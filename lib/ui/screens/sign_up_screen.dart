import 'dart:core';
import "package:flutter/material.dart";
import "package:kalachar/ui/widgets/custom_text_field.dart";
import 'package:kalachar/ui/widgets/custom_flat_button.dart';
import 'dart:io';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignUpScreen extends StatefulWidget {
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _orgname = new TextEditingController();
  final TextEditingController _orgphone = new TextEditingController();
  final TextEditingController _orgaddr = new TextEditingController();
  final TextEditingController _username = new TextEditingController();
  final TextEditingController _number = new TextEditingController();
  final TextEditingController _password = new TextEditingController();
  CustomTextField _orgnameField;
  CustomTextField _orgphoneField;
  CustomTextField _orgaddrField;
  CustomTextField _nameField;
  CustomTextField _passwordField;
  CustomTextField _phoneField;
  bool _blackVisible = false;
  VoidCallback onBackPress;

  @override
  void initState() {
    super.initState();
    this.authenticate();
    this.final_auth();
    onBackPress = () {
      Navigator.of(context).pop();
    };
    _orgnameField = new CustomTextField(
      baseColor: Colors.grey,
      borderColor: Colors.grey[400],
      controller: _orgname,
      hint: "Organization Name",
    );
    _orgphoneField = new CustomTextField(
      baseColor: Colors.grey,
      borderColor: Colors.grey[400],
      controller: _orgphone,
      hint: "Organization Phone Number"
    );
    _orgaddrField = new CustomTextField(
      baseColor: Colors.grey,
      borderColor: Colors.grey[400],
      controller: _orgaddr,
      hint: "Organization Address"
    );

    _nameField = new CustomTextField(
      baseColor: Colors.grey,
      borderColor: Colors.grey[400],
      controller: _username,
      hint: "Name",
    );
     _passwordField = CustomTextField(
      baseColor: Colors.grey,
      borderColor: Colors.grey[400],
      controller: _password,
      hint: "Password",
    );
    _phoneField = new CustomTextField(
      baseColor: Colors.grey,
      borderColor: Colors.grey[400],
      controller: _number,
      hint: "Phone Number"
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
                        "     Create new account",
                        softWrap: true,
                        textAlign: TextAlign.left,
                        style: TextStyle(
                          color: Colors.teal[200],
                          decoration: TextDecoration.none,
                          fontSize: 25.0,
                          fontWeight: FontWeight.w700,
                          fontFamily: "OpenSans",
                        ),
                      ),
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
                      child: _orgnameField,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
                      child: _orgphoneField,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
                      child: _orgaddrField,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 20.0, left: 15.0, right: 15.0),
                      child: _nameField,
                    ),
                     Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
                      child: _passwordField,
                    ),
                    Padding(
                      padding:
                          EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
                      child: _phoneField,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 25.0, horizontal: 40.0),
                      child: CustomFlatButton(
                        title: "Register",
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        textColor: Colors.white,
                        onPressed: () async{
                          final_auth();
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
                    height: MediaQuery.of(context).size.height,
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
  var orgname = _orgname.text;
  var orgphone= _orgphone.text;
  var orgaddr=_orgaddr.text;
  var user_name=_username.text;
  var number=_number.text;
  var password=_password.text;
  try {
    var response = await http.get(
        "https://kalachar.aerele.in/api/method/kalachar.kalachar.doctype.user_information.user_information.create_new_user?org_name=$orgname&org_phone=$orgphone&org_addr=$orgaddr&user_name=$user_name&user_phone=$number&password=$password",
        headers: {
          HttpHeaders.authorizationHeader: "token 04ff51f6fbc077a:9d337bcdccd6746",
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

  final_auth() async {
    var orgname = _orgname.text;
    var orgphone= _orgphone.text;
    var orgaddr=_orgaddr.text;
    var user_name=_username.text;
    var number=_number.text;
    var password=_password.text;
    final uri = "https://kalachar.aerele.in/api/resource/User%20Information";
    final headers = {
      HttpHeaders.authorizationHeader: "token 0612c2a10307f3f:945c07858b66c2a",
      'Content-Type': "application/json",
    };
    Map<String, dynamic> body = { 'data':'{\"docstatus\": 1, \"organization_name\": \"$orgname\", \"organization_phone_number\": \"$orgphone\", \"doctype\": \"User Information\",\"organization_address\": \"$orgaddr\", \"user_name\": \"$user_name\", \"user_phone_number\": \"$number\",\"password\": \"$password\"}'
    };
    String jsonBody = json.encode(body);
    print(jsonBody);

    var response = await http.post(
      uri,
      headers: headers,
      body: jsonBody,
    );
    print(response.statusCode);
    if (response.statusCode == 200) {
      Toast.show("Registered Successfully", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    } else {
      Toast.show("Error Try Again", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    }
  }

}





