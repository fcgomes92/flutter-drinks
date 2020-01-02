import 'package:drinks/pages/LoginPage.dart';
import 'package:drinks/pages/SplashPage.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Welcome to Flutter',
      home: SplashPage(),
      routes: <String, WidgetBuilder>{
        '/login': (BuildContext context) => LoginPage(),
      },
    );
  }
}
