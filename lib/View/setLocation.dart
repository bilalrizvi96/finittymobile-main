import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class setLocation extends StatefulWidget {
  @override
  _setLocationState createState() => _setLocationState();
}

class _setLocationState extends State<setLocation> {

  GoogleMapController mapController;

  final LatLng _center = const LatLng(27.2046,77.4977);

  void _onMapCreated(GoogleMapController controller) {
    mapController = controller;
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Container(
            child:Padding(
              padding: const EdgeInsets.only(left:20.0,right:20, top: 5),
              child: Stack(
                alignment: Alignment.topCenter,
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: size.height / 5,
                      width: size.width / 2.5,
                      margin: EdgeInsets.only(top:24,left: 0),
                      child: Opacity(
                        opacity: 0.6,
                        child: Image.asset(
                          'lib/assets/images/logo.png',
                        ),
                      ),
                    ),
                  ),
               Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                    // Row Avatar
                  SizedBox(height: 30,),
                  Row(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        child: Icon(
                          Icons.perm_identity,
                          color: Colors.black87,
                        ),
                        backgroundColor: Colors.grey[300],
                      ),
                      SizedBox(width: 10),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text("Welcome Charles", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),),
                          Padding(
                            padding: const EdgeInsets.only(right:38.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Icon(Icons.location_searching),
                                Padding(
                                  padding: const EdgeInsets.only(left:8.0),
                                  child: Text("Update Location"),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  SizedBox(height: 10,),
                  Padding(
                    padding: const EdgeInsets.only(left:2.0,right: 2),
                    child: Container(
                      height: 350,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border:Border.all(width: 2, color: Colors.red),
                      ),
                      child:
                      GoogleMap(
                        onMapCreated: _onMapCreated,
                        initialCameraPosition: CameraPosition(
                          target: _center,
                          zoom: 11.0,
                        ),
                      ),
                    ),
                  ),

                  //Container with border, map inside
                  SizedBox(height: 10,),
                  //row Selected location help
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Selected Location"),
                      Text("Help?", style: TextStyle(fontWeight: FontWeight.bold),)

                    ],
                  ),
                  SizedBox(height: 10,),
                  Container(
                    height: 30,
                    child: TextField(
                      decoration: new InputDecoration(
                        border: new OutlineInputBorder(
                            borderSide: new BorderSide(color: Colors.black)),
                        labelText: 'Lynthon Park',

                      ),
                    ),
                  ),

                  SizedBox(height: 15,),
                  Container(
                    height: 50,
                    decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Color(0xFF0CCCCC)),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(left:8.0,right: 8),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon(Icons.zoom_in, color: Color(0xFF4DCFFF),),
                          Icon(Icons.zoom_out, color: Color(0xFF4DCFFF),),
                          Icon(Icons.my_location, color: Colors.red,),
                          Icon(Icons.add_location, color: Colors.green,),
                          Icon(Icons.edit_location, color: Colors.green,)
                        ],
                      ),
                    ),
                  ),
                  //Text Field lython park

                  //  Container w border, row 5 icons
                ],
              ),
              ],
          ),
            ),
        ),
      ),
    ),
    );
  }
}
