import 'package:flutter/material.dart';
import 'package:no5_flutter_tests/view/myhomepage.dart';
import 'package:no5_flutter_tests/view/subpage.dart';
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override

  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
        routes: <String, WidgetBuilder> {
          '/home': (BuildContext context) =>  MyHomePage(),
          '/subpage': (BuildContext context) =>  SubPage()
        }
    );
  }
}
