import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive/hive.dart';

part 'favourite_article_cubit.freezed.dart';
part 'favourite_article_state.dart';

class FavouriteArticleCubit extends Cubit<FavouriteArticleState> {
  final Box<bool> favoritesBox;

  FavouriteArticleCubit({required String name, required this.favoritesBox})
      : super(FavouriteArticleState(
          name: name,
          isFavorite: favoritesBox.get(name, defaultValue: false) ?? false,
        ));

  void toggleFavorite() {
    final newIsFavorite = !state.isFavorite;
    emit(state.copyWith(isFavorite: newIsFavorite));
    favoritesBox.put(state.name, newIsFavorite);
  }
}
