import 'dart:io';

import 'package:charles_app/API/API.dart';
import 'package:charles_app/BaseUrl/variableGloable.dart';
import 'package:charles_app/NotificationClasses/postRequest.dart';
import 'package:charles_app/NotificationClasses/LocalNotification.dart';
import 'package:charles_app/View/splash.dart';
import 'package:charles_app/muben/paymentconfirmed.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:http_parser/http_parser.dart';
import 'package:progress_dialog/progress_dialog.dart';

class OrderConfirmation extends StatefulWidget {
  OrderConfirmation({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _OrderConfirmationState createState() => _OrderConfirmationState();
}

class _OrderConfirmationState extends State<OrderConfirmation> {
  var clickstatus=true;
  ProgressDialog pr;
  List uploadList = [];
  final _formKey = GlobalKey<FormState>();
  FirebaseAuth _auth = FirebaseAuth.instance;

  void initState() {
    pr= new ProgressDialog(context);
  }
  _sendReqNotification(String a,String b) {
    SplashTest.toke.clear();
    final FirebaseDatabase database1 = FirebaseDatabase.instance;
    DatabaseReference ref1 = database1.reference().child('Vendors');
    ref1.once().then((DataSnapshot snapshot){
      Map<String, dynamic> mapOfMaps = Map.from( snapshot.value );
      mapOfMaps.values.forEach( (value) {
        final FirebaseDatabase database2 = FirebaseDatabase.instance;
        DatabaseReference ref2 = database2.reference()
            .child('Tokens')
            .child(value['uid']);
        ref2.once().then((DataSnapshot snapshot) {
          Map<String, dynamic> mapOfMapss = Map.from(snapshot.value);
          mapOfMapss.values.forEach((value2) {
              SplashTest.toke.add(value2);
              if (SplashTest.toke.length == 1) {
                postRequest()
                    .makePostRequest(
                    a,
                    "" + username +" "+b,
                    SplashTest.toke[0].toString());
              }
          });
        });
      });
    });
  }

  void waittocheckout() async{
    await Future.delayed(const Duration(seconds: 1), (){
      if(success == 'true'){
        localnotification.showNotification("Request","Request Send Successfully");
        _sendReqNotification("Booking","Send a Request");
        pr.hide();
        clickstatus=true;
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
              builder: (_) => PaymentConfirmed(),
            ));
      }
      else if(success == 'error'){
        clickstatus=true;
        pr.hide();
        Fluttertoast.showToast(
            msg: "'Kindly Check Your Data'",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor:Color(0xFFFF0000),
            textColor: Colors.white,
            fontSize: 16.0);

      }
      else {
        waittocheckout();
      }

    });

  }


  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        body: SingleChildScrollView(
            child: Stack(
          children: [
            Positioned(
                right: 22.0,
                top: 46.0,
                child: Container(
                    width: 111.42,
                    height: 135,
                    child: Image.asset("lib/assets/Group 9637.png"))),
            Container(
              height: 800,
              margin: EdgeInsets.only(left: 30.5, right: 30.5),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 38.0),
                    child: Row(
                      children: [
                             InkWell(
                               child: Icon(
                                CupertinoIcons.back,
                                color: Color(0xff454545),),
                               onTap: (){
                                 Navigator.of(context).pop();
                               },
                             ),
                        SizedBox(width: 10,),
                        Text(
                          "Order Confirmation",
                          style: TextStyle(
                              color: Color(0xff454545),
                              fontFamily: "Open Sans Bold",
                              fontSize: 20.0,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 8.0),
                  Container(
                    child: Image.asset("lib/assets/undraw_runner_start_x0uu.png"),
                  ),
                  SizedBox(height: h * 0.022),
                  Container(
                    margin: EdgeInsets.only(right: 16.0),
                    alignment: Alignment.center,
                    child: Text(
                      "All Ready",
                      style:
                          TextStyle(fontSize: 26.0, fontWeight: FontWeight.bold),
                    ),
                  ),
                  SizedBox(height: h * 0.005),
                  Container(
                    margin: EdgeInsets.only(right: 16.0),
                    alignment: Alignment.center,
                    child: Text(
                      "Whenever you're ready!",
                      style: TextStyle(
                          color: Color(0xff454545),
                          fontFamily: "Open Sans Semibold",
                          fontSize: 9.0),
                    ),
                  ),
                  SizedBox(height: h * 0.05),
                  Container(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Finity-360",
                              style: TextStyle(
                                  fontSize: 24.0, fontWeight: FontWeight.bold),
                            ),
                            RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                child: Text(
                                  "Applied",
                                  style: TextStyle(
                                    color: Color(0xffFFFFFF),
                                  ),
                                ),
                                color: Color(0xff1BD741),
                                onPressed: () {}),
                          ],
                        ),
                        SizedBox(height: h * 0.005),
                        Text(
                          "Order Details",
                          style: TextStyle(
                              fontSize: 24.0, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(height: h * 0.015),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Date",
                              style: TextStyle(
                                  fontSize: 14.0, color: Color(0xff999999)),
                            ),
                            Text(
                              selectTime.toString()+" "+selectDate.toString(),
                              style: TextStyle(
                                  fontSize: 14.0, color: Color(0xff999999)),
                            ),
                          ],
                        ),
                        SizedBox(height: h * 0.005),
                        Padding(
                          padding: const EdgeInsets.only(left: 20,right: 20),
                          child: Divider(),
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Loaction",
                              style: TextStyle(
                                  fontSize: 14.0, color: Color(0xff999999)),
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width/2,
                              child: Text(
                                first == null
                                    ? 'Address'
                                    : first.toString(),
                                style: TextStyle(
                                    fontSize: 14.0, color: Color(0xff999999)),
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),

                        SizedBox(height: h * 0.015),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Service Details",
                              style: TextStyle(
                                  fontSize: 20.0, fontWeight: FontWeight.bold),
                            ),
                            Text(
                              "View Details",
                              style: TextStyle(
                                  fontSize: 16.0,
                                  fontWeight: FontWeight.bold,
                                  color: Color(0xFFFF0000)),
                            ),
                          ],
                        ),
                        SizedBox(height: h * 0.010),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text(
                              "Charges",
                              style: TextStyle(
                                  fontSize: 13.0, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                        SizedBox(height: h * 0.010),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              vl.title.toString(),
                              style: TextStyle(
                                  fontSize: 14.0, color: Color(0xff454545)),
                            ),
                            Text(
                              money.toString(),
                              style: TextStyle(
                                  fontSize: 14.0, color: Color(0xff454545)),
                            ),
                          ],
                        ),
                        SizedBox(height: h * 0.005),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              coupon.text==""?"-":coupon.text,
                              style: TextStyle(
                                  fontSize: 14.0, color: Color(0xff454545)),
                            ),
                            Text(
                              "--",
                              style: TextStyle(
                                  fontSize: 14.0, color: Color(0xff454545)),
                            ),
                          ],
                        ),
                        SizedBox(height: h * 0.005),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Total",
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18.0,
                                  color: Color(0xff454545)),
                            ),
                            Text(
                              money.toString(),
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 24.0,
                                  color: Color(0xff454545)),
                            ),
                          ],
                        ),
                        // SizedBox(height: h * 0.035),

                      ],
                    ),
                  ),
                 // SizedBox(height: h * 0.005),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        "Addons",
                        style: TextStyle(
                            fontFamily: "Open Sans",
                            fontSize: 14.0,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  SizedBox(height: h * 0.005),
                  new Expanded(
                    child: ListView.builder(
                      itemCount: selectedaddonsList.length,
                      itemBuilder: (context, i){
                        return    Padding(
                          padding: const EdgeInsets.only(top: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                selectedaddonsnameList[i].toString(),
                                style: TextStyle(
                                    fontSize: 14.0, color: Color(0xff454545)),
                              ),
                              Text(
                                selectedaddonspriceList[i].toString(),
                                style: TextStyle(
                                    fontSize: 14.0, color: Color(0xff454545)),
                              ),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        )),
        bottomNavigationBar:  Container(
          margin: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
          height: 40.0,
          width: double.infinity,
          child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: Text(
                "PAY NOW",
                style: TextStyle(
                  color: Color(0xffFFFFFF),
                ),
              ),
              color: Color(0xFFFF0000),
              onPressed: () async {
                final FirebaseUser user = await _auth.currentUser();
                pr.show();
                var exp=crdexp.split('-');
                // var time=prefertime.split( ' - ',);
                var money1=money.split(' ');
                // var datetimfrom=preferdate.toString()+" "+prefertime.toString()+":"+"0";
                // var datetimto=preferdate.toString()+" "+totime.toString()+":"+"0";

                for (var imageFiles in imageslist) {
                  uploadList.add(MultipartFile.fromFile(imageFiles.path, filename:imageFiles.path.split('/').last));
                }
                // List<MultipartFile> imageList = new List<MultipartFile>();
                //   for (var i in imageslist) {
                //     MultipartFile multipartFile = new MultipartFile.fromBytes(
                //       i,
                //       filename: 'DetailImages',
                //       contentType: MediaType("image", "jpg"),
                //     );
                //     imageList.add(multipartFile);
                //   }
                var dateto= selectTime+" "+selectDate.toString();
                  API.CheckoutAPI(
                      user.uid,
                      crdnum,
                      exp[0],
                      exp[1],
                      crdcvc,
                      money1[1],
                      userid,
                      pakgid,
                      pkgname,
                      lat,
                      lng,
                      first,
                      note.text,
                      dateto,
                      dateto,
                      uploadList,
                      subpkgname);
                  waittocheckout();

              }),
        ),

      ),
    );
  }
}
