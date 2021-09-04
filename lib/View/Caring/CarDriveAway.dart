import 'dart:io';
import 'dart:math';
import 'dart:ui';
import 'package:charles_app/BaseUrl/variableGloable.dart';
import 'package:charles_app/Model/Cleaning/cleaningList.dart';
import 'package:charles_app/TimeSlots/TimeList.dart';
import 'package:charles_app/TimeSlots/TimeSlotModel.dart';
import 'package:charles_app/assets/appColors/appColors.dart';
import 'package:charles_app/muben/addlocationdetails.dart';
import 'package:charles_app/muben/paymentmethod.dart';
import 'package:charles_app/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:geocoder/geocoder.dart';
import 'package:image_picker/image_picker.dart';

import '../../map.dart';
import '../splash.dart';

bool selected = true;
bool selected2 = true;
bool selected3 = true;
bool selected4 = true;
Color cardcolor1 = appColors.redColor;
Color cardcolor2 = Color(0XFFBCBDC1);
Color cardcolor3 = Color(0XFFBCBDC1);
Color cardcolor4 = Color(0XFFBCBDC1);
bool homevisibility = true;
bool lawnvisibility = false;
bool poolvisibility = false;
bool snowvisibility = false;
TimeOfDay _time;
DateTime dd;

class CarDriveAway extends StatefulWidget {
  @override
  _CarDriveAwayState createState() => _CarDriveAwayState();
}

