import 'package:charles_app/View/bottom.dart';
import 'package:charles_app/booking.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PaymentConfirmed extends StatefulWidget {
  PaymentConfirmed({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _PaymentConfirmedState createState() => _PaymentConfirmedState();
}

class _PaymentConfirmedState extends State<PaymentConfirmed> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        body: WillPopScope(
          onWillPop: ()async=>false,
          child: SingleChildScrollView(
            child: Stack(
              children: [
                Positioned(
                    right: 10,
                    top: 40.0,
                    child: Container(
                        width: 111.42,
                        height: 135,
                        child: Image.asset("lib/assets/Group 9637.png"))),
                Container(
                  margin: EdgeInsets.only(left: 30.5, right: 30.5),
                  child: Column(
                    children: [
                      SizedBox(height: 40.0),
                      Row(
                        children: [
                          Text(
                            "Payment Confirmed",
                            style: TextStyle(
                                color: Color(0xff454545),
                                fontFamily: "Open Sans Bold",
                                fontSize: 20.0,
                              fontWeight: FontWeight.bold
                            ),
                          ),
                          SizedBox(width: 80,),
                          Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(3), color: Colors.white,),
                            child: Icon(
                                Icons.file_download,
                                color: Color(0xFFFF0000),
                              ),
                          ),
                        ],
                      ),
                      SizedBox(height: h * 0.209),
                      Container(
                        child: Image.asset("lib/assets/undraw_confirmation_2uy0.png"),
                      ),
                      SizedBox(height: h * 0.022),
                      Container(
                        margin: EdgeInsets.only(right: 16.0),
                        alignment: Alignment.center,
                        child: Text(
                          "Thank you",
                          style: TextStyle(
                              fontFamily: "Open Sans Bold",
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                      SizedBox(height: h * 0.005),
                      Container(
                        margin: EdgeInsets.only(right: 16.0),
                        alignment: Alignment.center,
                        child: Text(
                          "For choosing Finitty",
                          style: TextStyle(
                              color: Color(0xff454545),
                              fontFamily: "Open Sans Semibold",
                              fontSize: 14.0),
                        ),
                      ),
                      SizedBox(height: h * 0.035),
                      Container(
                        margin: EdgeInsets.only(right: 16.0),
                        alignment: Alignment.center,
                        child: InkWell(
                          onTap: () {

                          },
                          child: Text(
                            "View Details",
                            style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Color(0xff454545),
                                fontFamily: "Open Sans Semibold",
                                fontSize: 12.0),
                          ),
                        ),
                      ),
                      SizedBox(height: h * 0.15),

                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        bottomNavigationBar:  Container(
          margin: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
          height: 40.0,
          width: double.infinity,
          child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: Text(
                "CONTINUE",
                style: TextStyle(
                  color: Color(0xffFFFFFF),
                ),
              ),
              color: Color(0xFFFF0000),
              onPressed: () {
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => home_sc(inde:0),
                    ));

              }),
        ),
      ),
    );
  }
}
