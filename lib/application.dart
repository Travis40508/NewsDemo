import 'package:flutter/material.dart';
import 'package:news_demo/screens/headlines/headlines_screen.dart';


class NewsApplication extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demo News App',
      home: HeadlinesScreen(),
    );
  }
}
