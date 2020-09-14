
import 'package:flutter/material.dart';
import 'package:kalachar/ui/screens/booking_details.dart';
import 'package:kalachar/ui/screens/common.dart';
import 'package:kalachar/ui/screens/explore.dart';
import 'package:kalachar/ui/screens/sizeconfig.dart';
import 'package:kalachar/ui/widgets/theme.dart';
class FirstPage extends StatefulWidget {
  @override
  _FirstPageState createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> with TickerProviderStateMixin{
  TabController tabController;
  TextEditingController textEditingController;
  final List<String> _dropdownValues = [
    "Dance Category",
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
    "Kummi",
    "Peacock dance",
    "Ottan Koothu",
    "Oyilattam",
    "Oyil Kummi",
    "Snake Dance",
    "Artificial Horse Dance",
    "TigerDance",
    "Shattam dance",
    "Parai Attam",
    "Koothu",
    "Urummi Attam",
    "Villu Paatu"
  ];
  String _currentlySelected = "Dance Category"; //var to hold currently selected value

  //make the drop down its own widget for readability
  Widget dropdownWidget() {

    return
      DropdownButton(
      //map each value from the lIst to our dropdownMenuItem widget
      items: _dropdownValues
          .map((value) => DropdownMenuItem(
        child:
        Text(value,style: TextStyle(color: Colors.teal[200],
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
    tabController = TabController(vsync:this,length: 2,initialIndex: lastSelectedAccountsTab);
    tabController.addListener(_setActiveTabIndex);
  }

  _setActiveTabIndex() {
    lastSelectedAccountsTab = tabController.index;
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
            centerTitle: false,
            elevation: 0,
            backgroundColor: Color(0xFFEEEEEE),
            title: Text(
              'Kalachaar',
              style: TextStyle(fontSize: 24, fontFamily: 'Product Sans'),
            ),
            
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(35.0),
              child: Column(
                children: <Widget>[
                  TabBar(
                    controller: tabController,
                    isScrollable: true,
                    indicatorColor: MyColors.primaryColor,
                    indicatorPadding: EdgeInsets.symmetric(horizontal: 10),
                    labelColor: MyColors.primaryColor,
                    unselectedLabelColor: Colors.black,
                    labelPadding: EdgeInsets.symmetric(horizontal: 25),
                    tabs: <Widget>[
                      Tab(
                        text: 'Explore',
                      ),
                      Tab(
                        text: 'Booking Details',
                      ),
                    ],
                  ),


                ],
              ),
            )),
        body: TabBarView(
          controller: tabController,
          children: <Widget>[
           Invoice(),
           Booking()
          //  OutStanding(),
          //  Invoice()
          ],
        ),
      ),
    );

  }
}