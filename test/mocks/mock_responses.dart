import 'package:news_demo/models/headlines_res.dart';
import 'package:rxdart/rxdart.dart';

class MockResponses {

  static List<Article> fetchHeadlinesResponse() {

    Article article = Article("one", "two", "three", "four", "five", "six", "seven");
    Article article2 = Article("one", "two", "three", "four", "five", "six", "seven");
    List<Article> articles = List();

    articles.add(article);
    articles.add(article2);

    NewsRes res = NewsRes(1, articles);

    return res.articles;
  }
}
