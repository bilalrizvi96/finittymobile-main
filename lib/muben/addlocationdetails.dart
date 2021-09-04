import 'dart:async';
import 'package:charles_app/BaseUrl/variableGloable.dart';
import 'package:charles_app/View/Caring/CarDriveAway.dart';
import 'package:charles_app/View/Homepage/Home.dart';
import 'package:charles_app/View/IntroPages/introPages.dart';
import 'package:charles_app/View/bottom.dart';
import 'package:charles_app/muben/unsupportedarea.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:geocoder/geocoder.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:charles_app/View/splash.dart';

class AddLocationDetail extends StatefulWidget {
  @override
  _AddLocationDetailState createState() => _AddLocationDetailState();
}

class _AddLocationDetailState extends State<AddLocationDetail> with SingleTickerProviderStateMixin{
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
      position: LatLng(lat,
         lng),
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
          target: LatLng(lat, lng),
          zoom: 15.0,
        ),
      ),
    );

    _controller.complete(controller);
  }
  void add(var lat,var lng) async
  {
    final coordinates = new Coordinates(lat, lng);
    addresses = await Geocoder.local.findAddressesFromCoordinates(coordinates);
    print("${addresses[2].subLocality},${addresses[2].locality},${addresses[2].countryCode}");
    setState(() {
      currentaddress="${addresses[2].subLocality},${addresses[2].locality},${addresses[2].countryCode}";
    });

  }
  Widget _getLowerLayer() {
    return GoogleMap(
      padding: EdgeInsets.only(bottom: 10),
      //buildingsEnabled: true,
      zoomControlsEnabled: false,
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
      onMapCreated: _onMapCreated,
      initialCameraPosition: CameraPosition(
        target:  new LatLng(lat, lng),
        zoom: 15.0,
      ),

      mapType: _currentMapType,
      markers: _markers,
      // onCameraMove: _onCameraMove,
        onTap: (latLng) {
        setState(() {

          lat=latLng.latitude;
          lng=latLng.longitude;
          add(latLng.latitude,latLng.longitude);
        });

          print('${latLng.latitude}, ${latLng.longitude}');
          setMarkers();
        }
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
                    hintText: currentaddress),
                style: TextStyle(
                    fontSize: 12

                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
            InkWell(
              onTap: () {

                if(holdrecord.toString()=="0")
                  {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => Mainpage(),
                        ));
                  }
                else
                  {
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (_) => CarDriveAway(),
                        ));
                  }


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
                    child: new Text("Next",
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
  Future<bool> _willPopCallback() async {
    // await showDialog or Show add banners or whatever

    return false; // return true if the route to be popped
  }
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop:  _willPopCallback,
      child: SafeArea(
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
      ),
    );
  }
}
// import 'package:charles_app/Auth/HomePage.dart';
// import 'package:charles_app/View/Homepage/Home.dart';
// import 'package:country_code_picker/country_code_picker.dart';
// import 'package:flutter/material.dart';
//
// class Page18 extends StatefulWidget {
//   @override
//   _Page18State createState() => _Page18State();
// }
//
// class _Page18State extends State<Page18> {
//   GlobalKey prefixKey = GlobalKey();
//   String cd = "+502";
//   @override
//   Widget build(BuildContext context) {
//     double w = MediaQuery.of(context).size.width;
//
//     return Scaffold(
//       backgroundColor: Color(0xffFFFFFF),
//       body: SingleChildScrollView(
//           child: Stack(
//         children: [
//           Positioned(
//             child: Container(
//                 width: w, height: 437, child: Image.asset("assets/map.png")),
//           ),
//           Positioned(
//             left: w * 0.31,
//             top: 123.5,
//             child: Container(
//                 width: 160,
//                 height: 160,
//                 child: InkWell(
//                     onTap: () {
//                       _settingModalBottomSheet(context);
//                     },
//                     child: Image.asset("lib/assets/pin-searching-1.png"))),
//           ),
//         ],
//       )),
//     );
//   }
//
//   Widget prefix() {
//     return Container(
//         decoration: BoxDecoration(
//           border: Border(
//               bottom: BorderSide(
//             color: Colors.grey,
//             width: 1.0,
//           )),
//         ),
//         key: prefixKey,
//         child: Row(
//           children: [
//             CountryCodePicker(
//               onChanged: _onCountryChange,
//               initialSelection: 'GT',
//               favorite: ['+92', 'PAK'],
//               onInit: (code) =>
//                   print("on init ${code.name} ${code.dialCode} ${code.name}"),
//             ),
//             Icon(Icons.arrow_drop_down)
//           ],
//         ));
//   }
//
//   void _onCountryChange(CountryCode countryCode) {
//     this.cd = countryCode.toString();
//     print("New Country selected: " + countryCode.toString());
//   }
//
//   void _settingModalBottomSheet(context) {
//     double h = MediaQuery.of(context).size.height;
//     showModalBottomSheet(
//         isScrollControlled: true,
//         context: context,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.only(
//               topLeft: Radius.circular(20.0), topRight: Radius.circular(20.0)),
//         ),
//         backgroundColor: Colors.white,
//         builder: (BuildContext bc) {
//           return Container(
//             margin: EdgeInsets.symmetric(horizontal: 36.5),
//             height: h * 0.675,
//             child: SingleChildScrollView(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: <Widget>[
//                   SizedBox(
//                     height: h * 0.04,
//                   ),
//                   Container(
//                     alignment: Alignment.center,
//                     child: Text(
//                       "Form",
//                       style: TextStyle(
//                           fontFamily: "Open Sans Bold",
//                           fontSize: 24.5,
//                           fontWeight: FontWeight.w700),
//                     ),
//                   ),
//                   SizedBox(
//                     height: h * 0.015,
//                   ),
//                   Text(
//                     "Fill in this online form to register your community, and we will keep you updated with new services available in your area.",
//                     textAlign: TextAlign.center,
//                     style: TextStyle(
//                         color: Color(0xff454545),
//                         fontFamily: "Open Sans Semibold",
//                         fontSize: 12.0),
//                   ),
//                   SizedBox(
//                     height: h * 0.03,
//                   ),
//                   TextField(
//                     decoration: InputDecoration(
//                         prefixIcon: Image.asset(
//                           "lib/assets/user (-1.png",
//                           height: 14.37,
//                           width: 14.37,
//                         ),
//                         hintText: "Full Name",
//                         hintStyle: TextStyle(color: Colors.black)),
//                   ),
//                   SizedBox(
//                     height: h * 0.006,
//                   ),
//                   Row(
//                     children: [
//                       prefix(),
//                       SizedBox(
//                         width: 8,
//                       ),
//                       Flexible(
//                         child: TextFormField(
//                           decoration: InputDecoration(
//
//                               prefixIcon: Icon(
//                                 Icons.phone,
//                                 color: Colors.black,
//                                 size: 18.5,
//                               ),
//                               hintText: "Phone Number",
//                               hintStyle: TextStyle(color: Colors.black)),
//                         ),
//                       ),
//                     ],
//                   ),
//                   SizedBox(
//                     height: h * 0.015,
//                   ),
//                   TextField(
//                     decoration: InputDecoration(
//                         prefixIcon: Icon(
//                           Icons.email,
//                           color: Colors.black,
//                           size: 18.37,
//                         ),
//                         hintText: "Email Address",
//                         hintStyle: TextStyle(color: Colors.black)),
//                   ),
//                   SizedBox(
//                     height: h * 0.015,
//                   ),
//                   TextField(
//                     decoration: InputDecoration(
//                         prefixIcon: Icon(
//                           Icons.gps_fixed,
//                           size: 14.37,
//                           color: Colors.black,
//                         ),
//                         suffixIcon: Icon(
//                           Icons.search,
//                           size: 20.0,
//                           color: Colors.black,
//                         ),
//                         hintText: "R 1085- Waterpump, Karachi Paki..."),
//                   ),
//                   SizedBox(
//                     height: h * 0.030,
//                   ),
//                   Text(
//                     "Please select the services you want Finitty to provide in your area.",
//                     style: TextStyle(
//                         color: Color(0xff454545),
//                         fontFamily: "Open Sans Semibold",
//                         fontSize: 14.0),
//                   ),
//                   SizedBox(
//                     height: h * 0.015,
//                   ),
//                   Text(
//                     "Cleaning",
//                     textAlign: TextAlign.left,
//                     style: TextStyle(
//                         color: Color(0xff454545),
//                         fontFamily: "Open Sans Semibold",
//                         fontSize: 14.0),
//                   ),
//                   SizedBox(
//                     height: h * 0.005,
//                   ),
//                   SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5),
//                             color:Color(0xFFFF0000),
//                           ),
//                           height: 40,
//                           width: 80,
//                           child: Center(
//                               child: Text(
//                             "Home",
//                             style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 12.0,
//                             ),
//                           )),
//                         ),
//                         SizedBox(
//                           width: 8,
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5),
//                             color: Color(0xffBCBDC1),
//                           ),
//                           height: 40,
//                           width: 80,
//                           child: Center(
//                               child: Text(
//                             "Snow",
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 12.0,
//                             ),
//                           )),
//                         ),
//                         SizedBox(
//                           width: 8,
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5),
//                             color: Color(0xffBCBDC1),
//                           ),
//                           height: 40,
//                           width: 80,
//                           child: Center(
//                               child: Text(
//                             "Lawn",
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 12.0,
//                             ),
//                           )),
//                         ),
//                         SizedBox(
//                           width: 8,
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5),
//                             color: Color(0xffBCBDC1),
//                           ),
//                           height: 40,
//                           width: 80,
//                           child: Center(
//                               child: Text(
//                             "Pool",
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 12.0,
//                             ),
//                           )),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: h * 0.015,
//                   ),
//                   Text(
//                     "Caring",
//                     textAlign: TextAlign.left,
//                     style: TextStyle(
//                         color: Color(0xff454545),
//                         fontFamily: "Open Sans Semibold",
//                         fontSize: 14.0),
//                   ),
//                   SizedBox(
//                     height: h * 0.005,
//                   ),
//                   SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5),
//                             color: Color(0xffBCBDC1),
//                           ),
//                           height: 40,
//                           width: 80,
//                           child: Center(
//                               child: Text(
//                             "Sitter",
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 12.0,
//                             ),
//                           )),
//                         ),
//                         SizedBox(
//                           width: 8,
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5),
//                             color: Color(0xffBCBDC1),
//                           ),
//                           height: 40,
//                           width: 80,
//                           child: Center(
//                               child: Text(
//                             "PSW",
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 12.0,
//                             ),
//                           )),
//                         ),
//                         SizedBox(
//                           width: 8,
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5),
//                             color: Color(0xffBCBDC1),
//                           ),
//                           height: 40,
//                           width: 80,
//                           child: Center(
//                               child: Text(
//                             "Nurses",
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 12.0,
//                             ),
//                           )),
//                         ),
//                         SizedBox(
//                           width: 8,
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5),
//                             color: Color(0xffBCBDC1),
//                           ),
//                           height: 40,
//                           width: 80,
//                           child: Center(
//                               child: Text(
//                             "Dentists",
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 12.0,
//                             ),
//                           )),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: 8,
//                   ),
//                   Container(
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(5),
//                       color: Color(0xffBCBDC1),
//                     ),
//                     height: 40,
//                     width: 180,
//                     child: Center(
//                         child: Text(
//                       "Personel Foot Care Nurses",
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 12.0,
//                       ),
//                     )),
//                   ),
//                   SizedBox(
//                     height: h * 0.015,
//                   ),
//                   Text(
//                     "Laundry",
//                     textAlign: TextAlign.left,
//                     style: TextStyle(
//                         color: Color(0xff454545),
//                         fontFamily: "Open Sans Semibold",
//                         fontSize: 14.0),
//                   ),
//                   SizedBox(
//                     height: h * 0.005,
//                   ),
//                   SingleChildScrollView(
//                     scrollDirection: Axis.horizontal,
//                     child: Row(
//                       children: [
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5),
//                             color: Color(0xffBCBDC1),
//                           ),
//                           height: 40,
//                           width: 80,
//                           child: Center(
//                               child: Text(
//                             "Wash & Iron",
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 12.0,
//                             ),
//                           )),
//                         ),
//                         SizedBox(
//                           width: 8,
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5),
//                             color: Color(0xffBCBDC1),
//                           ),
//                           height: 40,
//                           width: 80,
//                           child: Center(
//                               child: Text(
//                             "Wash & Fold",
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 12.0,
//                             ),
//                           )),
//                         ),
//                         SizedBox(
//                           width: 8,
//                         ),
//                         Container(
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(5),
//                             color: Color(0xffBCBDC1),
//                           ),
//                           height: 40,
//                           width: 80,
//                           child: Center(
//                               child: Text(
//                             "Dry Cleaning",
//                             style: TextStyle(
//                               color: Colors.black,
//                               fontSize: 12.0,
//                             ),
//                           )),
//                         ),
//                       ],
//                     ),
//                   ),
//                   SizedBox(
//                     height: h * 0.07,
//                   ),
//                   Container(
//                     width: double.infinity,
//                     height: 52.0,
//                     child: RaisedButton(
//                       color: Color(0xFFFF0000),
//                       onPressed: () {
//                         Navigator.push(
//                             context,
//                             MaterialPageRoute(
//                               builder: (_) => Mainpage(),
//                             ));
//                       },
//                       shape: RoundedRectangleBorder(
//                         borderRadius: BorderRadius.circular(25.0),
//                       ),
//                       child: Text(
//                         "Submit",
//                         style: TextStyle(
//                             color: Colors.white,
//                             fontFamily: "Open Sans Semibold",
//                             fontSize: 14.0),
//                       ),
//                     ),
//                   ),
//                   SizedBox(
//                     height: h * 0.015,
//                   ),
//                 ],
//               ),
//             ),
//           );
//         });
//   }
// }
