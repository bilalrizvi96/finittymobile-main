import 'package:charles_app/muben/RoomChat.dart';
import 'package:charles_app/muben/messeges.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';

class InbMessage extends StatefulWidget {
  @override
  _InbMessageState createState() => _InbMessageState();
}

class _InbMessageState extends State<InbMessage> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        floatingActionButton: new FloatingActionButton(
          child: const Icon(Icons.add),
          backgroundColor: Color(0xff5E605F),
        ),
        backgroundColor: Color(0xffFFFFFF),
        body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Stack(
              children: [
                // FloatingActionButton(
                //   onPressed: () {},
                //   backgroundColor: Color(0xff5E605F),
                //   child: Icon(Icons.add),
                // ),
                Positioned(
                    right: 22.0,
                    top: 46.0,
                    child: Container(
                        width: 111.42,
                        height: 135,
                        child: Image.asset("lib/assets/Group 9637.png"))),
                Container(
                  margin: EdgeInsets.only(left: 30.5, right: 30.5),
                  child: Column(
                    children: [
                      Container(
                        alignment: Alignment.centerLeft,
                        margin: EdgeInsets.only(top: 38.0, bottom: 22.0),
                        child: Text(
                          "Messages",
                          style: TextStyle(
                              color: Color(0xff454545),
                              fontFamily: "Open Sans Bold",
                              fontSize: 20.0,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      ),
                      SizedBox(
                        height: h * 0.010,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 3.0, right: 3.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              width: w * 0.4,
                              height: 36.0,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5.0),
                                  border: Border.all(
                                      color: Colors.black, width: 1.0)),
                              child: RaisedButton(
                                color: Colors.white,
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) =>Messeges(),
                                      ));
                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Text(
                                  "SUPPORT",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: "Open Sans Bold",
                                      fontSize: 10.0),
                                ),
                              ),
                            ),
                            Container(
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color:Color(0xFFFF0000),),
                              width: w * 0.4,
                              height: 36.0,
                              child: RaisedButton(
                                color: Color(0xFFFF0000),
                                onPressed: () {

                                },
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(5.0),
                                ),
                                child: Text(
                                  "PROVIDER",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Open Sans Bold",
                                      fontSize: 10.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: h * 0.037,
                      ),
                      InkWell(
                        onTap: (){
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (_) => RoomCleaning(),
                              ));
                          },
                        child: _listtilenew("Simon - Laundry", "2 hours ago",
                            "How is your work going?", w),
                      ),
                      SizedBox(
                        height: h * 0.014,
                      ),
                      _listtile("Andrew - Snow", "5 hours ago",
                          "How are you getting along with your work?", w),
                      SizedBox(
                        height: h * 0.014,
                      ),
                      _listtile("Sara Dunn", "Nov 2", "Great idea!", w),
                      SizedBox(
                        height: h * 0.014,
                      ),
                      _listtile("Laura Barnett", "Nov 6",
                          "How is your job? Is it still OK?", w),
                      SizedBox(
                        height: h * 0.014,
                      ),
                      _listtile("Beverly Walsh", "Nov 8",
                          "What's about your business?", w),
                      SizedBox(
                        height: h * 0.014,
                      ),
                      _listtile("Brittany Rose", "Nov 8", "Good job.", w),
                      //
                      SizedBox(
                        height: h * 0.014,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 500,
                ),
              ],
            ),

        ),
      ),
    );
  }

  Container _listtilenew(
      String person, String timestamp, String msg, double w) {
    return Container(
      height: 75.5,
      width: double.infinity,
      child: Row(
        children: [
          Container(
            width: 70,
            height: 70,
            child: CircleAvatar(
              radius: 50,
              child: Image.asset("lib/assets/images/dp.png"),
              backgroundColor: Colors.transparent,
            ),
          ),
          SizedBox(
            width: w * 0.010,
          ),
          Flexible(
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    person,
                    style: TextStyle(
                      color: Color(0xff161F39),
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    timestamp,
                    textAlign: TextAlign.right,
                    style: TextStyle(fontSize: 12.0, color: Color(0xffBCC5D3)),
                  ),
                ],
              ),
              subtitle: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(msg,
                      style:
                      TextStyle(fontSize: 13.0, color: Color(0xffBCC5D3))),
                  Container(
                    decoration: BoxDecoration(
                        color: Color(0xff5E605F),
                        borderRadius: BorderRadius.circular(15.0),
                        border: Border.all(color: Color(0xff5E605F))),
                    height: 12.0,
                    width: 12.0,
                    // color: Color(0xff5E605F)
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Container _listtile(String person, String timestamp, String msg, double w) {
    return Container(
      height: 75.5,
      width: 500,
      child: Row(
        children: [
        Container(
        width: 70,
        height: 70,
        child: CircleAvatar(
          radius: 50,
          child: Image.asset("lib/assets/images/dp.png"),
          backgroundColor: Colors.transparent,),
        ),
          Flexible(
            child: ListTile(
              title: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    person,
                    style: TextStyle(
                      color: Color(0xff161F39),
                      fontSize: 16.0,
                    ),
                  ),
                  Text(
                    timestamp,
                    style: TextStyle(fontSize: 12.0, color: Color(0xffBCC5D3)),
                  ),
                ],
              ),
              subtitle: Text(msg,
                  style: TextStyle(fontSize: 13.0, color: Color(0xffBCC5D3))),
            ),
          ),
        ],
      ),
    );
  }
}