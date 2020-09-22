// import 'package:essdee/screens/accounts.dart';
// import 'package:essdee/screens/others.dart';
// import 'package:essdee/translator_localizations.dart';
// import 'package:essdee/screens/settings.dart';
// import 'package:essdee/theme.dart';
import 'package:flutter/material.dart';
import 'package:kalachar/ui/screens/common.dart';
import 'package:kalachar/ui/screens/contact_form.dart';
import 'package:kalachar/ui/screens/home_ui.dart';
import 'package:kalachar/ui/screens/settings.dart';
import 'package:kalachar/ui/widgets/theme.dart';

class DashboardScreen extends StatefulWidget {
  @override
  _DashboardScreenState createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen>
    with TickerProviderStateMixin {
  int _selectedIndex = 0;
  static List<Widget> _widgetOptions = <Widget>[
    FirstPage(),
  //  RewardPage(),
    Others(),
    Profile(),
  ];
  static List<Widget> _widgetOptions_Others = <Widget>[
    Others(),
//    RewardPage(),
    Profile()
  ];
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }
  Widget _buildbodyWidget(var selectedIndex){
    // if(True){
      return _widgetOptions.elementAt(selectedIndex);
    // }
    // else{
      // return _widgetOptions_Others.elementAt(selectedIndex);
    // }
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 3,
        child: Scaffold(
          bottomNavigationBar: BottomNavigationBar(
            elevation: 15.0,
            showUnselectedLabels: true,
            type: BottomNavigationBarType.fixed,
            items: <BottomNavigationBarItem>[
              // user_status?
               BottomNavigationBarItem(
                icon: Icon(Icons.search,),
                title: Text('Explore', style: TextStyle(fontFamily: 'Product Sans'),),
              ),
               BottomNavigationBarItem(
                  icon: Icon(Icons.help,),
                  title: Text('Support', style: TextStyle(fontFamily: 'Product Sans'),),
                ),
                // :
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                title: Text('Settings', style: TextStyle(fontFamily: 'Product Sans'),),
              ),
              
            ],
            currentIndex: _selectedIndex,
            selectedItemColor: MyColors.primaryColor,
            onTap: _onItemTapped,
          ),
          body: Container(
            color: Color(0xFFEEEEEE),
            child:Column(
              children: <Widget>[
                Expanded(child: _buildbodyWidget(_selectedIndex)
                ),
              ],
            ),
          ),
        ));
  }
}