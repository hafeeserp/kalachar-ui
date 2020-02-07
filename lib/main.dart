import 'package:flutter/material.dart';
import 'package:kalachar/kalachar_home_page.dart';
void main() => runApp(KalacharApp());

class KalacharApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kalachar',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

