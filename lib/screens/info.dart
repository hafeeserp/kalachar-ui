import 'package:flutter/material.dart';
import 'package:kalachar/dashboard.dart';
import 'package:kalachar/screens/add_category.dart';
class Info extends StatefulWidget {
  @override
  _InfoState createState() => _InfoState();
}

class _InfoState extends State<Info> {
  @override
  Widget build(BuildContext context) {
    Color primaryColor = Colors.black;
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              width: double.infinity,
              decoration: BoxDecoration(
            //       image: new DecorationImage(
            // image: new AssetImage('assets/images/undraw_chore_list_iof3.png'),
            // fit: BoxFit.fill,
        // ),),
                  color: primaryColor, border: Border.all(color: primaryColor)),
              child: Padding(
                padding: EdgeInsets.only(top: 30.0, right: 15.0, left: 15.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.menu),
                      color: Colors.white,
                      iconSize: 30.0,
                      onPressed: () {},
                    ),
                    // IconButton(
                    //   icon: Icon(Icons.notifications_none),
                    //   color: Colors.white,
                    //   iconSize: 30.0,
                    //   onPressed: () {},
                    // )
                  ],
                ),
              ),
            ),
            Stack(
              children: <Widget>[
                ClipPath(
                  clipper: CustomShapeClipper(),
                  child: Container(
                    decoration: BoxDecoration(
                  image: new DecorationImage(
            image: new AssetImage('assets/images/undraw_celebration_0jvk.png'),
            fit: BoxFit.fill,)),
                    height: 350.0,
                    // decoration: BoxDecoration(color: primaryColor),
                    
                  ),
                  
                ),
                
                // Padding(
                //   padding: EdgeInsets.only(top: 120.0, right: 25.0, left: 25.0),
                //   child: Container(
                //     width: double.infinity,
                //     height: 370.0,
                //     decoration: BoxDecoration(
                //         color: Colors.white,
                //         borderRadius: BorderRadius.all(Radius.circular(20.0)),
                //         boxShadow: [
                //           BoxShadow(
                //               color: Colors.black.withOpacity(0.1),
                //               offset: Offset(0.0, 3.0),
                //               blurRadius: 15.0)
                //         ]),
                //         ]),
                //     child: Column(
                //       children: <Widget>[
                //         Padding(
                //           padding: EdgeInsets.symmetric(
                //               horizontal: 40.0, vertical: 40.0),
                //           child: Row(
                //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                //             children: <Widget>[
                //               Column(
                //                 children: <Widget>[
                //                   Material(
                //                     borderRadius: BorderRadius.circular(100.0),
                //                     color: Colors.purple.withOpacity(0.1),
                //                     child: IconButton(
                //                       padding: EdgeInsets.all(15.0),
                //                       icon: Icon(Icons.send),
                //                       color: Colors.purple,
                //                       iconSize: 30.0,
                //                       onPressed: () {
                //                         Navigator.of(context).push(MaterialPageRoute(
                //                          builder: (BuildContext context) => AddCategory()
                //                          ));
                //                       },
                //                     ),
                //                   ),
                //                   SizedBox(height: 8.0),
                //                   Text('Send',
                //                       style: TextStyle(
                //                           color: Colors.black54,
                //                           fontWeight: FontWeight.bold))
                //                 ],
                //               ),
                //               Column(
                //                 children: <Widget>[
                //                   Material(
                //                     borderRadius: BorderRadius.circular(100.0),
                //                     color: Colors.blue.withOpacity(0.1),
                //                     child: IconButton(
                //                       padding: EdgeInsets.all(15.0),
                //                       icon: Icon(Icons.credit_card),
                //                       color: Colors.blue,
                //                       iconSize: 30.0,
                //                       onPressed: () {},
                //                     ),
                //                   ),
                //                   SizedBox(height: 8.0),
                //                   Text('Pay',
                //                       style: TextStyle(
                //                           color: Colors.black54,
                //                           fontWeight: FontWeight.bold))
                //                 ],
                //               ),
                //               Column(
                //                 children: <Widget>[
                //                   Material(
                //                     borderRadius: BorderRadius.circular(100.0),
                //                     color: Colors.lightBlue.withOpacity(0.1),
                //                     child: IconButton(
                //                       padding: EdgeInsets.all(15.0),
                //                       icon: Icon(Icons.receipt),
                //                       color: Colors.orange,
                //                       iconSize: 30.0,
                //                       onPressed: () {},
                //                     ),
                //                   ),
                //                   SizedBox(height: 8.0),
                //                   Text('Request',
                //                       style: TextStyle(
                //                           color: Colors.black54,
                //                           fontWeight: FontWeight.bold))
                //                 ],
                //               )
                //             ],
                //           ),
                //         ),
                // //         Padding(
                // //   padding:
                // //       EdgeInsets.symmetric(horizontal: 25.0, vertical: 20.0),
                // //   child: Row(
                // //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // //     children: <Widget>[
                // //       Column(
                // //         mainAxisSize: MainAxisSize.min,
                // //         crossAxisAlignment: CrossAxisAlignment.start,
          
                // //       ),
                // //       Material(
                // //         elevation: 1.0,
                // //         borderRadius: BorderRadius.circular(100.0),
                // //         color: Colors.blue[300],
                // //         child: MaterialButton(
                // //           onPressed: () {
                // //             Navigator.of(context).push(MaterialPageRoute(
                // //               builder: (BuildContext context) => DashboardPage()
                // //             ));
                // //           },
                // //           padding: EdgeInsets.symmetric(
                // //               vertical: 10.0, horizontal: 30.0),
                // //           child: Text(
                // //             'Status',
                // //             style:
                // //                 TextStyle(fontSize: 16.0, color: Colors.white),
                // //           ),
                // //         ),
                // //       )
                // //     ],
                // //   ),
                // // ),
                //       ],
                //     ),
                  // ),
                // ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.0, vertical: 30.0),
              child: Text(
                'POPULAR',
                style: TextStyle(
                    color: Colors.black.withOpacity(0.7),
                    fontWeight: FontWeight.bold,
                    fontSize: 20.0),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 30.0, bottom: 5.0),
              child: Container(
                height: 150.0,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    UpcomingCard(
                      title: 'Culturals',
                      // value: 5000.0,
                      color: Colors.purple,
                    ),
                    UpcomingCard(
                      title: 'Workshops',
                      // value: 5000.0,
                      color: Colors.blue,
                    ),
                    UpcomingCard(
                      title: 'Kummi',
                      value: 5000.0,
                      color: Colors.orange,
                    ),
                    UpcomingCard(
                      title: 'Bommalattam',
                      value: 5000.0,
                      color: Colors.pink,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class CustomShapeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();

    path.lineTo(0.0, 390.0 - 200);
    path.quadraticBezierTo(size.width / 2, 280, size.width, 390.0 - 200);
    path.lineTo(size.width, 0.0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}

class UpcomingCard extends StatelessWidget {
  final String title;
  final double value;
  final Color color;

  UpcomingCard({this.title, this.value, this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(right: 15.0),
      child: Container(
        width: 120.0,
        decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.all(Radius.circular(25.0))),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 20.0, vertical: 30.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(title,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold)),
              SizedBox(height: 30.0),
              Text('$value',
                  style: TextStyle(
                      fontSize: 22.0,
                      color: Colors.white,
                      fontWeight: FontWeight.bold))
            ],
          ),
        ),
      ),
    );
  }
}