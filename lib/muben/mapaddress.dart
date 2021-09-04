import 'dart:async';
import 'package:charles_app/BaseUrl/variableGloable.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:charles_app/View/Homepage/Home.dart';
import 'package:charles_app/View/IntroPages/introPages.dart';
import 'package:charles_app/View/bottom.dart';
import 'package:charles_app/muben/unsupportedarea.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart';
import 'package:charles_app/View/splash.dart';

class MapForm extends StatefulWidget {
  @override
  _MapFormState createState() => _MapFormState();
}

class _MapFormState extends State<MapForm> with SingleTickerProviderStateMixin {
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

      // location.onLocationChanged().listen((LocationData cLoc) {
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
      position: LatLng(lat,lng),
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

  Widget _getLowerLayer() {
    return GoogleMap(
      padding: EdgeInsets.only(bottom: 10),
      //buildingsEnabled: true,
      zoomControlsEnabled: false,
      onMapCreated: _onMapCreated,
      myLocationButtonEnabled: true,
      myLocationEnabled: true,
      initialCameraPosition: CameraPosition(
        target: LatLng(lat, lng),
        zoom: 15.0,
      ),
      mapType: _currentMapType,
      markers: _markers,
      // onCameraMove: _onCameraMove,
    );
  }

  Widget _getUpperLayer(BuildContext ctx) {
    double h = MediaQuery.of(ctx).size.height;
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 36.0),
      height: MediaQuery.of(context).size.height * 0.65,
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
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(
              height: 40,
            ),
            Container(
              alignment: Alignment.center,
              child: Text(
                "Form",
                style: TextStyle(
                    fontFamily: "monb",
                    fontSize: 24.5,
                    fontWeight: FontWeight.w700),
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 24),
              child: RichText(
                textAlign: TextAlign.center,
                text: new TextSpan(
                    text: "Fill in ",
                    style: TextStyle(
                        color: Color(0xff454545),
                        fontFamily: "Open Sans Semibold",
                        fontSize: 14.0),
                    children: [
                      new TextSpan(
                        text: 'this online form',
                        style: TextStyle(
                            color: Color(0xff454545),
                            fontStyle: FontStyle.italic,
                            fontFamily: "Open Sans Semibold",
                            decoration: TextDecoration.underline,
                            fontSize: 14.0),
                      ),
                      new TextSpan(
                          text:
                              ' to register your community, and we will keep you updated with new services available in your area.')
                    ]),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.person, size: 15, color: Colors.black),
                  // Image.asset(
                  //         "lib/assets/images/user.png",
                  //         height: 14.37,
                  //         width: 14.37,
                  //       ),
                  hintText: "Full Name",
                  hintStyle: TextStyle(color: Colors.black)),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              children: [
                prefix(),
                SizedBox(
                  width: 8,
                ),
                Flexible(
                  child: TextFormField(
                    decoration: InputDecoration(
                        prefixIcon: Icon(
                          Icons.phone,
                          color: Colors.black,
                          size: 18.5,
                        ),
                        hintText: "Phone Number",
                        hintStyle: TextStyle(color: Colors.black)),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            TextField(
              decoration: InputDecoration(
                  prefixIcon: Icon(
                    Icons.email,
                    color: Colors.black,
                    size: 18.37,
                  ),
                  hintText: "Email Address",
                  hintStyle: TextStyle(color: Colors.black)),
            ),
            SizedBox(
              height: 10,
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
                  hintText: "R 1085- Waterpump, Karachi Paki..."),
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              "Please select the services you want Finitty to provide in your area.",
              style: TextStyle(
                  color: Color(0xff454545),
                  fontFamily: "Open Sans Semibold",
                  fontSize: 14.0),
            ),
            SizedBox(
              height: 18,
            ),
            Text(
              "Cleaning",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color(0xff454545),
                  fontFamily: "Open Sans Semibold",
                  fontSize: 14.0),
            ),
            SizedBox(
              height: 5,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xFFFF0000),
                    ),
                    height: 30,
                    width: 80,
                    child: Center(
                        child: Text(
                      "Home",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 12.0,
                      ),
                    )),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xFFE4E4E4),
                    ),
                    height: 30,
                    width: 80,
                    child: Center(
                        child: Text(
                      "Snow",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                      ),
                    )),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xFFE4E4E4),
                    ),
                    height: 30,
                    width: 80,
                    child: Center(
                        child: Text(
                      "Lawn",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                      ),
                    )),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xFFE4E4E4),
                    ),
                    height: 30,
                    width: 80,
                    child: Center(
                        child: Text(
                      "Pool",
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
              height: 10,
            ),
            Text(
              "Caring",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color(0xff454545),
                  fontFamily: "Open Sans Semibold",
                  fontSize: 14.0),
            ),
            SizedBox(
              height: 5,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xFFE4E4E4),
                    ),
                    height: 30,
                    width: 80,
                    child: Center(
                        child: Text(
                      "Sitter",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                      ),
                    )),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xFFE4E4E4),
                    ),
                    height: 30,
                    width: 80,
                    child: Center(
                        child: Text(
                      "PSW",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                      ),
                    )),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xFFE4E4E4),
                    ),
                    height: 30,
                    width: 80,
                    child: Center(
                        child: Text(
                      "Nurses",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                      ),
                    )),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xFFE4E4E4),
                    ),
                    height: 30,
                    width: 80,
                    child: Center(
                        child: Text(
                      "Dentists",
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
              height: 6,
            ),
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                color: Color(0xFFE4E4E4),
              ),
              height: 30,
              width: 180,
              child: Center(
                  child: Text(
                "Personel Foot Care Nurses",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 12.0,
                ),
              )),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "Laundry",
              textAlign: TextAlign.left,
              style: TextStyle(
                  color: Color(0xff454545),
                  fontFamily: "Open Sans Semibold",
                  fontSize: 14.0),
            ),
            SizedBox(
              height: 5,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xFFE4E4E4),
                    ),
                    height: 30,
                    width: 85,
                    child: Center(
                        child: Text(
                      "Wash & Iron",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                      ),
                    )),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xFFE4E4E4),
                    ),
                    height: 30,
                    width: 85,
                    child: Center(
                        child: Text(
                      "Wash & Fold",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 12.0,
                      ),
                    )),
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xFFE4E4E4),
                    ),
                    height: 30,
                    width: 85,
                    child: Center(
                        child: Text(
                      "Dry Cleaning",
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
              height: 27,
            ),
            Container(
              width: double.infinity,
              height: 52.0,
              child: RaisedButton(
                color: Color(0xFFFF0000),
                onPressed: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => Mainpage(),
                      ));
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(25.0),
                ),
                child: Text(
                  "Submit",
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Open Sans Semibold",
                      fontSize: 14.0),
                ),
              ),
            ),
            SizedBox(
              height: 40,
            ),
          ],
        ),
      ),
    );
  }

  Widget prefix() {
    return Container(
        decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
            color: Colors.grey,
            width: 1.0,
          )),
        ),
        key: prefixKey,
        child: Row(
          children: [
            CountryCodePicker(
              onChanged: _onCountryChange,
              initialSelection: 'GT',
              favorite: ['+92', 'PAK'],
              onInit: (code) =>
                  print("on init ${code.name} ${code.dialCode} ${code.name}"),
            ),
            Icon(Icons.arrow_drop_down)
          ],
        ));
  }

  GlobalKey prefixKey = GlobalKey();
  String cd = "+502";
  void _onCountryChange(CountryCode countryCode) {
    this.cd = countryCode.toString();
    print("New Country selected: " + countryCode.toString());
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Container(
                height: MediaQuery.of(context).size.height * 0.37,
                child: _getLowerLayer()),
            Align(
              alignment: Alignment.bottomCenter,
              child: _getUpperLayer(this.context),
            )
          ],
        ),
      ),
    );
  }
}
