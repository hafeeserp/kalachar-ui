import 'package:flutter/material.dart';
import 'package:kalachar/ui/screens/sign_up_screen.dart';
import 'package:kalachar/ui/screens/welcome_screen.dart';

void main() => runApp(KalacharApp());

class KalacharApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Kalachar',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: WelcomeScreen(),
    );
  }
}



