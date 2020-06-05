import 'dart:core';
import "package:flutter/material.dart";
import "package:kalachar/ui/widgets/custom_text_field.dart";
import 'package:kalachar/ui/widgets/custom_flat_button.dart';
import 'dart:io';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class DancerScreen extends StatefulWidget {
  _DancerScreenState createState() => _DancerScreenState();
}

class _DancerScreenState extends State<DancerScreen> {
  bool Iloading = false;
  final TextEditingController _phone = new TextEditingController();
  final TextEditingController _password = new TextEditingController();
  final TextEditingController _bar = new TextEditingController();
  CustomTextField _passwordField;
  CustomTextField _phoneField;
  CustomTextField _bargain;
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
  hint: "Request Type",
  );
  _bargain = CustomTextField(
    baseColor: Colors.black,
    borderColor: Colors.black,
    errorColor: Colors.red,
    controller: _bar,
    hint: "Requesting Amount",
  );
  }

  @override
  Widget build(BuildContext context) {
  return WillPopScope(
  onWillPop: onBackPress,
  child: Scaffold(
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
  "Booking Details",
  softWrap: true,
  textAlign: TextAlign.left,
  style: TextStyle(
  color: Colors.black,
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
      padding:
      EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
      child: _bargain,
    ),

  Padding(
  padding: const EdgeInsets.symmetric(
  vertical: 25.0, horizontal: 40.0),
  child: CustomFlatButton(
  title: "Send Message",
  fontSize: 22,
  fontWeight: FontWeight.w700,
  textColor: Colors.white,
  onPressed: () async {
  debugPrint(_phone.text);
  debugPrint(_password.text);
  var auth = await authenticate();
  print(auth);
  Toast.show("Message Sent", context,
      duration: Toast.LENGTH_LONG,
      gravity: Toast.CENTER);
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
  icon: Icon(Icons.arrow_back),
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
  color: Colors.black54,
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
    print("https://10.0/api/method/kalachar.kalachar.doctype.booking_status.booking_status.send_request?from_user='8428849121'&phone=$phone&status=$password");
  try {
  var response = await http.get(
  "https://kalachar.aerele.in/api/method/kalachar.kalachar.doctype.booking_status.booking_status.send_request?from_user='8428849121'&phone=$phone&status=$password",
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




