class _CarDriveAwayState extends State<CarDriveAway>
    with TickerProviderStateMixin {
  void set()
  {
    setState(() {

    });
  }


var  date="";
var updateddate;
  DateTime currentDate = DateTime.now();
  Future<void> _selectDate(BuildContext context) async {

    final DateTime pickedDate = await showDatePicker(

        context: context,
        initialDate: currentDate,
        firstDate: DateTime.now().subtract(Duration(days: 0)),
        lastDate: DateTime(2050));
    if (pickedDate != null && pickedDate != currentDate)
      setState(() {
        currentDate = pickedDate;

        date=currentDate.toString();
        updateddate=date.split("00");
        preferdate=updateddate[0].toString();
      });
  }

  bool isSwitched = false;
  bool buttonsflag = false;
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  bool sheduleflage = true;

  String comparetime;


 // List<Recurrent> rec;
  @override
  void initState() {
    images=null;
    imageslist.clear();
    note.text='';
    prefertime=null;
    _time = TimeOfDay.now();
    // TODO: implement initState
    super.initState();
    Getaddress();
  }

  void Getaddress() async {
    final coordinates = new Coordinates(
        lat, lng);
    final addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);
    setState(() {
      first = addresses.first.addressLine;
    });
  }

  @override
  Widget build(BuildContext context) {
    _pickTime() async {

      TimeOfDay time = await showTimePicker(
           context: context,
          //initialTime: _time,
          initialTime: TimeOfDay.now(),

          builder: (BuildContext context, Widget child) {
            return Theme(
              data: ThemeData(
                primaryColor: Color(0xFFC41A3B),
                accentColor: Color(0xFFC41A3B),
            //    primarySwatch: _buttonTextColor,
              ),
              child: MediaQuery(
                data:
                MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
                child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: child,
                ),
              ),
            );
          });
      if (time != null)
        setState(() {
          _time = time;
          prefertime='${_time.hour}:${_time.minute}'.toString();
          dd=new DateTime(0,0,0,time.hour,time.minute+30);
          //dd.add(duration(minutes: 30));
          totime='${dd.hour}:${dd.minute}'.toString();
          print(dd.minute);
        });
    }


    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: Scaffold(
      bottomNavigationBar: Container(
        height: MediaQuery.of(context).size.width / 4.5,
        child: Stack(
          children: [
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 35),
              // margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
              height: MediaQuery.of(context).size.width / 8.4,
              width: MediaQuery.of(context).size.width / 1.1,
              child: Row(
                children: [
                  Text("Total",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold)),
                  Spacer(),
                  Text(money.toString(),
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold)),
                ],
              ),
            ),
            Positioned(
              top: 10,
              child: Container(
                margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                height: MediaQuery.of(context).size.width / 8.4,
                width: MediaQuery.of(context).size.width / 1.2,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: Color(0xFFFF0000)),
                child: FlatButton(
                    onPressed: () {
                      if (selectTime != null&& selectDate!=null) {
                        // if(imageslist.length!=0 && note.text!=''){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => PaymentMethod(),
                              ));
                        // }else{
                        //   Fluttertoast.showToast(
                        //       msg: "Please Enter Details and Images",
                        //       toastLength: Toast.LENGTH_SHORT,
                        //       gravity: ToastGravity.CENTER,
                        //       timeInSecForIosWeb: 3,
                        //       backgroundColor: Color(0xFFFF0000),
                        //       textColor: Colors.white,
                        //       fontSize: 16.0);
                        // }

                      }
                      else{
                        Fluttertoast.showToast(
                            msg: "Please Enter Date and Select Time",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 3,
                            backgroundColor: Color(0xFFFF0000),
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }
                    },
                    child: Text(
                      "BOOK NOW",
                      style: TextStyle(color: Colors.white, fontFamily: 'opsb'),
                    )),
              ),
            ),
          ],
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Stack(children: [
          Align(
            alignment: Alignment.topRight,
            child: Container(
              padding: EdgeInsets.only(right: 10),
              margin: EdgeInsets.only(top: 20, left: 5),
              child: Opacity(
                opacity: 1.0,
                child: Image.asset(
                  'lib/assets/images/logo.png',
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(
                left: 35.5, right: 35.5, bottom: 30, top: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 4),
                  Row(
                    children: [
                      InkWell(
                          onTap: () => {Navigator.pop(context)},
                          child: Icon(
                            Icons.arrow_back_ios,
                          )),
                      // SizedBox(width: 5),
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: Text(vl.title.toString() + " Driverway",
                            style: Styles().openBold(size: 18.0)),
                      ),
                      Spacer(),
                      Padding(
                        padding: const EdgeInsets.only(right: 0.0),
                        child: Card(
                          elevation: 2,
                          child: Container(
                              child: Transform.rotate(
                            angle: 180 * pi / 300,
                            child: Icon(Icons.search),
                          )),
                        ),
                      ),
                      // searchAnimate(),
                    ],
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Text("Date, Time & Location",
                      style: Styles().openBold(size: 20.0)),
                  SizedBox(
                    height: 5,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 25,
                      ),
                      InkWell(
                        child: Container(
                            width: 350,
                            height: 50,
                            child: new Theme(
                                data: new ThemeData(
                                  primaryColor: Color(0xffE4E4E4),
                                  primaryColorDark: Color(0xffE4E4E4),
                                ),
                                child: new Container(
                                  padding: EdgeInsets.all(5),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: Colors.grey, width: 0.5),
                                      borderRadius: BorderRadius.circular(5)),
                                  width: 350,
                                  height: 70,
                                  alignment: Alignment.center,
                                  child: Center(
                                    child: Text(
                                      first == null
                                          ? 'Address'
                                          : first.toString(),
                                      style: TextStyle(
                                        fontFamily: 'rob',
                                        color: Colors.black,
                                        fontSize: 15.0,
                                      )),
                                  ),
                                )
                                // new TextFormField(
                                //   controller: address,
                                //   // validator: (value) {
                                //   //   if (value.isEmpty) {
                                //   //     return 'Enter First Name';
                                //   //   }
                                //   //   return null;
                                //   // },
                                //   decoration: new InputDecoration(
                                //     enabledBorder: OutlineInputBorder(
                                //       borderSide: BorderSide(
                                //           color:Colors.grey, width: 0.5),
                                //     ),
                                //     border: new OutlineInputBorder(
                                //         borderSide: new BorderSide(
                                //             color: Colors.grey,)),
                                //     hintText: 'Location-MAP',
                                //     labelText: 'Address',
                                //   ),
                                // ),
                                )),
                        onTap: () {
                          holdrecord=1;
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => AddLocationDetail(),
                              ));
                        },
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      InkWell(
                        child: Container(
                             width: 350,
                             height: 50,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.grey, //                   <--- border color
                                width: 0.5,
                              ),
                              borderRadius: BorderRadius.all(
                                  Radius.circular(5.0) //                 <--- border radius here
                              ),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8,top: 15),

                              child:selectTime==null? Text(
                                  "Preferred Date"
                              ):Text(
                                  selectTime
                              )
                            ),
                        ),
                        onTap: (){
                          DatePicker.showDateTimePicker(context, showTitleActions: true,
                              minTime:DateTime.now(),
                              theme: DatePickerTheme(
                              headerColor:  Color(0xFFFF0000),
                              backgroundColor: Colors.white,
                              itemStyle: TextStyle(
                                  color: Colors.black, fontWeight: FontWeight.bold, fontSize: 18),
                              doneStyle: TextStyle(color: Colors.white, fontSize: 16),cancelStyle: TextStyle(color: Colors.white, fontSize: 16)),
                              onChanged: (date) {

                                print('change $date in time zone ' + date.timeZoneOffset.inHours.toString());
                              }, onConfirm: (date) {
                                TimeOfDay timeofdaay = TimeOfDay.fromDateTime(DateTime.parse(date.toString()));

                                comparetime=timeofdaay.toString();
                                setState(() {
                                  selectTime = "${date.toLocal()}".split(' ')[0];
                                  selectDate = "${date.toLocal()}".split(' ')[1];
                                  sheduleflage=true;
                                  print('confirm $date');
                                });

                              }, currentTime: DateTime.now(),
                              onCancel: (){
                                setState(() {
                                  sheduleflage=false;
                                });
                              });
                          },
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                          width: 350,
                          height: 50,
                          child: new Theme(
                            data: new ThemeData(
                              primaryColor: Color(0xffE4E4E4),
                              primaryColorDark: Color(0xffE4E4E4),
                            ),
                            child:
                                InkWell(
                          //    onTap: () => _showTimeDialog(),
                          //         onTap: () => showTimePicker(
                          //             context: context,
                          //             initialTime: TimeOfDay.now(),
                          //
                          //         ),
                                  //onTap: _pickTime,
                                  child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.grey, width: 0.5),
                                    borderRadius: BorderRadius.circular(5)),
                                width: 350,
                                height: 70,
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                      left: 10, right: 10),
                                  child: Row(
                                    children: [
                                      Text(
                                          selectDate == null
                                              ? 'Time'
                                              : selectDate.toString(),
                                          style: TextStyle(
                                            fontFamily: 'rob',
                                            color: Colors.black,
                                            fontSize: 15.0,
                                          )),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          Text("Recurrent",
                              style: TextStyle(
                                color: Color(0xffE4E4E4),
                                fontSize: 12.0,
                              )),
                          Spacer(),
                          Switch(
                            value: isSwitched,
                            onChanged: (value) {
                              setState(() {
                                isSwitched = value;
                                print(isSwitched);
                                buttonsflag = value;
                                if (isSwitched != false) {
                                  statusswitch = 1;
                                } else {
                                  statusswitch = 0;
                                }
                              });
                            },
                            activeTrackColor: Color(0xffE4E4E4),
                            activeColor: Color(0xFFFF0000),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Visibility(
                          visible: buttonsflag,
                          child: Container(
                            height: 40,
                            width: MediaQuery.of(context).size.width,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                                itemCount: rec.length,
                               // padding: EdgeInsets.all(10.0),
                                itemBuilder: (_, index) {
                                  return InkWell(
                                    onTap: (){
                                      setState(() {
                                        for(int i =0; i< rec.length; i++){
                                          if(i == index)
                                          {
                                            if(rec[i].select == true){
                                              rec[i].select = false;

                                            }else{
                                              rec[i].select = true;
                                              rectitle=rec[index].title;
                                            }
                                          }
                                          else{
                                            rec[i].select = false;
                                          }
                                        }
                                      });
                                    },
                                    child: Padding(
                                      padding: const EdgeInsets.only(left:5.0,right:5.0),
                                      child: Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(5),
                                          color: rec[index].select!=true? Color(0xffE4E4E4):Color(0xFFFF0000),
                                        ),
                                        height: 35,
                                        width:
                                            MediaQuery.of(context).size.width * 0.24,
                                        child: Center(
                                            child: Text(
                                          rec[index].title,
                                          style: TextStyle(
                                            color: rec[index].select!=true?Colors.black:Colors.white,
                                            fontSize: 12.0,
                                          ),
                                        )),
                                      ),
                                    ),
                                  );
                                }),
                          )
                          // Row(
                          //   children: [
                          //
                          //     SizedBox(
                          //       width: 10,
                          //     ),
                          //     Container(
                          //       decoration: BoxDecoration(
                          //         borderRadius: BorderRadius.circular(5),
                          //         color: Color(0xffE4E4E4),
                          //       ),
                          //       height: 30,
                          //       width: MediaQuery.of(context).size.width*0.3,
                          //       child: Center(
                          //           child: Row(
                          //             mainAxisAlignment: MainAxisAlignment.center,
                          //             children: [
                          //               Text(
                          //                 "weekly",
                          //                 style: TextStyle(
                          //                   color: Colors.black,
                          //                   fontSize: 12.0,
                          //                 ),
                          //               ),
                          //           Text(
                          //             "-15% off",
                          //             style: TextStyle(
                          //               color: Color(0xFFFF0000),
                          //               fontSize: 12.0,
                          //             ),
                          //           ),
                          //             ],
                          //           )),
                          //     ),
                          //     SizedBox(
                          //       width: 10,
                          //     ),
                          //     Container(
                          //       decoration: BoxDecoration(
                          //         borderRadius:
                          //         BorderRadius.circular(5),
                          //         color: Color(0xffE4E4E4),
                          //       ),
                          //       height: 30,
                          //       width: MediaQuery.of(context).size.width*0.2,
                          //       child: Center(
                          //           child: Text(
                          //             "Monthly",
                          //             style: TextStyle(
                          //               color: Colors.black,
                          //               fontSize: 12.0,
                          //             ),
                          //           )),
                          //     ),
                          //   ],
                          // ),
                          ),
                      SizedBox(
                        height: 25,
                      ),
                      InkWell(
                        onTap: () {

                          showModalBottomSheet(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
                              ),
                              isScrollControlled: false,
                              context: context,
                              builder: (BuildContext bc){
                                return dialogInfo();
                              }
                          );
                          // setState(() {
                          //   _settingModalBottomSheet(context);
                          // });

                        },
                        child: Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Color(0xFFFF0000)),
                          height: 40,
                          width: 140,
                          child: Center(
                              child: Text(
                            "Add Details",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 12.0,
                            ),
                          )),
                        ),
                      ),
                      SizedBox(
                        height: 80,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(vl.title.toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  )),
                              // Text("Regular",
                              //     style: TextStyle(
                              //         color: Colors.black,
                              //         fontSize: 10,)),
                              // Text("Salting",
                              //     style: TextStyle(
                              //         color:  Color(0xffBCBDC1),
                              //         fontSize: 10,)),
                            ],
                          ),
                          Spacer(),
                          Column(
                            children: [
                              Text(money.toString(),
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 14,
                                  )),
                              // Text("--",
                              //     style: TextStyle(
                              //       color: Colors.black,
                              //       fontSize: 10,)),
                              // Text("10\$ / Car",
                              //     style: TextStyle(
                              //       color:  Color(0xffBCBDC1),
                              //       fontSize: 10,)),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      SizedBox(
                        height: 20,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ]),
      ),
    ));
  }
  dialogInfo(){
    return bottomdialog();
  }
  final ImagePicker _picker = ImagePicker();
  _imgFromCamera() async {
    PickedFile image = await _picker.getImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxWidth: 100.0,
      maxHeight: 100.0,
    );
    setState(() {
      images = image;
      imageslist.add(image);
     //_settingModalBottomSheet(context);
    });
  }

  Widget _settingModalBottomSheet(context) {

    showModalBottomSheet(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(top: Radius.circular(15.0)),
        ),
        isScrollControlled: false,
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (BuildContext context, StateSetter setState /*You can rename this!*/) {
          return FractionallySizedBox(
            heightFactor: 1.2,
            child: new Container(
              child: Wrap(
               children: [
                 Container(
                   padding: const EdgeInsets.only(left: 35.5, right: 35.5),
                   child: Column(
                     mainAxisAlignment: MainAxisAlignment.start,
                     crossAxisAlignment: CrossAxisAlignment.start,
                     children: [
                       SizedBox(
                         height: 40,
                       ),
                       Text("Add Details",
                           style: TextStyle(fontSize: 24, fontFamily: 'monb')),
                       SizedBox(
                         height: 20,
                       ),
                       Container(
                         decoration: BoxDecoration(
                             border: Border.all(
                                 color: Colors.grey, width: 0.5),
                             borderRadius: BorderRadius.circular(5)),
                         width: 350,
                         height: 70,
                         child: Padding(
                           padding: const EdgeInsets.only(
                               left: 10, right: 10),
                           child: Row(
                             children: [
                               images == null?
                               Text("Add Images",
                                   style: TextStyle(
                                     fontFamily: 'rob',
                                     color: Colors.black,
                                     fontSize: 15.0,
                                   )):Container(
                                 child: ListView.builder(
                                   itemCount: imageslist.length,
                                   scrollDirection: Axis.horizontal,
                                   key: UniqueKey(),
                                   itemBuilder: (context, i){
                                     return Padding(
                                       padding: const EdgeInsets.all(5.0),
                                       child: Container(
                                           width: 60,
                                           height: 50,
                                           child: ClipRRect(
                                             borderRadius: BorderRadius.circular(5.0),
                                             child: Image.file(
                                               File(imageslist[i].path),
                                               fit: BoxFit.fill,
                                               width: 60,
                                               height: 50,

                                             ),
                                           )),
                                     );
                                   },
                                 ),
                                 height: 60,
                                 width: 220,
                               ),
                               Spacer(),
                               InkWell(
                                   onTap: () {
                                     setState(() {
                                       _imgFromCamera();

                                     });
                                   },
                                   child: Icon(Icons.add_a_photo))
                             ],
                           ),
                         ),
                       ),

                       SizedBox(
                         height: 20,
                       ),
                       Container(
                           width: 350,
                           height: 200,
                           child: new Theme(
                             data: new ThemeData(
                               primaryColor: Color(0xffE4E4E4),
                               primaryColorDark: Color(0xffE4E4E4),
                             ),
                             child: new TextFormField(
                               controller: note,
                               // validator: (value) {
                               //   if (value.isEmpty) {
                               //     return 'Enter First Name';
                               //   }
                               //   return null;
                               // },
                               decoration: new InputDecoration(
                                   alignLabelWithHint: true,
                                   enabledBorder: OutlineInputBorder(
                                     borderSide: BorderSide(
                                         color: Colors.grey, width: 0.5),
                                   ),
                                   border: new OutlineInputBorder(
                                       borderSide: new BorderSide(
                                         color: Colors.grey,
                                       )),
                                   hintText: 'Special instructions?',
                                   labelText: 'Notes',
                                   labelStyle: TextStyle(
                                       fontFamily: 'rob', fontSize: 15)),
                               maxLines: 10,
                             ),
                           )),
                       SizedBox(
                         height: 20,
                       ),
                       Container(
                         height: 40,
                         width: MediaQuery.of(context).size.width / 1.2,
                         decoration: BoxDecoration(
                             borderRadius: BorderRadius.circular(5),
                             color: Color(0xFFFF0000)),
                         child: FlatButton(
                             onPressed: () {
                               if (selectTime == null&& selectDate==null) {
                                 if(imageslist.length!=0 && note.text!=''){
                                   Navigator.push(
                                       context,
                                       MaterialPageRoute(
                                         builder: (_) => PaymentMethod(),
                                       ));
                                 }else{
                                   Fluttertoast.showToast(
                                       msg: "Please Enter Details and Images",
                                       toastLength: Toast.LENGTH_SHORT,
                                       gravity: ToastGravity.CENTER,
                                       timeInSecForIosWeb: 3,
                                       backgroundColor: Color(0xFFFF0000),
                                       textColor: Colors.white,
                                       fontSize: 16.0);
                                 }

                               } else {
                                 Fluttertoast.showToast(
                                     msg: "Please Enter Date and Select Time",
                                     toastLength: Toast.LENGTH_SHORT,
                                     gravity: ToastGravity.CENTER,
                                     timeInSecForIosWeb: 3,
                                     backgroundColor: Color(0xFFFF0000),
                                     textColor: Colors.white,
                                     fontSize: 16.0);
                               }
                             },
                             child: Text(
                               "BOOK NOW",
                               style: TextStyle(
                                   color: Colors.white, fontFamily: 'opsb'),
                             )),
                       ),
                       SizedBox(
                         height: 25,
                       ),
                     ],
                   )),
               ],
              ),
            ),
          );
        });
        });
  }

  void _showTimeDialog() {
    // flutter defined function
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return Container(
            child: Dialog(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20.0)), //this right here
              child: Container(
                  padding: EdgeInsets.only(top: 50),
                  child: Container(
                    width: MediaQuery.of(context).size.width*0.65,
                    height: MediaQuery.of(context).size.height*0.58,
                    child: ListView.builder(
                        shrinkWrap: true,
                        // physics: NeverScrollableScrollPhysics(),
                        scrollDirection: Axis.vertical,
                        itemCount: timeslotslist.length,
                        itemBuilder: (_, index) {

                          return Container(
                            padding: EdgeInsets.only(right: 50,left: 50),
                            child: Column(
                              children: [
                                InkWell(
                                  onTap: (){
                                    setState(() {
                                      prefertime=timeslotslist[index].time;
                                    });

                                    Navigator.pop(context);
                                  },

                                  child: Container(
                                      height: 70,
                                      width: 260,
                                      child: Center(child: Text(timeslotslist[index].time , style:  TextStyle(fontSize: 22,fontWeight: FontWeight.bold),))
                                  ),
                                ),
                                Divider( thickness: 1.5,)
                              ],
                            ),
                          );
                        }
                    ),
                  )


              ),
            ),
          );
        });
  }
}



