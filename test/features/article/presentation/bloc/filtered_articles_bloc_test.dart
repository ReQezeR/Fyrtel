import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fyrtel/src/features/article/domain/article_repository.dart';
import 'package:fyrtel/src/features/article/presentation/bloc/filtered_articles_bloc.dart';
import 'package:mocktail/mocktail.dart';

import '../../../../injectable.dart';
import '../mock_data/mock_articles_data.dart';

void main() {
  _TestDependencies? dependencies;

  test(
    'FilteredArticlesBloc - initial state',
    () {
      dependencies = _TestDependencies.init();
      final sut = dependencies!.sut;

      expect(
        sut.state,
        const FilteredArticlesState.initial(),
      );
    },
  );

  blocTest(
    'FilteredArticlesBloc - load',
    setUp: () => dependencies = _TestDependencies.init(length: 10),
    tearDown: dependencies = null,
    build: () => dependencies!.sut,
    act: (bloc) => bloc.add(FilteredArticlesEvent.load(null)),
    expect: () => [
      const FilteredArticlesState.loadInProgress(),
      FilteredArticlesState.loaded(MockArticlesData.mockArticles(length: 10))
    ],
    verify: (bloc) {
      verify(() => dependencies!.articleRepository.loadArticles()).called(1);
    },
  );

  blocTest(
    'FilteredArticlesBloc - load paid',
    setUp: () =>
        dependencies = _TestDependencies.init(length: 10, isPaid: true),
    tearDown: dependencies = null,
    build: () => dependencies!.sut,
    act: (bloc) => bloc.add(FilteredArticlesEvent.load(true)),
    expect: () => [
      const FilteredArticlesState.loadInProgress(),
      FilteredArticlesState.loaded(
          MockArticlesData.mockArticles(length: 10, isPaid: true))
    ],
    verify: (bloc) {
      verify(() => dependencies!.articleRepository.loadArticles()).called(1);
    },
  );

  blocTest(
    'FilteredArticlesBloc - load free',
    setUp: () =>
        dependencies = _TestDependencies.init(length: 10, isPaid: false),
    tearDown: dependencies = null,
    build: () => dependencies!.sut,
    act: (bloc) => bloc.add(FilteredArticlesEvent.load(false)),
    expect: () => [
      const FilteredArticlesState.loadInProgress(),
      FilteredArticlesState.loaded(
          MockArticlesData.mockArticles(length: 10, isPaid: false))
    ],
    verify: (bloc) {
      verify(() => dependencies!.articleRepository.loadArticles()).called(1);
    },
  );

  blocTest(
    'FilteredArticlesBloc - failure',
    setUp: () => dependencies = _TestDependencies.init(validResponse: false),
    tearDown: dependencies = null,
    build: () => dependencies!.sut,
    act: (bloc) => bloc.add(FilteredArticlesEvent.load(false)),
    expect: () => [
      const FilteredArticlesState.loadInProgress(),
      FilteredArticlesState.failure(Exception("failure").toString()),
    ],
    verify: (bloc) {
      verify(() => dependencies!.articleRepository.loadArticles()).called(1);
    },
  );
}

class _TestDependencies {
  _TestDependencies._(this.articleRepository);

  factory _TestDependencies.init({
    bool validResponse = true,
    bool? isPaid,
    int length = 0,
  }) =>
      _TestDependencies._(
          _mockedArticleRepository(validResponse, isPaid, length));

  final ArticleRepository articleRepository;

  FilteredArticlesBloc get sut => FilteredArticlesBloc(articleRepository);

  static ArticleRepository _mockedArticleRepository(
      bool withValidResponse, bool? isPaid, int length) {
    final repository = locator<ArticleRepository>();

    if (withValidResponse) {
      when(() => repository.loadArticles()).thenAnswer((invocation) async =>
          MockArticlesData.mockArticles(length: length, isPaid: isPaid));
    } else {
      when(() => repository.loadArticles()).thenThrow(Exception("failure"));
    }
    return repository;
  }
}
