import 'package:flutter/material.dart';
import 'package:generic_bloc_provider/generic_bloc_provider.dart';
import 'package:news_demo/routing/news_content_route.dart';
import 'package:news_demo/screens/headlines/headlines_bloc.dart';
import 'package:news_demo/screens/headlines/headlines_screen.dart';
import 'package:news_demo/screens/newscontent/news_content_screen.dart';


class NewsApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo News App',
      home: BlocProvider(
        bloc: HeadlinesBloc(),
        child: HeadlinesScreen(),
      ),
      routes: {
        NewsContentRoute.routeName: (context) => NewsContentScreen()
      },
      theme: ThemeData(
        primaryColor: Colors.blueAccent,
        backgroundColor: Colors.white,
        accentColor: Colors.white,

        textTheme: TextTheme(
          title: TextStyle(
            color: Colors.white
          )
        )
      ),
    );
  }
}
