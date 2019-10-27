
import 'package:flutter_test/flutter_test.dart';
import 'package:news_demo/screens/headlines/headlines_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:rxdart/rxdart.dart';

import 'mocks/mock_responses.dart';
import 'mocks/repository_mock.dart';

void main() {
  test('testing fetchHeadlines', () {
    final repository = RepositoryMock();
    final res = MockResponses.fetchHeadlinesResponse();

    when(repository.fetchArticles()).thenAnswer((_) => Observable.just(res));
    final headlinesBloc = HeadlinesBloc.withMocks(repository: repository);

    expectLater(headlinesBloc.headlinesSubject, emitsInOrder([
      emits(res)
    ]));

    headlinesBloc.fetchHeadlines();
  });

  test('testing fetchHeadlines onError', () {
    final repository = RepositoryMock();
    final res = Error();

    when(repository.fetchArticles()).thenAnswer((_) => Observable.error(res));

    final headlinesBloc = HeadlinesBloc.withMocks(repository: repository);

    expectLater(headlinesBloc.headlinesSubject, emitsInOrder([
      emitsError(res)
    ]));

    headlinesBloc.fetchHeadlines();
  });

  test('testing refreshHeadlines clears headlines', () {
    final repository = RepositoryMock();
    final res = MockResponses.fetchHeadlinesResponse();
    when(repository.fetchArticles()).thenAnswer((_) => Observable.just(res));

    final headlinesBloc = HeadlinesBloc.withMocks(repository: repository);

    expectLater(headlinesBloc.headlinesSubject, emitsInOrder([
      emits(null),
    ]));

    headlinesBloc.refreshHeadlines();
  });

  test('testing refreshHeadlines fetches headlines after clearing them', () {
    final repository = RepositoryMock();
    final res = MockResponses.fetchHeadlinesResponse();
    when(repository.fetchArticles()).thenAnswer((_) => Observable.just(res));

    final headlinesBloc = HeadlinesBloc.withMocks(repository: repository);

    expectLater(headlinesBloc.headlinesSubject, emitsInOrder([
      emits(null),
      emits(res),
    ]));

    headlinesBloc.refreshHeadlines();
  });

  test('verifying that dispose closes our stream', () {
    final repository = RepositoryMock();
    final headlinesBloc = HeadlinesBloc.withMocks(repository: repository);

    headlinesBloc.dispose();

    expect(headlinesBloc.headlinesSubject.isClosed, true);
  });
}