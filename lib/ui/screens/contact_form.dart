import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kalachar/ui/screens/common.dart';
import 'package:kalachar/ui/screens/dancer_form.dart';
import 'package:kalachar/ui/screens/otp_screen.dart';
import 'package:kalachar/ui/widgets/theme.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:toast/toast.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_svg/svg.dart';


class Others extends StatefulWidget {
  @override
  OthersState createState() {
    return OthersState();
  }
}

class OthersState extends State<Others> {
final RoundedLoadingButtonController _btn1Controller = new RoundedLoadingButtonController();
final RoundedLoadingButtonController _btn2Controller = new RoundedLoadingButtonController();
bool contactFormStatus = false;

 _navigateAndDisplaySelection(BuildContext context, Widget widget) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) =>widget),
    );
 }
 Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: false,
        elevation: 0,
        backgroundColor:  Color(0xFFEEEEEE),
        title: Center(
          child: Text('New User',
          style: TextStyle(fontSize: 24, color: Colors.black, fontFamily: 'Product Sans'),),
        )
      ),
      body: contactFormStatus==null?
      Center(child: CircularProgressIndicator())
          : contactFormStatus==true?Center(child:
      Container(
        padding: EdgeInsets.all(16),
        child: ListView(
          shrinkWrap: true,
          children: [
            Column(
            mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children:<Widget>[
                  // SvgPicture.asset('assets/images/others_waiting.svg',width: MediaQuery.of(context).size.width/4*3,),
                  // Text(message_hi,style: TextStyle(fontFamily: 'Product Sans', color: Colors.black, fontSize: 20,), textAlign: TextAlign.center),
                  // SizedBox(height: 10,),
                  // Text(message_en,style: TextStyle(fontFamily: 'Product Sans', color: Colors.black, fontSize: 20,), textAlign: TextAlign.center),
                ]
                ),
          ],
        ),
      )
          ):
      CustomScrollView(
        slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate([
                Container(
                    padding: EdgeInsets.all(16),
                  child:Container(
                      alignment: Alignment(0,0),
                      padding: EdgeInsets.only(top: 11,left: 16,right: 16,bottom: 11),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          boxShadow: [BoxShadow(
                            spreadRadius: 5,
                            blurRadius: 8.0,
                            color: Colors.black.withOpacity(.1),
                            offset: Offset(0,0),
                          )]
                      ),
                      child:
                      Center(
                        child:Column(
                    children: <Widget>[
                      Row(
                        mainAxisSize:MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child:
                            Center(child:Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                 Align(
                              alignment: Alignment.center,
                              child:
                                SvgPicture.asset('assets/images/undraw_workout_gcgu.svg', alignment: Alignment.center,fit:BoxFit.contain,width: 100,height: 100,),
                                ),
                                Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                              'Are you a Dancer?',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color:Colors.grey,
                                  fontSize: 20
                              ),
                                ),),
                            SizedBox(height:10),
                            RoundedLoadingButton(
                            controller: _btn1Controller,
                            color:  MyColors.primaryColor,
                            valueColor: Colors.white,
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                              child:
                                  Center(
                                  child: Text(
                                    "Update Dance Group Info",
                                    style: TextStyle(fontSize: 16, fontFamily: 'Product Sans',color:Colors.white),
                                    textAlign: TextAlign.center,
                                  )
                                  )
                            ),
                            onPressed: () {
                             Future.delayed(const Duration(seconds: 1), () {
                               _navigateAndDisplaySelection(context, DistributorContact());
                               _btn1Controller.reset();
                            },
                          );
                            }
                            ),
                          SizedBox(height:10),
                              ],
                            ),
                            )
                          ),
                        ],
                      ),
                    ],
                      )
                  ))),
                Container(
                    padding: EdgeInsets.all(16),
                  child:Container(
                      alignment: Alignment(0,0),
                      padding: EdgeInsets.only(top: 11,left: 16,right: 16,bottom: 11),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5.0)),
                          boxShadow: [BoxShadow(
                            spreadRadius: 5,
                            blurRadius: 8.0,
                            color: Colors.black.withOpacity(.1),
                            offset: Offset(0,0),
                          )]
                      ),
                      child:
                      Center(
                        child:Column(
                    children: <Widget>[
                      Row(
                        mainAxisSize:MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child:
                            Center(child:Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: <Widget>[
                                 Align(
                              alignment: Alignment.center,
                              child:
                                SvgPicture.asset('assets/images/undraw_booking_33fn.svg', alignment: Alignment.center,fit:BoxFit.contain,width: 100,height: 100,),
                                ),
                                Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                              "Are you an event organizer?",
                                textAlign: TextAlign.center,
                              style: TextStyle(
                                  color:Colors.grey,
                                  fontSize: 20
                              ),
                                ),),
                          SizedBox(height:10),
                          RoundedLoadingButton(
                            controller: _btn2Controller,
                            color:  MyColors.primaryColor,
                            valueColor: Colors.white,
                            child: Container(
                              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                              child:
                                  Center(
                                  child: Text(
                                    "Update Organization Info",
                                    style: TextStyle(fontSize: 16, fontFamily: 'Product Sans',color:Colors.white),
                                    textAlign: TextAlign.center,
                                  )
                                  )
                            ),
                            onPressed: () {
                              Future.delayed(const Duration(seconds: 1), () {
                                 _navigateAndDisplaySelection(context, OthersContact());
                               _btn2Controller.reset();
                                });
                            },
                          ),
                          SizedBox(height:10),
                              ],
                            ),
                            )
                          ),
                        ],
                      ),
                    ],
                      )
                  )))])
    )])
        );
 }
}




class OthersContact extends StatefulWidget {
  @override
  OthersContactState createState() {
    return OthersContactState();
  }
}

