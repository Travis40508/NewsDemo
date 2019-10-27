import 'package:news_demo/models/headlines_res.dart';
import 'package:flutter/foundation.dart';

abstract class NewsService {
  Future<NewsRes> fetchHeadlines();
  Future<NewsRes> searchNews({@required final String query});
}