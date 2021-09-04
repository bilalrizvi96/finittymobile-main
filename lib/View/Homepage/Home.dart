import 'dart:math';

import 'package:charles_app/BaseUrl/variableGloable.dart';
import 'package:charles_app/Model/PopularServicesHp/popularBuilder.dart';
import 'package:charles_app/Model/RecommendationHp/recomBuilder.dart';
import 'package:charles_app/Model/promotionServicesHp/promotionBuilder.dart';
import 'package:charles_app/Model/servicesHomePage/servicesBuilder.dart';
import 'package:charles_app/View/setLocation.dart';
import 'package:charles_app/assets/drawer.dart';
import 'package:charles_app/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:geocoder/geocoder.dart';
import '../../map.dart';


class Mainpage extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _Mainpagestate createState() => _Mainpagestate();
}


class _Mainpagestate extends State<Mainpage>
    with SingleTickerProviderStateMixin{
  bool searchbar=false;
  AnimationController _controller;
  Animation<Offset> _offsetFloat;
  @override
  void initState() {

    // TODO: implement initState
    super.initState();

  }



  //first = addresses.first;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        drawer:drawersr(20.0,20.0).drawers( context),
        body: SingleChildScrollView(
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(left: 8),
            color: Colors.white,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: InkWell(
                    onTap: (){
                      setState(() {
                        searchbar=false;
                      });
                    },
                    child: Container(
                      height: size.height / 5,
                      width: size.width / 2.5,
                      margin: EdgeInsets.only(top:24,left: 0),
                      child: Opacity(
                        opacity: 1.0,
                        child: Image.asset(
                          'lib/assets/images/logo.png',
                        ),
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.start,
                  // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    SizedBox(height: 10,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom:30,top: 12),
                          child: Builder(
                            builder: (BuildContext context){
                              return
                                InkWell(
                                  onTap: ()=>{
                                    Scaffold.of(context).openDrawer(),
                                  },
                                  child: Padding(
                                    padding: const EdgeInsets.only(top:14.0,right: 0),
                                    child: Container(
                                       padding: EdgeInsets.only(left: 5),
                                      width: 40,
                                      // height: 100,
                                      color: Colors.transparent,
                                      child:Image.asset('lib/assets/images/menu.png', height: 20,)
                                    ),
                                  ),
                                );
                            },
                          ),
                        ),

                        // SizedBox(
                        //   width: 1,
                        // ),
                        Padding(
                          padding: const EdgeInsets.only(top: 28,left: 5),
                          child: Container(
                              alignment: Alignment.bottomRight,
                              // padding: EdgeInsets.only(top: 15),
                              child: Text(
                                'Hi, '+username.toString(),
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'monb',
                                    color: Color.fromRGBO(69, 69, 69, 1)
                                ),
                              )),
                        ),
                         Spacer(),
                        Padding(
                          padding: const EdgeInsets.only(top:10.0,bottom: 10.0,right: 25.0,left: 25.0),
                          child: CircleAvatar(
                            radius: 30,
                            child: Image.asset("lib/assets/images/dp.png"),
                            backgroundColor: Colors.transparent,
                          ),
                        ),

                      ],
                    ),
                    Column(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            children: [
                              Container(
                                 // alignment: Alignment.bottomRight,
                                  padding: EdgeInsets.only(left: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                        'Showing services in',
                                         style: Styles().openRegular(size: 10.0),
                                      ),
                                    ],
                                  )
                              ),
                            ],
                          ),
                        ),
                        Container(
                            child: Row(
                              children: [
                                InkWell(
                                  onTap: (){
                                    holdrecord=0;
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (_) => Maps(),
                                        )  );
                                  },

                               child: Row(
                                 children: [
                                   Padding(
                                     padding: const EdgeInsets.only(left:10.0),
                                     child: Container(
                                       width: MediaQuery.of(context).size.width/2,
                                       child: Text(
                                         currentaddress==null?"address":currentaddress.toString(),
                                         style: TextStyle(
                                             fontSize: 18,
                                             fontFamily: 'mmonb',
                                             color: Color.fromRGBO(69, 69, 69, 1)
                                         ),
                                         // style: Styles().openRegular(size: 10.0),
                                       ),
                                     ),

                                   ),
                                   Icon(Icons.arrow_drop_down )

                                 ],
                               ),
                                ),
                              ],
                            )),
                      ],
                    ),
                    SizedBox(height: 10),
                    Container(
                      padding: EdgeInsets.only(top: 12),
                      alignment: Alignment.topLeft,
                      height: size.height /2.3,
                      width: size.width,
                      child: Servicebuilder()),
                    //   Container(
                    //       height:MediaQuery.of(context).size.height/4,
                    //       padding: const EdgeInsets.only(top:8.0),
                    //       child: Servicebuilder()),
                    // ),
                    SizedBox(height: 0,),
                    Container(
                      alignment: Alignment.topLeft,
                      height: size.height / 3.3,
                      width: size.width,
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              'Popular in your area',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  fontSize: 24,
                                  fontFamily: 'monb',
                                  color: Color.fromRGBO(69, 69, 69, 1),

                              ),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              'In your area Linton park',
                              style: TextStyle(
                                  fontSize: 10, fontFamily: 'opsr',
                                  color: Color.fromRGBO(69, 69, 69, 1)

                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:8.0),
                            child: PServicebuilder(),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 5,),
                    Container(
                      alignment: Alignment.topLeft,
                      height: size.height / 3,
                      width: size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              'Promotion',
                              style: TextStyle(
                                  fontSize: 20, fontFamily: 'opsb'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:8.0),
                            child: ProServicebuilder(),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15),
                      alignment: Alignment.topLeft,
                      height: size.height / 3,
                      width: size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              'On Going Jobs- 4',
                              style: TextStyle(
                                  fontSize: 20, fontFamily: 'opsb'),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top:8.0),
                            child: ProServicebuilder(),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 15),
                      alignment: Alignment.topLeft,
                      height: size.height / 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              'Recommendation',
                              style: TextStyle(
                                  fontSize: 20, fontFamily: 'opsb'),
                            ),
                          ),
                          Recommendationbuilder(),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

