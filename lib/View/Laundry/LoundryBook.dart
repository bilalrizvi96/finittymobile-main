import 'dart:math';
import 'dart:ui';
import 'package:charles_app/TimeSlots/TimeList.dart';
import 'package:charles_app/View/Cleaning/homeOfficeLanding.dart';
import 'package:charles_app/View/Cleaning/lawnLanding.dart';
import 'package:charles_app/View/Cleaning/poolLanding.dart';
import 'package:charles_app/View/Cleaning/snowView.dart';
import 'package:charles_app/View/Homepage/Home.dart';
import 'package:charles_app/assets/appColors/appColors.dart';
import 'package:charles_app/muben/paymentmethod.dart';
import 'package:charles_app/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

bool selected = true;
bool selected2 = true;
bool selected3 = true;
bool selected4 = true;
Color cardcolor1 = appColors.redColor;
Color cardcolor2 = Color(0XFFBCBDC1);
Color cardcolor3 = Color(0XFFBCBDC1);
Color cardcolor4 = Color(0XFFBCBDC1);
bool homevisibility = true;
bool lawnvisibility = false;
bool poolvisibility = false;
bool snowvisibility = false;

class LoundryBook extends StatefulWidget {
  @override
  _CaringState createState() => _CaringState();
}

class _CaringState extends State<LoundryBook> with TickerProviderStateMixin {

  List<Widget> _tabScroll() => [
    Tab(
      child: Container(
        alignment: Alignment.center,
        color: Colors.transparent,
        constraints: BoxConstraints.expand(width: 100),
        child: Text(
          "Pickup",

        ),
      ),
    ),
    Tab(
      child: Container(
        alignment: Alignment.center,
        color: Colors.transparent,
        constraints: BoxConstraints.expand(width: 80),
        child: Text(
          "Delivery",
        ),
      ),
    ),

  ];

