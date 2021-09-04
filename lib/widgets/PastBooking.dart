import 'package:charles_app/API/API.dart';
import 'package:charles_app/BaseUrl/variableGloable.dart';
import 'package:dotted_line/dotted_line.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class PastBooking extends StatefulWidget {
  @override
  _PastBookingState createState() => _PastBookingState();
}

class _PastBookingState extends State<PastBooking> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(1.0),
        child: _listcontainers(),
      ),
    );
  }
  Widget _listcontainers() {
    return Completebookinglist.isEmpty?
    Container(child: Center(child: Text("No Data to Show",style: TextStyle(color: Colors.black),)),)
        :Container(
      padding: EdgeInsets.only(top: 20),
      margin: EdgeInsets.symmetric(horizontal: 13.0),
      child:
      ListView.builder(
          scrollDirection: Axis.vertical,
          itemCount: Completebookinglist.length,
          itemBuilder: (_,index){
            return  containerOngoingNew(
                Completebookinglist[index].id,
                index,
                Completebookinglist[index].clr,
                Completebookinglist[index].service,
                Completebookinglist[index].preferred_date_from,
                Completebookinglist[index].address,
                Completebookinglist[index].price,
                Completebookinglist[index].name,
                context,
                Completebookinglist[index].vendor_id,
            );
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

  // Widget _listcontainers(){
  //   return SingleChildScrollView(
  //     child: Container(
  //         padding: EdgeInsets.only(top: 20),
  //         margin: EdgeInsets.symmetric(horizontal: 13.0),
  //         child: Column(children: [
  //           containerOngoingNew(0,Colors.green, "Wash & Iron", "October, 28 2020",
  //               "Accepted",context),
  //           SizedBox(
  //             height: 6.0,
  //           ),
  //
  //         ],)
  //     ),
  //   );
  // }
  List<bool> _size1 = [false,false,false,false,false];
  List<double> _height1 = [88.0,88.0,88.0,88.0,88.0];
  Widget containerOngoingNew(var id,int index,Color color, var service,
      var date, var address,var price,var name, BuildContext context,var vendor_id) {
    double w= MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: GestureDetector(
        onTap:() {
          if (_size1[index] == false) {
            setState(() {
              _height1[index] = 310;
              _size1[index] = true;
            });
          } else if (_size1[index] == true) {
            setState(() {
              _height1[index] = 88.0;
              _size1[index]= false;
            });
          }
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: _height1[index],
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
                        borderRadius: BorderRadius.only(bottomLeft: Radius.circular(5),topLeft: Radius.circular(5)),
                      ),
                    ),
                    Expanded(
                        child: Column(
                          children: [
                            Container(margin: EdgeInsets.only(left: 8),
                                height: 60,
                                width: double.infinity,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                        child: Column(crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            SizedBox(height: 4,),
                                            Text("Booking ID #"+id.toString(),style: TextStyle(
                                                fontSize: 10, fontFamily: 'opsb', color: Colors.black),),
                                            SizedBox(height: 5,),
                                            Text(service,style: TextStyle(fontWeight: FontWeight.bold,
                                                fontSize: 20, fontFamily: 'opsb', color: Colors.black),),
                                            // SizedBox(height: 2,),
                                            // Row(
                                            //   children: [
                                            //     Icon(Icons.location_on,size: 12,),
                                            //     SizedBox(width: 2,),
                                            //     Text("Division 2, Toronto, Ontario, Cad",style: TextStyle(
                                            //         fontSize: 10, fontFamily: 'opsr', color: Colors.grey),),
                                            //   ],
                                            // ),
                                          ],
                                        )
                                    ),
                                    Container(
                                        margin: EdgeInsets.only(right: 8),
                                        child: Column(crossAxisAlignment: CrossAxisAlignment.end,
                                          children: [
                                            SizedBox(height: 4,),
                                            Text(date,style: TextStyle(
                                                fontSize: 10, fontFamily: 'opsr', color: Colors.grey),),
                                            Row(
                                              children: [
                                                Container(
                                                  child: Column(
                                                    crossAxisAlignment:CrossAxisAlignment.end,
                                                    children: [
                                                      Text(name.toString(),style: TextStyle(fontWeight: FontWeight.bold,
                                                          fontSize: 12, fontFamily: 'opsb', color: Colors.black),),
                                                      Row(
                                                        children: [
                                                          RatingBar(
                                                            itemSize: 10,
                                                            initialRating: 3.5,
                                                            minRating: 1,
                                                            direction: Axis.horizontal,
                                                            itemCount: 5,
                                                            itemPadding: EdgeInsets.symmetric(horizontal: 0.3),
                                                            itemBuilder: (context, _) => Icon(
                                                              Icons.star,
                                                              color: Colors.orangeAccent,
                                                            ),
                                                          ),
                                                          SizedBox(height: 3,),
                                                          Text("3.5",style: TextStyle(fontWeight: FontWeight.bold,
                                                              fontSize: 8, color: Colors.black),),
                                                        ],
                                                      )
                                                    ],
                                                  ),
                                                ),
                                                CircleAvatar(
                                                  radius: 21,
                                                  child: Image.asset("lib/assets/images/dp.png"),
                                                  backgroundColor: Colors.transparent,
                                                ),
                                              ],
                                            ),
                                          ],
                                        )
                                    ),
                                  ],
                                )
                            ),
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
                        )
                    )
                  ],
                ),
                Expanded(
                  child: SingleChildScrollView(
                      child: Container(
                        child: Column(
                          children: [
                            SizedBox(height: 12.0,),
                            Container(margin: EdgeInsets.only(left: 8.0,right: 8.0),
                              child: Row(children: [
                                SizedBox(
                                  width: 5,
                                ),Text(
                                  "OrderPlaced #212423",
                                  style: TextStyle(
                                      fontSize: 9, fontFamily: 'opsr', color: Colors.black,fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Text(
                                  date==null?"07:15 pm - October, 28 2020":date.toString(),
                                  style: TextStyle(
                                    fontSize: 9, fontFamily: 'opsr', color: Color(0xff52545D),),
                                ),
                              ],
                              ),
                            ),
                            SizedBox(height: 8.0,),
                            Container(margin: EdgeInsets.only(left: 8.0,right: 8.0),
                              child: Row(children: [
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Total',
                                  style: TextStyle(
                                    fontSize: 9, fontFamily: 'opsr', color: Colors.black,),
                                ),

                                Spacer(),
                                Text(
                                  price==null?'400.00\$':price.toString()+"\$",
                                  style: TextStyle(
                                    fontSize: 9, fontFamily: 'opsr', color: Color(0xff52545D),),
                                ),

                              ],),
                            ),
                            SizedBox(height: 6.0,),
                            Container(margin: EdgeInsets.only(left: 8.0,right: 8.0),
                              child: Row(children: [
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Total',
                                  style: TextStyle(
                                    fontSize: 9, fontFamily: 'opsr', color: Colors.black,),
                                ),

                                Spacer(),
                                Text(
                                  price==null?'400.00\$':price.toString()+"\$",
                                  style: TextStyle(
                                    fontSize: 9, fontFamily: 'opsr', color: Color(0xff52545D),),
                                ),

                              ],),
                            ),
                            SizedBox(height: 6.0,),
                            Container(margin: EdgeInsets.only(left: 8.0,right: 8.0),
                              child: Row(children: [
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Total',
                                  style: TextStyle(
                                    fontSize: 9, fontFamily: 'opsr', color: Colors.black,),
                                ),

                                Spacer(),
                                Text(
                                  price==null?'400.00\$':price.toString()+"\$",
                                  style: TextStyle(
                                    fontSize: 9, fontFamily: 'opsr', color: Color(0xff52545D),),
                                ),

                              ],),
                            ),
                            SizedBox(height: 10.0,),
                            Container(margin: EdgeInsets.only(left: 8.0,right: 8.0),
                              child: Row(children: [
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Total',
                                  style: TextStyle(
                                    fontSize: 10, fontFamily: 'opsb', color: Colors.black,),
                                ),

                                Spacer(),
                                Text(
                                  price==null?'400.00\$':price.toString()+"\$",
                                  style: TextStyle(
                                    fontSize: 10, fontFamily: 'opsb', color: Color(0xff52545D),),
                                ),

                              ],),
                            ),
                            SizedBox( height: 5,),

                            Padding(
                              padding: const EdgeInsets.only(left: 15,right: 15),
                              child: Divider(),
                            ),
                            SizedBox(height: 5,),
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
                            SizedBox( height: 10,),
                            Container(
                              margin: EdgeInsets.only(left: 10.0,right: 10.0,bottom: 8.0),
                              height: 40,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: Color(0xFFFF0000),
                                borderRadius: BorderRadius.all(Radius.circular(5)),
                              ),
                              child: FlatButton(
                                onPressed: (){
                                   popup(vendor_id);
                                },
                                child: Text("Rate",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "Open Sans Semibold",
                                      fontSize: 14.0),
                                ),
                              ),
                            ),
                          ],
                        ),
                      )
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  var rating= 0.0;
  bool _ratingstatus=false;

  void popup(var vendor_id){
    showDialog(context: context,builder: (BuildContext context){
      return AlertDialog(
        content: Container(
          margin: EdgeInsets.only(left: 20,top: 10,right: 20,bottom: 10),
          height: MediaQuery.of(context).size.height*0.34,
          width: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text("Thank You",
                style: TextStyle(fontSize: 24,fontFamily: 'opsb'),
              ),
              SizedBox(height: 5),
              Text("Help us make your experience better, Rate your experience with this service",
                style: TextStyle(fontSize: 14,fontFamily: 'opsr',color: Color(0xFF7B8696)),
              ),
              SizedBox(height: 14),
              Container(
                width: 80,
                child: Center(
                    child: SmoothStarRating(
                      rating: rating,
                      isReadOnly: false,
                      size: 38,
                      color: Colors.amber,
                      borderColor: Colors.amberAccent,
                      filledIconData: Icons.star,
                      halfFilledIconData: Icons.star_half,
                      defaultIconData: Icons.star_border,
                      starCount: 5,
                      allowHalfRating: true,
                      spacing: 3,
                      onRated: (value) {
                        print("rating value -> $value");
                        setState(() {
                          rating=value;
                          _ratingstatus=true;
                        });
                      },
                    )
                ),
              ),
              SizedBox(height: 14),
              Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Please rate",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontFamily: 'sour',
                        letterSpacing: 0.5
                    ),
                  ),

                  // Text("Add Comments",
                  //   style: TextStyle(
                  //       fontSize: 14,
                  //       fontFamily: 'sour',
                  //       color: _ratingstatus?Colors.black12:Colors.black,
                  //       letterSpacing: 0.5
                  //   ),
                  // ),
                ],
              ),
              Spacer(),
              Center(
                child: Row(
                  children: [
                    InkWell(
                      child: Text( "Skip",
                        style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFFFF0000),
                            fontFamily: 'sour',
                            fontWeight:FontWeight.bold,
                            letterSpacing: 0.5
                        ),
                      ),
                      onTap: (){
                        Navigator.of(context).pop();
                      },
                    ),
                    Spacer(),
                    InkWell(
                      onTap: (){
                        if(rating==0.0){
                          Fluttertoast.showToast(
                              msg: "Please Rate to Tab on Stars",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 3,
                              backgroundColor: Color(0xFFFF0000),
                              textColor: Colors.white,
                              fontSize: 16.0);
                        }else{
                          API.RatingAPI(vendor_id, userid, rating);
                          Fluttertoast.showToast(
                              msg: "Rate Successfully Done",
                              toastLength: Toast.LENGTH_SHORT,
                              gravity: ToastGravity.CENTER,
                              timeInSecForIosWeb: 3,
                              backgroundColor: Color(0xFFFF0000),
                              textColor: Colors.white,
                              fontSize: 16.0);
                          Navigator.of(context).pop();
                        }

                      },
                      child: Text( "Done",
                        style: TextStyle(
                            fontSize: 15,
                            color: Color(0xFFFF0000),
                            fontFamily: 'sour',
                            fontWeight:FontWeight.bold,
                            letterSpacing: 0.5
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget containerOngoing(int index,String bookid,Color color, String series, String date, String details,BuildContext context) {
    double w= MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: GestureDetector(
        onTap:() {
          if (_size1[index] == false) {
            setState(() {
              _height1[index] = 220;
              _size1[index] = true;
            });
          } else if (_size1[index] == true) {
            setState(() {
              _height1[index] = 68.0;
              _size1[index]= false;
            });
          }
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: _height1[index],
          width: w,
          child: Card(
            elevation: 2.0,
            child: Column(
              children: [
                SizedBox(height: 12,),
                Container(margin: EdgeInsets.only(bottom: 6),
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
                                fontSize: 12, fontFamily: 'opsr', color: Colors.black),
                          ),
                          Text(
                            date,
                            style: TextStyle(
                                fontSize: 12, fontFamily: 'opsr', color: Colors.grey),
                          ),
                        ],
                      ),
                      Spacer(),
                      Container(
                        width: 70,
                        height: 24,
                        decoration: BoxDecoration(
                          color: Colors.green,
                          borderRadius: BorderRadius.all(Radius.circular(25)),
                        ),
                        child: Center(
                            child: Text(
                              details,
                              style: TextStyle(color: Colors.white, fontSize: 11),
                            )),
                      ),
                      SizedBox(width: 10,),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                        size: 24,
                      ),
                      SizedBox(width: 10,)
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                      child: Container(
                        child: Column(
                          children: [
                            SizedBox(height: 12.0,),
                            Container(margin: EdgeInsets.only(left: 8.0,right: 8.0),
                              child: Row(children: [
                                SizedBox(
                                  width: 5,
                                ),Text(
                                  "Booking ID",
                                  style: TextStyle(
                                      fontSize: 9, fontFamily: 'opsr', color: Colors.black,fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Text(
                                  "#"+bookid,
                                  style: TextStyle(
                                    fontSize: 9, fontFamily: 'opsr', color: Color(0xff52545D),),
                                ),
                              ],
                              ),
                            ),
                            SizedBox(height: 8.0,),
                            Container(margin: EdgeInsets.only(left: 8.0,right: 8.0),
                              child: Row(children: [
                                SizedBox(
                                  width: 5,
                                ),Text(
                                  series,
                                  style: TextStyle(
                                      fontSize: 9, fontFamily: 'opsr', color: Colors.black,fontWeight: FontWeight.bold),
                                ),
                                Spacer(),
                                Text(
                                  '07:15 pm - October, 28 2020',
                                  style: TextStyle(
                                    fontSize: 9, fontFamily: 'opsr', color: Color(0xff52545D),),
                                ),
                              ],
                              ),
                            ),
                            SizedBox(height: 8.0,),
                            Container(margin: EdgeInsets.only(left: 8.0,right: 8.0),
                              child: Row(children: [
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Men:',
                                  style: TextStyle(
                                    fontSize: 9, fontFamily: 'opsr', color: Colors.black,),
                                ),

                                Spacer(),
                                Text(
                                  '2 Bag +2 Pent +3 Socks',
                                  style: TextStyle(
                                    fontSize: 9, fontFamily: 'opsr', color: Color(0xff52545D),),
                                ),

                              ],),
                            ),
                            SizedBox(height: 6.0,),
                            Container(margin: EdgeInsets.only(left: 8.0,right: 8.0),
                              child: Row(children: [
                                SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  'Kids:',
                                  style: TextStyle(
                                    fontSize: 9, fontFamily: 'opsr', color: Colors.black,),
                                ),

                                Spacer(),
                                Text(
                                  '1 Bag',
                                  style: TextStyle(
                                    fontSize: 9, fontFamily: 'opsr', color: Color(0xff52545D),),
                                ),

                              ],),
                            ),
                            SizedBox(height: 18.0,),

                            Row(
                              children: [
                                Container(
                                  alignment: Alignment.bottomCenter,
                                  margin: EdgeInsets.only(left: 10.0,right: 10.0,bottom: 8.0),
                                  height: 40,
                                  width: MediaQuery.of(context).size.width/2.6,
                                  decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(color: Colors.black),
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                  ),
                                  child: FlatButton(
                                    child: Text("Rate",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontFamily: "Open Sans Semibold",
                                          fontSize: 12.0),
                                    ),
                                  ),
                                ),
                                Spacer(),

                                Container(
                                  margin: EdgeInsets.only(left: 10.0,right: 10.0,bottom: 8.0),
                                  height: 40,
                                  width: MediaQuery.of(context).size.width/2.6,
                                  decoration: BoxDecoration(
                                    color: Color(0xFFFF0000),
                                    borderRadius: BorderRadius.all(Radius.circular(5)),
                                  ),
                                  child: FlatButton(
                                    child: Text("Book Again",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontFamily: "Open Sans Semibold",
                                          fontSize: 12.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      )
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  List<bool> _size = [false,false];
  List<double> _height= [68.0,68.0];
  Widget containerOngoing2(int index,Color color, String series, String date, String status,BuildContext context) {
    double w= MediaQuery.of(context).size.width;
    return SingleChildScrollView(
      child: GestureDetector(
        onTap:() {
          if (_size[index] == false) {
            setState(() {
              _height[index] = 220.57;
              _size[index]= true;
            });
          } else if (_size[index] == true) {
            setState(() {
              _height[index] = 68.0;
              _size[index]= false;
            });
          }
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 300),
          height: _height[index],
          width: w,
          child: Card(
            elevation: 2.0,
            child: Column(
              children: [
                SizedBox(height: 12,),
                Container(margin: EdgeInsets.only(bottom: 6),
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
                                fontSize: 12, fontFamily: 'opsr', color: Colors.black),
                          ),
                          Text(
                            date,
                            style: TextStyle(
                                fontSize: 12, fontFamily: 'opsr', color: Colors.grey),
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
                      SizedBox(width: 10,),
                      Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.grey,
                        size: 24,
                      ),
                      SizedBox(width: 10,)
                    ],
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(

                      child: Column(
                        children: [
                          SizedBox(height: 12.0,),
                          Container(
                            margin: EdgeInsets.only(left: 16,right: 16),
                            child: DottedLine(
                              dashLength: 2,
                              dashGapLength: 2,
                              lineThickness: 1,
                            ),
                          ),
                          SizedBox(height: 14.0,),
                          Container(margin: EdgeInsets.only(left: 8.0,right: 8.0),
                            child: Row(children: [
                              SizedBox(
                                width: 5,
                              ),Text(
                                series,
                                style: TextStyle(
                                    fontSize: 9, fontFamily: 'opsr', color: Colors.black,fontWeight: FontWeight.bold),
                              ),
                              Spacer(),
                              Text(
                                '07:15 pm - October, 28 2020',
                                style: TextStyle(
                                  fontSize: 9, fontFamily: 'opsr', color: Color(0xff52545D),),
                              ),
                            ],
                            ),
                          ),
                          SizedBox(height: 8.0,),
                          Container(margin: EdgeInsets.only(left: 8.0,right: 8.0),
                            child: Row(children: [
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Men:',
                                style: TextStyle(
                                  fontSize: 9, fontFamily: 'opsr', color: Colors.black,),
                              ),

                              Spacer(),
                              Text(
                                '2 Bag +2 Pent +3 Socks',
                                style: TextStyle(
                                  fontSize: 9, fontFamily: 'opsr', color: Color(0xff52545D),),
                              ),

                            ],),
                          ),
                          SizedBox(height: 6.0,),
                          Container(margin: EdgeInsets.only(left: 8.0,right: 8.0),
                            child: Row(children: [
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Kids:',
                                style: TextStyle(
                                  fontSize: 9, fontFamily: 'opsr', color: Colors.black,),
                              ),

                              Spacer(),
                              Text(
                                '1 Bag',
                                style: TextStyle(
                                  fontSize: 9, fontFamily: 'opsr', color: Color(0xff52545D),),
                              ),

                            ],),
                          ),
                          SizedBox(height: 18.0,),

                          Row(
                            children: [
                              Container(
                                alignment: Alignment.bottomCenter,
                                margin: EdgeInsets.only(left: 10.0,right: 10.0,bottom: 8.0),
                                height: 40,
                                width: MediaQuery.of(context).size.width/2.6,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  border: Border.all(color: Colors.black),
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                ),
                                child: FlatButton(
                                  child: Text("Rate",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontFamily: "Open Sans Semibold",
                                        fontSize: 12.0),
                                  ),
                                ),
                              ),
                              Spacer(),

                              Container(
                                margin: EdgeInsets.only(left: 10.0,right: 10.0,bottom: 8.0),
                                height: 40,
                                width: MediaQuery.of(context).size.width/2.6,
                                decoration: BoxDecoration(
                                  color: Color(0xFFFF0000),
                                  borderRadius: BorderRadius.all(Radius.circular(5)),
                                ),
                                child: FlatButton(
                                  child: Text("Book Again",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontFamily: "Open Sans Semibold",
                                        fontSize: 12.0),
                                  ),
                                ),
                              ),
                            ],
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