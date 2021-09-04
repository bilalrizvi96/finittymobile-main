import 'package:charles_app/BaseUrl/variableGloable.dart';
import 'package:charles_app/View/IntroPages/introPages.dart';
import 'package:charles_app/View/bottom.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:geocoder/geocoder.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashTest extends StatefulWidget {
  static SharedPreferences sharedPreferences;
  static String tok;
  static List<String> toke = new List();
  @override
  // static LatLng center = new LatLng(33.652100, 75.123398);
  _SplashTestState createState() => _SplashTestState();
}

class _SplashTestState extends State<SplashTest> with TickerProviderStateMixin{
  double _height = 1000.0;
  double _width = 1000.0;
  var _color = Colors.blue;
  bool _resized = false;
  Position currentLocation;
  String _message = '';
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  getUserLocation() async {
    currentLocation = await locateUser();
    setState(() {
      add(currentLocation.latitude,currentLocation.longitude);
      lat=currentLocation.latitude;
      lng=currentLocation.longitude;
      latlong=currentLocation;
      //_center = LatLng(currentLocation.latitude, currentLocation.longitude);
      //    getLocationName(currentLocation.latitude, currentLocation.longitude);
    });
    //print('center $_center');
  }
  Future<Position> locateUser() async {
    return Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  void add(var lat,var lng) async
  {
    final coordinates = new Coordinates(lat, lng);
    addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    print("${addresses[2].subLocality},${addresses[2].locality},${addresses[2].countryCode}");
    currentaddress="${addresses[2].subLocality},${addresses[2].locality},${addresses[2].countryCode}";
  }

  initi()async{
  SplashTest.sharedPreferences=await SharedPreferences.getInstance();
  usertoken=SplashTest.sharedPreferences.getString("usertoken");
  userid=SplashTest.sharedPreferences.getString("userid");
  username=SplashTest.sharedPreferences.getString("username");
  getUserLocation();
  }

  Widget delay(){
    Future.delayed(
        const Duration(seconds: 9), ()
    {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (_) => usertoken!=null?home_sc(inde: 2,):IntroPage()));
    });
  }
  AnimationController controller;
  Animation<double> animation;
  @override
  void initState() {
    initi();


    // TODO: implement initState
    //setState(() {
      Future.delayed(
          const Duration(seconds: 2), ()
      {
        setState(() {
          if (_resized==false) {
            _resized = false;
            _color = Colors.blue;
            _height = 80.0;
            _width = 80.0;
          } else {
            _resized = true;
            _color = Colors.blue;
            _height = 1000.0;
            _width = 1000.0;
          }
        });
      });
      controller = AnimationController(
          duration: const Duration(seconds: 5), vsync: this);
      animation = CurvedAnimation(parent: controller, curve: Curves.easeInBack);
      //this will start the animation
      controller.forward();
      delay();
  //  });

    super.initState();
    Future.delayed(Duration.zero, () {
      this. _registerOnFirebase();
      this.getMessage();
    });
    var initializationSettingsAndroid =
    AndroidInitializationSettings('@mipmap/ic_launcher');
    var initializationSettingsIOs = IOSInitializationSettings();
    var initSetttings = InitializationSettings(
        initializationSettingsAndroid, initializationSettingsIOs);

    flutterLocalNotificationsPlugin.initialize(initSetttings,
        onSelectNotification: onSelectNotification);
  }
  Future onSelectNotification(String payload) {
    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return home_sc(inde: 2,);
    }));
  }
  _registerOnFirebase() {
    _firebaseMessaging.subscribeToTopic('all');
    _firebaseMessaging.getToken().then((token) => SplashTest.tok = token);
  }
  void getMessage() {
    var platform = Theme.of(context).platform;
    if (platform == TargetPlatform.iOS) {
      _firebaseMessaging
          .requestNotificationPermissions(const IosNotificationSettings(sound: true, badge: true, alert: true));
      _firebaseMessaging.onIosSettingsRegistered.listen((IosNotificationSettings settings) {
        print("Settings registered: $settings");
      });
    }
    else{
      _firebaseMessaging.configure(
          onMessage: (Map<String, dynamic> message) async {
            print('received message');
            setState(() => _message = message["notification"]["body"]);
          },
          onResume: (Map<String, dynamic> message) async {
            print('on resume $message');
            setState(() => _message = message["notification"]["body"]);
          },
          onLaunch: (Map<String, dynamic> message) async {
            print('on launch $message');
            setState(() => _message = message["notification"]["body"]);
          }
      );
    }

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            top: 130,
            left: 0.0,
            right: 0.0,
            bottom: 0.0,
            child: Container(
              alignment: Alignment.center,
              padding: EdgeInsets.all(25),
              child: DelayedDisplay(
                  slidingCurve: Curves.easeInOutBack,
                  delay: Duration(seconds: 6),
                  fadingDuration: Duration(seconds: 2),
                  child:Text('FINITTY',style: TextStyle(
                      fontWeight: FontWeight.bold,color: Color(0xFFFF0000),fontSize: 35),)
              ),
            ),
          ),
          Center(
            child: GestureDetector(
              child: Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20.0),
                    color: Color(0xFFFF0000),
                    border: Border.all(color: Color(0xFFFF0000))
                ),

                child: AnimatedSize(
                  curve: Curves.easeIn,
                  vsync: this,
                  duration: Duration(seconds: 1),
                  child: Container(
                    child: Stack(
                      children: [
                        Container(
                          width: _width,
                          height: _height,
                          child: FadeTransition(
                              opacity: animation,
                              child: Image.asset("lib/assets/images/Group 9419.png",width: 20,height: 20,color: Colors.white)
                          ),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20.0),
                              color: Color(0xFFFF0000),
                              border: Border.all(color: Color(0xFFFF0000))
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


//   Widget delay(){
//     if(selected==false){
//       Future.delayed(
//           const Duration(seconds: 2), () {
//             setState(() {
//               selected=true;
//             });
//
//       });
//
//     }
//
//   }
//
//   bool selected = false;
//   @override
//   void initState() {
//     selected=false;
//     // TODO: implement initState
//     setState(() {
//
//       delay();
//     });
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return  GestureDetector(
//       // onTap: () {
//       //   setState(() {
//       //     selected = !selected;
//       //   });
//       // },
//       child: Center(
//         child: AnimatedContainer(
//           width: selected ? MediaQuery.of(context).size.width : MediaQuery.of(context).size.width,
//           height: selected ? MediaQuery.of(context).size.height : MediaQuery.of(context).size.height,
//           color: selected ? Colors.white : Colors.red,
//           alignment:
//           Alignment.center ,
//           duration: Duration(seconds: 5),
//           curve: Curves.slowMiddle,
//           child: selected ? Container(
//               decoration: BoxDecoration(
//                 borderRadius: BorderRadius.circular(20.0),
//                 color: Colors.red,
//                   border: Border.all(color: Colors.red)
//               ),
//               child: FlutterLogo(duration: Duration(seconds: 5),size: 75)) : Container(width: MediaQuery.of(context).size.width
//             ,height: MediaQuery.of(context).size.height, color: Colors.red,),
//         ),
//       ),
//     );;
//   }
// }
// import 'package:charles_app/Auth/HomePage.dart';
// import 'package:charles_app/View/Homepage/Home.dart';
// import 'package:charles_app/View/IntroPages/introPages.dart';
// import 'package:charles_app/map.dart';
// import 'package:delayed_display/delayed_display.dart';
// import 'package:flutter/material.dart';
// import 'package:google_maps_flutter/google_maps_flutter.dart';
// import 'dart:async';
//
// import 'package:location/location.dart';
//
// class SplashTest extends StatefulWidget {
//   static LatLng center = new LatLng(33.652100, 75.123398);
//   @override
//   _SplashTestState createState() => _SplashTestState();
// }
//
// class _SplashTestState extends State<SplashTest> with TickerProviderStateMixin{
//   double _height = 1000.0;
//   double _width = 1000.0;
//   var _color = Colors.blue;
//   bool _resized = false;
//   Widget delay(){
//     Future.delayed(
//         const Duration(seconds: 7), ()
//     {
//       Navigator.of(context)
//           .push(MaterialPageRoute(builder: (_) => IntroPage()));
//     });
//   }
//   AnimationController controller;
//   Animation<double> animation;
//   @override
//   void initState() {
//     // TODO: implement initState
//     setState(() {
//
//       Future.delayed(
//           const Duration(seconds: 2), ()
//       {
//         setState(() {
//
//           if (_resized==false) {
//             _resized = false;
//             _color = Colors.blue;
//             _height = 80.0;
//             _width = 80.0;
//           } else {
//             _resized = true;
//             _color = Colors.blue;
//             _height = 1000.0;
//             _width = 1000.0;
//           }
//         });
//       });
//       controller = AnimationController(
//           duration: const Duration(seconds: 6), vsync: this);
//       animation = CurvedAnimation(parent: controller, curve: Curves.easeInBack);
//       //this will start the animation
//       controller.forward();
//       delay();
//     });
//
//     super.initState();
//   }
//   @override
//   Widget build(BuildContext context) {
//
//     return Scaffold(
//       body: Stack(
//         children: [
//           Positioned(
//             top: 150,
//             left: 0.0,
//             right: 0.0,
//             bottom: 0.0,
//             child: Container(
//               alignment: Alignment.center,
//               padding: EdgeInsets.all(25),
//               child: DelayedDisplay(
//                   delay: Duration(seconds: 5),
//                   fadingDuration: Duration(seconds: 2),
//                   child:Text('FINITY',style: TextStyle(
//                       fontWeight: FontWeight.bold,color: Colors.red,fontSize: 35),)
//               ),
//             ),
//           ),
//           Center(
//             child: GestureDetector(
//               child: Container(
//                 decoration: BoxDecoration(
//                     borderRadius: BorderRadius.circular(20.0),
//                     color: Colors.red,
//                     border: Border.all(color: Colors.red)
//                 ),
//
//                 child: AnimatedSize(
//                   curve: Curves.easeIn,
//                   vsync: this,
//                   duration: Duration(seconds: 1),
//                   child: Container(
//                     child: Stack(
//                       children: [
//                         Container(
//                           width: _width,
//                           height: _height,
//                           child: FadeTransition(
//                               opacity: animation,
//                               child: Image.asset("lib/assets/images/Group 9419.png",width: 20,height: 20,color: Colors.white)
//                           ),
//                           decoration: BoxDecoration(
//                               borderRadius: BorderRadius.circular(20.0),
//                               // color: Color(0xFFFF0000),
//                               border: Border.all(color: Colors.red)
//                           ),
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ),
//           ),
//
//
//         ],
//       ),
//     );
//   }
// }
