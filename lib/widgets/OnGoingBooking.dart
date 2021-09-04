import 'package:charles_app/BaseUrl/variableGloable.dart';
import 'package:charles_app/Chat/Constants.dart';
import 'package:charles_app/Chat/chats.dart';
import 'package:charles_app/Chat/databse.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class OngoingBooking extends StatefulWidget {
  @override
  _OngoingBookingState createState() => _OngoingBookingState();
}

class _OngoingBookingState extends State<OngoingBooking> {
  // List<bool> _size1 = [false,false,false,false,false];
  // List<double> _height1 = [88.0,88.0,88.0,88.0,88.0];
  DatabaseMethods databaseMethods = new DatabaseMethods();
  FirebaseAuth _auth = FirebaseAuth.instance;
  List<bool> _size1 = new List();
  List<double> _height1 = new List();

  @override
  void initState() {
    super.initState();
    //  getPastBooking();
    for (int i = 0; i <= OnGoingbookinglist.length; i++) {
      _size1.add(false);
      _height1.add(88.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _listcontainers(),
    );
  }

  Widget _listcontainers() {
    return OnGoingbookinglist.isEmpty?
    Container(child: Center(child: Text("No Data to Show",style: TextStyle(color: Colors.black),)),)
        :Container(
      padding: EdgeInsets.only(top: 20),
      margin: EdgeInsets.symmetric(horizontal: 13.0),
      child:
      ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: OnGoingbookinglist.length,
          itemBuilder: (_,index){
            return  containerOngoingNew(
                OnGoingbookinglist[index].id,
                index,
                OnGoingbookinglist[index].clr,
                OnGoingbookinglist[index].service,
                OnGoingbookinglist[index].preferred_date_from,
                OnGoingbookinglist[index].address,
                OnGoingbookinglist[index].price,
                OnGoingbookinglist[index].name,
                context,
                OnGoingbookinglist[index].vendor_firebase_id
            );
          }
      ),

      // child: Column(
      //   children: [
      //     SizedBox(
      //       height: 6.0,
      //     ),
      //     containerOngoingNew(1, Colors.blue, "Wash & Iron",
      //         "06:17 am - Oct 17,20", "Men, Kids 2 Bag +, 1 Bag", context),
      //     SizedBox(
      //       height: 6.0,
      //     ),
      //     containerOngoingNew(2, Colors.green, "Wash & Iron",
      //         "06:17 am - Oct 17,20", "Men, Kids 2 Bag +, 1 Bag", context),
      //     SizedBox(
      //       height: 6.0,
      //     ),
      //   ],
      // )

    );
  }

