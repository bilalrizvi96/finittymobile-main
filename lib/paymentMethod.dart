import 'package:charles_app/CreditCard/card_background.dart';
import 'package:charles_app/CreditCard/card_type.dart';
import 'package:charles_app/CreditCard/credit_card.dart';
import 'package:charles_app/orderConfirm.dart';
import 'package:charles_app/View/payCard.dart';
import 'package:flutter/material.dart';

class paymentMethod extends StatefulWidget {
  @override
  _paymentMethodState createState() => _paymentMethodState();
}

class _paymentMethodState extends State<paymentMethod> {
  String cardNumber = "";
  String cardHolderName = "";
  String expiryDate = "";
  String cvv = "";
  bool showBack = false;
  bool checkBoxValue = false;

  static Widget red = new Container(
    width: double.maxFinite,
    height: double.maxFinite,
    color: Colors.red,
  );

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
                            child: Text("Payment Method", style: TextStyle(
                                fontWeight: FontWeight.bold, fontSize: 18),),
                          ),
                        ],
                      ),
                      SizedBox(height: 30,),

                      Center(
                        child: InkWell(
                          onTap: ()=>{
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>payCard()))
                          },
                          child: CreditCard(
                            checkBox: null,
                            // checkBox: Theme(
                            //   child: Radio(
                            //     groupValue: checkBoxValue,
                            //     onChanged: (value) => setState(
                            //           () => checkBoxValue = value,
                            //     ),
                            //   ),
                            //   data: ThemeData(
                            //
                            //     // inputDecorationTheme: InputDecorationTheme(
                            //     //
                            //     // ),
                            //     primarySwatch: Colors.green,
                            //     unselectedWidgetColor: Colors.white, // Your color
                            //   ),
                            // ),



                            cardNumber: cardNumber,
                            cardExpiry: "10/25",
                            cardHolderName: "Card Holder",
                            cvv: "456",
                            bankName: "Bank",
                            showBackSide: showBack,
                            frontBackground: red,
                            backBackground: CardBackgrounds.white,
                            cardType: CardType.masterCard,
                            showShadow: true,

                          ),

                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(right:10.0, top:8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Update Payment Method",style: TextStyle(fontSize: 12,fontFamily: 'opsr'),),
                          ],
                        ),
                      ),

                      //
                      SizedBox(height: 30,),
                      // Apply coupon row
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:20),
                            child: Container(
                              // height:4,
                              width: MediaQuery.of(context).size.width/1.7,
                              child: TextFormField(
                                decoration: new InputDecoration(
                                  hintText: 'Apply Coupon...',
                                  hintStyle: TextStyle(
                                      fontSize: 14
                                  ),
                                  contentPadding: EdgeInsets.all(8),
                                  isDense: true,
                                  border: new OutlineInputBorder(
                                      borderSide: new BorderSide(color: Colors.grey)
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 90,
                            child: RaisedButton(
                              textColor: Colors.white,
                              color: Color.fromRGBO(94, 96, 95, 1),
                              onPressed: () {},
                              child: const Text('Apply', style: TextStyle(fontSize: 14)),
                            ),
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
                          Text("Date", style: TextStyle(color: Colors.grey,fontFamily: 'opsr',fontSize: 10),),
                          Spacer(),
                          Text("Mon, Sep 1,20 --- 06:30pm", style: TextStyle(color: Colors.grey,fontFamily: 'opsr',fontSize: 10))
                        ],
                      ),

                      Row(
                        children: [
                          Text("Location", style: TextStyle(color: Colors.grey,fontFamily: 'opsr',fontSize: 10),),
                          Spacer(),
                          Column(
                            children: [
                              Text("32nd St, Round Sq", style: TextStyle(color: Colors.grey,fontFamily: 'opsr',fontSize: 10)),
                              Text("Toronto, Canada", style: TextStyle(color: Colors.grey,fontFamily: 'opsr',fontSize: 10)),
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
                            Text("Service Details", style: TextStyle(fontFamily: 'opsb',fontSize: 18,color: Colors.black),),
                            Spacer(),
                            Container(
                                width:90,
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
                          Text("Total", style: TextStyle(fontSize:18 ,fontFamily: 'opsb'),),
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
                            color: Colors.red,
                            textColor: Colors.white,
                            disabledColor: Colors.grey,
                            disabledTextColor: Colors.black,
                            padding: EdgeInsets.all(8.0),
                            splashColor: Colors.red[700],
                            onPressed: () {
                              Navigator.push(context,
                                  MaterialPageRoute(builder: (context) => orderConfirm()));
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