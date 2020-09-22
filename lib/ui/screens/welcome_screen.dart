// import 'package:flutter/material.dart';
// import 'package:kalachar/ui/widgets/custom_flat_button.dart';
// import 'package:kalachar/ui/screens/sign_up_screen.dart';
// import 'package:kalachar/ui/screens/login_screen.dart';
// DateTime currentBackPressTime;

// class WelcomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.black,
//       body:
//       new ListView(
//         children: <Widget>[
//           Padding(
//             padding: EdgeInsets.only(top: 60.0),
//             child: Icon(
//               Icons.phone_iphone,
//               color: Colors.teal[200],
//               size: 125.0,
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.only(top: 35.0, right: 15.0, left: 15.0),
//             child: Text(
//               "Kalachar",
//               softWrap: true,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Colors.teal[200],
//                 decoration: TextDecoration.none,
//                 fontSize: 24.0,
//                 fontWeight: FontWeight.w700,
//                 fontFamily: "OpenSans",
//               ),
//             ),
//           ),
//           Padding(
//             padding: const EdgeInsets.all(20.0),
//             child: Text(
//             "App to book traditional dancers for culturals and workshops",
//               softWrap: true,
//               textAlign: TextAlign.center,
//               style: TextStyle(
//                 color: Colors.teal[200],
//                 decoration: TextDecoration.none,
//                 fontSize: 15.0,
//                 fontWeight: FontWeight.w300,
//                 fontFamily: "OpenSans",
//               ),
//             ),
//           ),
//           Padding(
//             padding:
//                 const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40.0),
//             child: CustomFlatButton(
//               title: "Log In",
//               fontSize: 22,
//               fontWeight: FontWeight.w700,
//               textColor: Colors.white,
//               onPressed: () {
//                 Navigator.push(context,MaterialPageRoute(builder:(context)=>LoginScreen()),);
//               },
//               splashColor: Colors.teal[200],
//               borderColor: Colors.teal[200],
//               borderWidth: 0,
//               color: Colors.teal[200]
// //              color: Color.fromRGBO(212, 20, 15, 1.0),
//             ),
//           ),
//           Padding(
//             padding:
//                 const EdgeInsets.symmetric(vertical: 8.0, horizontal: 40.0),
//             child: CustomFlatButton(
//               title: "Sign Up",
//               fontSize: 22,
//               fontWeight: FontWeight.w700,
//               textColor: Colors.teal[200],
//               onPressed: () {
//                 Navigator.push(context,MaterialPageRoute(builder:(context)=>SignUpScreen()),
//                 );
//                 // Navigator.of(context).pushNamed("/signup");
//               },
//               splashColor: Colors.teal[200],
//               borderColor: Colors.teal[200],
//               borderWidth: 2,
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }



// //BackButton
// class BackButton extends StatefulWidget {
//   @override
//   _BackButtonState createState() => _BackButtonState();
// }
// class _BackButtonState extends State<BackButton> {
//   DateTime backbuttonpressedTime;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: WillPopScope(
//         child: Center(
//           child: Text('Double Click to exit app'),
//         ),
//       ),
//     );
//   }
// }




