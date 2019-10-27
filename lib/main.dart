import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:news_demo/application.dart';

void main() {
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(NewsApplication());
  });
}