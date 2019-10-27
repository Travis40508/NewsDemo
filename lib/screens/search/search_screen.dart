import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:news_demo/screens/search/search_bloc.dart';
import 'package:news_demo/utils/strings.dart';
import 'package:news_demo/widgets/news_app_scaffold.dart';


class SearchScreen extends StatefulWidget {
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {

  SearchBloc _bloc;

  @override
  void didChangeDependencies() {
    _bloc = BlocProvider.of<SearchBloc>(context);
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return NewsAppScaffold(
      context: context,
      scaffoldBody: buildBody(),
    );
  }

  Widget buildBody() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        TextField(
          decoration: InputDecoration(
            hintText: Strings.searchHint
          ),
        ),
      ],
    );
  }
}
