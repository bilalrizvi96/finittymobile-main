import 'dart:async';
import 'package:charles_app/BaseUrl/variableGloable.dart';
import 'package:charles_app/View/splash.dart';
import 'package:charles_app/muben/addlocationdetails.dart';
import 'package:charles_app/muben/mapaddress.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:location/location.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../map.dart';

class UnSupportedArea extends StatefulWidget {
  @override
  _UnSupportedAreaState createState() => _UnSupportedAreaState();
}

class _UnSupportedAreaState extends State<UnSupportedArea> with SingleTickerProviderStateMixin {

  GoogleMapController _controllermap;
  Completer<GoogleMapController> _controller = Completer();

  //static  LatLng _center1 ;
  //static  LatLng _center=LatLng(33.652100, 75.123398) ;
  final Set<Marker> _markers = {};

//  static LatLng _lastMapPosition = _center;

  MapType _currentMapType = MapType.normal;

  /*void _onMapTypeButtonPressed() {
    setState(() {
      _currentMapType = _currentMapType == MapType.normal
          ? MapType.satellite
          : MapType.normal;
    });
  }*/

  TextEditingController searchController = TextEditingController();
  // GoogleMapController mapController;
  //
  // final LatLng _center = const LatLng(45.521563, -122.677433);
  //
  // void _onMapCreated(GoogleMapController controller) {
  //   mapController = controller;
  // }

  void initState() {
    setState(() {
      final location = new Location();
      //
      // location.onLocationChanged().listen((LocationData cLoc){
      //   SplashTest.center = LatLng(cLoc.latitude, cLoc.longitude);
      //
      // });
    });

    setMarkers();
    super.initState();
  }

  setMarkers(){

    Marker resultMarker = Marker(
      markerId: MarkerId('Current location'),
      infoWindow: InfoWindow(
        title: 'Current location',
      ),
      position: LatLng(lat, lng),
    );
    setState(() {
      _markers.add(resultMarker);
    });

  }


  // void _onCameraMove(CameraPosition position) {
  //   SplashTest.center = position.target;
  // }

  void _onMapCreated(GoogleMapController controller) {
    _controllermap = controller;
    _controllermap.animateCamera(
      CameraUpdate.newCameraPosition(
        CameraPosition(
          target:  new LatLng(lat, lng),
          zoom: 15.0,
        ),
      ),
    );

    _controller.complete(controller);
  }

  Widget _getLowerLayer() {
    return GoogleMap(
      padding: EdgeInsets.only(bottom: 10),
      //buildingsEnabled: true,
      zoomControlsEnabled: false,
      onMapCreated: _onMapCreated,
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
      initialCameraPosition: CameraPosition(
        target: new LatLng(lat, lng) ,
        zoom: 15.0,
      ),

      mapType: _currentMapType,
      markers: _markers,
      // onCameraMove: _onCameraMove,
    );
  }

