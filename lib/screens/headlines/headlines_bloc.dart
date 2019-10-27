
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:news_demo/models/headlines_res.dart';
import 'package:news_demo/repository/repository_impl.dart';
import 'package:rxdart/rxdart.dart';

class HeadlinesBloc extends Bloc {

  Repository repository = RepositoryImpl();

  final _headlinesSubject = PublishSubject<List<Article>>();
  Observable<List<Article>> get headlinesStream => _headlinesSubject.stream;

  void fetchHeadlines() async {
    repository.fetchArticles()
        .listen((articles) => _headlinesSubject.sink.add(articles), onError: (e) => _headlinesSubject.sink.addError(e));
  }

  HeadlinesBloc.withMocks({this.repository});

  @override
  void dispose() {
    _headlinesSubject.close();
  }

  Future<void> refreshHeadlines() async {
    _headlinesSubject.sink.add(null);
    fetchHeadlines();
  }

  //Using a getting to keep this immutable
  PublishSubject get headlinesSubject => _headlinesSubject;

}