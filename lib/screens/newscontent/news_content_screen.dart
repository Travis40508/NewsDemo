import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:news_demo/routing/news_content_route.dart';
import 'package:news_demo/screens/newscontent/news_content_bloc.dart';
import 'package:news_demo/widgets/news_app_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class NewsContentScreen extends StatefulWidget {
  @override
  _NewsContentScreenState createState() => _NewsContentScreenState();
}

class _NewsContentScreenState extends State<NewsContentScreen> {

  NewsContentRoute route;
  NewsContentBloc _bloc;

  @override
  void didChangeDependencies() {
    route = ModalRoute.of(context).settings.arguments;
    _bloc = BlocProvider.of<NewsContentBloc>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: NewsAppBar(appBarTitle: route.title, context: context,),
      body: buildScreenBody(),
    );
  }

  Widget buildScreenBody() {
    return StreamBuilder(
      stream: _bloc.pageIndexStream,
      initialData: NewsContentBloc.LOADING_INDEX,
      builder: (context, AsyncSnapshot<int> snapshot) {
        return IndexedStack(
          index: snapshot.data,
          children: <Widget>[
            WebView(
              javascriptMode: JavascriptMode.unrestricted,
              initialUrl: route.url,
              onPageFinished: (v) => _bloc.onPageLoaded(),
            ),
            Container(
              child: Center(
                child: CircularProgressIndicator(
                  backgroundColor: Theme.of(context).primaryColor
                ),
              ),
            )
          ],
        );
      },
    );
  }
}