  Widget _getUpperLayer() {
    double h = MediaQuery.of(context).size.height;
    return Container(
      height: h*0.54,
      padding: EdgeInsets.symmetric(horizontal: 36.5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0),
        ),
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Text(
              "Sorry!!",
              style: TextStyle(
                  fontFamily: "Open Sans Bold",
                  fontSize: 24.5,
                  fontWeight: FontWeight.w900),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 22),
              child: RichText(
                textAlign: TextAlign.center,
                text: new TextSpan(
                    text: "Finitty is not yet in your area, we hope to be very soon. We are expanding and currently providing our services to other communities. Please simply fill in ",
                    style: TextStyle(
                        color: Color(0xff454545),
                        fontFamily: "Open Sans Semibold",
                        fontSize: 14.0),
                    children: [
                      new TextSpan(
                          text: 'this online form', style: TextStyle(
                          color: Color(0xff454545),
                          fontStyle: FontStyle.italic,
                          fontFamily: "Open Sans Semibold",
                          decoration: TextDecoration.underline,
                          fontSize: 14.0),
                          recognizer: new TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) => MapForm(),
                                  ));
                            }
                      ),
                      new TextSpan(
                          text: ' to register your community, and we will keep you updated with new services available in your area.')
                    ]),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.gps_fixed,
                    size: 14.37,
                    color: Colors.black,
                  ),
                  suffixIcon: Icon(
                    Icons.search,
                    size: 20.0,
                    color: Colors.black,
                  ),
                  hintText: currentaddress,
                hintStyle: TextStyle(
                  fontSize: 12

                ),

              ),
            ),
            SizedBox(
              height: 45,
            ),
            Container(
              width: double.infinity,
              height: 50.0,
              child: RaisedButton(
                color: Color(0xFFFF0000),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => AddLocationDetail(),
                      ));
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Text(
                  "Next",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Open Sans Semibold",
                      fontSize: 14.0),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            )
          ],
        ),
      ),
    )
    ;
  }


  @override
  Widget build(BuildContext context) {

    double h = MediaQuery
        .of(context)
        .size
        .height;
    double w = MediaQuery
        .of(context)
        .size
        .width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        body: Stack(
          children: <Widget>[
            Container(
                height: MediaQuery.of(context).size.height*0.54,
                child: _getLowerLayer()),
            Align(
              alignment: Alignment.bottomCenter,
              child: _getUpperLayer(),
            )
          ],
        ),
        // body: SingleChildScrollView(
        //     child: Stack(
        //       children: [
        //         Positioned(
        //           child: Container(
        //               height: MediaQuery
        //                   .of(context)
        //                   .size
        //                   .height,
        //               child: GoogleMap(
        //                 onMapCreated: _onMapCreated,
        //                 initialCameraPosition: CameraPosition(
        //                   target: _center,
        //                   zoom: 11.0,
        //                 ),
        //               )
        //           ),
        //         ),
        //         // Positioned(
        //         //   left: w * 0.31,
        //         //   top: 123.5,
        //         //   child: Container(
        //         //       width: 160,
        //         //       height: 160,
        //         //       child: Image.asset("lib/assets/pin-searching-1.png")
        //         //   ),
        //         // ),
        //         Container(
        //
        //           decoration: BoxDecoration(
        //             color: Colors.white,
        //               borderRadius: BorderRadius.only(
        //                   topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0),
        //             ),
        //           ),
        //           child: Container(
        //             margin: EdgeInsets.symmetric(horizontal: 36.5),
        //             height: h * 0.47,
        //             child: Column(
        //               children: <Widget>[
        //                 SizedBox(
        //                   height: h * 0.04,
        //                 ),
        //                 Text(
        //                   "Sorry!!",
        //                   style: TextStyle(
        //                       fontFamily: "Open Sans Bold",
        //                       fontSize: 24.5,
        //                       fontWeight: FontWeight.bold),
        //                 ),
        //                 SizedBox(
        //                   height: h * 0.015,
        //                 ),
        //                 RichText(
        //                   textAlign: TextAlign.center,
        //                   text: new TextSpan(
        //                       text: "Finitty is not yet in your area, we hope to be very soon. We are expanding and currently providing our services to other communities. Please simply fill in ",
        //                       style: TextStyle(
        //                           color: Color(0xff454545),
        //                           fontFamily: "Open Sans Semibold",
        //                           fontSize: 14.0),
        //                       children: [
        //                         new TextSpan(
        //                             text: 'this online form', style: TextStyle(
        //                             color: Color(0xff454545),
        //                             fontStyle: FontStyle.italic,
        //                             fontFamily: "Open Sans Semibold",
        //                             decoration: TextDecoration.underline,
        //                             fontSize: 14.0),
        //                             recognizer: new TapGestureRecognizer()
        //                               ..onTap = () {
        //                                 Navigator.push(
        //                                     context,
        //                                     MaterialPageRoute(
        //                                       builder: (_) => Page18(),
        //                                     ));
        //                               }
        //                         ),
        //                         new TextSpan(
        //                             text: ' to register your community, and we will keep you updated with new services available in your area.')
        //                       ]),
        //                 ),
        //                 SizedBox(
        //                   height: h * 0.054,
        //                 ),
        //                 TextField(
        //                   decoration: InputDecoration(
        //                       prefixIcon: Icon(
        //                         Icons.gps_fixed,
        //                         size: 14.37,
        //                         color: Colors.black,
        //                       ),
        //                       suffixIcon: Icon(
        //                         Icons.search,
        //                         size: 20.0,
        //                         color: Colors.black,
        //                       ),
        //                       hintText: "R 1085- Waterpump, Karachi Paki..."),
        //                 ),
        //                 SizedBox(
        //                   height: h * 0.06,
        //                 ),
        //                 Container(
        //                   width: double.infinity,
        //                   height: 52.0,
        //                   child: RaisedButton(
        //                     color: Color(0xFFFF0000),
        //
        //                     onPressed: () {
        //
        //                     },
        //                     shape: RoundedRectangleBorder(
        //                       borderRadius: BorderRadius.circular(25.0),
        //                     ),
        //                     child: Text(
        //                       "Next",
        //                       style: TextStyle(
        //                           color: Colors.white,
        //                           fontFamily: "Open Sans Semibold",
        //                           fontSize: 14.0),
        //                     ),
        //                   ),
        //                 )
        //               ],
        //             ),
        //           ),
        //         )
        //       ],
        //     )),
      ),
    );
  }
}


