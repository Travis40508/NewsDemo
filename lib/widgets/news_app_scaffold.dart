
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class NewsAppScaffold extends Scaffold {

  final BuildContext context;
  final AppBar newsAppBar;

  NewsAppScaffold({@required this.context, this.newsAppBar});

  @override
  Color get backgroundColor => Theme.of(context).backgroundColor;

  @override
  PreferredSizeWidget get appBar => newsAppBar;
}