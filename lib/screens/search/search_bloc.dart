

import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:news_demo/repository/repository.dart';
import 'package:news_demo/repository/repository_impl.dart';
import 'package:flutter/foundation.dart';

class SearchBloc extends Bloc {

  Repository _repository = RepositoryImpl();

  @override
  void dispose() {
    // TODO: implement dispose
  }

  SearchBloc();
  SearchBloc.withMocks({@required final Repository repository}) {
    this._repository = repository;
  }

  void onTextChanged(final String query) {

  }

}