  // Widget _listcontainers(){
  //   return SingleChildScrollView(
  //     child: Container(
  //         padding: EdgeInsets.only(top: 20),
  //
  //         margin: EdgeInsets.symmetric(horizontal: 13.0),
  //         child: Column(children: [
  //           containerOngoingNew(0,Colors.green, "Wash & Iron", "06:17 am - Oct 17,20",
  //               "Men, Kids 2 Bag +, 1 Bag",context),
  //         ],)
  //     ),
  //   );
  // }
  // Widget containerOngoing(var id,int index,Color color, var service,
  //     var date, var address,var price, BuildContext context,var name,) {
  //   double w= MediaQuery.of(context).size.width;
  //   return SingleChildScrollView(
  //     child: GestureDetector(
  //       onTap:() {
  //         if (_size1[index] == false) {
  //           setState(() {
  //             _height1[index] = 324;
  //             _size1[index] = true;
  //           });
  //         } else if (_size1[index] == true) {
  //           setState(() {
  //             _height1[index] = 80.0;
  //             _size1[index]= false;
  //           });
  //         }
  //       },
  //       child: AnimatedContainer(
  //         duration: Duration(milliseconds: 300),
  //         height: _height1[index],
  //         width: double.infinity,
  //         child: Card(
  //           elevation: 2.0,
  //           child: Column(
  //             children: [
  //               Container(margin: EdgeInsets.only(bottom: 6),
  //                 child: Row(
  //                   children: [
  //                     Container(
  //                       height: 66,
  //                       width: 20,
  //                       decoration: BoxDecoration(
  //                         color: color,
  //                         borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),topLeft: Radius.circular(5)),
  //                       ),
  //                     ),
  //                     SizedBox(
  //                       width: 10,
  //                     ),
  //                     Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       mainAxisAlignment: MainAxisAlignment.center,
  //                       children: [
  //                         Text(
  //                           series,
  //                           style: TextStyle(
  //                               fontSize: 12, fontFamily: 'opsr', color: Colors.black),
  //                         ),
  //                         Text(
  //                           date,
  //                           style: TextStyle(
  //                               fontSize: 11, fontFamily: 'opsr', color: Colors.grey),
  //                         ),
  //                       ],
  //                     ),
  //                     Spacer(),
  //                     Center(
  //                         child: Text(
  //                           details,
  //                           style: TextStyle(color: Colors.black, fontSize: 11),
  //                         )),
  //                     CircleAvatar(
  //                       radius: 20,
  //                       child: Image.asset("lib/assets/images/dp.png"),
  //                       backgroundColor: Colors.transparent,
  //                     ),
  //                     Icon(Icons.star,color: Colors.grey,size: 14,),
  //                     SizedBox(width: 2,),
  //                     Center(
  //                         child: Text(
  //                           "4.5",
  //                           style: TextStyle(color: Colors.black, fontSize: 11),
  //                         )),
  //                     Icon(
  //                       Icons.keyboard_arrow_down,
  //                       color: Colors.grey,
  //                       size: 24,
  //                     ),
  //                     SizedBox(width: 10,)
  //                   ],
  //                 ),
  //               ),
  //               Expanded(
  //                 child: Stack(
  //                   children: [
  //                     SingleChildScrollView(
  //                         child: Container(
  //                           child: Column(
  //                             children: [
  //                               SizedBox(height: 12.0,),
  //                               Container(margin: EdgeInsets.only(left: 8.0,right: 8.0),
  //                                 child: Row(children: [
  //                                   SizedBox(
  //                                     width: 5,
  //                                   ),
  //                                   Container(
  //                                     height: 22,
  //                                     width: 22,
  //                                     child: Icon(Icons.check,size:10,color: Colors.white,),
  //                                     decoration: BoxDecoration(
  //                                       color: color,
  //                                       borderRadius: BorderRadius.all(Radius.circular(25)),
  //                                     ),
  //                                   ),
  //                                   SizedBox(
  //                                     width: 10,
  //                                   ),
  //                                   Text(
  //                                     'Order Placed #212423',
  //                                     style: TextStyle(
  //                                         fontSize: 9, fontFamily: 'opsr', color: Colors.black,fontWeight: FontWeight.bold),
  //                                   ),
  //
  //                                   Spacer(),
  //                                   Text(
  //                                     '07:15 pm - October, 28 2020',
  //                                     style: TextStyle(
  //                                       fontSize: 9, fontFamily: 'opsr', color: Color(0xff52545D),),
  //                                   ),
  //
  //                                 ],),
  //                               ),
  //                               SizedBox(height: 23.0,),
  //                               Container(margin: EdgeInsets.only(left: 6.0,right: 8.0),
  //                                 child: Row(crossAxisAlignment: CrossAxisAlignment.start,
  //                                   children: [
  //                                     SizedBox(
  //                                       width: 5,
  //                                     ),
  //                                     Container(
  //                                       margin: EdgeInsets.only(top: 7),
  //                                       height: 28,
  //                                       width: 28,
  //                                       child: Icon(Icons.check,size:14,color: Colors.white,),
  //                                       decoration: BoxDecoration(
  //                                         color: color,
  //                                         borderRadius: BorderRadius.all(Radius.circular(25)),
  //                                       ),
  //                                     ),
  //                                     SizedBox(
  //                                       width: 5,
  //                                     ),
  //                                     Column(crossAxisAlignment: CrossAxisAlignment.start,
  //                                       children: [
  //                                         Container(height:13,width: 40,
  //                                           child: Text(
  //                                             'Accepted',
  //                                             textAlign: TextAlign.start,
  //                                             style: TextStyle(
  //                                                 fontSize: 9, fontFamily: 'opsr', color: Colors.black,fontWeight: FontWeight.bold),
  //                                           ),
  //                                         ),
  //                                         SizedBox(height: 3,),
  //                                         Container(height: 25,width: 116,
  //                                           child: Text(
  //                                             'Your order #212423 was placed on 23 Nov 20 - 07:15 pm',
  //                                             style: TextStyle(
  //                                                 fontSize: 8, fontFamily: 'opsr', color: Colors.black),
  //                                           ),
  //                                         ),
  //                                       ],
  //                                     ),
  //                                     Spacer(),
  //                                     Text(
  //                                       '07:15 pm - October, 28 2020',
  //                                       style: TextStyle(
  //                                         fontSize: 9, fontFamily: 'opsr', color: Color(0xff52545D),),
  //                                     ),
  //
  //                                   ],),
  //                               ),
  //                               SizedBox(height: 10.0,),
  //                               Container(margin: EdgeInsets.only(left: 8.0,right: 8.0),
  //                                 child: Row(children: [
  //                                   SizedBox(
  //                                     width: 5,
  //                                   ),
  //                                   Container(
  //                                     height: 22,
  //                                     width: 22,
  //
  //                                     decoration: BoxDecoration(
  //                                       color: Color(0xffE4E4E4),
  //                                       borderRadius: BorderRadius.all(Radius.circular(25)),
  //                                     ),
  //                                   ),
  //                                   SizedBox(
  //                                     width: 10,
  //                                   ),
  //                                   Text(
  //                                     'Provider Arrived',
  //                                     style: TextStyle(
  //                                         fontSize: 9, fontFamily: 'opsr', color: Colors.black,fontWeight: FontWeight.bold),
  //                                   ),
  //
  //                                   Spacer(),
  //                                   Text(
  //                                     '-  -  -  -',
  //                                     style: TextStyle(
  //                                       fontSize: 9, fontFamily: 'opsr', color: Color(0xff52545D),),
  //                                   ),
  //
  //                                 ],),
  //                               ),
  //                               SizedBox(height: 6.0,),
  //                               Container(margin: EdgeInsets.only(left: 8.0,right: 8.0),
  //                                 child: Row(children: [
  //                                   SizedBox(
  //                                     width: 5,
  //                                   ),
  //                                   Container(
  //                                     height: 22,
  //                                     width: 22,
  //
  //                                     decoration: BoxDecoration(
  //                                       color: Color(0xffE4E4E4),
  //                                       borderRadius: BorderRadius.all(Radius.circular(25)),
  //                                     ),
  //                                   ),
  //                                   SizedBox(
  //                                     width: 10,
  //                                   ),
  //                                   Text(
  //                                     'Job Started',
  //                                     style: TextStyle(
  //                                         fontSize: 9, fontFamily: 'opsr', color: Colors.black,fontWeight: FontWeight.bold),
  //                                   ),
  //
  //                                   Spacer(),
  //                                   Text(
  //                                     '-  -  -  -',
  //                                     style: TextStyle(
  //                                       fontSize: 9, fontFamily: 'opsr', color: Color(0xff52545D),),
  //                                   ),
  //
  //                                 ],),
  //                               ),
  //                               SizedBox(height: 6.0,),
  //                               Container(margin: EdgeInsets.only(left: 8.0,right: 8.0),
  //                                 child: Row(children: [
  //                                   SizedBox(
  //                                     width: 5,
  //                                   ),
  //                                   Container(
  //                                     height: 22,
  //                                     width: 22,
  //
  //                                     decoration: BoxDecoration(
  //                                       color: Color(0xffE4E4E4),
  //                                       borderRadius: BorderRadius.all(Radius.circular(25)),
  //                                     ),
  //                                   ),
  //                                   SizedBox(
  //                                     width: 10,
  //                                   ),
  //                                   Text(
  //                                     'Job Started',
  //                                     style: TextStyle(
  //                                         fontSize: 9, fontFamily: 'opsr', color: Colors.black,fontWeight: FontWeight.bold),
  //                                   ),
  //
  //                                   Spacer(),
  //                                   Text(
  //                                     '-  -  -  -',
  //                                     style: TextStyle(
  //                                       fontSize: 9, fontFamily: 'opsr', color: Color(0xff52545D),),
  //                                   ),
  //
  //                                 ],),
  //                               ),
  //                               SizedBox(height:42),
  //
  //                             ],
  //                           ),
  //                         )
  //                     ),
  //                     Padding(
  //                       padding: const EdgeInsets.only(top:215),
  //                       child: BottomAppBar(
  //                         color: Colors.white,
  //                         child: Container(
  //                           // alignment: Alignment.bottomCenter,
  //                           margin: EdgeInsets.only(left: 10.0,right: 10.0,bottom: 8.0),
  //                           height: 40,
  //                           width: MediaQuery.of(context).size.width,
  //                           decoration: BoxDecoration(
  //                             color: Color(0xFFFF0000),
  //                             borderRadius: BorderRadius.all(Radius.circular(5)),
  //                           ),
  //                           child: FlatButton(
  //                             child: Text("Messages",
  //                               style: TextStyle(
  //                                   color: Colors.white,
  //                                   fontFamily: "Open Sans Semibold",
  //                                   fontSize: 12.0),
  //                             ),
  //                           ),
  //                         ),
  //                         elevation: 0,
  //                       ),
  //                     ),
  //                   ],
  //                 ),
  //               )
  //             ],
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget containerOngoingNew(var id,var index,Color color, var service, var date, var  address,
      var price,var name, BuildContext context,var user_firebase_id) {
    double w= MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: GestureDetector(
        onTap:() {
          if (_size1[index] == false) {
            setState(() {
              _height1[index] = 370;
              _size1[index] = true;
            });
          } else if (_size1[index] == true) {
            setState(() {
              _height1[index] = 88.0;
              _size1[index]= false;
            });
          }
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: _height1[index],
          width: double.infinity,
          child: Card(
            elevation: 1.0,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 80,
                      width: 20,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),topLeft: Radius.circular(5)),
                      ),
                    ),
                    Expanded(
                        child: Column(
                          children: [
                            Container(margin: EdgeInsets.only(left: 8),
                                height: 60,
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 4,),
                                            Text("Booking ID #"+id.toString(),style: TextStyle(
                                                fontSize: 10, fontFamily: 'opsb', color: Colors.black),),
                                            SizedBox(height: 5,),
                                            Text(service==null?"Wash & Iron":service.toString(),style: TextStyle(fontWeight: FontWeight.bold,
                                                fontSize: 20, fontFamily: 'opsb', color: Colors.black),),

                                            // SizedBox(height: 2,),
                                            // Row(
                                            //   children: [
                                            //     Icon(Icons.location_on,size: 12,),
                                            //     SizedBox(width: 2,),
                                            //     Text("Division 2, Toronto, Ontario, Cad",style: TextStyle(
                                            //         fontSize: 10, fontFamily: 'opsr', color: Colors.grey),),
                                            //   ],
                                            // ),
                                          ],
                                        )
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(right: 8),
                                        child: Column(crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            SizedBox(height: 4,),
                                            Text(date,style: TextStyle(
                                                fontSize: 10, fontFamily: 'opsr', color: Colors.grey),),
                                            Row(
                                              children: [
                                                Container(
                                                  child: Column(
                                                    crossAxisAlignment:CrossAxisAlignment.end,
                                                    children: [
                                                      Text(name==null?"Abrageem":name.toString(),style: TextStyle(fontWeight: FontWeight.bold,
                                                          fontSize: 12, fontFamily: 'opsb', color: Colors.black),),
                                                      Row(
                                                        children: [
                                                          RatingBar(
                                                            itemSize: 10,
                                                            initialRating: 3.5,
                                                            minRating: 1,
                                                            direction: Axis.horizontal,
                                                            itemCount: 5,
                                                            itemPadding: EdgeInsets.symmetric(horizontal: 0.3),
                                                            itemBuilder: (context, _) => Icon(
                                                              Icons.star,
                                                              color: Colors.orangeAccent,
                                                            ),
                                                          ),
                                                          SizedBox(height: 3,),
                                                          Text("3.5",style: TextStyle(fontWeight: FontWeight.bold,
                                                              fontSize: 8, color: Colors.black),),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                CircleAvatar(
                                                  radius: 21,
                                                  child: Image.asset("lib/assets/images/dp.png"),
                                                  backgroundColor: Colors.transparent,
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                    ),
                                  ],
                                )
                            ),
                            Visibility(
                              visible: true,
                              //visible: _size[index],
                              child: Container(margin: EdgeInsets.only(top: 4),
                                height: 16,
                                width: double.infinity,
                                child: Icon(Icons.keyboard_arrow_down,size: 16,),
                                decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(5)),
                                ),
                              ),
                            )
                          ],
                        )
                    )
                  ],
                ),
                Expanded(
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                          child: Container(
                            child: Column(
                              children: [
                                SizedBox(height: 12.0,),
                                Container(margin: EdgeInsets.only(left: 8.0,right: 8.0),
                                  child: Row(children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      height: 22,
                                      width: 22,
                                      child: Icon(Icons.check,size:10,color: Colors.white,),
                                      decoration: BoxDecoration(
                                        color: color,
                                        borderRadius: BorderRadius.all(Radius.circular(25)),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Order Placed #212423',
                                      style: TextStyle(
                                          fontSize: 9, fontFamily: 'opsr', color: Colors.black,fontWeight: FontWeight.bold),
                                    ),

                                    Spacer(),
                                    Text(
                                      date==null?'07:15 pm - October, 28 2020':date.toString(),
                                      style: TextStyle(
                                        fontSize: 9, fontFamily: 'opsr', color: Color(0xff52545D),),
                                    ),

                                  ],),
                                ),
                                SizedBox(height: 16.0,),
                                Container(margin: EdgeInsets.only(left: 8.0,right: 8.0),
                                  child: Row(children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      height: 22,
                                      width: 22,
                                      child: Icon(Icons.check,size:10,color: Colors.white,),
                                      decoration: BoxDecoration(
                                        color: color,
                                        borderRadius: BorderRadius.all(Radius.circular(25)),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Order Placed #212423',
                                      style: TextStyle(
                                          fontSize: 9, fontFamily: 'opsr', color: Colors.black,fontWeight: FontWeight.bold),
                                    ),

                                    Spacer(),
                                    Text(
                                      date==null?'07:15 pm - October, 28 2020':date.toString(),
                                      style: TextStyle(
                                        fontSize: 9, fontFamily: 'opsr', color: Color(0xff52545D),),
                                    ),

                                  ],),
                                ),
                                SizedBox(height: 10.0,),
                                Container(margin: EdgeInsets.only(left: 8.0,right: 8.0),
                                  child: Row(children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      height: 22,
                                      width: 22,
                                      decoration: BoxDecoration(
                                        color: Color(0xffE4E4E4),
                                        borderRadius: BorderRadius.all(Radius.circular(25)),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Provider Arrived',
                                      style: TextStyle(
                                          fontSize: 9, fontFamily: 'opsr', color: Colors.black,fontWeight: FontWeight.bold),
                                    ),

                                    Spacer(),
                                    Text(
                                      '-  -  -  -',
                                      style: TextStyle(
                                        fontSize: 9, fontFamily: 'opsr', color: Color(0xff52545D),),
                                    ),

                                  ],),
                                ),
                                SizedBox(height: 6.0,),
                                Container(margin: EdgeInsets.only(left: 8.0,right: 8.0),
                                  child: Row(children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      height: 22,
                                      width: 22,
                                      decoration: BoxDecoration(
                                        color: Color(0xffE4E4E4),
                                        borderRadius: BorderRadius.all(Radius.circular(25)),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Job Started',
                                      style: TextStyle(
                                          fontSize: 9, fontFamily: 'opsr', color: Colors.black,fontWeight: FontWeight.bold),
                                    ),

                                    Spacer(),
                                    Text(
                                      '-  -  -  -',
                                      style: TextStyle(
                                        fontSize: 9, fontFamily: 'opsr', color: Color(0xff52545D),),
                                    ),

                                  ],),
                                ),
                                SizedBox(height: 6.0,),
                                Container(margin: EdgeInsets.only(left: 8.0,right: 8.0),
                                  child: Row(children: [
                                    SizedBox(
                                      width: 5,
                                    ),
                                    Container(
                                      height: 22,
                                      width: 22,

                                      decoration: BoxDecoration(
                                        color: Color(0xffE4E4E4),
                                        borderRadius: BorderRadius.all(Radius.circular(25)),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10,
                                    ),
                                    Text(
                                      'Job Started- Rate Booking',
                                      style: TextStyle(
                                          fontSize: 9, fontFamily: 'opsr', color: Colors.black,fontWeight: FontWeight.bold),
                                    ),

                                    Spacer(),
                                    Text(
                                      'Rate',
                                      style: TextStyle(
                                        fontSize: 9, fontFamily: 'opsr', color: Color(0xff52545D),),
                                    ),

                                  ],),
                                ),
                                SizedBox( height: 5,),

                                Padding(
                                  padding: const EdgeInsets.only(left: 15,right: 15),
                                  child: Divider(),
                                ),
                                SizedBox( height: 5,),
                                Container(
                                  margin:
                                  EdgeInsets.only(left: 10.0, right: 10.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        size: 22,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width/1.4,
                                        child: Text(
                                          address.toString(),
                                          // overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'opsr',
                                              color: Colors.grey),
                                          maxLines: 2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox( height: 10,),
                                Row(
                                  children: [
                                    Container(
                                      // alignment: Alignment.bottomCenter,
                                      margin: EdgeInsets.only(left: 10.0,right: 5.0),
                                      height: 40,
                                      width: MediaQuery.of(context).size.width*0.40,
                                      decoration: BoxDecoration(
                                        color: Color(0xffE4E4E4),
                                        borderRadius: BorderRadius.all(Radius.circular(5)),
                                      ),
                                      child: FlatButton(
                                        child: Text("Cancel",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontFamily: "Open Sans Semibold",
                                              fontSize: 14.0),
                                        ),
                                      ),
                                    ),
                                    Spacer(),
                                    InkWell(
                                      onTap: ()async{
                                        // final FirebaseUser user = await _auth.currentUser();
                                        // Navigator.of(context).push(MaterialPageRoute(
                                        //     builder: (context) => Chat(
                                        //         chatRoomId: user_firebase_id,
                                        //         image: null,
                                        //         name: name,
                                        //         reciuid: user.uid,
                                        //     )));
                                      },
                                      child: Container(
                                        // alignment: Alignment.bottomCenter,
                                        margin: EdgeInsets.only(left: 5.0,right: 10.0),
                                        height: 40,
                                        width: MediaQuery.of(context).size.width*0.40,
                                        decoration: BoxDecoration(
                                          color: Color(0xFFFF0000),
                                          borderRadius: BorderRadius.all(Radius.circular(5)),
                                        ),
                                        child: FlatButton(
                                          onPressed: (){

                                          },
                                          child: Text("Messages",
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontFamily: "Open Sans Semibold",
                                                fontSize: 14.0),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                // Row(
                                //   children: [
                                //     Container(
                                //       // alignment: Alignment.bottomCenter,
                                //       margin: EdgeInsets.only(left: 10.0,right: 5.0),
                                //       height: 40,
                                //       width: 170,
                                //       decoration: BoxDecoration(
                                //         color: Color(0xffE4E4E4),
                                //         borderRadius: BorderRadius.all(Radius.circular(5)),
                                //       ),
                                //       child: FlatButton(
                                //         child: Text("Cancel",
                                //           style: TextStyle(
                                //               color: Colors.black,
                                //               fontFamily: "Open Sans Semibold",
                                //               fontSize: 14.0),
                                //         ),
                                //       ),
                                //     ),
                                //     Spacer(),
                                //     Container(
                                //       // alignment: Alignment.bottomCenter,
                                //       margin: EdgeInsets.only(left: 5.0,right: 10.0),
                                //       height: 40,
                                //       width: 170,
                                //       decoration: BoxDecoration(
                                //         color: Color(0xFFFF0000),
                                //         borderRadius: BorderRadius.all(Radius.circular(5)),
                                //       ),
                                //       child: FlatButton(
                                //         child: Text("Messages",
                                //           style: TextStyle(
                                //               color: Colors.white,
                                //               fontFamily: "Open Sans Semibold",
                                //               fontSize: 14.0),
                                //         ),
                                //       ),
                                //     ),
                                //   ],
                                // ),
                              ],
                            ),
                          )
                      ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<bool> _size = [false,false];
  List<double> _height= [58.0,58.0];
  Widget containerOngoing2(int index,Color color, String series, String date, String status,BuildContext context) {
    double w= MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: GestureDetector(
        onTap:() {
          if (_size[index] == false) {
            setState(() {
              _height[index] = 240.57;
              _size[index]= true;
            });
          } else if (_size[index] == true) {
            setState(() {
              _height[index] = 58.0;
              _size[index]= false;
            });
          }
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: _height[index],
          width: double.infinity,
          child: Card(
            elevation: 2.0,
            child: Column(
              children: [
                SizedBox(height: 12,),
                Container(margin: EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            series,
                            style: TextStyle(
                                fontSize: 12, fontFamily: 'opsr', color: Colors.black),
                          ),
                          Text(
                            date,
                            style: TextStyle(
                                fontSize: 12, fontFamily: 'opsr', color: Colors.grey),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        width: 70,
                        height: 24,
                        decoration: BoxDecoration(
                          color: Color(0xFFFF0000),
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        child: Center(
                            child: Text(
                              status,
                              style: TextStyle(color: Colors.white, fontSize: 11),
                            )),
                      ),
                      SizedBox(width: 10,),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                        size: 24,
                      ),
                      SizedBox(width: 10,)
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(

                      child: Column(
                        children: [
                          SizedBox(height: 12.0,),
                          Container(
                            margin: EdgeInsets.only(left: 16,right: 16),
                            child: DottedLine(
                              dashLength: 2,
                              dashGapLength: 2,
                              lineThickness: 1,
                            ),
                          ),
                          SizedBox(height: 14.0,),
                          Container(margin: EdgeInsets.only(left: 8.0,right: 8.0),
                            child: Row(children: [
                              SizedBox(
                                width: 5,
                              ),Text(
                                series,
                                style: TextStyle(
                                    fontSize: 9, fontFamily: 'opsr', color: Colors.black,fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Text(
                                '07:15 pm - October, 28 2020',
                                style: TextStyle(
                                  fontSize: 9, fontFamily: 'opsr', color: Color(0xff52545D),),
                              ),
                            ],
                            ),
                          ),
                          SizedBox(height: 8.0,),
                          Container(margin: EdgeInsets.only(left: 8.0,right: 8.0),
                            child: Row(children: [
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Men:',
                                style: TextStyle(
                                  fontSize: 9, fontFamily: 'opsr', color: Colors.black,),
                              ),

                              Spacer(),
                              Text(
                                '2 Bag +2 Pent +3 Socks',
                                style: TextStyle(
                                  fontSize: 9, fontFamily: 'opsr', color: Color(0xff52545D),),
                              ),

                            ],),
                          ),
                          SizedBox(height: 6.0,),
                          Container(margin: EdgeInsets.only(left: 8.0,right: 8.0),
                            child: Row(children: [
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Kids:',
                                style: TextStyle(
                                  fontSize: 9, fontFamily: 'opsr', color: Colors.black,),
                              ),

                              Spacer(),
                              Text(
                                '1 Bag',
                                style: TextStyle(
                                  fontSize: 9, fontFamily: 'opsr', color: Color(0xff52545D),),
                              ),

                            ],),
                          ),
                          SizedBox(height: 58.0,),


                          Container(

                            margin: EdgeInsets.only(left: 10.0,right: 10.0,bottom: 8.0),
                            height: 40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Colors.red,
                              borderRadius: BorderRadius.all(Radius.circular(5)),
                            ),
                            child: FlatButton(
                              child: Text("Book Again",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Open Sans Semibold",
                                    fontSize: 10.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}