import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:kalachar/ui/widgets/custom_flat_button.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:toast/toast.dart';
import 'dart:convert';
import 'package:kalachar/ui/screens/final.dart';

class BookingScreen extends StatefulWidget {
  final String org_name;
  final String org_phone;
  final String org_addr;
  final String value;
  BookingScreen({Key key,this.org_name,this.org_addr,this.org_phone,this.value}): super(key: key);
  _BookingScreenState createState() => _BookingScreenState();
}
class _BookingScreenState extends State<BookingScreen> {
  List parsed;

  var type="To accept booking";
  Future<String> dancer_details() async {
    print("came");
    print(widget.org_name);
    var response = await http.get(
        "https://kalachar.aerele.in/api/method/kalachar.kalachar.doctype.user_information.user_information.get_selected_dancer_details?org_name=${widget.org_name}&org_phone=${widget.org_phone}&org_addr=${widget.org_addr}",
        headers: {
          HttpHeaders.authorizationHeader: "token 04ff51f6fbc077a:9d337bcdccd6746 ",
        });
    print(response.statusCode);
    print(response.body);
    print("NOOOO");
    if (response.statusCode == 200) {
      this.setState((){
        parsed = json.decode(response.body)['message'];
      });
//        parsed_data=parsed['message'];
      print(parsed[0]['user_phone']);
      print(parsed.length);
      return "Done";

    }
    else {
      Toast.show("Error Try Again !!", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
    }
  }

  String _date = "Not set";
  String _time = "Not set";

  @override
  void initState() {
    super.initState();
    this.dancer_details();
  }

  @override
  Widget build(BuildContext context) {
    var description =
    Container(child: Text(
      '${parsed[0]['details']}',
      textAlign: TextAlign.justify,
      style: TextStyle(height: 1.5, color: Color(0xFF6F8398)),
    ),
        padding: EdgeInsets.all(16)
    );
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Booking Info'),
      ),
      body:
      SafeArea(

        child: Column(
          children: <Widget>[

            new Container (
              decoration: new BoxDecoration (
                  color: Colors.red
              ),
            ),
            DrawerHeader(

                decoration: BoxDecoration(
                    image: new DecorationImage(
//                  gradient: LinearGradient(
//                      colors: <Color>[
//                        Colors.black,
//                        Colors.black
//                      ]),
                      image: new AssetImage(
                          'assets/images/undraw_celebration_0jvk.png'),
                      fit: BoxFit.fill,
                    )

//                   gradient: LinearGradient(
//                       colors: <Color>[Colors.black, Colors.black]),
                ),
                child: null),

            description,
        Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                elevation: 4.0,
                onPressed: () {
                  DatePicker.showDatePicker(context,
                      theme: DatePickerTheme(
                        containerHeight: 210.0,
                      ),
                      showTitleActions: true,
                      minTime: DateTime(2000, 1, 1),
                      maxTime: DateTime(2022, 12, 31), onConfirm: (date) {
                        print('confirm $date');
                        _date = '${date.year} - ${date.month} - ${date.day}';
                        setState(() {});
                      }, currentTime: DateTime.now(), locale: LocaleType.en);
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.date_range,
                                  size: 18.0,
                                  color: Colors.teal[200],
                                ),
                                Text(
                                  " $_date",
                                  style: TextStyle(
                                      color: Colors.teal[200],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Text(
                        "  Change",
                        style: TextStyle(
                            color: Colors.teal[200],
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                    ],
                  ),
                ),
                color: Colors.white,
              ),
              SizedBox(
                height: 20.0,
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5.0)),
                elevation: 4.0,
                onPressed: () {
                  DatePicker.showTimePicker(context,
                      theme: DatePickerTheme(
                        containerHeight: 210.0,
                      ),
                      showTitleActions: true, onConfirm: (time) {
                        print('confirm $time');
                        _time = '${time.hour} : ${time.minute} : ${time.second}';
                        setState(() {});
                      }, currentTime: DateTime.now(), locale: LocaleType.en);
                  setState(() {});
                },
                child: Container(
                  alignment: Alignment.center,
                  height: 50.0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            child: Row(
                              children: <Widget>[
                                Icon(
                                  Icons.access_time,
                                  size: 18.0,
                                  color: Colors.teal[200],
                                ),
                                Text(
                                  " $_time",
                                  style: TextStyle(
                                      color: Colors.teal[200],
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18.0),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                      Text(
                        "  Change",
                        style: TextStyle(
                            color: Colors.teal[200],
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                      ),
                    ],
                  ),
                ),
                color: Colors.white,
              )
            ],
          ),
        ),
      ),
            Padding(
              padding: const EdgeInsets.symmetric(
                  vertical: 10.0, horizontal: 100.0),
              child: CustomFlatButton(
                title: "Book Now",
                fontSize: 22,
                fontWeight: FontWeight.w700,
                textColor: Colors.white,
                onPressed: () async{

print("here oh");
print(widget.value);
                          Navigator.push(context,MaterialPageRoute(builder:(context)=>FinalScreen(org_phone: parsed[0]['user_phone'],value: widget.value,date:_date,time:_time)),);

                },
                splashColor: Colors.teal[200],
                borderColor: Colors.teal[200],
                borderWidth: 0,
                color: Colors.teal[200],
              ),
            ),
          ],
        ),
    ),);
  }
}



























