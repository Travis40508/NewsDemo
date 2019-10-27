import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';
import 'package:news_demo/widgets/news_error_widget.dart';

class StreamHandler {
  static Widget streamWidget({@required BuildContext context, @required AsyncSnapshot snapshot, @required Widget successWidget, bool shouldLoad}) {
    if (snapshot.hasError) {
      print('Error - ${snapshot.error}');
      return NewsErrorWidget();
    }

    if (!snapshot.hasData) {
      return shouldLoad ?? false ? Center(
        child: CircularProgressIndicator(backgroundColor: Theme.of(context).primaryColor,),
      ) : Container();
    }

    return successWidget;
  }
}
