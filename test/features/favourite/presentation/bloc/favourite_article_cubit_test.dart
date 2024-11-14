import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:fyrtel/src/features/favourite/presentation/bloc/favourite_article_cubit.dart';
import 'package:mocktail/mocktail.dart';
import '../../../../mocks/common.dart';

void main() {
  _TestDependencies? dependencies;

  test(
    'FavouriteArticleCubit - initial state',
    () {
      dependencies = _TestDependencies(name: 'testName');
      final sut = dependencies!.sut;

      expect(
        sut.state,
        const FavouriteArticleState(
          name: 'testName',
          isFavorite: false,
        ),
      );
    },
  );
  blocTest(
    'FavouriteArticleCubit - toggleFavorite true',
    setUp: () => dependencies = _TestDependencies(name: 'testName'),
    tearDown: dependencies = null,
    build: () => dependencies!.sut,
    act: (bloc) => bloc.toggleFavorite(),
    expect: () => [
      const FavouriteArticleState(
        name: 'testName',
        isFavorite: true,
      )
    ],
    verify: (bloc) {
      verify(() => dependencies!.box.put('testName', any())).called(1);
    },
  );

  blocTest(
    'FavouriteArticleCubit - toggleFavorite true and false',
    setUp: () => dependencies = _TestDependencies(name: 'testName'),
    tearDown: dependencies = null,
    build: () => dependencies!.sut,
    act: (bloc) {
      bloc.toggleFavorite();
      bloc.toggleFavorite();
    },
    expect: () => [
      const FavouriteArticleState(
        name: 'testName',
        isFavorite: true,
      ),
      const FavouriteArticleState(
        name: 'testName',
        isFavorite: false,
      )
    ],
    verify: (bloc) {
      verify(() => dependencies!.box.put('testName', true)).called(1);
      verify(() => dependencies!.box.put('testName', false)).called(1);
    },
  );
}

class _TestDependencies {
  _TestDependencies({required this.name});

  final String name;

  final box = _mockedHiveBox;

  static MockHiveBox get _mockedHiveBox {
    MockHiveBox box = MockHiveBox();
    when(() => box.get(any())).thenReturn(true);
    when(() => box.put(any(), any())).thenAnswer((_) async => {});
    return box;
  }

  FavouriteArticleCubit get sut =>
      FavouriteArticleCubit(name: name, favoritesBox: box);
}
