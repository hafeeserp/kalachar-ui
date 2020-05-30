import 'package:flutter/material.dart';
import 'package:kalachar/ui/screens/booking.dart';
import "package:kalachar/ui/widgets/custom_text_field.dart";
import 'package:toast/toast.dart';
import 'dart:convert';
import 'dart:core';
import "package:kalachar/ui/screens/dancers.dart";
import 'package:kalachar/ui/screens/welcome_screen.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import "package:kalachar/ui/profile.dart";

class MyHomePage extends StatefulWidget {
  final String value;
  MyHomePage({Key key,this.value}): super(key: key);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  List parsed_data;
  String category;
  bool _load = false;
  Future<String> dancer_filter_details(category) async {

    var res = await http.get(
        "https://kalachar.aerele.in/api/method/kalachar.kalachar.doctype.user_information.user_information.get_filter_details?category=$category",
        headers: {
          HttpHeaders.authorizationHeader: "token 04ff51f6fbc077a:9d337bcdccd6746 ",
        });
//    print(res.statusCode);
//    print("hello");
    if (res.statusCode == 200) {
      this.setState((){
        parsed = json.decode(res.body)['message'];
      });
//        parsed_data=parsed['message'];
//      print("HEEE");
//      print(parsed.length);
      return "Done";

    }
    else {
      Toast.show("Error Try Again !!", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
    }
  }
  List parsed;
  var type="To accept booking";
  Future<String> dancer_details() async {
      var response = await http.get(
          "https://kalachar.aerele.in/api/method/kalachar.kalachar.doctype.user_information.user_information.get_dancer_detail?usertype=$type",
          headers: {
            HttpHeaders.authorizationHeader: "token 04ff51f6fbc077a:9d337bcdccd6746 ",
          });
      if (response.statusCode == 200) {
        this.setState((){
        parsed = json.decode(response.body)['message'];
        });
//        parsed_data=parsed['message'];

        return "Done";

      }
      else {
        Toast.show("Error Try Again !!", context,
            duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
      }
  }
  List msg_data;
  Future<String> get_profile() async {
    print("category");
    print("Hey you");
    print('${widget.value}');
    var re = await http.get(
"https://kalachar.aerele.in/api/method/kalachar.kalachar.doctype.user_information.user_information.get_profile_details?user_phone=${widget.value}",
        headers: {
          HttpHeaders.authorizationHeader: "token 0612c2a10307f3f:945c07858b66c2a",
        });
    print(re.statusCode);
    print("hello");
    if (re.statusCode == 200) {
      this.setState((){
        msg_data = json.decode(re.body)['message'];
      });
//        parsed_data=parsed['message'];

      return "Done";

    }
    else {
      Toast.show("Error Try Again !!", context,
          duration: Toast.LENGTH_SHORT, gravity: Toast.CENTER);
    }
  }
  final TextEditingController _phone = new TextEditingController();
  final TextEditingController _password = new TextEditingController();
  CustomTextField _passwordField;
  CustomTextField _phoneField;
  bool _blackVisible = false;
  VoidCallback onBackPress;
  final List<String> _dropdownValues = [
    "Dance Category",
    "Bamber dance",
    "Bharatanatyam",
    "Puppet show",
    "Chakkai Attam",
    "Devaraattam",
    "Kamandi",
    "Kai Silambu Attam",
    "Kolattam",
    "Karagattam",
    "Kazhai Kothu",
    "Kolattam",
    "Poi Kal attam",
    "Kummi",
    "Peacock dance",
    "Ottan Koothu",
    "Oyilattam",
    "Oyil Kummi",
    "Snake Dance",
    "Artificial Horse Dance",
    "TigerDance",
    "Shattam dance",
    "Parai Attam",
    "Koothu",
    "Urummi Attam",
    "Villu Paatu"
  ];
  String _currentlySelected = "Dance Category"; //var to hold currently selected value

  //make the drop down its own widget for readability
  Widget dropdownWidget() {

    return
      DropdownButton(
      //map each value from the lIst to our dropdownMenuItem widget
      items: _dropdownValues
          .map((value) => DropdownMenuItem(
        child:
        Text(value,style: TextStyle(color: Colors.teal[200],
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
    this.dancer_details();
    this.authenticate();
    this.get_profile();
    this.dancer_filter_details(category);
    onBackPress = () {
      Navigator.of(context).pop();
    };
    _phoneField = new CustomTextField(
      baseColor: Colors.black,
      borderColor: Colors.black,
      controller: _phone,
      hint: "Category",
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
//    return MaterialApp(
//    home:  KeyValuePairDropdown(),
//    );
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
//          title: appBarTitle,
          actions: <Widget>[
            //Add the dropdown widget to the `Action` part of our appBar. it can also be among the `leading` part
            dropdownWidget(),
            FlatButton(
              child: Icon(Icons.refresh,color: Colors.white),
//              child: Text("FILTER",style: TextStyle(color: Colors.black,
//                  fontWeight: FontWeight.bold)),
              onPressed: () {
                setState(() {
                  _load = true;
                  dancer_filter_details(_currentlySelected);
                  new ListView.builder(
                    itemCount: parsed_data == null ? 0 : parsed_data.length,
                    itemBuilder: (BuildContext context, int index){

//            _buildTicket(parsed[index]["org_name"],parsed[index]["org_addr"],parsed[index]["org_phone"]);
                      return
                        Padding(
                          padding: EdgeInsets.only(top: 5.0, right: 5.0, left: 5.0),
                          child: GestureDetector(
                            child: Container(

                                height: 150.0,
                                child:Card(

                                    elevation: 5.0,
                                    child:
                                    Padding(
                                      padding: EdgeInsets.all(5.0),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                                        children: <Widget>[
//                      _priority(priority),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: <Widget>[
//                      CircleAvatar(
//                        radius: 3,
//                        backgroundColor: Colors.red,
//                      ),
                                              SizedBox(
                                                width: 2.0,
                                              ),
//                      Text('High'),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                '${parsed_data[index]["org_name"]}',
//                            textScaleFactor: 1.6,
                                                style: TextStyle(
                                                  fontSize: 16.0,
                                                  color: Colors.black,
                                                ),
                                              )
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                '${parsed_data[index]["org_addr"]}',
//                            textScaleFactor: 1.4,
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          ),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: <Widget>[
                                              Text(
                                                '${parsed_data[index]["org_phone"]}',
//                            textScaleFactor: 1.4,
                                                style: TextStyle(
                                                  fontSize: 14.0,
                                                  color: Colors.grey,
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
//              child: new Text(parsed[index]["org_name"]),
                                    )
                                )
                            ),
                            onTap: () {
                              Navigator.push(context,MaterialPageRoute(builder:(context)=>BookingScreen(org_name: parsed_data[index]["org_name"],org_phone: parsed_data[index]["org_phone"],org_addr: parsed_data[index]["org_addr"],value:widget.value)),);
                            },
                          ),
                        );
                    },
                  );
                }
                );
              },
            ),
          ],
        ),
        drawer: _drawer(),
        body:

        new ListView.builder(
          itemCount: parsed == null ? 0 : parsed.length,
          itemBuilder: (BuildContext context, int index){
            return
              Padding(
                padding: EdgeInsets.only(top: 5.0, right: 5.0, left: 5.0),
            child: GestureDetector(
            child: Container(

            height: 150.0,
            child:Card(

                elevation: 5.0,
                child:
                Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
//                      _priority(priority),
                  Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
//                      CircleAvatar(
//                        radius: 3,
//                        backgroundColor: Colors.red,
//                      ),
                      SizedBox(
                        width: 2.0,
                      ),
//                      Text('High'),
                    ],
                  ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[

                          Text(
                          '${parsed[index]["org_name"]}',

//                            textScaleFactor: 1.6,
                            style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                            ),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '${parsed[index]["org_addr"]}',
//                            textScaleFactor: 1.4,
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '${parsed[index]["org_phone"]}',
//                            textScaleFactor: 1.4,
                            style: TextStyle(
                              fontSize: 14.0,
                              color: Colors.grey,
                            ),
                          ),
//                           Icon(Icons.keyboard_arrow_right),
                        ],
                      )
                    ],
                  ),
//              child: new Text(parsed[index]["org_name"]),
            )
            )
            ),
              onTap: () {
                Navigator.push(context,MaterialPageRoute(builder:(context)=>BookingScreen(org_name: parsed[index]["org_name"],org_phone: parsed[index]["org_phone"],org_addr: parsed[index]["org_addr"],value:widget.value)),);
    },
            ),
            );
          },
        )
        );

  }

  Widget _buildTicket(String name, String opened, String created) {
    return Padding(
      padding: EdgeInsets.only(top: 5.0, right: 5.0, left: 5.0),
      child: GestureDetector(
        child: Container(
            height: 150.0,
            child: Card(
                elevation: 5.0,
                child: Padding(
                  padding: EdgeInsets.all(5.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
//                      _priority(priority),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            name,
                            textScaleFactor: 1.6,
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '- Opened on $opened',
                            textScaleFactor: 1,
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          Text(
                            '- Created by  $created',
                            textScaleFactor: 1,
                          ),
                        ],
                      )
                    ],
                  ),
                ))),
        onTap: () {
//          Navigator.push(context,
//              MaterialPageRoute(builder: (context) => TicketPage(name)));
        },
      ),
    );
  }

  Widget _drawer() {
    return Drawer(
        elevation: 20,
        child: ListView(
          children: <Widget>[
        new Container (
        decoration: new BoxDecoration (
            color: Colors.red
        ),
        ),
            DrawerHeader(

                decoration: BoxDecoration(
                    color: const Color(0xFF80CBC4),
                image: new DecorationImage(
//                  gradient: LinearGradient(
//                      colors: <Color>[
//                        Colors.black,
//                        Colors.black
//                      ]),
                  image: new AssetImage(
                      'assets/images/undraw_chore_list_iof3.png'),
                  fit: BoxFit.cover,
                )
                ),
                child: null),

            ListTile(
                leading: Icon(Icons.person, color: Colors.black),
                title: Text('PROFILE'),
//    ,style: TextStyle(color: Colors.purpleAccent[100])


                onTap: () {
                  get_profile();
                  print(msg_data);
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) => ProfilePage(org_name:msg_data[0]['org_name'],org_phone:msg_data[0]['org_phone'],user_name:msg_data[0]['user_name'],user_phone:msg_data[0]['user_phone'])),);
//                  Navigator.pop(context);fn
                  // Navigator.push(context,
                  // MaterialPageRoute(builder: (context) => AddSupplier()));
                }
              ),

            Divider(),
            ListTile(
                leading: Icon(Icons.bookmark, color: Colors.black),
                title: Text('Activities'),
                onTap: () {
                  Navigator.pop(context);
                }),
            Divider(),
            ListTile(
                leading: Icon(Icons.exit_to_app, color: Colors.black),
                title: Text('LOGOUT'),
                onTap: () {
//                Navigator.of(context).pop();
//                Navigator.pop(context,true);
//                  exit(0);
                Navigator.push(context, MaterialPageRoute(
                    builder: (context) => WelcomeScreen()),);
                }),
          ],
        ));
  }

  Widget buildRaisedbutton(buttonName, Widget navto) {
    return Padding(
        padding: EdgeInsets.only(right: 70.0, left: 70.0),
        child: Row(children: <Widget>[
          Expanded(
            child: RaisedButton(
              textColor: Colors.white,
              color: Colors.white,
              splashColor: Colors.white,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              child: Text(
                buttonName,
                textScaleFactor: 1.5,
              ),
              onPressed: () {
                Navigator.of(context).push(createRoute(navto));
              },
            ),
          ),
        ]));
  }

  Route createRoute(Widget page) {
    return PageRouteBuilder(
      pageBuilder: (context, animation, secondaryAnimation) => page,
      transitionDuration: Duration(milliseconds: 400),
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        var begin = Offset(0.0, 1.0);
        var end = Offset.zero;
        var curve = Curves.easeIn;

        var tween =
        Tween(begin: begin, end: end).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      },
    );
  }
  authenticate() async {
    try {
      var response = await http.get(
          "https://kalachar.aerele.in/api/method/kalachar.kalachar.doctype.user_information.user_information.get_profile_details?user_phone='${widget.value}'",
          headers: {
            HttpHeaders.authorizationHeader: "token 04ff51f6fbc077a:9d337bcdccd6746 ",
          });
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




