  bool isSwitched = false;
  bool buttonsflag = false;
  // List<Widget> Child = [
  //   homeView(),
  //   snowView(),
  //   lawnLanding(),
  //   poolLanding(),
  // ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
          bottomNavigationBar:  Container(
            height: MediaQuery.of(context).size.width / 4.5,
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 35),
                  // margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  height: MediaQuery.of(context).size.width / 8.4,
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: Row(
                    children: [
                      Text("Total",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold)),
                      Spacer(),
                      Text("20\$",
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 22.0,
                              fontWeight: FontWeight.bold)),
                    ],
                  ),
                ),

                Positioned(
                  top: 10,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
                    height: MediaQuery.of(context).size.width / 8.4,
                    width: MediaQuery.of(context).size.width / 1.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xFFFF0000)),
                    child: FlatButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => PaymentMethod(),
                              ));
                        },
                        child: Text(
                          "Book Now",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ),
              ],
            ),
          ),
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: Stack(children: [
              Align(
                alignment: Alignment.topRight,
                child: Container(
                  padding: EdgeInsets.only(right: 10),
                  margin: EdgeInsets.only(top: 20, left: 5),
                  child: Opacity(
                    opacity: 1.0,
                    child: Image.asset(
                      'lib/assets/images/logo.png',
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left:35.5 , right:35.5,bottom: 30,top: 20),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 4),
                      Row(
                        children: [
                          InkWell(
                              onTap: () => {Navigator.pop(context)},
                              child: Icon(
                                Icons.arrow_back_ios,
                              )),
                          Padding(
                            padding: const EdgeInsets.only(left: 6.0),
                            child: Text("Laundry",
                                style: Styles().openBold(size: 18.0)),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right: 0.0),
                            child: Card(
                              elevation: 2,
                              child: Container(
                                  child: Transform.rotate(
                                    angle: 180 * pi / 300,
                                    child: Icon(Icons.search),
                                  )),
                            ),
                          ),
                          // searchAnimate(),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Text("Choose Service",
                          style: Styles().openBold(size: 20.0)),
                      Text("Drag to select your desired service",
                          style: Styles().openRegular2()),
                      SizedBox(
                        height: 5,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 230,
                            child: DefaultTabController(

                              length: 2,
                              child: Column(
                                children: [
                                  Container(
                                    color: Colors.transparent,
                                    constraints: BoxConstraints.expand(height: 60),
                                    child: TabBar(

                                      isScrollable: true,
                                      tabs: _tabScroll(),
                                      indicatorPadding: EdgeInsets.symmetric(horizontal:30),
                                      labelPadding: EdgeInsets.symmetric(horizontal: 20.0),
                                      unselectedLabelColor: Colors.grey[400],
                                      labelColor: Colors.black,
                                      indicatorColor: Colors.black,
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: TabBarView(children: [

                                        Container(
                                          height: MediaQuery.of(context).size.height / 3,
                                          child: Column(
                                            children: [
                                              SizedBox(
                                                height: 25,
                                              ),
                                              Container(
                                                  width: 350,
                                                  height: 50,
                                                  child: new Theme(
                                                    data: new ThemeData(
                                                      primaryColor:  Color(0xffE4E4E4),
                                                      primaryColorDark: Color(0xffE4E4E4),
                                                    ),
                                                    child: new TextFormField(
                                                      // validator: (value) {
                                                      //   if (value.isEmpty) {
                                                      //     return 'Enter First Name';
                                                      //   }
                                                      //   return null;
                                                      // },
                                                      decoration: new InputDecoration(
                                                        enabledBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors.grey, width: 0.5),
                                                        ),
                                                        border: new OutlineInputBorder(
                                                            borderSide: new BorderSide(
                                                              color: Colors.grey,)),
                                                        hintText: 'MM - DD - YY',
                                                        labelText: 'Preferred Date',
                                                      ),
                                                    ),
                                                  )),
                                              SizedBox(
                                                height: 25,
                                              ),
                                              Container(
                                                  width: 350,
                                                  height: 50,
                                                  child: new Theme(
                                                    data: new ThemeData(
                                                      primaryColor: Color(0xffE4E4E4),
                                                      primaryColorDark: Color(0xffE4E4E4),
                                                    ),
                                                    child: new TextFormField(
                                                      onTap: (){
                                                        _showTimeDialog();
                                                      },
                                                      // validator: (value) {
                                                      //   if (value.isEmpty) {
                                                      //     return 'Enter First Name';
                                                      //   }
                                                      //   return null;
                                                      // },
                                                      decoration: new InputDecoration(
                                                        enabledBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors.grey, width: 0.5),
                                                        ),
                                                        border: new OutlineInputBorder(
                                                            borderSide: new BorderSide(
                                                                color: Colors.grey)),
                                                        hintText: 'HH - MM',
                                                        labelText: 'Preferred Time',
                                                      ),
                                                    ),
                                                  )),
                                              SizedBox(
                                                height: 20,
                                              ),
                                            ],
                                          ),
                                        ),


                                        Container(
                                          height: MediaQuery.of(context).size.height / 3,
                                          child: Column(
                                            children: [

                                              SizedBox(
                                                height: 25,
                                              ),
                                              Container(
                                                  width: 350,
                                                  height: 50,
                                                  child: new Theme(
                                                    data: new ThemeData(
                                                      primaryColor:  Color(0xffE4E4E4),
                                                      primaryColorDark: Color(0xffE4E4E4),
                                                    ),
                                                    child: new TextFormField(
                                                      // validator: (value) {
                                                      //   if (value.isEmpty) {
                                                      //     return 'Enter First Name';
                                                      //   }
                                                      //   return null;
                                                      // },
                                                      decoration: new InputDecoration(
                                                        enabledBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors.grey, width: 0.5),
                                                        ),
                                                        border: new OutlineInputBorder(
                                                            borderSide: new BorderSide(
                                                              color: Colors.grey,)),
                                                        hintText: 'MM - DD - YY',
                                                        labelText: 'Preferred Date',
                                                      ),
                                                    ),
                                                  )),
                                              SizedBox(
                                                height: 25,
                                              ),
                                              Container(
                                                  width: 350,
                                                  height: 50,
                                                  child: new Theme(
                                                    data: new ThemeData(
                                                      primaryColor: Color(0xffE4E4E4),
                                                      primaryColorDark: Color(0xffE4E4E4),
                                                    ),
                                                    child: new TextFormField(
                                                      onTap: (){
                                                        _showTimeDialog();
                                                      },
                                                      // validator: (value) {
                                                      //   if (value.isEmpty) {
                                                      //     return 'Enter First Name';
                                                      //   }
                                                      //   return null;
                                                      // },
                                                      decoration: new InputDecoration(
                                                        enabledBorder: OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors.grey, width: 0.5),
                                                        ),
                                                        border: new OutlineInputBorder(
                                                            borderSide: new BorderSide(
                                                                color: Colors.grey)),
                                                        hintText: 'HH - MM',
                                                        labelText: 'Preferred Time',
                                                      ),
                                                    ),
                                                  )),
                                              SizedBox(
                                                height: 20,
                                              ),
                                            ],
                                          ),
                                        )


                                      ]),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 20,
                          ),


                          Row(
                            children: [
                              Text("Recurrent",
                                  style: TextStyle(
                                    color: Color(0xffE4E4E4),
                                    fontSize: 12.0,
                                  )),
                              Spacer(),
                              Switch(
                                value: isSwitched,
                                onChanged: (value) {
                                  setState(() {
                                    isSwitched = value;
                                    buttonsflag=value;
                                    print(isSwitched);
                                  });
                                },
                                activeTrackColor: Color(0xffE4E4E4),
                                activeColor: Color(0xFFFF0000),
                              ),
                            ],
                          ),
                          Visibility(
                            visible: buttonsflag,
                            child: Row(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0xFFFF0000),
                                  ),
                                  height: 40,
                                  width: 80,
                                  child: Center(
                                      child: Text(
                                        "Daily",
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12.0,
                                        ),
                                      )),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    color: Color(0xffBCBDC1),
                                  ),
                                  height: 40,
                                  width: 80,
                                  child: Center(
                                      child: Text(
                                        "weekly",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.0,
                                        ),
                                      )),
                                ),
                                SizedBox(
                                  width: 20,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius:
                                    BorderRadius.circular(5),
                                    color: Color(0xffBCBDC1),
                                  ),
                                  height: 40,
                                  width: 80,
                                  child: Center(
                                      child: Text(
                                        "Monthly",
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 12.0,
                                        ),
                                      )),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          InkWell(
                            onTap: (){
                              _settingModalBottomSheet(context);
                            },
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  color: Color(0xFFFF0000)),
                              height: 40,
                              width: 140,
                              child: Center(
                                  child: Text(
                                    "Add Details",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 12.0,
                                    ),
                                  )),
                            ),
                          ),
                          SizedBox(
                            height: 100,
                          ),
                          // Row(
                          //   children: [
                          //     Text("Total",
                          //         style: TextStyle(
                          //             color: Colors.black,
                          //             fontSize: 22.0,
                          //             fontWeight: FontWeight.bold)),
                          //     Spacer(),
                          //     // Text("20\$",
                          //     //     style: TextStyle(
                          //     //         color: Colors.black,
                          //     //         fontSize: 22.0,
                          //     //         fontWeight: FontWeight.bold)),
                          //   ],
                          // ),
                          SizedBox(
                            height: 5,
                          ),
                          // Container(
                          //   width:
                          //       MediaQuery.of(context).size.width / 1.2,
                          //   decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(5),
                          //       color: Colors.red),
                          //   child: FlatButton(
                          //       onPressed: () {
                          //         Navigator.push(
                          //             context,
                          //             MaterialPageRoute(
                          //               builder: (_) => MyHomePage(),
                          //             ));
                          //       },
                          //       child: Text(
                          //         "Book Now",
                          //         style: TextStyle(color: Colors.white),
                          //       )),
                          // )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ]),
          ),

        )
    );

  }
  void _showTimeDialog() {
    // flutter defined function
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)), //this right here
              child: Container(
                  padding: EdgeInsets.only(top: 50),
                  child: TimetList()),
            ),
          );
        });
  }
  void _settingModalBottomSheet(context){
    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
        ),
        isScrollControlled: true,
        context: context,
        builder: (BuildContext bc){
          return new Container(
            height: 450,
            child: Container(
                padding: const EdgeInsets.only(left:35.5 , right:35.5),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 40,),
                    Text("Add Details",
                        style: Styles().openBold(size: 25.0)),
                    SizedBox(height: 20,),
                    Container(
                      decoration: BoxDecoration(border: Border.all(color: Colors.grey , width: 0.5) , borderRadius: BorderRadius.circular(5)),
                      width: 350,
                      height: 70,
                      child:Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child: Row(
                          children: [
                            Text("Add Images",
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 15.0,
                                )),
                            Spacer(),
                            Icon(
                                Icons.add_a_photo
                            )
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 20,),
                    Container(
                        width: 350,
                        height: 150,
                        child: new Theme(
                          data: new ThemeData(
                            primaryColor:  Color(0xffE4E4E4),
                            primaryColorDark: Color(0xffE4E4E4),
                          ),
                          child: new TextFormField(
                            // validator: (value) {
                            //   if (value.isEmpty) {
                            //     return 'Enter First Name';
                            //   }
                            //   return null;
                            // },
                            decoration: new InputDecoration(
                              alignLabelWithHint: true,
                              enabledBorder: OutlineInputBorder(
                                borderSide: BorderSide(
                                    color:Colors.grey, width: 0.5),
                              ),
                              border: new OutlineInputBorder(
                                  borderSide: new BorderSide(
                                    color: Colors.grey,)),
                              hintText: 'Special instructions?',
                              labelText: 'Notes',

                            ),
                            maxLines: 7,
                          ),
                        )),

                    SizedBox(
                      height: 30,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color:Color(0xFFFF0000)),
                      child: FlatButton(
                          onPressed: () {},
                          child: Text(
                            "Book Now",
                            style: TextStyle(color: Colors.white),
                          )),
                    ),
                    SizedBox(
                      height: 25,
                    ),

                  ],
                )
            ),
          );
        }
    );
  }
}