class OthersContactState extends State<OthersContact> {
  final RoundedLoadingButtonController _btn1Controller = new RoundedLoadingButtonController();
  var data;
  var annual_turnover_range = [
    "Below 2.5 crores",
    "2.5 - 5 crores",
    "5 - 10 crores",
    "10 - 15 crores",
    "15 - 20 crores",
    "Above 20 crores"
  ];
  var business_years = [
    "Below 2 years",
    "2-5 years",
    "5-10 years",
    "10-15 years",
    "15 - 20 years",
    "Above 20 years"
  ];
  var dealing_status = [
    "Yes",
    "No"
  ];
  String yearField;
  String turnOver;
  String dealingField;
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  String paymentOption;
  final _businessController = TextEditingController();
  final _userController = TextEditingController();
  final _addressController = TextEditingController();
  bool _validateBusinessName = false;
  bool _validateName = false;
  bool _validateCity = false;
  bool _validatePincode = false;
  bool _validateTurnover = false;
  bool _validateBusinessYears = false;
  bool _validateDealingStatus = false;
  bool _validateBrands = false;

  void submitOthersNewContact(var body) async {
    // try {
      Toast.show("Submitted Successfully", context,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
    //   http.Response response = await api_call(context,'post','submit_others_new_contact',
    //   data: body
    //   );
    //   if (response == null) {_btn1Controller.reset(); return;}
    //   if(response.statusCode == 200){
    //     var res = json.decode(response.body)['message'];
    //     var status = res['status'];
    //   if (status=='open') {
    //     Navigator.pop(context, ['Our Team will Connect Shortly']);
    //   } 
    // }
    // else{
    //   Toast.show("Error", context,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
    // }
    // _btn1Controller.reset();
    // } catch (e) {
    //   showInSnackBar("Unable to submit");
    //   _btn1Controller.reset();
    // }
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: false,
          elevation: 0,
          backgroundColor:  Color(0xFFEEEEEE),
          title: Text('Organization Verification Form',
          style: TextStyle(fontSize: 24, color: Colors.black, fontFamily: 'Product Sans'),),
           leading: new IconButton(
                  icon: new Icon(Icons.arrow_back_ios),
                  onPressed: () {
                    Navigator.pop(context);
                  }
                ),
        ),
        body:
        Padding(
          padding: const EdgeInsets.all(10),
          child: ListView(
            children: <Widget>[
                 Column(
                  children: <Widget>[
                    SizedBox(height:10),
                     TextField(
                          controller: _businessController,
                          style: TextStyle(color: Colors.black),
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            enabledBorder:  new OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(10.0),
                                  ),
                                  borderSide: BorderSide(
                                  color: Colors.grey
                                  )
                                ),
                            errorBorder:  new OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(10.0),
                                  ),
                                  borderSide: BorderSide(
                                  color: Colors.red
                                  )
                                ),
                            focusedBorder:
                            new OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(10.0),
                                  ),
                                  borderSide: BorderSide(
                                  color:MyColors.primaryColor
                                  )
                                ),
                              labelText: 'Enter your organization name',
                              labelStyle: TextStyle(fontFamily: 'Product Sans', color: Colors.grey, fontSize: 16),
                              focusColor: MyColors.primaryColor,
                              errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0,fontFamily: 'Product Sans' ),
                              errorText: _validateBusinessName? 'Mandatory Field' : null,
                          ),
                          keyboardType: TextInputType.text,
                        ),
                         SizedBox(height:10),
                     TextField(
                          controller: _userController,
                          style: TextStyle(color: Colors.black),
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            enabledBorder:  new OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(10.0),
                                  ),
                                  borderSide: BorderSide(
                                  color: Colors.grey
                                  )
                                ),
                                errorBorder:  new OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(10.0),
                                  ),
                                  borderSide: BorderSide(
                                  color: Colors.red
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
                              labelText: 'Enter your full name',
                              labelStyle: TextStyle( color:Colors.grey,fontFamily: 'Product Sans', fontSize: 16),
                              errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0,fontFamily: 'Product Sans' ),
                              errorText: _validateName? 'Mandatory Field' : null,
                          ),
                          keyboardType: TextInputType.text,
                        ),
                         SizedBox(height:20),
                          TextField(
                          controller: _addressController,
                          style: TextStyle(color: Colors.black),
                          cursorColor: Colors.black,
                          decoration: InputDecoration(
                            alignLabelWithHint: true,
                            enabledBorder:  new OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(10.0),
                                  ),
                                  borderSide: BorderSide(
                                  color: Colors.grey
                                  )
                                ),
                            errorBorder: new OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(10.0),
                                  ),
                                  borderSide: BorderSide(
                                  color: Colors.red
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
                              labelText: ' Organization Address',
                              labelStyle: TextStyle(color: Colors.grey,fontFamily: 'Product Sans', fontSize: 16),
                          ),
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                        ),
                    SizedBox(
                      height:10
                    ),
                    
                  ],
                ),
              SizedBox(height:20),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Center(
                    child:SizedBox(
                    width: 100,
                    child:
                    RoundedLoadingButton(
                      controller: _btn1Controller,
                      color:  MyColors.primaryColor,
                      valueColor: Colors.white,
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                        child:
                            Center(
                            child: Text(
                              "Submit".toUpperCase(),
                              style: TextStyle(fontSize: 16, fontFamily: 'Product Sans',color:Colors.white),
                              textAlign: TextAlign.center,
                            )
                            )
                      ),
                      onPressed: () {
                          Map body = {
                          "data": {
                            "org_name": "${_businessController.text}",
                             "name1": "${_userController.text}",
                              "org_address": "${_addressController.text}",
                            
                          }};
                        submitOthersNewContact(body);
                        }
                            ),
                    )
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}