class bottomdialog extends StatefulWidget {
  @override
  _bottomdialogState createState() => _bottomdialogState();
}

class _bottomdialogState extends State<bottomdialog> {
  final ImagePicker _picker = ImagePicker();
  _imgFromCamera() async {
    PickedFile image = await _picker.getImage(
      source: ImageSource.camera,
      imageQuality: 50,
      maxWidth: 100.0,
      maxHeight: 100.0,
    );
    setState(() {
      images = image;
      imageslist.add(image);
      //_settingModalBottomSheet(context);
    });
  }
  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      heightFactor: 1.2,
      child: new Container(
        child: Wrap(
          children: [
            Container(
                padding: const EdgeInsets.only(left: 35.5, right: 35.5,top: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 40,
                    ),
                    Text("Add Details",
                        style: TextStyle(fontSize: 24, fontFamily: 'monb')),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      decoration: BoxDecoration(
                          border: Border.all(
                              color: Colors.grey, width: 0.5),
                          borderRadius: BorderRadius.circular(5)),
                      width: 350,
                      height: 70,
                      child: Padding(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10),
                        child: Row(
                          children: [
                            images == null?
                            Text("Add Images",
                                style: TextStyle(
                                  fontFamily: 'rob',
                                  color: Colors.black,
                                  fontSize: 15.0,
                                )):Container(
                              child: ListView.builder(
                                itemCount: imageslist.length,
                                scrollDirection: Axis.horizontal,
                                key: UniqueKey(),
                                itemBuilder: (context, i){
                                  return Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Container(
                                        width: 60,
                                        height: 50,
                                        child: ClipRRect(
                                          borderRadius: BorderRadius.circular(5.0),
                                          child: Image.file(
                                            File(imageslist[i].path),
                                            fit: BoxFit.fill,
                                            width: 60,
                                            height: 50,

                                          ),
                                        )),
                                  );
                                },
                              ),
                              height: 60,
                              width: 220,
                            ),
                            Spacer(),
                            InkWell(
                                onTap: () {
                                  setState(() {
                                    _imgFromCamera();

                                  });
                                },
                                child: Icon(Icons.add_a_photo))
                          ],
                        ),
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),
                    Container(
                        width: 350,
                        height: 200,
                        child: new Theme(
                          data: new ThemeData(
                            primaryColor: Color(0xffE4E4E4),
                            primaryColorDark: Color(0xffE4E4E4),
                          ),
                          child: new TextFormField(
                            controller: note,
                            // validator: (value) {
                            //   if (value.isEmpty) {
                            //     return 'Enter First Name';
                            //   }
                            //   return null;
                            // },
                            decoration: new InputDecoration(
                                alignLabelWithHint: true,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                      color: Colors.grey, width: 0.5),
                                ),
                                border: new OutlineInputBorder(
                                    borderSide: new BorderSide(
                                      color: Colors.grey,
                                    )),
                                hintText: 'Special instructions?',
                                labelText: 'Notes',
                                labelStyle: TextStyle(
                                    fontFamily: 'rob', fontSize: 15)),
                            maxLines: 10,
                          ),
                        )),
                    SizedBox(
                      height: 20,
                    ),
                    GestureDetector(
                      onTap: () {
                        if (preferdate != null&& prefertime!=null) {
                          if(imageslist.length!=0 && note.text!=''){
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => PaymentMethod(),
                                ));
                          }else{
                            Fluttertoast.showToast(
                                msg: "Please Enter Details and Images",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 3,
                                backgroundColor: Color(0xFFFF0000),
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }

                        }
                        else{
                          Fluttertoast.showToast(
                              msg: "Please Enter Date and Select Time",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 3,
                              backgroundColor: Color(0xFFFF0000),
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }
                      },
                      child: Container(
                        height: 40,
                        width: MediaQuery.of(context).size.width / 1.2,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color(0xFFFF0000)),
                        child: FlatButton(
                            onPressed: () {
                              if (preferdate != null&& prefertime!=null) {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) => PaymentMethod(),
                                    ));
                              } else {
                                Fluttertoast.showToast(
                                    msg: "Please Enter Date and Select Time",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 3,
                                    backgroundColor: Color(0xFFFF0000),
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                              }
                            },
                            child: Text(
                              "BOOK NOW",
                              style: TextStyle(
                                  color: Colors.white, fontFamily: 'opsb'),
                            )),
                      ),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                  ],
                )),
          ],
        ),
      ),
    );
  }
}
