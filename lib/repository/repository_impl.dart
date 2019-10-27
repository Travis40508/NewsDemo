
import 'package:news_demo/models/headlines_res.dart';
import 'package:news_demo/repository/news_service_impl.dart';
import 'package:news_demo/repository/repository.dart';
export 'package:news_demo/repository/repository.dart';
import 'package:rxdart/rxdart.dart';
import 'package:flutter/foundation.dart';

class RepositoryImpl implements Repository {

  final NewsService _headlinesService = NewsServiceImpl();

  @override
  Observable<List<Article>> fetchArticles() {
    return Observable.fromFuture(_headlinesService.fetchHeadlines())
        .map((res) => res.articles);
  }

  @override
  Observable<List<Article>> searchNews({@required final String query}) {
    return Observable.fromFuture(_headlinesService.searchNews(query: query))
    .map((res) => res.articles);
  }

}