import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class NewsAppBar extends AppBar {

  final String appBarTitle;
  final BuildContext context;

  NewsAppBar({@required this.appBarTitle, @required this.context});

  @override
  Color get backgroundColor => Theme.of(context).primaryColor;

  @override
  Widget get title => Text(
    appBarTitle,
    style: Theme.of(context).textTheme.title,
  );

  @override
  bool get centerTitle => true;
}