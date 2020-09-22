import 'package:flutter/material.dart';
import 'package:kalachar/ui/screens/common.dart';
import 'package:kalachar/ui/screens/first_page.dart';
import 'package:kalachar/ui/screens/welcome_screen.dart';
import 'dart:core';
import 'package:shared_preferences/shared_preferences.dart';
Future<Null> main() async {
  runApp(new MyApp());
}

class MyApp extends StatefulWidget {
      @override
      MyAppState createState() {
        return new MyAppState();
      }
    }
    
class MyAppState extends State<MyApp> {
    Widget _homeScreen = new WelcomeScreen();
    @override
    void initState(){
      super.initState();
      navigateUser();
    }
    var status;
    void navigateUser() async{
      SharedPreferences prefs = await SharedPreferences.getInstance();
      status = prefs.getBool('isLoggedIn') ?? false;
      if (status) {
        mobileNumber = prefs.getString("mobileNumber");
        // partner_name = prefs.getString("partner_name");
        // partner_type = prefs.getString("partner_type");
        api_key = prefs.getString("api_key");
        api_secret = prefs.getString("api_secret");
        // partner_status = prefs.getBool("partner_status");
        // support_number = prefs.getString("support_number");
        _homeScreen = new DashboardScreen();
      }
    }
      @override
      Widget build(BuildContext context) {
        navigateUser();
        return MaterialApp(
          title: 'Kalachaar',
          theme: ThemeData(
            primarySwatch: Colors.grey,
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          debugShowCheckedModeBanner: false,
          home: _homeScreen
        );
      }
}