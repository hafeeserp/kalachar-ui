import 'package:flutter/material.dart';
import 'package:kalachar/ui/screens/sign_up_screen.dart';
import 'package:kalachar/ui/screens/welcome_screen.dart';
import 'package:animated_text_kit/animated_text_kit.dart';


class SplashApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SizedBox(
      width: 250.0,
      child: ColorizeAnimatedTextKit(
          onTap: () {
            print("Tap Event");
          },
          text: [
            "Larry Page",
            "Bill Gates",
            "Steve Jobs",
          ],
          textStyle: TextStyle(
              fontSize: 50.0,
              fontFamily: "Horizon"
          ),
          colors: [
            Colors.purple,
            Colors.blue,
            Colors.yellow,
            Colors.red,
          ],
          textAlign: TextAlign.start,
          alignment: AlignmentDirectional.topStart // or Alignment.topLeft
      ),
    );
  }
}