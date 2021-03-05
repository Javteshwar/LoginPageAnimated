import 'package:flutter/material.dart';
import 'package:intern_application/CommonWidgets/SimpleWidgets.dart';

class CourseScreen extends StatefulWidget {
  final String title;
  CourseScreen({this.title});
  @override
  _CourseScreenState createState() => _CourseScreenState();
}

class _CourseScreenState extends State<CourseScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      appBar: AppBar(
        backgroundColor: Colors.blue[800],
        elevation: 16,
        title: Text(widget.title),
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: getBackground(),
        ),
      ),
    );
  }
}
