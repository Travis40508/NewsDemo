import 'package:flutter/material.dart';
import 'package:news_demo/utils/strings.dart';
import 'package:news_demo/widgets/news_app_bar.dart';
import 'package:news_demo/widgets/news_app_scaffold.dart';

class HeadlinesScreen extends StatefulWidget {
  @override
  _HeadlinesScreenState createState() => _HeadlinesScreenState();
}

class _HeadlinesScreenState extends State<HeadlinesScreen> {
  @override
  Widget build(BuildContext context) {
    return NewsAppScaffold(
      context: context,
      newsAppBar: NewsAppBar(appBarTitle: Strings.headlinesTitle, context: context,),
    );
  }
}
