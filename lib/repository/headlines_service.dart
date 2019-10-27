import 'package:news_demo/models/headlines_res.dart';

abstract class HeadlinesService {
  Future<NewsRes> fetchHeadlines();
}