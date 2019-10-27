import 'package:news_demo/models/headlines_res.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/foundation.dart';

abstract class Repository {

  Observable<List<Article>> fetchArticles();
  Observable<List<Article>> searchNews({@required final String query});
}