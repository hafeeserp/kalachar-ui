import 'package:flutter/material.dart';
import "package:kalachar/ui/widgets/custom_text_field.dart";
import 'package:toast/toast.dart';
import 'dart:convert';
import 'dart:core';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:kalachar/ui/widgets/custom_flat_button.dart';


class FinalScreen extends StatefulWidget {
  final String org_phone;
  final String value;
  final String date;
  final String time;
  FinalScreen({Key key,this.org_phone,this.value,this.date,this.time}): super(key: key);
  @override
  _FinalScreenState createState() => _FinalScreenState();
}

class _FinalScreenState extends State<FinalScreen> {
  List parsed_data;
  String category;
  bool _load = false;
  String _selected;




  final TextEditingController _phone = new TextEditingController();
  final TextEditingController _password = new TextEditingController();
  CustomTextField _passwordField;
  CustomTextField _phoneField;
  bool _blackVisible = false;
  VoidCallback onBackPress;
  final List<String> _dropdownValues = [
    'Category',
    'Culturals',
    'Workshops'
  ];
  String _currentlySelected = "Category";
  Widget dropdownWidget() {
    return
      DropdownButton(
        items: _dropdownValues
            .map((value) =>
            DropdownMenuItem(
              child:
              Text(value, style: TextStyle(color: Colors.teal[200],
                  fontWeight: FontWeight.bold)),
              value: value,

            ))
            .toList(),
        onChanged: (String value) {
          //once dropdown changes, update the state of out currentValue
          setState(() {
            _currentlySelected = value;
          });
        },
        //this wont make dropdown expanded and fill the horizontal space
        isExpanded: false,
        //make default value of dropdown the first value of our list
        value: _currentlySelected,
      );
  }

  Widget appBarTitle = new Text(
      'Kalachar', style: TextStyle(color: Colors.white,
      fontWeight: FontWeight.bold));
  Icon actionIcon = new Icon(Icons.search);

  void initState() {

    super.initState();
    this.final_auth(_selected);

    onBackPress = () {
      Navigator.of(context).pop();
    };
    _phoneField = new CustomTextField(
      baseColor: Colors.black,
      borderColor: Colors.black,
      controller: _phone,
      hint: "Request Amount",
    );
    _passwordField = CustomTextField(
      baseColor: Colors.black,
      borderColor: Colors.black,
      controller: _password,
      hint: "Purpose",
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
//          title: appBarTitle,
          actions: <Widget>[
            //Add the dropdown widget to the `Action` part of our appBar. it can also be among the `leading` part
            dropdownWidget(),
            FlatButton(
                child: Icon(Icons.star_half, color: Colors.white),
//              child: Text("FILTER",style: TextStyle(color: Colors.black,
//                  fontWeight: FontWeight.bold)),
                onPressed: () {
                  setState(() {
                    _load = true;
                  }
                  );
                }
            ),


          ]
      ),
      body: Stack(
            children: <Widget>[
    Stack(
    alignment: Alignment.topLeft,
    children: <Widget>[
    ListView(
    children: <Widget>[
      Padding(
        padding:
        EdgeInsets.only(top: 10.0, left: 15.0, right: 15.0),
        child: _phoneField,
      ),


    Padding(
    padding: const EdgeInsets.symmetric(
    vertical: 25.0, horizontal: 40.0),
    child: CustomFlatButton(
    title: "Confirm Booking",
    fontSize: 22,
    fontWeight: FontWeight.w700,
    textColor: Colors.white,
    onPressed: () async {
      print(_currentlySelected);
    debugPrint(_phone.text);
    var auth= await final_auth(_currentlySelected);
    print(auth);
    if (auth == 200) {
      Toast.show("Booking Confirmed", context,
          duration: Toast.LENGTH_LONG,
          gravity: Toast.CENTER);
    }
    else {
    Toast.show("Booking Confirmed", context,
    duration: Toast.LENGTH_LONG,
    gravity: Toast.CENTER);
    }
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


    );
  }
  final_auth(String _selected) async {
    var phone = _phone.text;
    final uri = "https://kalachar.aerele.in/api/resource/Booking%20Status";
    final headers = {
      HttpHeaders.authorizationHeader: "token 0612c2a10307f3f:945c07858b66c2a",
      'Content-Type': "application/json",
    };
    Map<String, dynamic> body = { 'data':'{\"docstatus\": 1, \"from_user\": \"${widget.value}\", \"to_user\": \"${widget.org_phone}\", \"doctype\": \"Booking Status\",\"purpose\": \"$_selected\", \"bargain_amount\": \"$phone\", \"booking_status\": \"Booking Request\",\"date\": \"${widget.date}\", \"time\": \"${widget.time}\"}'
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
      return response.statusCode;
    } else {
      Toast.show("Booking Confirmed", context,
          duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    }
  }


}