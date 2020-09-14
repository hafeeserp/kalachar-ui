import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kalachar/ui/screens/common.dart';
import 'package:kalachar/ui/screens/otp_screen.dart';
import 'package:kalachar/ui/widgets/theme.dart';
import 'package:rounded_loading_button/rounded_loading_button.dart';
import 'package:toast/toast.dart';

class DistributorContact extends StatefulWidget {
  @override
  DistributorContactState createState() {
    return DistributorContactState();
  }
}

class DistributorContactState extends State<DistributorContact> {
  final RoundedLoadingButtonController _btn1Controller = new RoundedLoadingButtonController();
  var data;
  bool autoValidate = true;
  bool readOnly = false;
  bool showSegmentedControl = true;
  String paymentOption;
  final _businessController = TextEditingController();
  final _userController = TextEditingController();
  final _typeController = TextEditingController();
  final _bankController = TextEditingController();
  final _addressController = TextEditingController();
  bool _validateBusinessName = false;
  bool _validateFullName = false;
  bool _validateDanceType = false;
  bool _validateBank = false;
  var annual_turnover_range = [
    "Account Details",
    "Gpay",
    "Phonepe"
  ];
  String turnOver;
  void submitOthersNewContact(var body) async {
    Toast.show("Submitted Successfully", context,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
    // try {
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
          backgroundColor: Color(0xFFEEEEEE),
          title: Text('Dancer Verification Form',style: TextStyle(fontFamily: 'Product Sans', fontSize: 24, color: Colors.black),),
           leading: new IconButton(
          icon: new Icon(Icons.arrow_back_ios),
          onPressed: () {
            Navigator.pop(context);
          }
        ),
        ),
        body: Padding(
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
                              labelText: 'Enter your dance group name',
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
                              // errorText: _validateFullName? 'Mandatory Field' : null,
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
                                  color: MyColors.secondaryColor
                                  )
                                ),
                              labelText: 'Address',
                              labelStyle: TextStyle(color: Colors.grey,fontFamily: 'Product Sans', fontSize: 16),
                          ),
                          keyboardType: TextInputType.multiline,
                          maxLines: 5,
                        ),
                      
                    SizedBox(
                      height:10
                    ),
                     TextField(
                          controller: _typeController,
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
                              labelText: 'Dance Category',
                              labelStyle: TextStyle( color:Colors.grey,fontFamily: 'Product Sans', fontSize: 16),
                              errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0,fontFamily: 'Product Sans' ),
                              // errorText: _validateDanceType? 'Mandatory Field' : null,
                          ),
                          keyboardType: TextInputType.text,
                        ),
                         SizedBox(height:20),
                         FormField<String>(
                    builder: (FormFieldState<String> state) {
                    return InputDecorator(
                      decoration: InputDecoration(
                         focusedBorder:
                            new OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(10.0),
                                  ),
                                  borderSide: BorderSide(
                                  color: MyColors.secondaryColor
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
                        enabledBorder:  new OutlineInputBorder(
                                  borderRadius: const BorderRadius.all(
                                    const Radius.circular(10.0),
                                  ),
                                  borderSide: BorderSide(
                                  color: Colors.grey
                                  )
                                ),
                          labelStyle: TextStyle(color: Colors.grey,fontFamily: 'Product Sans', fontSize: 16),
                          errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0,fontFamily: 'Product Sans' ),
                          labelText: 'Banking Info Type',
                      ),
                      // isEmpty: turnOver == '',
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          value: turnOver,
                          isDense: true,
                           onTap: () {
                          setState(() {
                          });
                        },
                          onChanged: (String newValue) {
                            setState(() {
                              turnOver = newValue;
                              state.didChange(newValue);
                            });
                          },
                          items: annual_turnover_range.map((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList()
                        ),
                      ),
                    );
                  },
                ),
                  SizedBox(height:20),
                   TextField(
                          controller: _bankController,
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
                              labelText: 'Banking Details (Account number, UPI ID)',
                              labelStyle: TextStyle( color:Colors.grey,fontFamily: 'Product Sans', fontSize: 16),
                              errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0,fontFamily: 'Product Sans' ),
                              // errorText: _validateBank? 'Mandatory Field' : null,
                          ),
                          keyboardType: TextInputType.multiline,
                          maxLines: 5
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
                      color: MyColors.primaryColor,
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
                        Map<String, dynamic> body = {
                            "data": {
                              "org_name": "${_businessController.text}",
                              "name1": "${_userController.text}",
                              "org_address": "${_addressController.text}",
                              "dance_category": "${_typeController.text}",
                              "bank_type": "$turnOver",
                              "bank_details": "${_bankController.text}"
                            }
                        };
                        submitOthersNewContact(body);
                        }
                            ),
                    )
                  ),
                  ],
              ),
            ],
          ),
            ]))),
    );
  }
}
