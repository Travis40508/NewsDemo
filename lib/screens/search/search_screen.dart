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
  TextEditingController _controller = TextEditingController();

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
      ],
    );
  }
}
