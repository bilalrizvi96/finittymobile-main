import 'dart:collection';
import 'dart:io';

import 'package:charles_app/BaseUrl/variableGloable.dart';
import 'package:charles_app/Chat/Constants.dart';
import 'package:charles_app/Chat/chatRoom.dart';
import 'package:charles_app/View/Homepage/Home.dart';
import 'package:charles_app/View/Homepage/Profile.dart';
import 'package:charles_app/View/rollingNav.dart';
import 'package:charles_app/View/splash.dart';
import 'package:charles_app/booking.dart';
import 'package:charles_app/muben/message_main.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../referalBonus.dart';
import 'addtocart/addtocart.dart';
import 'addtocart/addtocart_card.dart';
import 'addtocart/addtocart_list.dart';
import 'indexed.dart';

double scaledHeight(BuildContext context, double baseSize) {
  return baseSize * (MediaQuery.of(context).size.height / 800);
}

double scaledWidth(BuildContext context, double baseSize) {
  return baseSize * (MediaQuery.of(context).size.width / 375);
}

class home_sc extends StatefulWidget {
  // This widget is the root of your application.
  int inde;
  home_sc({this.inde});
  @override
  _home_scState createState() => _home_scState();
}

class _home_scState extends State<home_sc> {
  Color logoColor;
  int activeIndex=2;
  FirebaseAuth _auth = FirebaseAuth.instance;
  final databaseReference = FirebaseDatabase.instance.reference();

  var iconData = <String>[
    "lib/assets/images/Group 9648.png",
    "lib/assets/images/Group 9649.png",
    "lib/assets/images/Group 11061.png",
    "lib/assets/images/Group 9650.png",
    "lib/assets/images/Group 9651.png",
    // Image.asset("lib/assets/images/Group 9649.png"),
    // Image.asset("lib/assets/images/Group 11061.png"),
    // Image.asset("lib/assets/images/Group 9650.png"),
    // Image.asset("lib/assets/images/Group 9651.png"),
    // Icons.person_outline,
  ];
  var iconsize = <double>[
    35.0,
    35.0,
    45.0,
    35.0,
    35.0,
  ];
  final List<Widget> _children = [


    Booking(),
    ChatRoom(),
  //  InbMessage(),
    Mainpage(),
    CartList(),
    Profile()


  ];


  var badges = <int>[
    null, null, null, null, null
  ];

  var iconText = <Widget>[
    Text('', style: TextStyle(color: Colors.grey, fontSize: 12)),
    Text('', style: TextStyle(color: Colors.grey, fontSize: 12)),
    Text('', style: TextStyle(color: Colors.grey, fontSize: 12)),
    Text('', style: TextStyle(color: Colors.grey, fontSize: 12)),
    Text('', style: TextStyle(color: Colors.grey, fontSize: 12)),
  ];

  var indicatorColors = <Color>[
    Color.fromRGBO(255, 0, 0, 1),
    Color.fromRGBO(255, 0, 0, 1),
    Color.fromRGBO(255, 0, 0, 1),
    Color.fromRGBO(255, 0, 0, 1),
    Color.fromRGBO(255, 0, 0, 1),
  ];


  @override
  void initState() {
    logoColor = Colors.red[600];
    activeIndex = widget.inde;
    super.initState();
    _registerOnFirebase();
  }
  FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  _registerOnFirebase() async {
     final FirebaseUser user = await _auth.currentUser();
     _firebaseMessaging.subscribeToTopic('all');
    _firebaseMessaging.getToken().then((token) {
      final FirebaseDatabase database = FirebaseDatabase.instance;
      database.reference().child('CustomerTokens').child(user.uid);
      Map<String, Object> createDoc = new HashMap();
      createDoc['token'] = token.toString();
      //createDoc['did']= user.uid;
      database.reference().child('CustomerTokens').child(user.uid).set(createDoc);
    });

     databaseReference.child("Customers").child(user.uid).set({
       'uid': user.uid,
       'Name': username,
       'userphone': SplashTest.sharedPreferences.getString("userphone"),
     });
     Constants.myName = user.uid;
     Constants.uid =  user.uid;
     Constants.name = username;
  }


  void incrementIndex() {
    setState(() {
      activeIndex = activeIndex < (iconData.length - 1) ? activeIndex + 1 : 0;
      print(activeIndex);
    });
  }

  // ignore: unused_element
  _onAnimate(AnimationUpdate update) {
    setState(() {
      logoColor = update.color;
    });
  }

  _onTap(int index) {
    setState(() {
      activeIndex = index;
      //if(activeIndex == index){
      setState(() {
        for(int a = 0; a < iconsize.length; a++){
          if(a == index){
            iconsize[a] = 45.0;
          }
          else{
            iconsize[a] = 35.0;
          }
        }
      });
      // }
    });

  }

//  void _incrementBadge() {
//    badges[activeIndex] =
//        badges[activeIndex] == null ? 1 : badges[activeIndex] + 1;
//    setState(() {});
//  }

  List<Widget> get builderChildren => const <Widget>[
    Text('1', style: TextStyle(color: Colors.grey)),
    Text('2', style: TextStyle(color: Colors.grey)),
    Text('3', style: TextStyle(color: Colors.grey)),
  ];
  Future<bool> _onBackPressed() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text('Are you sure?'),
          content: Text('Do you want to exit an App'),
          actions: <Widget>[
            FlatButton(
              child: Text('No'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            FlatButton(
              child: Text('Yes'),
              onPressed: () {
                exit(0);
              },
            )
          ],
        );
      },
    ) ?? false;
  }

  @override
  Widget build(BuildContext context) {


    return WillPopScope(
    //  onWillPop: _onBackPressed,
      child: MaterialApp(
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.blue[100],
        ),
        home: Directionality(
          //textDirection: TextDirection.rtl,
          textDirection: TextDirection.ltr,
          child: Builder(
            builder: (BuildContext context) {
              double largeIconHeight = MediaQuery.of(context).size.width;
              double navBarHeight = scaledHeight(context, 70);
              double topOffset = (MediaQuery.of(context).size.height -
                  largeIconHeight -
                  MediaQuery.of(context).viewInsets.top -
                  (navBarHeight * 2)) / 2;
              return WillPopScope(
                onWillPop: _onBackPressed,
                child: Scaffold(
//              floatingActionButton: FloatingActionButton(
//                backgroundColor: logoColor,
//                child: Icon(Icons.add),
//                onPressed: _incrementBadge,
//              ),

                  body: _children[activeIndex],
                  bottomNavigationBar: Stack(
                    children: <Widget>[

                      Container(
                        //bottom: 0,
                        height: navBarHeight+20,
                        width: MediaQuery.of(context).size.width,
                        // Option 1: Recommended
                        child: Stack(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                              ),

                            ),

                            RollingNavBar.iconData(
//
                              activeIconColors: [
                                Colors.white,
                              ],
                              activeIndex: activeIndex,
                              animationCurve: Curves.linear,
                              animationType: AnimationType.roll,
                              baseAnimationSpeed: 200,
//                      badges: badgeWidgets,
                              iconData: iconData,
                              iconColors: <Color>[Colors.grey[800]],
                              // iconText: iconText,
                              indicatorColors: indicatorColors,
                              indicatorSides: 6,
                            //  indicatorCornerRadius: 500,
                              iconSize: iconsize,
                              indicatorRadius: scaledHeight(context, 40),
                              onAnimate: _onAnimate,
                              onTap: _onTap,
                            ),
                          ],
                        ),

                        // Option 2: Possibly more complicated, but there if you need it
                        // child:

                      ),
                    ],

                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
