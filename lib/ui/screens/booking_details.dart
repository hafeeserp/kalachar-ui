import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kalachar/ui/screens/explore_details.dart';
import 'package:kalachar/ui/screens/final_screen.dart';
import 'package:kalachar/ui/screens/sizeconfig.dart';
import 'package:kalachar/ui/widgets/theme.dart';


class Booking extends StatefulWidget {
  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> {
  TextEditingController textEditingController;
  var annual_turnover_range = [
    "Accept",
    "Deny"
  ];
 var invoice = 
[
		{
			"date": "Ram - Prist University",
			"voucher_no": "11 Nehru nagar,Porur, Chennai-21",
			"amount": 6383291865,
			"cashback_claim_status": "available",
		},
		{
			"date": "Subha - Anna University",
			"voucher_no": "10 Raja nagar Covai-21",
			"amount": 8798989899,
			"cashback_claim_status": "available",
		},
		{
			"date": "Prince - KPM University",
			"voucher_no": "5 prime road Cuddalore-21",
			"amount": 7798934399,
			"cashback_claim_status": "available",
		
		},
			{
			"date": "Kala - Prime University",
			"voucher_no": "11 Krishna nagar Chennai-21",
			"amount": 6798989899,
			"cashback_claim_status": "available",
		}
	];
   @override
  void initState() {
    super.initState();
    
  }
  
  @override
  Widget build(BuildContext context) {
    if(invoice.length==0)
     return Center(child: CircularProgressIndicator());
    else
    return  Scaffold(
      backgroundColor: Colors.white,
    body:RefreshIndicator(
        color: MyColors.secondaryColor,
        onRefresh: ()async{
      // await getInvoiceList(force_refresh: true);
    },
    child:
     ListView.builder(
        itemCount: invoice.length,
        itemBuilder: (BuildContext context, int index) {
          return InkWell(
            onTap: (){
              var invoiceDetail = invoice[index].cast<String,dynamic>();
              bool disable_claim = invoiceDetail['cashback_claim_status']=='available'?true:false;
              showModalBottomSheet(
                  context: context,
                  isScrollControlled: true,
                  backgroundColor: Colors.transparent,
                  elevation: 10,
                  builder: (BuildContext context) {
                    return Container(
                        decoration: new BoxDecoration(
                                  color: Color(0xFFEEEEEE),
                                  borderRadius: new BorderRadius.only(
                                      topLeft: const Radius.circular(16),
                                      topRight: const Radius.circular(16))),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            Container(
                              padding: EdgeInsets.only(top: 16),
                              child:Text("Booking Status",style: TextStyle(fontSize: 24),)
                            ),
                            new FinalDetail( invoice: invoiceDetail, disable_Claim: disable_claim),
                          ],
                        ));
                  });
            },
            child:
          Container(
            width: SizeConfig.safeBlockHorizontal,
            padding: EdgeInsets.only(left: 16,right: 16,top: 16,bottom: 16),
              margin: EdgeInsets.all(8),
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                    left: BorderSide(
                      color: invoice[index]['cashback_claim_status'] == 'available'?Colors.blue:Colors.white,
                      width: 5
                    ),
                  ),
                  boxShadow: [BoxShadow(
                    spreadRadius: 2,
                    blurRadius: 4.0,
                    color: Colors.black.withOpacity(.1),
                    offset: Offset(0,0),
                  )]
              ),
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children:<Widget>[
                Expanded(
                  flex: 4,
                  child:Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                    children:<Widget>[
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children:<Widget>[
                          Icon(Icons.calendar_today,color:MyColors.secondaryColor,size:10),
                      Text(' ${invoice[index]['date']}',style: TextStyle(
                        color: MyColors.secondaryColor,
                        fontSize: 14
                    ),),]),
                      SizedBox(height: 4,),
                      Text('${invoice[index]['voucher_no']} ',style: TextStyle(
                          color: Colors.black,
                          fontSize: 14
                      ),),
                      SizedBox(height: 2,),
                      // Text('No. of Cartons: ${invoice[index]['no_of_cartons']}',style: TextStyle(
                      //     color: Colors.grey,
                      //     fontSize: 14
                      // ),),
                   ]
                  )
                ),
                Expanded(
                    flex: 4,
                        child:Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children:<Widget>[
                            Text('Phone No: ${invoice[index]['amount']}',style: TextStyle(
                              color: Colors.black,
                              fontSize: 16
                            ),),
                            // SizedBox(height: 4,),
                            // Text('${invoice[index]['lr_no']==null?'Awaiting dispatch details':('Dispatched: '+invoice[index]['lr_date'])}',
                            //   textAlign: TextAlign.end,
                            //   style: TextStyle(
                            //     color: invoice[index]['lr_no']==null?Colors.grey:Colors.green[300],
                            //     fontSize: 12
                            // ),),
                        ])
                ),
                Expanded(
                    flex: 1,
                    child:Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children:<Widget>[
                        SizedBox(width: 1,),
                      ]
                    )
                )
              ]
            )
          )
          );
        })
    )
          );
        }
  }