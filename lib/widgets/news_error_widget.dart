import 'package:flutter/material.dart';
import 'package:news_demo/utils/strings.dart';

class NewsErrorWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ListView (
      children: <Widget>[
        Container(
          height: MediaQuery.of(context).size.height * .8,
          child: Center(
            child: Text(
              Strings.errorText,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle
            ),
          ),
        ),
      ],
    );
  }
}
