import 'dart:async';
import 'package:flutter/material.dart';
import 'package:kalachar/kalachar_home_page.dart';
import 'package:kalachar/ui/screens/common.dart';
import 'package:kalachar/ui/screens/first_page.dart';
import 'package:kalachar/ui/screens/home_ui.dart';
import 'package:kalachar/ui/widgets/bezierContainer.dart';
import 'package:kalachar/ui/widgets/theme.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:timer_count_down/timer_count_down.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';



class OtpScreen extends StatefulWidget {
  @override
  _OtpScreenState createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> with  SingleTickerProviderStateMixin {
  TextEditingController _otpTextFieldController = TextEditingController(text: "");
  final RoundedLoadingButtonController _btnController = new RoundedLoadingButtonController();
  final RoundedLoadingButtonController _btnController1 = new RoundedLoadingButtonController();
  var onTapRecognizer;
  var  otp;
  bool _timerstatus = true;
  Timer timer;
  final int time = 60;
  int totalTimeInSeconds;
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
  @override
  void dispose() {
    super.dispose();
  }
  void verifyOtp() async {
     otp = _otpTextFieldController.text;
    try {
      http.Response response = await api_call(context,'post','verify_otp',data: {'login_attempt_id':'$loginAttemptId','incoming_otp':'$otp'});
      if (response == null) return;
      if(response.statusCode == 200){
        var res = json.decode(response.body)['message'];
        var status = res['status'];
      if (status=='Success') {
        api_key = res['api_key'];
        api_secret = res['api_secret'];
        mobileNumber = res['mobile_no'];
        SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs?.clear();
        prefs?.setBool("isLoggedIn", true);
        prefs?.setString("mobileNumber",mobileNumber);
        prefs?.setString("api_key",api_key);
        prefs?.setString("api_secret",api_secret);
        Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
            builder: (BuildContext context) => DashboardScreen()), (route) => false);
      } else if(status=='Failed'){
        showInSnackBar("Invalid OTP !!");
      }
      else if(status=='Expired'){
        showInSnackBar("Your OTP expired !!");
      }
      else if(status=='Maximum Limit Reached'){
        showInSnackBar("Maximum attempts reached. Please, try after sometimes !!");
      }
    }
    else{
      showInSnackBar("Unable to process your request !!");
    }
    _btnController.reset();
    } catch (e) {
      showInSnackBar("Error Try Again !!");
      _btnController.reset();
    }
  }


   Future<void> resendOtp() async {
    try {
      http.Response response = await api_call(context,'post','resend_otp',data: {'login_attempt_id':'$loginAttemptId'});
      if (response == null) return;
      print(response);
      if(response.statusCode == 200){
        var res = json.decode(response.body)['message'][0];
        var status = res['status'];
      if (status=='Success') {
        api_key = res['api_key'];
        api_secret = res['api_secret'];
        showInSnackBar("OTP sent successfully !!", Colors.green);
        setState((){
      _timerstatus=true;
              });
        
      } else if(status=='Failed'){
        showInSnackBar("Failed to send OTP !!");
      }
      else if(status=='Maximum Limit Reached !!'){
        showInSnackBar("Maximum attempts reached. Please, try after sometimes.");
      }
    }
    else{
      showInSnackBar("Failed to send OTP !!");
    }
    _btnController1.reset();
    } catch (e) {
      showInSnackBar("Error Try Again !!");
      _btnController1.reset();
    }
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
        resizeToAvoidBottomInset: true,
           body:
           Stack(
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
                            height: 25,
                          ),
                           Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5),
                            child: RichText(
                              text: TextSpan(
                                  text: "Enter the code sent to $mobileNumber",
                                  style: TextStyle(fontSize: 16, color: MyColors.primaryColor, fontFamily: 'Product Sans')),
                              textAlign: TextAlign.center,
                            ),
                          ),
                         SizedBox(
                          height: 1.0,
                         ),
                          PinCodeTextField(
                          hasTextBorderColor: MyColors.primaryColor,
                          pinBoxWidth: 40,
                          autofocus: false,
                          controller: _otpTextFieldController,
                          hideCharacter: false,
                          highlight: true,
                          highlightColor: Colors.grey,
                          defaultBorderColor: Colors.grey,
                          maxLength: 4,
                          onTextChanged: (text) {
                          },
                          onDone: (text) {
                          },
                          wrapAlignment: WrapAlignment.spaceAround,
                          pinBoxDecoration:
                              ProvidedPinBoxDecoration.underlinedPinBoxDecoration,
                          pinTextStyle: TextStyle(fontSize: 20.0, color: MyColors.primaryColor),
                          keyboardType: TextInputType.number,
                        ),
                           SizedBox(
                            height: 20,
                          ),
                          Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                          constraints: const BoxConstraints(
                              maxWidth: 150
                          ),
                            child:RoundedLoadingButton(
                            onPressed: () async {
                              SharedPreferences prefs = await SharedPreferences.getInstance();
                              prefs?.clear();
                              prefs?.setString("mobileNumber",mobileNumber);
                              print('99999999999999999999999999');
                              print(mobileNumber);
                              // verifyOtp();
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
            builder: (BuildContext context) => DashboardScreen()), (route) => false);
                            },
                            controller:_btnController,
                            color: MyColors.primaryColor,
                            valueColor: Colors.white,
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                              child: 
                                  Center(
                                  child: Text(
                                    "Verify OTP".toUpperCase(),
                                    style: TextStyle(fontSize: 16, fontFamily: 'Product Sans',color: Colors.white),
                                    textAlign: TextAlign.center,
                                  )
                                  )   
                            ),
                          ),
                           ),
                           _timerstatus ? _getTimer : _getResend,
                        ],
                    ),
                  )),
                  Positioned(top: 50, left:-2, child: _backButton()),
                 Positioned(
              top: -height * .15,
               left: -MediaQuery.of(context).size.width * .4,
                child: BezierContainer()),
            ],
          )
      ),
    );
  }

   Widget _backButton() {
    return InkWell(
      onTap: () {
        Navigator.pop(context);
      },
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 10),
        child: Row(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 0, top: 10, bottom: 10),
              child: Icon(Icons.keyboard_arrow_left, color:MyColors.primaryColor, size: 35,),
            ),
          ],
        ),
      ),
    );
  }
  get _getResend{
    return  Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      constraints: const BoxConstraints(
          maxWidth: 150
      ),
        child:RoundedLoadingButton(
        onPressed: () async {
          resendOtp();
        },
        controller:_btnController1,
        color: MyColors.primaryColor,
        valueColor: Colors.white,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
          child: 
              Center(
              child: Text(
                "Resend OTP".toUpperCase(),
                style: TextStyle(fontSize: 16, fontFamily: 'Product Sans',color: Colors.white),
                textAlign: TextAlign.center,
              )
              )   
        ),
      ),
        );
  }
  get _getTimer{
    return  Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30.0, vertical: 5),
    child:
    Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text("Resend OTP in ", style: TextStyle(color: MyColors.primaryColor),),
        Countdown(
        seconds: 30,
        build: (BuildContext context, double time) => Text(time.toInt().toString()+" Seconds", style: TextStyle(color:MyColors.primaryColor, fontSize: 16, fontFamily: 'Product Sans'),),
        interval: Duration(seconds: 1),
        onFinished: () {
          setState((){
          _timerstatus=false;
                  }
          );
        },
  ),
      ],
    )
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