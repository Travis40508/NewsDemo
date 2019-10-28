
import 'package:flutter_test/flutter_test.dart';
import 'package:news_demo/screens/newscontent/news_content_bloc.dart';

void main() {
  test('testing setting the index to web page', () {
    final newsContentBloc = NewsContentBloc();
    expectLater(newsContentBloc.pageIndexStream, emitsInOrder([
      NewsContentBloc.WEB_VIEW_INDEX
    ]));

    newsContentBloc.onPageLoaded();
  });
}