
import 'package:flutter/material.dart';
import 'package:kalachar/ui/screens/common.dart';
import 'package:kalachar/ui/screens/sizeconfig.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  TextEditingController textEditingController;

  Future<void> _showLogoutDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Logout'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Are you sure you want to logout?'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Cancel'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Logout'),
              onPressed: () {
                logoutUser(context);
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: false,
          elevation: 0,
          backgroundColor: Color(0xFFEEEEEE),
          title: Text(
            'Settings',
            style: TextStyle(
                fontSize: 24, color: Colors.black, fontFamily: 'Product Sans'),
          ),
        ),
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Color(0xFFEEEEEE),
                        Color(0xFFEEEEEE),
                        Colors.white,
                        Colors.white,
                      ],
                      stops: [0.125, 0.5, 0.5, 1.0],
                      end: Alignment.bottomCenter,
                      begin: Alignment.topCenter,
                    ),
                  ),
                  child: Container(
                      padding: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 13.0,
                              color: Colors.black.withOpacity(.03),
                              offset: Offset(1.0, 7.0),
                            )
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                              padding: EdgeInsets.only(right: 8),
                              child: Icon(Icons.person)),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  '8428849121',
                                  style: TextStyle(
                                    color: Colors.grey,
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      )),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20.0, vertical: 14.0),
                          child: ListTile(
                            title: Text(
                              'Logout',
                              style: TextStyle(
                                  fontFamily: 'Product Sans',
                                  color: Colors.black,
                                  fontSize: 16),
                            ),
                            trailing: Icon(
                              Icons.exit_to_app,
                              color: Colors.black,
                              size: 25,
                            ),
                            onTap: () {
                              _showLogoutDialog();
                            },
                          )),
                    ],
                  ),
                ),
              ]),
            ),
            SliverFillRemaining(
              hasScrollBody: false,
              child: Container(
                  child: Column(
                      // crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                    Image.asset(
                      'assets/images/kalachaar.png',
                      height: 75,
                      width: 115,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 0.0),
                      child: Text(
                        'Version ${1.0}',
                        style: TextStyle(
                            color: Colors.grey, fontFamily: 'Product Sans'),
                      ),
                    ),
                    SizedBox(height: 1),
                    Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10.0),
                        child: Text(
                          'Made with ❤️ in India',
                          style: TextStyle(
                              color: Colors.grey, fontFamily: 'Product Sans'),
                        ))
                  ])),
            )
          ],
        ),
      ),
    );
  }
}