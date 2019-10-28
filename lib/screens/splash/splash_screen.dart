
import 'package:flutter/material.dart';
import 'package:news_demo/routing/headlines_route.dart';
import 'package:news_demo/utils/strings.dart';
import 'package:news_demo/widgets/news_app_scaffold.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  ///Represents the duration of the Splash Screen
  static const int SPLASH_DURATION = 2000;

  @override
  void didChangeDependencies() {
    Future.delayed(Duration(milliseconds: SPLASH_DURATION), () => Navigator.pushReplacementNamed(context, HeadlinesRoute.routeName));
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return NewsAppScaffold(
      context: context,
      scaffoldBody: Center(
        child: Text(
          Strings.applicationName,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.headline
        ),
      ),
    );
  }
}
