import 'package:charles_app/BaseUrl/variableGloable.dart';
import 'package:charles_app/widgets/ModifyOrder.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

class NewRequest extends StatefulWidget {
  @override
  _NewRequestState createState() => _NewRequestState();

}

class _NewRequestState extends State<NewRequest> {

  @override
  void initState() {
    super.initState();
    for (int i = 0; i <= newbookinglist.length; i++) {
      size1.add(false);
      height1.add(88.0);
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: _listcontainers(),
    );
  }

  List<bool> _size1 = [false,false];
  List<double> _height1 =[88.0,88.0];
   // [88.0, 88.0, 88.0, 88.0, 88.0,88.0,88.0];
  Widget containerOngoingNew(var bookingid,int index, Color color, String series, String date,
      String address, BuildContext context,var visibility,var height,var price,var duration) {
    double w = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () {

          if (size1[index] == false) {
            setState(() {
              height1[index] = 254;
              size1[index] = true;
            });
          } else if (size1[index] == true) {
            setState(() {
              height1[index]= 88.0;
              size1[index] = false;
            });
          }
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: height1[index],
          width: double.infinity,
          child: Card(
            elevation: 1.0,
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      height: 80,
                      width: 20,
                      decoration: BoxDecoration(
                        color: color,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(5),
                            topLeft: Radius.circular(5)),
                      ),
                    ),
                    Expanded(
                        child: Column(
                          children: [
                            Container(
                                margin: EdgeInsets.only(left: 8),
                                height: 60,
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        width: MediaQuery.of(context).size.width/2.8,
                                        child: Column(
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              "Booking ID #"+bookingid.toString(),
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontFamily: 'opsb',
                                                  color: Colors.black),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
                                              series,

                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 20,
                                                  fontFamily: 'opsb',
                                                  color: Colors.black),
                                            ),
                                            SizedBox(
                                              height: 2,
                                            ),


                                          ],
                                        )),
                                    Spacer(),
                                    Container(
                                      width: MediaQuery.of(context).size.width/2.5,
                                        margin: EdgeInsets.only(right: 8),
                                        child: Column(
                                          crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                          children: [
                                            SizedBox(
                                              height: 4,
                                            ),
                                            Text(
                                              date,
                                              style: TextStyle(
                                                  fontSize: 10,
                                                  fontFamily: 'opsr',
                                                  color: Colors.grey),
                                            ),


                                          ],
                                        )),
                                  ],
                                )),
                            Visibility(
                              visible: true,
                              //visible: _size[index],
                              child: Container(margin: EdgeInsets.only(top: 4),
                                height: 16,
                                width: double.infinity,
                                child: Icon(Icons.keyboard_arrow_down,size: 16,),
                                decoration: BoxDecoration(
                                  color: Colors.black12,
                                  borderRadius: BorderRadius.only(bottomRight: Radius.circular(5)),
                                ),
                              ),
                            )
                          ],
                        ))
                  ],
                ),
                Expanded(
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                          child: Container(
                            child: Column(
                              children: [

                                SizedBox(
                                  height: 15,
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 35,right: 15),
                                  child: Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("Price",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: 'opsb',
                                                color: Colors.black),

                                          ),
                                          Text(
                                            price.toString()+" \$",
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontFamily: 'opsr',
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                   Spacer(),
                                   // SizedBox(width: MediaQuery.of(context).size.width/3.0,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Text("ETA",
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontFamily: 'opsb',
                                                color: Colors.black),

                                          ),
                                          Text(duration==null?"5-6 min":duration.toString()+" mins",
                                            style: TextStyle(
                                                fontSize: 10,
                                                fontFamily: 'opsr',
                                                color: Colors.grey),
                                          )
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox( height: 5,),

                                Padding(
                                  padding: const EdgeInsets.only(left: 15,right: 15),
                                  child: Divider(),
                                ),
                                SizedBox( height: 5,),
                                Container(
                                  margin:
                                  EdgeInsets.only(left: 10.0, right: 10.0),
                                  child: Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        size: 22,
                                      ),
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Container(
                                        width: MediaQuery.of(context).size.width/1.4,
                                        child: Text(
                                          address.toString(),
                                          // overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                              fontSize: 12,
                                              fontFamily: 'opsr',
                                              color: Colors.grey),
                                          maxLines: 2,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox( height: 15,),
                                Container(
                                  // alignment: Alignment.bottomCenter,
                                  margin:
                                  EdgeInsets.only(left: 10.0, right: 10.0),
                                  height: 40,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFF0000),
                                    borderRadius:
                                    BorderRadius.all(Radius.circular(5)),
                                  ),
                                  child: FlatButton(
                                    child: Text(
                                      "Modify",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Open Sans Semibold",
                                          fontSize: 14.0),
                                    ),
                                    onPressed: () {
                                      // Navigator.push(
                                      //   context,
                                      //   MaterialPageRoute(
                                      //     builder: (context) => ModifyOrder(),
                                      //   ),
                                      // );
                                    }

                                  ),
                                ),

                              ],
                            ),
                          )),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _listcontainers() {
    return newbookinglist.isEmpty?
    Container(child: Center(child: Text("No Data to Show",style: TextStyle(color: Colors.black),)),)
        :Container(
        padding: EdgeInsets.only(top: 20),
        margin: EdgeInsets.symmetric(horizontal: 13.0),
      child:
      ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: newbookinglist.length,
          itemBuilder: (_,index){
            return  containerOngoingNew(newbookinglist[index].id,index, Colors.green, newbookinglist[index].service,
                   newbookinglist[index].preferred_date_from,
                newbookinglist[index].address, context,newbookinglist[index].visiblity,
                newbookinglist[index].height,newbookinglist[index].price,newbookinglist[index].duration);
          }
      ),

        // child: Column(
        //   children: [
        //     SizedBox(
        //       height: 6.0,
        //     ),
        //     containerOngoingNew(1, Colors.blue, "Wash & Iron",
        //         "06:17 am - Oct 17,20", "Men, Kids 2 Bag +, 1 Bag", context),
        //     SizedBox(
        //       height: 6.0,
        //     ),
        //     containerOngoingNew(2, Colors.green, "Wash & Iron",
        //         "06:17 am - Oct 17,20", "Men, Kids 2 Bag +, 1 Bag", context),
        //     SizedBox(
        //       height: 6.0,
        //     ),
        //   ],
        // )

    );
  }

  Widget containerOngoing(int index, Color color, String series, String date,
      String details, BuildContext context) {
    double w = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () {
          if (_size1[index] == false) {
            setState(() {
              _height1[index] = 210;
              _size1[index] = true;
            });
          } else if (_size1[index] == true) {
            setState(() {
              _height1[index] = 68.0;
              _size1[index] = false;
            });
          }
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: height1[index],
          width: double.infinity,
          child: Card(
            elevation: 2.0,
            child: Column(
              children: [
                SizedBox(
                  height: 12,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 6),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            series,
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'opsr',
                                color: Colors.black),
                          ),
                          Text(
                            date,
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'opsr',
                                color: Colors.grey),
                          ),
                        ],
                      ),
                      Spacer(),
                      Center(
                          child: Text(
                            details,
                            style: TextStyle(color: Colors.black, fontSize: 10),
                          )),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                        size: 24,
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: Stack(
                    children: [
                      SingleChildScrollView(
                          child: Container(
                            height: MediaQuery.of(context).size.height / 3.5,
                            child: Column(
                              children: [
                                SizedBox(
                                  height: 12.0,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 16, right: 16),
                                  child: DottedLine(
                                    dashLength: 2,
                                    dashGapLength: 2,
                                    lineThickness: 1,
                                  ),
                                ),
                                SizedBox(
                                  height: 14.0,
                                ),
                                // Container(margin: EdgeInsets.only(left: 8.0,right: 8.0),
                                //   child: Row(children: [
                                //     SizedBox(
                                //       width: 5,
                                //     ),Text(
                                //       series,
                                //       style: TextStyle(
                                //           fontSize: 9, fontFamily: 'opsr', color: Colors.black,fontWeight: FontWeight.bold),
                                //     ),
                                //     Spacer(),
                                //     Text(
                                //       '07:15 pm - October, 28 2020',
                                //       style: TextStyle(
                                //         fontSize: 9, fontFamily: 'opsr', color: Color(0xff52545D),),
                                //     ),
                                //   ],
                                //   ),
                                // ),
                                // Container(margin: EdgeInsets.only(left: 8.0,right: 8.0),
                                //   child: Row(children: [
                                //     SizedBox(
                                //       width: 5,
                                //     ),Text(
                                //       series,
                                //       style: TextStyle(
                                //           fontSize: 9, fontFamily: 'opsr', color: Colors.black,fontWeight: FontWeight.bold),
                                //     ),
                                //     Spacer(),
                                //     Text(
                                //       '07:15 pm - October, 28 2020',
                                //       style: TextStyle(
                                //         fontSize: 9, fontFamily: 'opsr', color: Color(0xff52545D),),
                                //     ),
                                //   ],
                                //   ),
                                // ),
                                // Container(margin: EdgeInsets.only(left: 8.0,right: 8.0),
                                //   child: Row(children: [
                                //     SizedBox(
                                //       width: 5,
                                //     ),Text(
                                //       series,
                                //       style: TextStyle(
                                //           fontSize: 9, fontFamily: 'opsr', color: Colors.black,fontWeight: FontWeight.bold),
                                //     ),
                                //     Spacer(),
                                //     Text(
                                //       '07:15 pm - October, 28 2020',
                                //       style: TextStyle(
                                //         fontSize: 9, fontFamily: 'opsr', color: Color(0xff52545D),),
                                //     ),
                                //   ],
                                //   ),
                                // ),
                                // Container(margin: EdgeInsets.only(left: 8.0,right: 8.0),
                                //   child: Row(children: [
                                //     SizedBox(
                                //       width: 5,
                                //     ),Text(
                                //       series,
                                //       style: TextStyle(
                                //           fontSize: 9, fontFamily: 'opsr', color: Colors.black,fontWeight: FontWeight.bold),
                                //     ),
                                //     Spacer(),
                                //     Text(
                                //       '07:15 pm - October, 28 2020',
                                //       style: TextStyle(
                                //         fontSize: 9, fontFamily: 'opsr', color: Color(0xff52545D),),
                                //     ),
                                //   ],
                                //   ),
                                // ),
                                Container(
                                  margin: EdgeInsets.only(left: 8.0, right: 8.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        series,
                                        style: TextStyle(
                                            fontSize: 9,
                                            fontFamily: 'opsr',
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      Spacer(),
                                      Text(
                                        '07:15 pm - October, 28 2020',
                                        style: TextStyle(
                                          fontSize: 9,
                                          fontFamily: 'opsr',
                                          color: Color(0xff52545D),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),

                                SizedBox(
                                  height: 8.0,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 8.0, right: 8.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Men:',
                                        style: TextStyle(
                                          fontSize: 9,
                                          fontFamily: 'opsr',
                                          color: Colors.black,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        '2 Bag +2 Pent +3 Socks',
                                        style: TextStyle(
                                          fontSize: 9,
                                          fontFamily: 'opsr',
                                          color: Color(0xff52545D),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 6.0,
                                ),
                                Container(
                                  margin: EdgeInsets.only(left: 8.0, right: 8.0),
                                  child: Row(
                                    children: [
                                      SizedBox(
                                        width: 5,
                                      ),
                                      Text(
                                        'Kids:',
                                        style: TextStyle(
                                          fontSize: 9,
                                          fontFamily: 'opsr',
                                          color: Colors.black,
                                        ),
                                      ),
                                      Spacer(),
                                      Text(
                                        '1 Bag',
                                        style: TextStyle(
                                          fontSize: 9,
                                          fontFamily: 'opsr',
                                          color: Color(0xff52545D),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 18.0,
                                ),
                              ],
                            ),
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 100.0),
                        child: BottomAppBar(
                          color: Colors.white,
                          child: Container(
                            // alignment: Alignment.bottomCenter,
                            margin: EdgeInsets.only(
                                left: 10.0, right: 10.0, bottom: 8.0),
                            height: 40,
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                              color: Color(0xFFFF0000),
                              borderRadius:
                              BorderRadius.all(Radius.circular(5)),
                            ),
                            child: FlatButton(
                              child: Text(
                                "Modify Booking",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Open Sans Semibold",
                                    fontSize: 12.0),
                              ),
                            ),
                          ),
                          elevation: 0,
                        ),
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(top:100.0),
                      //     child: Container(
                      //       // alignment: Alignment.bottomCenter,
                      //       margin: EdgeInsets.only(left: 10.0,right: 10.0,bottom: 8.0),
                      //       height: 40,
                      //       width: MediaQuery.of(context).size.width,
                      //       decoration: BoxDecoration(
                      //         color: Color(0xFFFF0000),
                      //         borderRadius: BorderRadius.all(Radius.circular(5)),
                      //       ),
                      //       child: FlatButton(
                      //         child: Text("Modify Booking",
                      //           style: TextStyle(
                      //               color: Colors.white,
                      //               fontFamily: "Open Sans Semibold",
                      //               fontSize: 12.0),
                      //         ),
                      //       ),
                      //     ),
                      //   ),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  List<bool> _size = [false, false];
  List<double> _height = [68.0, 68.0];
  Widget containerOngoing2(int index, Color color, String series, String date,
      String status, BuildContext context) {
    double w = MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: GestureDetector(
        onTap: () {
          if (_size[index] == false) {
            setState(() {
              _height[index] = 240.57;
              _size[index] = true;
            });
          } else if (_size[index] == true) {
            setState(() {
              _height[index] = 68.0;
              _size[index] = false;
            });
          }
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: _height[index],
          width: double.infinity,
          child: Card(
            elevation: 2.0,
            child: Column(
              children: [
                SizedBox(
                  height: 12,
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 8),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 15,
                      ),
                      Container(
                        height: 10,
                        width: 10,
                        decoration: BoxDecoration(
                          color: color,
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            series,
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'opsr',
                                color: Colors.black),
                          ),
                          Text(
                            date,
                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: 'opsr',
                                color: Colors.grey),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        width: 70,
                        height: 24,
                        decoration: BoxDecoration(
                          color: Color(0xFFFF0000),
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        child: Center(
                            child: Text(
                              status,
                              style: TextStyle(color: Colors.white, fontSize: 11),
                            )),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                        size: 24,
                      ),
                      SizedBox(
                        width: 10,
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 12.0,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 16, right: 16),
                            child: DottedLine(
                              dashLength: 2,
                              dashGapLength: 2,
                              lineThickness: 1,
                            ),
                          ),
                          SizedBox(
                            height: 14.0,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  series,
                                  style: TextStyle(
                                      fontSize: 9,
                                      fontFamily: 'opsr',
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Text(
                                  '07:15 pm - October, 28 2020',
                                  style: TextStyle(
                                    fontSize: 9,
                                    fontFamily: 'opsr',
                                    color: Color(0xff52545D),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 8.0,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Men:',
                                  style: TextStyle(
                                    fontSize: 9,
                                    fontFamily: 'opsr',
                                    color: Colors.black,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  '2 Bag +2 Pent +3 Socks',
                                  style: TextStyle(
                                    fontSize: 9,
                                    fontFamily: 'opsr',
                                    color: Color(0xff52545D),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 6.0,
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 8.0, right: 8.0),
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Kids:',
                                  style: TextStyle(
                                    fontSize: 9,
                                    fontFamily: 'opsr',
                                    color: Colors.black,
                                  ),
                                ),
                                Spacer(),
                                Text(
                                  '1 Bag',
                                  style: TextStyle(
                                    fontSize: 9,
                                    fontFamily: 'opsr',
                                    color: Color(0xff52545D),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 58.0,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                left: 10.0, right: 10.0, bottom: 8.0),
                            height: 40,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: Color(0xFFFF0000),
                              borderRadius:
                              BorderRadius.all(Radius.circular(5)),
                            ),
                            child: FlatButton(
                              child: Text(
                                "Modify Booking",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Open Sans Semibold",
                                    fontSize: 10.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}