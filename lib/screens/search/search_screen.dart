import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:news_demo/models/headlines_res.dart';
import 'package:news_demo/routing/news_content_route.dart';
import 'package:news_demo/screens/search/search_bloc.dart';
import 'package:news_demo/utils/strings.dart';
import 'package:news_demo/widgets/loading_widget.dart';
import 'package:news_demo/widgets/news_app_scaffold.dart';
import 'package:news_demo/widgets/news_card.dart';
import 'package:news_demo/widgets/stream_handler.dart';

class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  SearchBloc _bloc;
  TextEditingController _controller = TextEditingController();

  @override
  void didChangeDependencies() {
    if (_bloc == null) {
      _bloc = BlocProvider.of<SearchBloc>(context);
    }
    super.didChangeDependencies();
  }

  @override
  void dispose() {
    _bloc.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return NewsAppScaffold(
      context: context,
      scaffoldBody: buildBody(),
      resizeToAvoidPadding: false,
    );
  }

  Widget buildBody() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _controller,
            decoration: InputDecoration(
              hintText: Strings.searchHint,
              border: OutlineInputBorder(),
              prefixIcon: Icon(Icons.search),
              suffixIcon: IconButton(
                icon: Icon(Icons.clear),
                onPressed: () => _controller.clear(),
              ),
            ),
            maxLines: 1,
            onChanged: (query) => _bloc.onTextChanged(query),
          ),
        ),
        StreamBuilder(
          initialData: false,
          stream: _bloc.loadingStream,
          builder: (context, AsyncSnapshot<bool> isLoading) {
            return isLoading.data ? NewsLoadingWidget() : Container();
          },
        ),
        StreamBuilder(
          stream: _bloc.searchedArticlesStream,
          builder: (context, AsyncSnapshot<List<Article>> snapshot) {
            return StreamHandler.streamWidget(
                context: context,
                snapshot: snapshot,
                successWidget: Expanded(
                  child: ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot?.data?.length,
                      itemBuilder: (context, index) {
                        Article article = snapshot?.data[index];

                        return NewsCard(
                          article: article,
                          onClick: () => Navigator.pushNamed(
                              context, NewsContentRoute.routeName,
                              arguments: NewsContentRoute(
                                  title: article?.title, url: article.url)),
                        );
                      }),
                ));
          },
        ),
      ],
    );
  }
}
