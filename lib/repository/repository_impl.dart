
import 'package:news_demo/models/headlines_res.dart';
import 'package:news_demo/repository/headlines_service_impl.dart';
import 'package:news_demo/repository/repository.dart';
export 'package:news_demo/repository/repository.dart';
import 'package:rxdart/rxdart.dart';

class RepositoryImpl implements Repository {

  final HeadlinesService _headlinesService = HeadlinesServiceImpl();

  @override
  Observable<List<Article>> fetchArticles() {
    return Observable.fromFuture(_headlinesService.fetchHeadlines())
        .map((res) => res.articles);
  }

}