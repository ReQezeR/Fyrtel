import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:fyrtel/src/features/article/domain/article_repository.dart';
import 'package:fyrtel/src/features/article/domain/model/article_model.dart';

part 'filtered_articles_state.dart';
part 'filtered_articles_event.dart';
part 'filtered_articles_bloc.freezed.dart';

@injectable
class FilteredArticlesBloc
    extends Bloc<FilteredArticlesEvent, FilteredArticlesState> {
  final ArticleRepository repository;
  FilteredArticlesBloc(this.repository)
      : super(const FilteredArticlesState.initial()) {
    on<LoadFilteredArticlesEvent>(_onLoad);
  }

  void _onLoad(
    LoadFilteredArticlesEvent event,
    Emitter<FilteredArticlesState> emit,
  ) async {
    try {
      emit(const FilteredArticlesState.loadInProgress());
      List<Article> articles = await repository.loadArticles();
      if (event.isPaid == null) {
        emit(FilteredArticlesState.loaded(articles));
      } else if (event.isPaid == true) {
        emit(FilteredArticlesState.loaded(
            articles.where((a) => !a.isForFree).toList()));
      } else {
        emit(FilteredArticlesState.loaded(
            articles.where((a) => a.isForFree).toList()));
      }
    } catch (e) {
      emit(FilteredArticlesState.failure(e.toString()));
    }
  }
}
