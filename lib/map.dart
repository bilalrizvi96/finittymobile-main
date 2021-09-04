import 'dart:async';
import 'package:charles_app/BaseUrl/variableGloable.dart';
import 'package:charles_app/View/IntroPages/introPages.dart';
import 'package:charles_app/muben/unsupportedarea.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'View/bottom.dart';
import 'View/splash.dart';

class Maps extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<Maps> with SingleTickerProviderStateMixin {
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

  void initState() {
    setState(() {
      final location = new Location();

      // location.onLocationChanged().listen((cLoc) {
      //   SplashTest.center = LatLng(cLoc.latitude, cLoc.longitude);
      // });
    });

    setMarkers();
    super.initState();
  }

  setMarkers() {
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
          target: new LatLng(lat,lng),
          zoom: 15.0,
        ),
      ),
    );

    _controller.complete(controller);
  }

  Widget _getLowerLayer() {
    return GoogleMap(
      onMapCreated: _onMapCreated,
      padding: EdgeInsets.only(bottom: 10),
      //buildingsEnabled: true,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: true,
      myLocationEnabled: true,

      initialCameraPosition: CameraPosition(
        target: new LatLng(lat,lng),
        zoom: 15.0,
      ),
      mapType: _currentMapType,
      markers: _markers,
      // onCameraMove: _onCameraMove,


    );
  }

  Widget _getUpperLayer() {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 36.5),
      height: MediaQuery.of(context).size.height * 0.54,
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: Color.fromRGBO(0, 0, 0, 0.05),
                offset: Offset(0, -3),
                blurRadius: 10)
          ],
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(24), topLeft: Radius.circular(24)),
          color: Colors.white),
      child: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: <Widget>[
            SizedBox(
              height: 20,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Text(
                'Select your location from the map',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontFamily: 'monb',
                  fontWeight: FontWeight.bold,
                  fontSize: 22.0,
                ),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              'Please enter your location to find available services at an affordable price near you',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'rubikl', fontSize: 14.0, color: Colors.black),
            ),
            SizedBox(
              height: 40,
            ),
            Container(
              height: 40.0,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(width: 1.0, color: Colors.grey),
                ),
              ),
              child: TextField(
                controller: searchController,
                cursorColor: Colors.grey,
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
                    hintText: "Address"),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => UnSupportedArea(),
                    ));
              },
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Color(0xFFFF0000),
                  border: Border.all(
                    color: Color(0xFFFF0000),
                  ),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Center(
                    child: new Text("Find me",
                        style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontStyle: FontStyle.normal,
                            fontSize: 15.0))),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
                height: MediaQuery.of(context).size.height*0.48,
                child: _getLowerLayer()),
            Align(
              alignment: Alignment.bottomCenter,
              child: _getUpperLayer(),
            )
          ],
        ),
      ),
    );
  }
}
