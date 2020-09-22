import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kalachar/ui/screens/welcome_screen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:toast/toast.dart';

var mobileNumber;
String api_url = 'https://kalachar.aerele.in';
// String api_url = 'http://kalachaar-demo:8000';
var loginAttemptId;
var api_key;
var api_secret;
int lastSelectedAccountsTab = 1;
var user_name;
bool user_status = true;

Future<http.Response> api_call(BuildContext context,String api_call_type,String api_name,{var header = null,var url_params = null,var data = null})async{
      http.Response response = null;
    try {
      var api_list = {
        "ledger_list":["/api/method/essdee_partners_api.essdee_partners_api.doctype.essdee_partners_api_settings.essdee_partners_api_settings.ledger_list",true],
        "login_attempt":["/api/method/kalachar.kalachar.doctype.login_details.login_details.login_attempt", false],
        "verify_otp":["/api/method/kalachar.kalachar.doctype.login_details.login_details.verify_otp", false],
        "resend_otp":["/api/method/kalachar.kalachar.doctype.login_details.login_details.resend_otp", false],
        "submit_others_new_contact": ["/api/method/kalachar.kalachar.doctype.user_information.user_information.create_new_user",true],
        "get_contact_form_status": ["/api/method/essdee_partners_api.essdee_partners_api.doctype.contact_form.contact_form.status", true],
        "send_request":["/api/method/kalachar.kalachar.doctype.booking_status.booking_status.send_booking_info?phone_no=6383291865", false],
        "accept_request":["/api/method/kalachar.kalachar.doctype.booking_status.booking_status.accept_booking_info?phone_no=6383291865", false],
        "deny_request":["/api/method/kalachar.kalachar.doctype.booking_status.booking_status.deny_booking_info?phone_no=6383291865", false],
      };
      if(header==null)
        header = {} ;
      if (!header.containsKey('Accept'))
        header= {'Accept':'application/json'};
      // if (!header.containsKey('Content-Type'))
      //   header= {'Content-Type':'application/json'};

      if (api_list[api_name][1])
        header['Authorization'] = 'token $api_key:$api_secret';
      String url_param = "?";
      if(url_params!=null){
        url_params.forEach((k,v) =>
            url_param+=k+'='+v+'&'
        );
      }
      if (api_call_type == 'get') {
        response = await http.get(
            api_url + api_list[api_name][0].toString(), headers: header);
      }
      else{
        print(api_url);
        print(api_list[api_name][0]);
        print(header);
        print(data);
        response = await http.post(
          api_url + api_list[api_name][0], headers: header, body: data);
        print(response.statusCode);
      }
      SharedPreferences prefs = await SharedPreferences.getInstance();
      if (response.statusCode == 403 || response.statusCode == 401) {
        logoutUser(context);
      }
      else if (response.statusCode >= 500 && response.statusCode < 600) {
        Toast.show("Server Error. Please try after sometime.", context,
            duration: Toast.LENGTH_SHORT, gravity: Toast.BOTTOM);
      }
      return response;
    }catch(e){
      print(e);
      showInSnackBar("Submitted Successfully");
      // Navigator.pop(context, ['Our Team will Connect Shortly']);
        // Toast.show("No Internet Connection.", context,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
      }
    }

Future<void> logoutUser(BuildContext context) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  prefs?.clear();
  loginAttemptId = null;
  api_key = null;
  api_secret = null;
  mobileNumber = null;
  Toast.show("You have been logged out", context, duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
  Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) =>
     WelcomeScreen()), (Route<dynamic> route) => false);
}