
import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:kalachar/ui/screens/datepicker.dart';
import 'package:kalachar/ui/widgets/theme.dart';
import 'package:toast/toast.dart';


class InvoiceDetail extends StatefulWidget {
  var invoice = new Map<String, dynamic>();
  bool disable_Claim;
  InvoiceDetail({Key key, @required this.invoice, @required this.disable_Claim});
  @override
  _InvoiceDetailState createState() => _InvoiceDetailState(invoice: invoice,disable_Claim: disable_Claim);
}
// ignore: must_be_immutable
class _InvoiceDetailState extends State<InvoiceDetail>{
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
  _InvoiceDetailState({Key key, @required this.invoice, @required this.disable_Claim});
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
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    
                    Text('Culturals: PerHour',
                    style:TextStyle(color: Colors.grey,)),
                    Text(
                    'Advance - Rs.2000',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16
                    ),),
                    Text(
                    'Full Amount - Rs.10000',
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 16
                    ),),
                  ]
                ),
              ],
            ),
            Divider(height: 16,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  flex: 1,
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Workshop: PerMonth',
                        style:TextStyle(color: Colors.grey,)),
                    Container(
                      child: Text(
                        'Advance - Rs.2500',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16
                        ),),)
                  ],
                ),),
//                Expanded(flex:1,child:VerticalDivider(thickness: 15,),),
                Expanded(
                  flex: 1,
                  child:Container(
                      padding: EdgeInsets.only(left: 10),
                      decoration: BoxDecoration(
                          border: Border(left: BorderSide(color: Theme.of(context).dividerColor,width: 0.75))
                      ),
                  child:Row(
                    children:[
                    Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                    Text('Final Amount:',
                        style:TextStyle(color: Colors.grey,)),
                      Text(
                        '15000',
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 16
                        ),),
                  ],
                ),])),)
              ],
            ),
            Divider(height: 16,),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                Text('Booking Date:',style: TextStyle(color: Colors.grey,fontSize: 12),),
                                                DatePicker(
                                                    onTap: () => editable
                                                        ? _selectDate(context, "startDate")
                                                        : null,
                                                    date: startDate),
                                              ],
                                            ),       
                      ],
                    ),
                  )
                ]
            ),
            SizedBox(height: 5,),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                         TextField(
                          controller: _amtController,
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
                              labelText: 'Request Amount (To Reduce)',
                              labelStyle: TextStyle( color:Colors.grey,fontFamily: 'Product Sans', fontSize: 16),
                              errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0,fontFamily: 'Product Sans' ),
                              errorText: _validateAmt? 'Mandatory Field' : null,
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                      ],
                    ),
                  ),
                ]
            ),
            Divider(height: 16,),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                              labelText: 'Hours',
                              labelStyle: TextStyle( color:Colors.grey,fontFamily: 'Product Sans', fontSize: 16),
                              errorStyle: TextStyle(color: Colors.redAccent, fontSize: 16.0,fontFamily: 'Product Sans' ),
                              errorText: _validateName? 'Mandatory Field' : null,
                          ),
                          keyboardType: TextInputType.phone,
                        ),
                      ],
                    ),
                  ),
                ]
            ),
                  RaisedButton(
                    padding: EdgeInsets.all(8),
                    disabledColor: Colors.grey,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                        side: BorderSide(color: MyColors.secondaryColor)),
                    onPressed: () {
                      Toast.show("Booking Confirmed", context,duration: Toast.LENGTH_LONG,gravity: Toast.BOTTOM);
                    },
                    color: MyColors.secondaryColor,
                    textColor: Colors.white,
                    child: Text("Book Now".toUpperCase(),
                        style: TextStyle(fontSize: 14)),
                  )
              ],
            ));
  }
}