import 'package:news_demo/models/headlines_res.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/foundation.dart';

abstract class Repository {

  ///Returns an Observable<List<Article>>
  ///Where the articles represent the data the user will see
  Observable<List<Article>> fetchArticles();

  ///Returns an Observable<List<Article>>
  ///Where the articles represent the data the user will see
  ///And the query String is that which the user whiches to search for
  Observable<List<Article>> searchNews({@required final String query});
}