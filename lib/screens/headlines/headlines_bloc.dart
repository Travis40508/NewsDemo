
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:news_demo/models/headlines_res.dart';
import 'package:news_demo/repository/repository_impl.dart';
import 'package:rxdart/rxdart.dart';

class HeadlinesBloc extends Bloc {

  final Repository repository = RepositoryImpl();

  final _headlinesSubject = PublishSubject<List<Article>>();
  Observable<List<Article>> get headlinesStream => _headlinesSubject.stream;

  void fetchHeadlines() async {
    repository.fetchArticles()
        .listen((articles) => _headlinesSubject.sink.add(articles));
  }

  @override
  void dispose() {
    _headlinesSubject.close();
  }

}