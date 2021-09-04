import 'package:charles_app/payment.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class paymentConfirmed extends StatefulWidget {
  @override
  _paymentConfirmedState createState() => _paymentConfirmedState();
}

class _paymentConfirmedState extends State<paymentConfirmed> {
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
                      SizedBox(height: 10,),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:12.0, top:10),
                            child: Text("Payment Confirmed", style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),),
                          ),
                          Spacer(),
                          Icon(Icons.inbox, color: Colors.red,)
                        ],
                      ),
                      SizedBox(height: 150,),

                      Center(
                        child: Container(
                          height: 150,
                          child: Image.asset("lib/assets/images/thanks2.png"),
                        ),
                      ),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Thank you", style: TextStyle(fontSize: 24, fontFamily: 'opsb'),),
                        ],
                      ),
                      SizedBox(height: 4,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("For choosing Finitty", style: TextStyle(fontSize: 16, fontFamily: 'opsr'),),
                        ],
                      ),

                      SizedBox(height: 15,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context) => Payments()));

                              },
                              child: Text("View Details", style: TextStyle(fontSize: 12,fontFamily: 'opsr' ,decoration: TextDecoration.underline),)),
                        ],
                      ),
                      SizedBox(height: 160,),
                      Padding(
                        padding: const EdgeInsets.only(left:10.0,right: 10),
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10)
                          ),
                          width:MediaQuery.of(context).size.width,
                          child: FlatButton(
                            color: Color.fromRGBO(255, 0, 0, 1),
                            textColor: Colors.white,
                            disabledColor: Colors.grey,
                            disabledTextColor: Colors.black,
                            padding: EdgeInsets.all(8.0),
                            splashColor: Colors.red,
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => paymentConfirmed()));
                            },
                            child: Text(
                              "CONTINUE",
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
