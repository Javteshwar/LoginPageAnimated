import 'package:flutter/material.dart';
import 'Screens/LoginScreen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Test App',
      home: LoginScreen(),
      darkTheme: ThemeData.dark(),
      theme: ThemeData(
        primaryColor: Colors.blue[900],
        primaryColorBrightness: Brightness.dark,
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
