
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class NewsAppScaffold extends Scaffold {

  final BuildContext context;
  final AppBar newsAppBar;
  final Widget scaffoldBody;
  final bool resizeToAvoidPadding;

  NewsAppScaffold({@required this.context, this.newsAppBar, this.scaffoldBody, this.resizeToAvoidPadding});

  @override
  Color get backgroundColor => Theme.of(context).backgroundColor;

  @override
  PreferredSizeWidget get appBar => newsAppBar;

  @override
  Widget get body => scaffoldBody;

  @override
  bool get resizeToAvoidBottomPadding => resizeToAvoidBottomInset;

}