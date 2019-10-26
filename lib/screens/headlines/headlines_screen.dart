import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:news_demo/models/headlines_res.dart';
import 'package:news_demo/screens/headlines/headlines_bloc.dart';
import 'package:news_demo/utils/strings.dart';
import 'package:news_demo/widgets/news_app_bar.dart';
import 'package:news_demo/widgets/news_app_scaffold.dart';
import 'package:cached_network_image/cached_network_image.dart';
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
  Widget build(BuildContext context) {
    return NewsAppScaffold(
      context: context,
      newsAppBar: NewsAppBar(
        appBarTitle: Strings.headlinesTitle,
        context: context,
      ),
      scaffoldBody: buildScreenBody(),
    );
  }

  Widget buildScreenBody() {
    return StreamBuilder(
      stream: _bloc.headlinesStream,
      builder: (context, AsyncSnapshot<List<Article>> snapshot) {
        return StreamHandler.streamWidget(
            context: context,
            snapshot: snapshot,
            successWidget: ListView.builder(
              itemCount: snapshot?.data?.length,
              itemBuilder: (context, index) {
                Article article = snapshot?.data[index];

                return NewsCard(article: article, onClick: () => print('woo!'),);
              },
            ));
      },
    );
  }
}
