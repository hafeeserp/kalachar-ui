import 'dart:core';
import "package:flutter/material.dart";
import "package:kalachar/ui/widgets/custom_text_field.dart";
import 'package:kalachar/ui/widgets/custom_flat_button.dart';
import 'package:kalachar/kalachar_home_page.dart';
import 'dart:io';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class LoginScreen extends StatefulWidget {
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  bool Iloading = false;
  final TextEditingController _phone = new TextEditingController();
  final TextEditingController _password = new TextEditingController();
  CustomTextField _passwordField;
  CustomTextField _phoneField;
  bool _blackVisible = false;
  VoidCallback onBackPress;

  @override
  void initState() {
    super.initState();
    this.authenticate();

    onBackPress = () {
      Navigator.of(context).pop();
    };
    _phoneField = new CustomTextField(
      baseColor: Colors.black,
      borderColor: Colors.black,
      errorColor: Colors.red,
      controller: _phone,
      hint: "Phone Number",
    );
    _passwordField = CustomTextField(
      baseColor: Colors.black,
      borderColor: Colors.black,
      errorColor: Colors.red,
      controller: _password,
      hint: "Password",
    );
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: onBackPress,
      child: Scaffold(
        backgroundColor: Colors.black,
        body: Stack(
          children: <Widget>[
            Stack(
              alignment: Alignment.topLeft,
              children: <Widget>[
                ListView(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(
                          top: 70.0, bottom: 10.0, left: 10.0, right: 10.0),
                      child: Text(
                        "  Sign In To Your Account",
                        softWrap: true,
                        textAlign: TextAlign.left,
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
                      padding:
                      EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
                      child: _phoneField,
                    ),
                    Padding(
                      padding:
                      EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
                      child: _passwordField,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 25.0, horizontal: 40.0),
                      child: CustomFlatButton(
                        title: "Sign In",
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        textColor: Colors.white,
                        onPressed: () async {
//                          Navigator.push(context, MaterialPageRoute(
//                                  builder: (context) => MyHomePage()),);
                            debugPrint(_phone.text);
                            debugPrint(_password.text);
                            var auth = await authenticate();
                            print(auth);
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context) => MyHomePage(value:_phone.text)),);
//                            if (auth == 'allowed') {
//                              Navigator.push(context, MaterialPageRoute(
//                                  builder: (context) => MyHomePage(value:_phone.text)),);
//                            }
//                            if (auth == 'not allowed') {
//                              Toast.show("Error Try Again !!", context,
//                                  duration: Toast.LENGTH_LONG,
//                                  gravity: Toast.CENTER);
//                            }

//                          Navigator.push(context,MaterialPageRoute(builder:(context)=>MyHomePage()),);
                          // _signUp(
                          //     fullname: _fullname.text,
                          //     email: _email.text,
                          //     number: _number.text,
                          //     password: _password.text);
                        },
                        splashColor: Colors.teal[200],
                        borderColor: Colors.teal[200],
                        borderWidth: 0,
                        color: Colors.teal[200],
                      ),
                    ),
                  ],
                ),
                SafeArea(
                  child: IconButton(
                    icon: Icon(Icons.arrow_back,color: Colors.white,),
                    onPressed: onBackPress,
                  ),
                ),
              ],
            ),
            Offstage(
              offstage: !_blackVisible,
              child: GestureDetector(
                onTap: () {},
                child: AnimatedOpacity(
                  opacity: _blackVisible ? 1.0 : 0.0,
                  duration: Duration(milliseconds: 400),
                  curve: Curves.ease,
                  child: Container(
                    height: MediaQuery
                        .of(context)
                        .size
                        .height,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }


  authenticate() async {
    debugPrint("HAI");
    var password = _password.text;
    var phone = _phone.text;
    try {
      var response = await http.get(
          "https://kalachar.aerele.in/api/method/kalachar.kalachar.doctype.user_information.user_information.authenticate_user?phone_no=$phone&password=$password",
          headers: {
            HttpHeaders.authorizationHeader: "token 04ff51f6fbc077a:9d337bcdccd6746 ",
          });
      print(response.statusCode);
      if (response.statusCode == 200) {
        print("yes");
        final parsed = json.decode(response.body);
        return parsed["message"][0].toString();

      }
      else {
        Toast.show("Error Try Again !!", context,
            duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
      }
    } catch (e) {
      print(e);
      print("Error getting response.");
      Toast.show("Error Try Again !!", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.CENTER);
    }
  }


  }



