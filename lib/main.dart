import 'package:flutter/material.dart';
import 'package:kalachar/ui/screens/welcome_screen.dart';
void main() {
  runApp(new MaterialApp(
    theme: ThemeData(
            primarySwatch: Colors.grey,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
    title: 'Kalachaar',
    debugShowCheckedModeBanner: false,
    home: new WelcomeScreen(),
  ));
}