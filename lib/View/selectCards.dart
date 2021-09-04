
import 'package:charles_app/CreditCard/card_background.dart';
import 'package:charles_app/CreditCard/card_type.dart';
import 'package:charles_app/CreditCard/credit_card.dart';
import 'package:charles_app/orderConfirm.dart';
import 'package:flutter/material.dart';

class SelectCard extends StatefulWidget {
  @override
  _SelectCardState createState() => _SelectCardState();
}

class _SelectCardState extends State<SelectCard> {

  String cardNumber = "";
  String cardHolderName = "";
  String expiryDate = "";
  String cvv = "";
  bool showBack = false;
  var checkBoxValue = [
    false,
    false
  ];
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
        backgroundColor: Colors.grey[200],
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
                      checkBox: Theme(
                        child: Radio(
                          groupValue: checkBoxValue[0],
                          onChanged: (value) => setState(
                                () {checkBoxValue[0] = value;
                          checkBoxValue[1] = false;}
                          ),
                        ),
                        data: ThemeData(

                          // inputDecorationTheme: InputDecorationTheme(
                          //
                          // ),
                          primarySwatch: Colors.green,
                          unselectedWidgetColor: Colors.white, // Your color
                        ),
                      ),
                      cardNumber: cardNumber,
                      cardExpiry: expiryDate,
                      cardHolderName: cardHolderName,
                      cvv: cvv,
                      bankName: "Bank",
                      showBackSide: showBack,
                      frontBackground: CardBackgrounds.red,
                      backBackground: CardBackgrounds.white,
                      cardType: CardType.masterCard,
                      showShadow: true,

                    ),

                    SizedBox(height: 20,),
                    CreditCard(
                      checkBox: Theme(
                        child: Radio(
                          groupValue: checkBoxValue[1],
                          onChanged: (value) => setState(
                                () {
                                  checkBoxValue[1] = value;
                                  checkBoxValue[0] = false;
                                }
                          ),
                        ),
                        data: ThemeData(

                          // inputDecorationTheme: InputDecorationTheme(
                          //
                          // ),
                          primarySwatch: Colors.green,
                          unselectedWidgetColor: Colors.white, // Your color
                        ),
                      ),
                      cardNumber: cardNumber,
                      cardExpiry: expiryDate,
                      cardHolderName: cardHolderName,
                      cvv: cvv,
                      bankName: "Bank",
                      showBackSide: showBack,
                      frontBackground: CardBackgrounds.grey,
                      backBackground: CardBackgrounds.white,
                      cardType: CardType.masterCard,
                      showShadow: true,

                    ),
                    SizedBox(height: 20,),
                    // padding: const EdgeInsets.only(left:20),
                    Padding(
                      padding: const EdgeInsets.only(left:20,right: 20),
                      child: Container(
                        height: 60,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.all(Radius.circular(5))
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(Icons.add,color: Colors.black,),
                            SizedBox(width: 2,),
                            Text("Add Cards",style: TextStyle(fontSize: 17,fontFamily: 'opsr',fontWeight: FontWeight.bold),),
                          ],
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
