import 'package:flutter/material.dart';
import 'package:kalachar/dashboard.dart';
import 'package:kalachar/screens/info.dart';

class SettingsWidget extends StatefulWidget {
  SettingsWidget({Key key}) : super(key: key);

  @override
  _SettingsWidgetState createState() => new _SettingsWidgetState();
}

class _SettingsWidgetState extends State<SettingsWidget> {

  List _category =
  ["Dancers", "Singers", "Professors", "Speakers"];

  List<DropdownMenuItem<String>> _dropDownMenuItems;
  String _currentCategory;

  @override
  void initState() {
    _dropDownMenuItems = getDropDownMenuItems();
    _currentCategory = _dropDownMenuItems[0].value;
    super.initState();
  }

  List<DropdownMenuItem<String>> getDropDownMenuItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String category in _category) {
      items.add(new DropdownMenuItem(
          value: category,
          child: new Text(category)
      ));
    }
    return items;
  }

  @override
  Widget build(BuildContext context) {
    return new Container(
      color: Colors.white,
      child: new Center(
          child: new Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new Text("Please choose Category: "),
              new Container(
                padding: new EdgeInsets.all(16.0),
              ),
              new DropdownButton(
                value: _currentCategory,
                items: _dropDownMenuItems,
                onChanged: changedDropDownItem,
              ),
            ],
          )
      ),
      
    );
  }

  void changedDropDownItem(String selectedCategory) {
    setState(() {
      _currentCategory = selectedCategory;
    });
  }

}
class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex=0;
  Widget callpage(int currentIndex)
  {
    switch (currentIndex){
      case 0:return Info();
      case 1:return Info();
      case 2:return Info();
      case 3:return DashboardPage();
      break;
      default:
      return Info();
    }
    
  }
  @override
  Widget build(BuildContext context) {
    Color primaryColor = Colors.black;

    return Scaffold(
       backgroundColor: Colors.white,
      body: callpage(_currentIndex),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (value){
          _currentIndex=value;
          setState((){

          });
        },
        items:[
          BottomNavigationBarItem(
            icon:Icon(Icons.home,
            color:Colors.black),
            title:Text('Home',style: TextStyle(color: Colors.black,
            fontWeight: FontWeight.bold))
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.search,
            color:Colors.black),
            title:Text('Explore' ,style: TextStyle(color: Colors.black,
            fontWeight: FontWeight.bold))
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.autorenew,
            color:Colors.black),
            title:Text('Status',style: TextStyle(color: Colors.black,
            fontWeight: FontWeight.bold))
          ),
          BottomNavigationBarItem(
            icon:Icon(Icons.notifications_none,
            color:Colors.black),
            title:Text('Notification',style: TextStyle(color: Colors.black,
            fontWeight: FontWeight.bold))
          )
        ]
      ),
       drawer: Drawer(
        elevation: 20,
        child: ListView(
          children: <Widget>[
            DrawerHeader(

                decoration: BoxDecoration(
                  image: new DecorationImage(
            image: new AssetImage('assets/images/undraw_chore_list_iof3.png'),
            fit: BoxFit.fill,
        ),
                  // gradient: LinearGradient(
                  //     colors: <Color>[Colors.black, Colors.black]),
                ),
                child: null),
            ListTile(
                leading: Icon(Icons.person, color: Colors.black),
                title: Text('PROFILE'),
                onTap: () {
                  Navigator.pop(context);
                  // Navigator.push(context,
                      // MaterialPageRoute(builder: (context) => AddSupplier()));
                }),
            ListTile(
                leading: Icon(Icons.bookmark, color: Colors.black),
                title: Text('PAST BOOKINGS'),
                onTap: () {
                  Navigator.pop(context);
                }),
                ListTile(
                leading: Icon(Icons.exit_to_app, color: Colors.black),
                title: Text('LOGOUT'),
                onTap: () {
                  Navigator.pop(context);
                }),
          ],
        ),
      ),
      
      // body: Container(
      //   child: Center(
      //     child: Column(
      //       mainAxisSize: MainAxisSize.min,
      //       children: <Widget>[
      //         buildRaisedbutton("For Booking", Info()),
      //         SizedBox(
      //           height: 15.0,
      //         ),
      //         SizedBox(
      //           height: 15.0,
      //         ),
      //         buildRaisedbutton("Search", Info()),
      //         SizedBox(
      //           height: 15.0,
      //         ),
      //         buildRaisedbutton("Dashboard", Info()),
      //       ],
      //     ),
      //   ),
      // ),
    );
  }

Widget buildRaisedbutton(buttonName, Widget navto) {
    return Padding(
        padding: EdgeInsets.only(right: 70.0, left: 70.0),
        child: Row(children: <Widget>[
          Expanded(
            child: RaisedButton(
              textColor: Colors.white,
              color: Colors.black,
              splashColor: Colors.black,
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
}


