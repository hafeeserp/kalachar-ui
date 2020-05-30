import 'package:flutter/material.dart';
import 'package:kalachar/ui/widgets/custom_flat_button.dart';
import 'package:kalachar/ui/screens/sign_up_screen.dart';
import 'package:kalachar/ui/screens/login_screen.dart';
DateTime currentBackPressTime;

class WelcomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body:
      new ListView(
        children: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 60.0),
            child: Icon(
              Icons.phone_iphone,
              color: Colors.teal[200],
              size: 125.0,
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 35.0, right: 15.0, left: 15.0),
            child: Text(
              "Kalachar",
              softWrap: true,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.teal[200],
                decoration: TextDecoration.none,
                fontSize: 24.0,
                fontWeight: FontWeight.w700,
                fontFamily: "OpenSans",
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: Text(
            "App to book traditional dancers for culturals and workshops",
              softWrap: true,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.teal[200],
                decoration: TextDecoration.none,
                fontSize: 15.0,
                fontWeight: FontWeight.w300,
                fontFamily: "OpenSans",
              ),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40.0),
            child: CustomFlatButton(
              title: "Log In",
              fontSize: 22,
              fontWeight: FontWeight.w700,
              textColor: Colors.white,
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder:(context)=>LoginScreen()),);
              },
              splashColor: Colors.teal[200],
              borderColor: Colors.teal[200],
              borderWidth: 0,
              color: Colors.teal[200]
//              color: Color.fromRGBO(212, 20, 15, 1.0),
            ),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40.0),
            child: CustomFlatButton(
              title: "Sign Up",
              fontSize: 22,
              fontWeight: FontWeight.w700,
              textColor: Colors.teal[200],
              onPressed: () {
                Navigator.push(context,MaterialPageRoute(builder:(context)=>SignUpScreen()),
                );
                // Navigator.of(context).pushNamed("/signup");
              },
              splashColor: Colors.teal[200],
              borderColor: Colors.teal[200],
              borderWidth: 2,
            ),
          ),
        ],
      ),
    );
  }
}



//BackButton
class BackButton extends StatefulWidget {
  @override
  _BackButtonState createState() => _BackButtonState();
}
class _BackButtonState extends State<BackButton> {
  DateTime backbuttonpressedTime;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: WillPopScope(
        onWillPop: onWillPop,
        child: Center(
          child: Text('Double Click to exit app'),
        ),
      ),
    );
  }
}