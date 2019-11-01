import 'package:flutter_test/flutter_test.dart';
import 'package:news_demo/screens/search/search_bloc.dart';
import 'package:mockito/mockito.dart';
import 'package:news_demo/utils/strings.dart';
import 'package:rxdart/rxdart.dart';

import 'mocks/mock_responses.dart';
import 'mocks/repository_mock.dart';

void main() {
  test('testing searching happy path', () {
    final repository = RepositoryMock();
    final res = MockResponses.fetchHeadlinesResponse();
    when(repository.searchNews(query: 'mock')).thenAnswer((_) =>
        Observable.just(res));

    final bloc = SearchBloc.withMocks(repository: repository);

    expectLater(bloc.searchedArticlesStream, emitsInOrder([
      //loading erases data
      emits(null),

      //response populates it
      emits(res)
    ]));

    bloc.onTextChanged('mock');
  });

  test('testing searching error path', () {
    final repository = RepositoryMock();
    final res = Error();
    when(repository.searchNews(query: 'mock')).thenAnswer((_) =>
        Observable.error(res));

    final bloc = SearchBloc.withMocks(repository: repository);

    expectLater(bloc.searchedArticlesStream, emitsInOrder([
      //clearing data for search
      emits(null),

      //emitting error
      emitsError(res),
    ]));

    bloc.onTextChanged('mock');
  });

  test('test no search when query empty', () {
    final repository = RepositoryMock();
    final res = MockResponses.fetchHeadlinesResponse();
    when(repository.searchNews(query: 'mock')).thenAnswer((_) =>
        Observable.just(res));

    final bloc = SearchBloc.withMocks(repository: repository);

    bloc.onTextChanged(Strings.emptyText);

    expect(bloc.debounce, null);
  });

  test('test search when query not empty', () {
    final repository = RepositoryMock();
    final res = MockResponses.fetchHeadlinesResponse();
    when(repository.searchNews(query: 'mock')).thenAnswer((_) =>
        Observable.just(res));

    final bloc = SearchBloc.withMocks(repository: repository);

    bloc.onTextChanged('mock');

    expect(bloc.debounce, isNotNull);
  });


  group('testing search', () {
    final _repository = RepositoryMock();
    final _bloc = SearchBloc.withMocks(repository: _repository);

    test('loader shows after typing', () {
      when(_repository.searchNews(query: 'mock')).thenAnswer((_) => Observable.just(MockResponses.fetchHeadlinesResponse()));
      expectLater(_bloc.loadingStream, emitsInOrder([
        //start loading
        true
      ]));

      _bloc.onTextChanged('mock');
    });

    test('search success without error', () {
      when(_repository.searchNews(query: 'mock')).thenAnswer((_) => Observable.just(MockResponses.fetchHeadlinesResponse()));
      expectLater(_bloc.loadingStream, emitsInOrder([
        //start loading
        true,

        //finish loading after response
        false
      ]));

      _bloc.onTextChanged('mock');
  });

    test('search success with error', () {
      when(_repository.searchNews(query: 'mock')).thenAnswer((_) => Observable.error('error'));
      expectLater(_bloc.loadingStream, emitsInOrder([
        //start loading
        true,

        //finish loading after response
        false
      ]));

      _bloc.onTextChanged('mock');
    });
});
}