import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:news_demo/routing/news_content_route.dart';
import 'package:news_demo/routing/search_route.dart';
import 'package:news_demo/screens/headlines/headlines_bloc.dart';
import 'package:news_demo/screens/headlines/headlines_screen.dart';
import 'package:news_demo/screens/newscontent/news_content_bloc.dart';
import 'package:news_demo/screens/newscontent/news_content_screen.dart';
import 'package:news_demo/screens/search/search_bloc.dart';
import 'package:news_demo/screens/search/search_screen.dart';
import 'package:news_demo/utils/strings.dart';


class NewsApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: Strings.applicationName,
      home: BlocProvider(
        bloc: HeadlinesBloc(),
        child: HeadlinesScreen(),
      ),
      routes: {

        NewsContentRoute.routeName: (context) => BlocProvider(
          bloc: NewsContentBloc(),
          child: NewsContentScreen(),
        ),

        SearchRoute.routeName: (context) => BlocProvider(
          bloc: SearchBloc(),
          child: SafeArea(child: SearchScreen(),
          )),
      },
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        backgroundColor: Colors.white,
        accentColor: Colors.white,

        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.white
          ),
          subtitle: TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.normal
          )
        )
      ),
    );
  }
}
