import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart';

class StreamHandler {
  static Widget streamWidget({@required BuildContext context, @required AsyncSnapshot snapshot, @required Widget successWidget}) {
    if (snapshot.hasError) {
      //TODO
      print('Error - ${snapshot.error}');
    }

    if (!snapshot.hasData) {
      return Center(
        child: CircularProgressIndicator(backgroundColor: Theme.of(context).primaryColor,),
      );
    }

    return successWidget;
  }
}
