import 'dart:math';
import 'dart:ui';
import 'package:charles_app/Auth/HomePage.dart';
import 'package:charles_app/TimeSlots/TimeList.dart';
import 'package:charles_app/View/Homepage/Home.dart';
import 'package:charles_app/View/bottom.dart';
import 'package:charles_app/assets/appColors/appColors.dart';
import 'package:charles_app/muben/paymentmethod.dart';
import 'package:charles_app/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class Profile extends StatefulWidget {
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with TickerProviderStateMixin {

  Future<bool> onbackpress(){
    print("abc");
  //  Navigator.of(context).pop();
    // Navigator.push(context,
    //     MaterialPageRoute(builder: (context) => home_sc(inde: 2,))
    // );
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return SafeArea(
        child: WillPopScope(
          onWillPop: onbackpress,
          child: Scaffold(
          bottomNavigationBar:  Container(
            height: MediaQuery.of(context).size.height * 0.1,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 30),
                  height: MediaQuery.of(context).size.height * 0.07,
                  width: MediaQuery.of(context).size.width / 1.2,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: Color(0xFFFF0000)),
                  child: FlatButton(
                      onPressed: () {
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => home_sc(inde: 2,))
                        );
                      },
                      child: Text(
                        "UPDATE DETAILS TO SAVE",
                        style: TextStyle(color: Colors.white,fontSize: 12),
                      )),
                ),
                SizedBox(height: 2,)
              ],
            ),

          ),
          backgroundColor: Colors.white,
          body: Stack(children: [
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
            padding: const EdgeInsets.only(left: 35.5, right: 35.5, top: 20),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      InkWell(
                          onTap: () => {
                          Navigator.push(context,
                          MaterialPageRoute(builder: (context) => Mainpage())
                          )
                          },
                          child: Icon(
                            Icons.arrow_back_ios,
                          )
                      ),
                      SizedBox(width: 5),
                      Padding(
                        padding: const EdgeInsets.only(left: 6.0),
                        child: Text("Profile", style: Styles().openBold(size: 18.0)),
                      ),
                      // searchAnimate(),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          CircleAvatar(
                            // alignment: Alignment.center,
                            radius: 60,
                            backgroundImage: AssetImage("lib/assets/images/profile.png")
                          ),
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children: [
                              Text("Charles", style: Styles().openBold(size: 20.0)),
                              Row(
                                children: [
                                  Container(
                                   // height: 40,
                                   // width: 500,
                                    child: RatingBar(
                                      itemSize: 20,
                                      initialRating: 3.6,
                                      minRating: 1,
                                      direction: Axis.horizontal,
                                      allowHalfRating: false,
                                      itemCount: 5,
                                      itemPadding: EdgeInsets.symmetric(horizontal: 1.0),
                                      itemBuilder: (context, _) => Icon(
                                        Icons.star,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ),
                                  Text("4.5/5" , style: TextStyle(color: Colors.black,fontSize: 10), )
                                ],
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                         // width: 350,
                          height: 50,
                          child: new Theme(
                            data: new ThemeData(
                              primaryColor: Color(0xffE4E4E4),
                              primaryColorDark: Color(0xffE4E4E4),
                            ),
                            child: new TextFormField(
                              decoration: new InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey, width: 0.5),
                                ),
                                border: new OutlineInputBorder(
                                    borderSide: new BorderSide(
                                  color: Colors.grey,
                                )),
                                hintText: 'Charles',
                                labelText: 'Name',
                              ),
                            ),
                          )),
                      SizedBox(
                        height: 25,
                      ),
                      Container(

                          height: 50,
                          child: new Theme(
                            data: new ThemeData(
                              primaryColor: Color(0xffE4E4E4),
                              primaryColorDark: Color(0xffE4E4E4),
                            ),
                            child: new TextFormField(
                              // validator: (value) {
                              //   if (value.isEmpty) {
                              //     return 'Enter First Name';
                              //   }
                              //   return null;
                              // },
                              decoration: new InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey, width: 0.5),
                                ),
                                border: new OutlineInputBorder(
                                    borderSide: new BorderSide(
                                  color: Colors.grey,
                                )),
                                hintText: '+1 123 456 78',
                                labelText: 'Phone Number',
                              ),
                            ),
                          )),
                      SizedBox(
                        height: 25,
                      ),
                      Container(
                        //  width: 350,
                          height: 50,
                          child: new Theme(
                            data: new ThemeData(
                              primaryColor: Color(0xffE4E4E4),
                              primaryColorDark: Color(0xffE4E4E4),
                            ),
                            child: new TextFormField(
                              onTap: () {},
                              decoration: new InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey, width: 0.5),
                                ),
                                border: new OutlineInputBorder(
                                    borderSide: new BorderSide(color: Colors.grey)),
                                hintText: 'Charles@gmail.com',
                                labelText: 'Email',
                              ),
                            ),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                         // width: 350,
                          height: 50,
                          child: new Theme(
                            data: new ThemeData(
                              primaryColor: Color(0xffE4E4E4),
                              primaryColorDark: Color(0xffE4E4E4),
                            ),
                            child: new TextFormField(
                              onTap: () {},
                              decoration: new InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey, width: 0.5),
                                ),
                                border: new OutlineInputBorder(
                                    borderSide: new BorderSide(color: Colors.grey)),
                                hintText: 'Toronta Canada',
                                labelText: 'Default Location',
                              ),
                            ),
                          )),
                      SizedBox(
                        height: 20,
                      ),
                      Container(
                         // width: 350,
                          height: 50,
                          child: new Theme(
                            data: new ThemeData(
                              primaryColor: Color(0xffE4E4E4),
                              primaryColorDark: Color(0xffE4E4E4),
                            ),
                            child: new TextFormField(
                              onTap: () {},
                              decoration: new InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.grey, width: 0.5),
                                ),
                                border: new OutlineInputBorder(
                                    borderSide: new BorderSide(color: Colors.grey)),
                                hintText: '*********',
                                labelText: 'Password',
                              ),
                            ),
                          )),
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
}
