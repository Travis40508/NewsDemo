import 'package:news_demo/models/headlines_res.dart';
import 'package:flutter/foundation.dart';

abstract class NewsService {

  ///Returns a Future of the pure response from the server for headlines
  Future<NewsRes> fetchHeadlines();

  ///Returns a Future of the pure response from the server for a search query
  ///Where the String query is that which the user wishes to search for
  Future<NewsRes> searchNews({@required final String query});
}