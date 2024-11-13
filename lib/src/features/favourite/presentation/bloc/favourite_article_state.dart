part of 'favourite_article_cubit.dart';

@freezed
class FavouriteArticleState with _$FavouriteArticleState {
  const factory FavouriteArticleState({
    required String name,
    @Default(false) bool isFavorite,
  }) = _FavouriteArticleState;
}
