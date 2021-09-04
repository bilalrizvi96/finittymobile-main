import 'package:charles_app/CreditCard/card_background.dart';
import 'package:charles_app/CreditCard/card_type.dart';
import 'package:charles_app/CreditCard/credit_card.dart';
import 'package:charles_app/muben/carddetails.dart';
import 'package:charles_app/orderConfirm.dart';
import 'package:charles_app/View/selectCards.dart';
import 'package:flutter/material.dart';

class payCard extends StatefulWidget {
  @override
  _payCardState createState() => _payCardState();
}

class _payCardState extends State<payCard> {

  String cardNumber = "";
  String cardHolderName = "";
  String expiryDate = "";
  String cvv = "";
  bool showBack = false;

  FocusNode _focusNode;

  @override
  void initState() {
    super.initState();
    _focusNode = new FocusNode();
    _focusNode.addListener(() {
      setState(() {
        _focusNode.hasFocus ? showBack = true : showBack = false;
      });
    });
  }

  @override
  void dispose() {
    _focusNode.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:180.0),
                  child: Container(
                    alignment: Alignment.topRight,
                    height: 210,
                    width: 250,
                    child: Opacity(
                        opacity: 0.3,
                        child: Image.asset("lib/assets/images/logo.png")),
                  ),
                ),

                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 10,),
                    Row(
                      children: [
                        InkWell(
                            onTap: ()=>{
                              Navigator.pop(context)
                            },
                            child: Container(child: Icon(Icons.arrow_back_ios,))),
                        Padding(
                          padding: const EdgeInsets.only(left:12.0),
                          child: Text("Select Card", style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 18),),
                        ),
                      ],
                    ),
                    SizedBox(height: 40,),

                    CreditCard(
                      cardNumber: cardNumber,
                      cardExpiry: expiryDate,
                      cardHolderName: cardHolderName,
                      cvv: cvv,
                      bankName: "Bank",
                      showBackSide: showBack,
                      frontBackground: CardBackgrounds.blackGradient,
                      backBackground: CardBackgrounds.white,
                      cardType: CardType.masterCard,
                      showShadow: true,

                    ),

                    SizedBox(height: 45,),

                    Padding(
                      padding: const EdgeInsets.only(left:14.0, right: 14),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        child: TextFormField(
                          decoration: new InputDecoration(
                            floatingLabelBehavior:FloatingLabelBehavior.always,
                            enabledBorder: OutlineInputBorder(
                              // borderSide: BorderSide(color: Colors.black, width: 1),
                            ),

                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.black)),
                            hintText: '1234 **** **** 5678',
                            labelText: 'Card Number',

                          ),
                          maxLength: 19,
                          onChanged: (value) {
                            setState(() {
                              cardNumber = value;
                            });
                          },
                        ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width/2.2,
                          child: TextFormField(
                            decoration: new InputDecoration(
                              floatingLabelBehavior:FloatingLabelBehavior.always,
                              enabledBorder: OutlineInputBorder(
                                // borderSide: BorderSide(color: Colors.black, width: 1),
                              ),

                              border: new OutlineInputBorder(
                                  borderSide: new BorderSide(color: Colors.black)),
                              hintText: 'MM--YY',
                              labelText: 'Exp Date',

                            ),
                            maxLength: 5,
                            onChanged: (value) {
                              setState(() {
                                expiryDate = value;
                              });
                            },
                          ),
                        ),
                        Container(
                          width: MediaQuery.of(context).size.width/2.5,
                          child: TextFormField(
                            decoration: new InputDecoration(
                              floatingLabelBehavior:FloatingLabelBehavior.always,
                              enabledBorder: OutlineInputBorder(
                                // borderSide: BorderSide(color: Colors.black, width: 1),
                              ),

                              border: new OutlineInputBorder(
                                  borderSide: new BorderSide(color: Colors.black)),
                              hintText: '123',
                              labelText: 'CVC Code',
                            ),

                            maxLength: 3,
                            onChanged: (value) {
                              setState(() {
                                cvv = value;
                              });
                            },
                            focusNode: _focusNode,

                          ),
                        ),
                      ],
                    ),

                    SizedBox(height: 130,),
                    Padding(
                      padding: const EdgeInsets.only(left:10.0,right: 10),
                      child: Container(
                        width:MediaQuery.of(context).size.width,
                        child: FlatButton(
                          color: Color(0xFF353B51),
                          textColor: Colors.white,
                          disabledColor: Colors.grey,
                          disabledTextColor: Colors.black,
                          padding: EdgeInsets.all(8.0),
                          splashColor: Colors.blue[700],
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => orderConfirm()));
                          },
                          child: Text(
                            "PAY NOW",
                            style: TextStyle(fontSize: 13.0),
                          ),
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(left:10.0,right: 10),
                      child: Container(
                        width:MediaQuery.of(context).size.width,
                        child: FlatButton(
                          color: Color(0xFF353B51),
                          textColor: Colors.white,
                          disabledColor: Colors.grey,
                          disabledTextColor: Colors.black,
                          padding: EdgeInsets.all(8.0),
                          splashColor: Colors.blue[700],
                          onPressed: () {
                            Navigator.push(context,
                                MaterialPageRoute(builder: (context) => DetailsCard()));
                          },
                          child: Text(
                            "SELECT CARD",
                            style: TextStyle(fontSize: 13.0),
                          ),
                        ),
                      ),
                    )

                  ],

                ),
              ]),
        ),
      ),
    );
  }
}