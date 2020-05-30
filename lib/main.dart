//import 'package:flutter/material.dart';
//import 'package:kalachar/ui/screens/sign_up_screen.dart';
//import 'package:kalachar/ui/screens/welcome_screen.dart';
//import 'package:animated_text_kit/animated_text_kit.dart';
//
//void main() => runApp(KalacharApp());
//
//class KalacharApp extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
////    SizedBox(
////      width: 250.0,
////      child: ColorizeAnimatedTextKit(
////          onTap: () {
////            print("Tap Event");
////          },
////          text: [
////            "Larry Page",
////            "Bill Gates",
////            "Steve Jobs",
////          ],
////          textStyle: TextStyle(
////              fontSize: 50.0,
////              fontFamily: "Horizon"
////          ),
////          colors: [
////            Colors.purple,
////            Colors.blue,
////            Colors.yellow,
////            Colors.red,
////          ],
////          textAlign: TextAlign.start,
////          alignment: AlignmentDirectional.topStart // or Alignment.topLeft
////      ),
////    );
////  }
//
//
//    return MaterialApp(
//      debugShowCheckedModeBanner: false,
//      title: 'Kalachar',
//      theme: ThemeData(primarySwatch: Colors.blue),
//      home: WelcomeScreen(),
//    );
//  }
//}


import 'package:flutter/material.dart';
import 'package:kalachar/ui/screens/welcome_screen.dart';
import 'package:splashscreen/splashscreen.dart';
import 'dart:async';
void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new KalacharApp(),
  ));
}

class KalacharApp extends StatefulWidget {
  @override
  _KalacharAppState createState() => new _KalacharAppState();
}


  class _KalacharAppState extends State<KalacharApp> {
    @override
    void initState() {
      super.initState();
      Timer(
          Duration(seconds: 8),
              () => Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (BuildContext context) => WelcomeScreen())));
    }

    @override
    Widget build(BuildContext context) {
      return Scaffold(
        backgroundColor: Colors.black,

        body: Center(
          child: Image.asset('assets/images/kalachar_logo.png'),
        ),
      );
    }
//  @override
//  Widget build(BuildContext context) {
//    return new SplashScreen(
//      seconds: 8,
//      navigateAfterSeconds: WelcomeScreen(),
//
//      image: new Image.asset(
//          'assets/images/kalachar_logo.png'),
//      backgroundColor: Colors.black,
////      styleTextUnderTheLoader: new TextStyle(),
////      photoSize: 150.0,
////      onClick: () => print("Flutter Egypt"),
////      loaderColor: Colors.white,
//    );
//  }
}

