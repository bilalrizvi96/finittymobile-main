import 'package:charles_app/paymentConfirmed.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class orderConfirm extends StatefulWidget {
  @override
  _orderConfirmState createState() => _orderConfirmState();
}

class _orderConfirmState extends State<orderConfirm> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(

      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.only(left:180.0,top:20),
                child: Container(
                  alignment: Alignment.topRight,
                  height: 210,
                  width: 250,
                  child: Image.asset("lib/assets/images/logo.png"),
                ),
              ),

              Padding(
                  padding: const EdgeInsets.only(left:12.0,right:12),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 20,),
                      Row(
                        children: [
                          InkWell(
                              onTap: ()=>{
                                Navigator.pop(context)
                              },
                              child: Container(child: Icon(Icons.arrow_back_ios,))),
                          Padding(
                            padding: const EdgeInsets.only(left:12.0),
                            child: Text("Order Confirmation", style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),),
                          ),
                          Spacer(),
                          Icon(Icons.inbox, color: Colors.red,)
                        ],
                      ),
                      SizedBox(height: 20,),

                      Center(
                        child: Container(
                          height: 200,
                          child: Image.asset("lib/assets/images/orderconfrmlimage.png"),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top:10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("All Ready", style: TextStyle(fontSize: 24, fontFamily: 'opsb'),),
                          ],
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Whenever you're ready!", style: TextStyle(fontSize: 10),),
                        ],
                      ),

                      //
                      SizedBox(height: 30,),
                      // Apply coupon row
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Finity-360", style: TextStyle(fontSize: 24, fontFamily: 'opsb'),),
                          RaisedButton(
                            textColor: Colors.white,
                            color: Color(0xFF1BD741),
                            onPressed: () {},
                            child: Container(
                                width: 60,
                                child: Center(child: const Text('Applied', style: TextStyle(fontSize: 12)))),
                          ),
                        ],
                      ),
                      //
                      //
                      //Order Details
                      SizedBox(height: 4,),
                      Row(
                        children: [
                          Text("Order Details", style: TextStyle(fontSize: 24, fontFamily: 'opsb'),),
                        ],
                      ),
                      SizedBox(height: 5,),
                      Row(
                        children: [
                          Text("Date", style: TextStyle(color: Colors.grey,fontSize: 10 ,fontFamily: 'opsr'),),
                          Spacer(),
                          Text("Mon, Sep 1,20 --- 06:30pm", style: TextStyle(color: Colors.grey,fontSize: 10 ,fontFamily: 'opsr'))
                        ],
                      ),

                      Row(
                        children: [
                          Text("Location", style: TextStyle(color: Colors.grey,fontSize: 10 ,fontFamily: 'opsr'),),
                          Spacer(),
                          Column(
                            children: [
                              Text("32nd St, Round Sq", style: TextStyle(color: Colors.grey,fontSize: 10 ,fontFamily: 'opsr')),
                              Text("Toronto, Canada", style: TextStyle(color: Colors.grey,fontSize: 10 ,fontFamily: 'opsr')),
                            ],
                          )
                        ],
                      ),
                      SizedBox(height: 10,),

                      Padding(
                        padding: const EdgeInsets.only(right:8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Service Details", style: TextStyle(fontSize: 18,fontFamily: 'opsb'),),
                            Spacer(),
                            Container(
                                width: 85,
                                child: Text("View Details", style: TextStyle(color: Colors.red, fontSize: 14,fontFamily: 'opsr'),))
                          ],
                        ),
                      ),
                      SizedBox(height: 7,),

                      Text("Laundry", style: TextStyle(fontSize: 15),),
                      SizedBox(height: 3,),
                      Padding(
                        padding: const EdgeInsets.only(right:8.0),
                        child: Row(
                          children: [
                            Text("1 Bag", style: TextStyle(color: Colors.grey),),
                            Spacer(),
                            Text("20\$", style: TextStyle(color: Colors.grey),),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right:8.0),
                        child: Row(
                          children: [
                            Text("Coupon", style: TextStyle(color: Colors.grey),),
                            Spacer(),
                            Text("--"),
                          ],
                        ),
                      ),
                      SizedBox(height: 3,),

                      Row(
                        children: [
                          Text("Total", style: TextStyle(fontSize: 18 ,fontFamily: 'opsb'),),
                          Spacer(),
                          Text("20\$", style: TextStyle(fontSize: 24, fontFamily: 'opsb'))
                        ],
                      ),
                      SizedBox(height: 10,),

                      Padding(
                        padding: const EdgeInsets.only(left:10.0,right: 10),
                        child: Container(
                          width:MediaQuery.of(context).size.width,
                          child: FlatButton(
                            color: Color.fromRGBO(255, 0, 0, 1),
                            textColor: Colors.white,
                            disabledColor: Colors.grey,
                            disabledTextColor: Colors.black,
                            padding: EdgeInsets.all(8.0),
                            splashColor: Colors.red,
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => paymentConfirmed()));
                            },
                            child: Text(
                              "PAY NOW",
                              style: TextStyle(fontSize: 10,fontFamily: 'opsb'),
                            ),
                          ),
                        ),
                      )
                    ],
                  )
              ),
            ],
          ),
        ),
      ),
    );
  }
}
