import 'package:news_demo/models/headlines_res.dart';
import 'package:rxdart/rxdart.dart';


abstract class Repository {

  Observable<List<Article>> fetchArticles();

}