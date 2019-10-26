import 'package:flutter/material.dart';
import 'package:news_demo/routing/news_content_route.dart';

class NewsContentScreen extends StatefulWidget {
  @override
  _NewsContentScreenState createState() => _NewsContentScreenState();
}

class _NewsContentScreenState extends State<NewsContentScreen> {

  NewsContentRoute route;

  @override
  void didChangeDependencies() {
    route = ModalRoute.of(context).settings.arguments;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
