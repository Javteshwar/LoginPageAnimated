import 'package:flutter/material.dart';

LinearGradient getBackground() {
  return LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [Colors.blue[900], Colors.blue[300]],
  );
}

Widget getLoadingIndicatorDialog({String msg = "Loading..."}) {
  return AlertDialog(
    content: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
          strokeWidth: 4,
        ),
        SizedBox(height: 16),
        Text(
          msg,
          textScaleFactor: 1.5,
        ),
      ],
    ),
  );
}
