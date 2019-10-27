

import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:news_demo/repository/repository.dart';
import 'package:news_demo/repository/repository_impl.dart';

class SearchBloc extends Bloc {

  Repository _repository = RepositoryImpl();

  @override
  void dispose() {
    // TODO: implement dispose
  }

  void onTextChanged(final String query) {
    
  }

}