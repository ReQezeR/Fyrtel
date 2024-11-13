part of 'filtered_articles_bloc.dart';

@freezed
class FilteredArticlesState with _$FilteredArticlesState {
  const factory FilteredArticlesState.initial() = _Initial;
  const factory FilteredArticlesState.loadInProgress() = _LoadInProgress;
  const factory FilteredArticlesState.loaded(List<Article> list) = _Loaded;
  const factory FilteredArticlesState.failure(String error) = _Failure;
}
