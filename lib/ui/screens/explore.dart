import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:kalachar/ui/screens/explore_details.dart';
import 'package:kalachar/ui/widgets/theme.dart';


class Invoice extends StatefulWidget {
  @override
  _InvoiceState createState() => _InvoiceState();
}

class _InvoiceState extends State<Invoice> {
  TextEditingController textEditingController;
 var invoice = 
[
		{
			"date": " Kalainayam",
			"voucher_no": "11 Gandhi nagar,Porur, Coimbatore-21",
			"amount": 9952637110,
			"cashback_claim_status": "available",
			"packing_slip_no": "SD-00034",
			"lr_no": null,
			"lr_date": null,
			"transport": "NEW MAHAVEER(C.C. ATTACHED)",
			"order_no": "291, 272",
			"no_of_cartons": "6",
			"destination": "MALEGAON"
		},
		{
			"date": " Brindha",
			"voucher_no": "5 prime road Cuddalore-21",
			"amount": 8952637110,
			"cashback_claim_status": "available",
			"packing_slip_no": "SD-00034",
			"lr_no": null,
			"lr_date": null,
			"transport": "NEW MAHAVEER(C.C. ATTACHED)",
			"order_no": "291, 272",
			"no_of_cartons": "6",
			"destination": "MALEGAON"
		},
		{
			"date": " Shivam Orcheshtra",
			"voucher_no": "5 prime road Tirupur-21",
			"amount": 9952637780,
			"cashback_claim_status": "available",
			"packing_slip_no": "SD-00034",
			"lr_no": null,
			"lr_date": null,
			"transport": "NEW MAHAVEER(C.C. ATTACHED)",
			"order_no": "291, 272",
			"no_of_cartons": "6",
			"destination": "MALEGAON"
		},
		{
			"date": " Nalini Groups",
			"voucher_no": "3 projan road Kovai -21",
			"amount": 9952637110,
			"cashback_claim_status": "available",
			"packing_slip_no": "SD-00034",
			"lr_no": null,
			"lr_date": null,
			"transport": "NEW MAHAVEER(C.C. ATTACHED)",
			"order_no": "291, 272",
			"no_of_cartons": "6",
			"destination": "MALEGAON"
		},
		{
			"date": "Meghalaya",
			"voucher_no": "5 gandhi road Erode-21",
			"amount": 9952637110,
			"cashback_claim_status": "available",
			"packing_slip_no": "SD-00034",
			"lr_no": null,
			"lr_date": null,
			"transport": "NEW MAHAVEER(C.C. ATTACHED)",
			"order_no": "291, 272",
			"no_of_cartons": "6",
			"destination": "MALEGAON"
		},
		{
			"date": "Kalalaya",
			"voucher_no": "5 prime road Salem-21",
			"amount": 7852637110,
			"cashback_claim_status": "available",
			"packing_slip_no": "SD-00034",
			"lr_no": null,
			"lr_date": null,
			"transport": "NEW MAHAVEER(C.C. ATTACHED)",
			"order_no": "291, 272",
			"no_of_cartons": "6",
			"destination": "MALEGAON"
		},
		{
			"date": " Macho Drums",
			"voucher_no": " 8 prime road Krishnagiri-21",
			"amount": 8952637110,
			"cashback_claim_status": "available",
			"packing_slip_no": "SD-00034",
			"lr_no": null,
			"lr_date": null,
			"transport": "NEW MAHAVEER(C.C. ATTACHED)",
			"order_no": "291, 272",
			"no_of_cartons": "6",
			"destination": "MALEGAON"
		}
	];
   final List<String> _dropdownValues = [
    "Bamber dance",
    "Bharatanatyam",
    "Puppet show",
    "Chakkai Attam",
    "Devaraattam",
    "Kamandi",
    "Kai Silambu Attam",
    "Kolattam",
    "Karagattam",
    "Kazhai Kothu",
    "Kolattam",
    "Poi Kal attam",
    "Kummi"
  ];
  String _currentlySelected = "Bamber dance"; //var to hold currently selected value

  //make the drop down its own widget for readability
  Widget dropdownWidget() {

    return
      DropdownButton(
      //map each value from the lIst to our dropdownMenuItem widget
      items: _dropdownValues
          .map((value) => DropdownMenuItem(
        child:
        Text(value,style: TextStyle(color: MyColors.primaryColor,
            fontWeight: FontWeight.bold)),
        value: value,

      ))
          .toList(),
      onChanged: (String value) {
        //once dropdown changes, update the state of out currentValue
        setState(() {
          _currentlySelected = value;
        });
      },
      //this wont make dropdown expanded and fill the horizontal space
      isExpanded: false,
      //make default value of dropdown the first value of our list
      value: _currentlySelected,
    );
  }
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
    body:
    Column(
          children: <Widget> [
      Expanded(
          child:CustomScrollView(
            slivers: <Widget>[
            SliverList(
              delegate: SliverChildListDelegate([
              Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Color(0xFFEEEEEE),Color(0xFFEEEEEE),Colors.white,Colors.white,],
                  stops: [0.125,0.5,0.51,1.0],
                  end: Alignment.bottomCenter,
                  begin: Alignment.topCenter,
                ),
              ),
              child:Container(
                  padding: EdgeInsets.only(top: 11,left: 16,right: 16,bottom: 11),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(5.0)),
                      boxShadow: [BoxShadow(
                        blurRadius: 8.0,
                        color: Colors.black.withOpacity(.08),
                        offset: Offset(1.0, 7.0),
                      )]
                  ),
                  child:Column(
                      children: <Widget>[
                        Padding(
                            padding: const EdgeInsets.symmetric(vertical: 0.0),
                            child:
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                        Wrap(
                                          crossAxisAlignment: WrapCrossAlignment.center,
                                          runSpacing: 5,
                                          children: <Widget>[
                                            Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              children: [
                                                dropdownWidget(),
                                              ]
                                            ),
                                          ]
                                        )
                                ]
                            )
                        )])))])),
                         SliverList(
          delegate: SliverChildBuilderDelegate(
                  (BuildContext context, int index) {
                return Column(
                  children:<Widget>[
                    InkWell(
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
                              child:Text("Charging Details",style: TextStyle(fontSize: 24),)
                            ),
                            new InvoiceDetail( invoice: invoiceDetail, disable_Claim: disable_claim),
                          ],
                        ));
                  });
            },
                  child:Container(
                      padding: EdgeInsets.only(top: 12,right:16,left:16,bottom: 12,),
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children:<Widget>[
                            Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children:<Widget>[
                                  Row(
                                      children:<Widget>[
                                        Icon(Icons.calendar_today,color:MyColors.secondaryColor,size:10),
                                        Text('${invoice[index]['date']}',style:TextStyle(
                                          color:MyColors.secondaryColor,
                                          fontSize: 14,
                                        )),
                                      ]),
                                  SizedBox(height: 4,),
                                  Row(
                                      children:<Widget>[
                                        Text('${invoice[index]['voucher_no']}',style:TextStyle(
                                          color:Colors.black,
                                          fontSize: 14,
                                        )),
                                      ]),
                                  Text('Phone No - ${invoice[index]['amount']}',style:TextStyle(
                                    color:Colors.green[300],
                                    fontSize: 12,
                                  )),
                                ]
                            ),
                          ]
                      )
                  )
                    ),
                    Divider(
                      height: 0,
                    )
                ]);
              },
            childCount:invoice.length,
          ),
        ),]))]));
  }}
          