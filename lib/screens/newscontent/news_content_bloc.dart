
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:rxdart/rxdart.dart';

class NewsContentBloc extends Bloc {

  final _pageIndexSubject = PublishSubject<int>();
  Observable<int> get pageIndexStream => _pageIndexSubject.stream;

  static const int WEB_VIEW_INDEX = 0;
  static const int LOADING_INDEX = 1;


  void onPageLoaded() {
    _pageIndexSubject.sink.add(WEB_VIEW_INDEX);
  }

  @override
  void dispose() {
    _pageIndexSubject.close();
  }

  ///Using a getter to keep our subject immutable
  PublishSubject<int> get pageIndexSubject => _pageIndexSubject;

}