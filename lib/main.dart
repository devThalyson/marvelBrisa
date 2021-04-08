import 'package:flutter/material.dart';
import 'package:marvel_brisa/views/home_view.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Marvel App',
      theme: ThemeData(
        primarySwatch: Colors.red,
        fontFamily: ('Google'),
      ),
      home: HomeView(),
    );
  }
}
