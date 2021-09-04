import 'package:charles_app/BaseUrl/variableGloable.dart';
import 'package:charles_app/Model/Cleaning/cleaningList.dart';
import 'package:charles_app/View/splash.dart';
import 'package:charles_app/muben/orderconfirmation.dart';
import 'package:flutter/material.dart';

class DetailsCard extends StatefulWidget {

  Function set;
  DetailsCard({this.set});
  @override
  _DetailsCardState createState() => _DetailsCardState();
}
class _DetailsCardState extends State<DetailsCard> {
  String expiryDate = "01/2025";
  bool selected = true;
  addCard(){
   card.add(
      CardDetails(cardno: cardnumber.text,cardcvc: cvc.text,cardexp: expdate.text,selected: false)
    );
   widget.set();
   final String
   encodedData =
   CardDetails.encodeMusics(card);
   SplashTest.sharedPreferences.setString("creditcard",
       encodedData);
  }

  Container _buildLogosBlock({@required Color color}) {
    return Container(
      margin: EdgeInsets.only(top: 30.5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(left: 30.5),
            child: Image.asset(
              "lib/assets/chip.png",
              width: 30.72,
              height: 20.56,
              fit: BoxFit.cover,
            ),
          ),
          Container(
            margin: EdgeInsets.only(right: 32.03),
            child: Text(
              expiryDate,
              style: TextStyle(
                  fontFamily: "Avenir Book",
                  color: color == Color(0xff61626C)
                      ? Color(0xffF7F7F7)
                      : Colors.black,
                  fontSize: 10.0,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
      ),
    );
  }

  Card _buildCreditCard(
      {@required Color color,
        @required String cardNumber,
        @required String cardHolder}) {
    return Card(
      elevation: 4.0,
      color: color,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(14),
      ),
      child: Container(
        height: 190,
        width: 350,
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 19.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _buildLogosBlock(color: color),
            Padding(
              padding: const EdgeInsets.only(left: 28.86, top: 16.0),
              child: Text(
                '$cardNumber',
                style: TextStyle(
                  color:
                  color == Color(0xff61626C) ? Colors.white : Colors.black,
                  fontSize: 22,
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Container(
                      padding: const EdgeInsets.only(left: 28.86, top: 16.0),
                      child: Text(
                        'Card Holder',
                        style: TextStyle(
                            fontFamily: "Avenir Book",
                            color: color == Color(0xff61626C)
                                ? Color(0xffF7F7F7)
                                : Colors.black,
                            fontSize: 9,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Container(
                      padding: const EdgeInsets.only(left: 28.86, top: 16.0),
                      child: Text(
                        '$cardHolder',
                        style: TextStyle(
                            fontFamily: "Avenir Heavy",
                            color: color == Color(0xff61626C)
                                ? Colors.white
                                : Colors.black,
                            fontSize: 15,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(right: 30.27),
                  child: Image.asset(
                    "lib/assets/mastercard.png",
                    height: 50,
                    width: 50,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    cardnumber.clear();
    cvc.clear();
    expdate.clear();
  }
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        body: SingleChildScrollView(
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
                  margin: EdgeInsets.symmetric(horizontal: 20.0),
                  child: Column(
                    children: [
                      Container(
                        margin: EdgeInsets.only(top: 38.0),
                        child: Row(
                          children: [
                            IconButton(
                                iconSize: 30.0,
                                icon: Icon(
                                  Icons.navigate_before,
                                  color: Color(0xff454545),
                                ),
                                onPressed: (){Navigator.of(context).pop();}),
                            Text(
                              "Select Card",
                              style: TextStyle(
                                  color: Color(0xff454545),
                                  fontFamily: "Open Sans Bold",
                                  fontSize: 22.0),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(height: 25.0),
                      _buildCreditCard(

                          color: Color(0xff61626C),
                          cardHolder: "Ugur Ates",
                          cardNumber: "1234 5783 1231 9123"),
                      SizedBox(height: 29.5),
                      Container(
                          width: MediaQuery.of(context).size.width*0.83,
                          height: 56,
                          child: new Theme(
                            data: new ThemeData(
                              primaryColor: Colors.grey,
                              primaryColorDark: Colors.grey,
                            ),
                            child: new TextFormField(
                              keyboardType:TextInputType.number,
                              controller: cardnumber,
                              // validator: (value) {
                              //   if (value.isEmpty) {
                              //     return 'Enter First Name';
                              //   }
                              //   return null;
                              // },
                              decoration: new InputDecoration(
                                enabledBorder: OutlineInputBorder(
                                  borderSide:
                                  BorderSide(color: Colors.grey, width: 0.5),
                                ),
                                border: new OutlineInputBorder(
                                    borderSide: new BorderSide(color: Colors.grey)),
                                hintText: '1234 **** **** 5678',
                                labelText: 'Card Number',

                              ),
                            ),
                          )),
                      SizedBox(
                        height: 12.0,
                      ),
                      Container(margin: EdgeInsets.symmetric(horizontal: 12),
                        child: Row(
                          children: [
                            Container(
                              //margin: EdgeInsets.only(left: 5.0),
                                width: MediaQuery.of(context).size.width*0.45,
                                height: 56,
                                child: new Theme(
                                  data: new ThemeData(
                                    primaryColor: Colors.grey,
                                    primaryColorDark: Colors.grey,
                                  ),
                                  child: new TextFormField(
                                    keyboardType:TextInputType.number,
                                    controller: expdate,
                                    // validator: (value) {
                                    //   if (value.isEmpty) {
                                    //     return 'Enter First Name';
                                    //   }
                                    //   return null;
                                    // },
                                    decoration: new InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                        borderSide:
                                        BorderSide(color: Colors.grey, width: 0.5),
                                      ),
                                      border: new OutlineInputBorder(
                                          borderSide:
                                          new BorderSide(color: Colors.grey)),
                                      hintText: 'MM -- YY',
                                      labelText: 'Exp Date',
                                    ),
                                  ),
                                )),
                            Spacer(),
                            Container(
                              height: 56.0,
                              width: MediaQuery.of(context).size.width*0.34,
                              child: new Theme(
                                data: new ThemeData(
                                  primaryColor: Colors.grey,
                                  primaryColorDark: Colors.grey,
                                ),
                                child: new TextFormField(
                                  keyboardType:TextInputType.number,
                                  controller: cvc,
                                  // validator: (value) {
                                  //   if (value.isEmpty) {
                                  //     return 'Enter First Name';
                                  //   }
                                  //   return null;
                                  // },
                                  decoration: new InputDecoration(
                                    enabledBorder: OutlineInputBorder(
                                      borderSide:
                                      BorderSide(color: Colors.grey, width: 0.5),
                                    ),
                                    border: new OutlineInputBorder(
                                        borderSide: new BorderSide(color: Colors.grey)),
                                    hintText: '103',
                                    labelText: 'CVC CODE',
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 287.0,
                      ),

                    ],
                  ),
                ),
              ],
            )),
        bottomNavigationBar: Container(
          margin: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
          height: 40.0,
          width: double.infinity,
          child: RaisedButton(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(6.0),
              ),
              child: Text(
                "Save",
                style: TextStyle(
                  color: Color(0xffFFFFFF),
                ),
              ),
              color: Color(0xFFFF0000),
              onPressed: () {

                addCard();
                Navigator.pop(context);
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (_) => OrderConfirmation(),
                //     ));
              }),
        ),

      ),
    );
  }
}