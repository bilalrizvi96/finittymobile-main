import 'package:charles_app/widgets/widgets.dart';

import '../../Component/searchButton.dart';

import 'package:charles_app/View/Laundry/LaundryService.dart';
import 'package:charles_app/View/Laundry/LaundryServiceCard.dart';
import 'package:charles_app/View/Laundry/ToggleButton.dart';
import 'package:flutter/material.dart';
import 'dart:math';

class Laundry_Services extends StatefulWidget {
  @override
  _Laundry_ServicesState createState() => _Laundry_ServicesState();
}

class _Laundry_ServicesState extends State<Laundry_Services> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return  DefaultTabController(
      length:2,
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(bottom:0.0),
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: size.height / 5,
                    width: size.width / 2.5,
                    margin: EdgeInsets.only(top:55,left: 0),
                    child: Opacity(
                      opacity: 1.0,
                      child: Image.asset(
                        'lib/assets/images/logo.png',
                        color:Color(0xFF7ADBFF),
                      ),
                    ),
                  ),
                ),

                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left:30,right: 30,top: 60),
                      child: Row(
                        children: [
                          SizedBox(height:4),

                          InkWell(
                              onTap: ()=>{
                                Navigator.pop(context)
                              },
                              child: Icon(Icons.arrow_back_ios,)
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:2.0),
                            child: Text("Laundry", style: Styles().openBold(size: 18.0)),
                          ),
                          Spacer(),
                          Padding(
                            padding: const EdgeInsets.only(right:0.0),
                            child: Card(
                              elevation:2,
                              child: Container(
                                  child:Transform.rotate(
                                    angle: 180*pi/300,
                                    child: Icon(Icons.search),
                                  )
                              ),
                            ),
                          ),
                          // searchAnimate(),
                        ],
                      ),
                    ),
                    SizedBox(height: 20,),
                    Column(
                      //mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left:30,top: 0,right: 0),
                          child: Text("Choose Service", style: Styles().openBold(size: 20.0)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left:30,top: 0,right: 0),
                          child: Text("Drag to select your desired service",style: Styles().openRegular()),
                        ),
                      ],
                    ),
                    SizedBox(height: 5,),

                    // Padding(
                    //   padding: const EdgeInsets.only(left:20,top:10),
                    //   child: Container(
                    //     //width: 150,
                    //     height: 120,
                    //     //height: MediaQuery.of(context).size.height/4,
                    //     width: MediaQuery.of(context).size.width,
                    //     child:
                    //     ListView.builder(
                    //         scrollDirection: Axis.horizontal,
                    //         itemCount: caring.length,
                    //         itemBuilder: (_, index) {
                    //           return laundryService_Card(
                    //             caringg: caring[index],
                    //           );
                    //         }
                    //     ),
                    //
                    //   ),
                    // ),
                    Stack(
                        children:[

                          Padding(
                            padding: const EdgeInsets.only(left:30,top: 53),
                            child: Text('Pickup Date',style:TextStyle(fontSize: 12,color: Colors.grey)),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:30,top: 130),
                            child: Text('Pickup Time',style:TextStyle(fontSize: 12,color: Colors.grey)),
                          ),

                          Container(
                              child:Column(
                                  children:[
                                    TabBar(
                                      indicatorColor: Colors.transparent,
                                      tabs: <Widget>[
                                        Tab(
                                            child: Text(
                                              "PickUp",
                                              style: TextStyle(color: Colors.black),
                                            )),
                                        Tab(
                                            child: Text(
                                              "Delivery",
                                              style: TextStyle(color: Colors.black),

                                            )),

                                      ],
                                    ),
                                    Container(
                                      height: 200,

                                      child: TabBarView(
                                        children: [
                                          Container(
                                              width:100,
                                              child:Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left:15,right:15,top:20),
                                                    child: TextField(

                                                      decoration: InputDecoration(
                                                        enabledBorder: OutlineInputBorder(
                                                            borderRadius: BorderRadius.circular(20),
                                                            borderSide: BorderSide(color: Colors.transparent)
                                                        ),
                                                        focusedBorder: OutlineInputBorder(
                                                            borderRadius: BorderRadius.circular(20),
                                                            borderSide: BorderSide(color: Colors.transparent)
                                                        ),
                                                        hintText: "MM-DD",
                                                        filled: true,

                                                      ),

                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left:15,right:15,top:20),
                                                    child: TextField(
                                                      decoration: InputDecoration(
                                                        enabledBorder: OutlineInputBorder(
                                                            borderRadius: BorderRadius.circular(20),
                                                            borderSide: BorderSide(color: Colors.transparent)
                                                        ),
                                                        focusedBorder: OutlineInputBorder(
                                                            borderRadius: BorderRadius.circular(20),
                                                            borderSide: BorderSide(color: Colors.transparent)
                                                        ),
                                                        hintText: "HH-MM",
                                                        filled: true,

                                                      ),

                                                    ),
                                                  )
                                                ],
                                              )
                                          ),
                                          Container(
                                              width:100,

                                              child:Column(
                                                mainAxisAlignment: MainAxisAlignment.start,
                                                crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding: const EdgeInsets.only(left:15,right:15,top:20),
                                                    child: TextField(
                                                      decoration: InputDecoration(
                                                        enabledBorder: OutlineInputBorder(
                                                            borderRadius: BorderRadius.circular(20),
                                                            borderSide: BorderSide(color: Colors.transparent)
                                                        ),
                                                        focusedBorder: OutlineInputBorder(
                                                            borderRadius: BorderRadius.circular(20),
                                                            borderSide: BorderSide(color: Colors.transparent)
                                                        ),
                                                        hintText: "MM-DD",
                                                        filled: true,

                                                      ),

                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: const EdgeInsets.only(left:15,right:15,top:20),
                                                    child: TextField(
                                                      decoration: InputDecoration(
                                                        enabledBorder: OutlineInputBorder(
                                                            borderRadius: BorderRadius.circular(20),
                                                            borderSide: BorderSide(color: Colors.transparent)
                                                        ),
                                                        focusedBorder: OutlineInputBorder(
                                                            borderRadius: BorderRadius.circular(20),
                                                            borderSide: BorderSide(color: Colors.transparent)
                                                        ),
                                                        hintText: "HH-MM",
                                                        filled: true,

                                                      ),

                                                    ),
                                                  )


                                                ],
                                              )

                                          ),



                                        ],
                                      ),
                                    ),

                                  ]
                              )
                          ),]
                    ),
                    Container(
                      child: Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:30,right:20),
                            child: Row(
                              children: [
                                Text("Recurrent",style: TextStyle(fontSize: 14),),
                                Spacer(),
                                toggle(),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:30,right:30),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  height: 40,
                                  width: 80,
                                  child: Card(
                                      elevation: 5,
                                      child:Center(child: Text("Daily"))
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  width: 80,
                                  child: Card(
                                      elevation: 5,
                                      child:Center(child: Text("Weekly"))
                                  ),
                                ),
                                Container(
                                  height: 40,
                                  width: 80,
                                  child: Card(
                                      elevation: 5,
                                      child:Center(child: Text("Monthly"))
                                  ),
                                ),

                              ],
                            ),
                          )
                        ],
                      ),
                    ),


                    //Spacer(),
                    //   Padding(
                    //     padding: const EdgeInsets.only(top:50,bottom:20.0,right: 20,left: 20),
                    //     child: Container(
                    //       width: MediaQuery.of(context).size.width,
                    //         decoration:BoxDecoration(
                    //           borderRadius: BorderRadius.circular(10),
                    //           color:Color(0xFFFF0000),
                    //         ),
                    //         child:FlatButton(
                    //             child:Text("Book Now",style: TextStyle(color: Colors.white),)
                    //
                    //         )
                    //
                    //     ),
                    //   )



                  ],
                ),

              ],
            ),
          ),
        ),

        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(left:30,right: 30,bottom: 0),
          child: Padding(
            padding: const EdgeInsets.only(top:0,bottom:20.0,right: 0,left: 0),
            child: Container(
                width: MediaQuery.of(context).size.width,
                decoration:BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color:Color(0xFFFF0000),
                ),
                child:FlatButton(
                    child:Text("Book Now",style: TextStyle(color: Colors.white),)

                )

            ),
          ),
        ),


      ),
    );
  }
}
