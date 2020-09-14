
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:kalachar/ui/screens/datepicker.dart';
import 'package:kalachar/ui/widgets/theme.dart';
import 'package:toast/toast.dart';


class FinalDetail extends StatefulWidget {
  var invoice = new Map<String, dynamic>();
  bool disable_Claim;
  FinalDetail({Key key, @required this.invoice, @required this.disable_Claim});
  @override
  _FinalDetailState createState() => _FinalDetailState(invoice: invoice,disable_Claim: disable_Claim);
}
// ignore: must_be_immutable
class _FinalDetailState extends State<FinalDetail>{
  var invoice = new Map<String, dynamic>();
  bool disable_Claim;
  String startDate = '01-04-2020';
   bool _validateName = false;
   bool _validateAmt = false;
   final _userController = TextEditingController();
   final _amtController = TextEditingController();
  String endDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
  String apiStartDateFormat = '20200401';
  String apiEndDateFormat = DateFormat("yyyyMMdd").format(DateTime.now());
  // ignore: non_constant_identifier_names
  bool isPDFButtonTapped = false;
  var annual_turnover_range = [
    "Accept",
    "Deny"
  ];
  String turnOver;
  // ignore: non_constant_identifier_names
  _FinalDetailState({Key key, @required this.invoice, @required this.disable_Claim});
  Future<Null> _selectDate(BuildContext context, selectedDate) async {
      DateTime picked;
      if(selectedDate == "startDate")
        picked = await showDatePicker(
        context: context,
        initialDate: DateFormat("dd-MM-yyyy").parse(startDate),
        firstDate: DateTime(2015, 8),
        lastDate: DateTime.now());
      else
        picked = await showDatePicker(
            context: context,
            initialDate: DateFormat("dd-MM-yyyy").parse(endDate),
            firstDate: DateTime(2015, 8),
            lastDate: DateTime.now());
    if (picked != null){
    String date = "${DateFormat("dd-MM-yyyy").format(picked.toLocal())}";
    String apiDateFormat = "${DateFormat("yyyyMMdd").format(picked.toLocal())}";
    if (selectedDate == "startDate") {
      if (picked != null && date != startDate)
        setState(() {
          startDate = date;
          apiStartDateFormat = apiDateFormat;
        });
    } else {
      if (picked != null && date != endDate)
        setState(() {
          endDate = date;
          apiEndDateFormat = apiDateFormat;
        });
    }
  }
  }
  
  Widget build(BuildContext context){
    bool editable = true;
    return Container(
        padding: EdgeInsets.only(top: 8,right:8,left:8),
        margin: EdgeInsets.only(top:8,right:8,left:8),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.only(topLeft:Radius.circular(10.0),topRight:Radius.circular(10.0)),
            color: Colors.white,
            boxShadow: [BoxShadow(
              blurRadius: 5.0,
              color: Colors.black.withOpacity(.08),
              offset: Offset(1.0, 7.0),
            )]
        ),
//                  color:Colors.grey,
        child:Column(
          children: [
            Divider(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
            SizedBox(height: 5,),
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
                          labelText: 'Status',
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
                Center(
                  child:RaisedButton(
                    padding: EdgeInsets.all(10),
                    disabledColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        side: BorderSide(color: MyColors.secondaryColor)),
                    onPressed: () {
                      if (turnOver=='Accept')
                      Toast.show("Payment Info sent shortly", context,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
                      else
                      Toast.show("Booking Declined", context,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
                    },
                    color: MyColors.secondaryColor,
                    textColor: Colors.white,
                    child: Text("Submit".toUpperCase(),
                        style: TextStyle(fontSize: 14)),
                  )
                )
              ],
            ))])]));
  }
}