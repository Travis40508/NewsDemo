

import 'dart:async';

import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:news_demo/repository/repository.dart';
import 'package:news_demo/repository/repository_impl.dart';
import 'package:flutter/foundation.dart';

class SearchBloc extends Bloc {

  static const int INPUT_DELAY = 500;
  Repository _repository = RepositoryImpl();
  Timer _debounce;

  @override
  void dispose() {
    // TODO: implement dispose
  }

  SearchBloc();
  SearchBloc.withMocks({@required final Repository repository}) {
    this._repository = repository;
  }

  void onTextChanged(final String query) {
    if (_debounce?.isActive ?? false) {
      _debounce.cancel();
    }
    _debounce = Timer(const Duration(milliseconds: INPUT_DELAY), () {
      print('search!');
    });
  }

}