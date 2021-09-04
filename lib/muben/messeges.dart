import 'package:charles_app/muben/message_main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Messeges extends StatefulWidget {
  @override
  _MessegesState createState() => _MessegesState();
}

class _MessegesState extends State<Messeges> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
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
                margin: EdgeInsets.only(left: 30.5, right: 30.5),
                child: Column(
                  children: [
                    Container(
                      margin: EdgeInsets.only(top: 35.0),
                      child: Row(
                        children: [
                          InkWell(
                              onTap: () => {Navigator.pop(context)},
                              child: Icon(
                                Icons.arrow_back_ios,
                              )
                          ),
                          SizedBox(
                            width: w*0.01,
                          ),
                          Text(
                            "Messages",
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
                    SizedBox(
                      height: h * 0.030,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5.0), color:Color(0xFFFF0000),
                          ),

                          width: w * 0.4,
                          height: 36.0,
                          child: RaisedButton(
                            color: Color(0xFFFF0000),
                            onPressed: () {},
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Text(
                              "SUPPORT",
                              style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: "Open Sans Bold",
                                  fontSize: 10.0),
                            ),
                          ),
                        ),
                        Container(
                          width: w * 0.4,
                          height: 36.0,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5.0),
                              border:
                              Border.all(color: Colors.black, width: 1.0)),
                          child: RaisedButton(
                            color: Colors.white,
                            onPressed: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (_) =>InbMessage(),
                                  ));
                            },
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5.0),
                            ),
                            child: Text(
                              "PROVIDER",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Open Sans Bold",
                                  fontSize: 10.0),
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: h * 0.057,
                    ),
                    SingleChildScrollView(scrollDirection: Axis.vertical,
                      child: Column(children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              width: w * 0.75,
                              // color: Color(0xffE1E1E1),
                              decoration: BoxDecoration(
                                  color: Color(0xffE1E1E1),
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0),topRight: Radius.circular(15.0),bottomRight: Radius.circular(15.0)),
                                  border: Border.all(color: Color(0xffE1E1E1))),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 13.0),
                              child: Text(
                                  """Welcome!\nHave any questions?\nAsk anything or tell us how can we help"""),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              "Finitty - Support",
                              style: TextStyle(fontSize:10,color: Color(0xffBCC5D3)),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              height: h * 0.153 / 2,
                              width: w * 0.45,
                              // color: Color(0xffE1E1E1),
                              decoration: BoxDecoration(
                                  color: Color(0xff5E605F),
                                  borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0),topRight: Radius.circular(15.0),bottomLeft: Radius.circular(15.0)),
                                  border: Border.all(color: Color(0xff5E605F))),
                              padding: EdgeInsets.symmetric(
                                  horizontal: 15.0, vertical: 13.0),
                              child: Text(
                                "Type something...",
                                style: TextStyle(color: Color(0xffBCC5D3)),
                              ),
                            ),
                          ],
                        ),
                      ],),
                    ),
                    SizedBox(height: h*0.42,),
                    Container(alignment: Alignment.bottomCenter,
                      height: h*0.068,
                      margin: EdgeInsets.only(bottom: h*0.018),
                      child: TextField(
                        decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            fillColor: Color(0xffF8F9FA),
                            filled: true,
                            border: new OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffEEEEEE)),
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(6.0),
                              ),
                            ),
                            hintText: "Type your message...",
                            hintStyle: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontFamily: "Open Sans",
                                fontSize: 14.0,
                                color: Color(0xff737680)),
                            suffixIcon: RaisedButton(color:Color(0xFFFF0000),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                child: Container(
                                  color: Color(0xFFFF0000),
                                  width: w * 0.068,
                                  //margin: ,
                                  child: Icon(
                                    Icons.send,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {})),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}