import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:kalachar/ui/screens/common.dart';
import 'package:kalachar/ui/screens/otp_screen.dart';
import 'package:kalachar/ui/widgets/bezierContainer.dart';
import 'package:kalachar/ui/widgets/theme.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:http/http.dart' as http;

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> with SingleTickerProviderStateMixin {
  final RoundedLoadingButtonController _btnController = new RoundedLoadingButtonController();
  TextEditingController phoneController = TextEditingController();
  bool expanded = true;
  AnimationController controller;
  @override
   void initState() {
    super.initState();
    controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 400),
      reverseDuration: Duration(milliseconds: 400),
    );
   }
   Future<String> login_attempt() async {
    mobileNumber = phoneController.text;
      http.Response response = await api_call(context,'post','login_attempt',data: {'mobile_number':'$mobileNumber'});
      print(response);
      if(response!=null) {

        if (response.statusCode == 200) {
          Map<String, dynamic> jsonRes = json.decode(
              response.body)['message'][0];
          if (jsonRes.containsKey('name')) {
            loginAttemptId = jsonRes['name'];
            print('came');
            Navigator.push(context, MaterialPageRoute(
                builder: (context) => OtpScreen()));
          }
          else {
            showInSnackBar('OTP Generation Failed !!');
          }
        } else if (response.statusCode > 400 && response.statusCode < 500) {
          showInSnackBar("Error try again !!");
        }
        else {
          showInSnackBar(
              "Oops something wrong !!");
        }
      }
      _btnController.reset();

  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.of(context).size.height;
    return GestureDetector(
      onTap: () {
            FocusScopeNode currentFocus = FocusScope.of(context);
            if (!currentFocus.hasPrimaryFocus) {
            currentFocus.unfocus();
            }
          },
      child: Scaffold(
        key: _scaffoldKey,
        backgroundColor: Colors.white,
           body:Stack(
            children: <Widget>[
               Positioned(
                  width: MediaQuery.of(context).size.width,
                  top: MediaQuery.of(context).size.width * 0.30,
                  child: Container(
                    margin: EdgeInsets.all(16.0),
                    child:Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                           SizedBox(
                            height: 55,
                          ),
                          Image.asset('assets/images/kalachaar.png', scale: 5.5),
                          SizedBox(
                            height:65,
                          ),
                          TextField(
                          controller: phoneController,
                          style: TextStyle(color: Colors.black),
                          cursorColor: Colors.black,
                          decoration: InputDecoration( 
                            counterStyle: TextStyle(color: MyColors.primaryColor),
                            enabledBorder:  new OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(10.0),
                                  ),
                                  borderSide: BorderSide(
                                  color: MyColors.primaryColor
                                  )
                                ),
                            focusedBorder: 
                            new OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(10.0),
                                  ),
                                  borderSide: BorderSide(
                                  color: MyColors.primaryColor
                                  )
                                ),
                            icon: Icon(Icons.phone, color: MyColors.primaryColor,),
                              labelText: 'Mobile Number',
                              labelStyle: TextStyle(color: MyColors.primaryColor,fontFamily: 'Product Sans'),
                              hintStyle: TextStyle(color: Colors.black),
                              prefixText: '+91 ',
                          ),
                          keyboardType: TextInputType.number,
                          maxLengthEnforced: true,
                          maxLength: 10,
                          
                        ),
                        SizedBox(
                          height:25
                        ),
                        Container(
                                  margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                                  constraints: const BoxConstraints(
                                      maxWidth: 150
                                  ),
                          child:RoundedLoadingButton(
                                    onPressed: () async {
                                      if (phoneController.text.length==10)
                                      {
                                        mobileNumber = phoneController.text;
                                        Navigator.push(context, MaterialPageRoute(
                builder: (context) => OtpScreen()));
                                        // login_attempt();
                                        // print(loginAttemptId);
                                      }
                                      else{
                                        showInSnackBar("Please Enter 10 Digit Phone Number");
                                        _btnController.reset();
                                      }
                                    },
                                    controller:_btnController,
                                    color: MyColors.primaryColor,
                                    valueColor: Colors.white,
                                    child: Container(
                                      padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                                      child: 
                                          Center(
                                          child: Text(
                                            'Get OTP'.toUpperCase(),
                                            style: TextStyle(fontSize: 16, fontFamily: 'Product Sans',color: Colors.white),
                                            textAlign: TextAlign.center,
                                          )
                                          )   
                                    ),
                                  ),
                           )
                        ],
                    ),
                  )),
                  Positioned(
              top: -height * .15,
               left: -MediaQuery.of(context).size.width * .4,
                child: BezierContainer()),
            ],
          )
      ),
    );
  }
}
final GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
void showInSnackBar(String value, [Color color = Colors.red]) {
    _scaffoldKey.currentState.showSnackBar(new SnackBar(
      behavior: SnackBarBehavior.floating,
      backgroundColor: color,
      content: new Text(value,style: TextStyle(color: Colors.white, fontSize: 16, fontFamily: 'Product Sans'))));
}



