import 'dart:async';

import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:news_demo/models/headlines_res.dart';
import 'package:news_demo/repository/repository.dart';
import 'package:news_demo/repository/repository_impl.dart';
import 'package:flutter/foundation.dart';
import 'package:rxdart/rxdart.dart';

class SearchBloc extends Bloc {
  static const int INPUT_DELAY = 750;
  Repository _repository = RepositoryImpl();
  Timer _debounce;

  final _searchedArticles = PublishSubject<List<Article>>();

  Observable<List<Article>> get searchedArticlesStream =>
      _searchedArticles.stream;

  final _loadingSubject = PublishSubject<bool>();

  Observable<bool> get loadingStream => _loadingSubject.stream;

  @override
  void dispose() {
    _searchedArticles.close();
    _loadingSubject.close();
  }

  SearchBloc();

  SearchBloc.withMocks({@required final Repository repository}) {
    this._repository = repository;
  }

  void onTextChanged(final String query) {
    if (_debounce?.isActive ?? false) {
      _debounce.cancel();
    }

    if (query.length > 0) {
      _debounce = Timer(const Duration(milliseconds: INPUT_DELAY), () {
        _loadingSubject.sink.add(true);
        _searchedArticles.sink.add(null);
        _repository.searchNews(query: query).listen((articles) {
          _loadingSubject.sink.add(false);
          _searchedArticles.sink.add(articles);
        }, onError: (e) {
          _loadingSubject.sink.add(false);
          _searchedArticles.sink.addError(e);
        });
      });
    }
  }

  ///Keeps timer immutable
  Timer get debounce => _debounce;
}
