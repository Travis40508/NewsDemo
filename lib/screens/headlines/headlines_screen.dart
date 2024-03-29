import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:news_demo/models/headlines_res.dart';
import 'package:news_demo/routing/news_content_route.dart';
import 'package:news_demo/routing/search_route.dart';
import 'package:news_demo/screens/headlines/headlines_bloc.dart';
import 'package:news_demo/utils/strings.dart';
import 'package:news_demo/widgets/news_app_bar.dart';
import 'package:news_demo/widgets/news_app_scaffold.dart';
import 'package:news_demo/widgets/news_card.dart';
import 'package:news_demo/widgets/stream_handler.dart';

class HeadlinesScreen extends StatefulWidget {
  @override
  _HeadlinesScreenState createState() => _HeadlinesScreenState();
}

class _HeadlinesScreenState extends State<HeadlinesScreen> {
  HeadlinesBloc _bloc;

  @override
  void didChangeDependencies() {
    _bloc = BlocProvider.of<HeadlinesBloc>(context);
    _bloc.fetchHeadlines();

    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      backgroundColor: Theme.of(context).primaryColor,
      onRefresh: () => _bloc.refreshHeadlines(),
      child: NewsAppScaffold(
        context: context,
        newsAppBar: NewsAppBar(
          appBarTitle: Strings.headlinesTitle,
          context: context,
          appBarActions: <Widget>[
            IconButton(
              icon: Icon(Icons.search),
              onPressed: () => Navigator.pushNamed(context, SearchRoute.routeName),
            ),
          ],
        ),
        scaffoldBody: buildScreenBody(),
      ),
    );
  }

  Widget buildScreenBody() {
    return StreamBuilder(
      stream: _bloc.headlinesStream,
      builder: (context, AsyncSnapshot<List<Article>> snapshot) {
        return StreamHandler.streamWidget(
          shouldLoad: true,
            context: context,
            snapshot: snapshot,
            successWidget: ListView.builder(
              physics: AlwaysScrollableScrollPhysics(),
                itemCount: snapshot?.data?.length,
                itemBuilder: (context, index) {
                  Article article = snapshot?.data[index];

                  return NewsCard(
                    article: article,
                    onClick: () => Navigator.pushNamed(
                        context, NewsContentRoute.routeName,
                        arguments: NewsContentRoute(
                            title: article.title, url: article.url)),
                  );
                }));
      },
    );
  }
}
