import 'package:charles_app/BaseUrl/variableGloable.dart';
import 'package:charles_app/muben/carddetails.dart';
import 'package:charles_app/muben/paymentmethod.dart';
import 'package:circular_check_box/circular_check_box.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SelectCard extends StatefulWidget {
  Function set;
  SelectCard({this.set});
  @override
  _SelectCardState createState() => _SelectCardState();
}

class _SelectCardState extends State<SelectCard> {
  String expiryDate = "01/2025";
  bool selected1 = false;
void set()
{
  setState(() {

  });
}
  Stack _buildLogosBlock({@required Color color}) {
    return Stack(
      children: [

        Container(
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
                      color: color == Color(0xffFF0000)
                          ? Colors.white
                          : Colors.black,
                      fontSize: 10.0,
                      fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Card _buildCreditCard(
      {@required Color color,
        @required String cardNumber,
        @required String cardHolder}) {
    return Card(
      elevation: 2.0,
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
                  color == Color(0xffFF0000) ? Colors.white : Colors.black,
                  fontSize: 20,
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
                            color: color == Color(0xffFF0000)
                                ? Colors.white
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
                            color: color == Color(0xffFF0000)
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

  Widget _addCard() {
    return InkWell(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => DetailsCard(set: set,),
            ));
      },
      child: Container(
        width: double.infinity,
        height: 70.0,
        child: Card(
            elevation: 2.0,
            shadowColor: Colors.grey,
            // shadowColor: Color(0xff00000014),
            child: Padding(
              padding: const EdgeInsets.only(top: 18,left: 10),
              child: Text(
                "+  Add Card",
                style: TextStyle(
                    fontFamily: "Open Sans Bold",
                    color: Color(0xff454545),
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold),
              ),
            )),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xffFFFFFF),
        body: SingleChildScrollView(
            child: Container(
              height: MediaQuery.of(context).size.height,
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
                          margin: EdgeInsets.only(top: 38.0),
                          child: Row(
                            children: [
                              InkWell(
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  color: Color(0xff454545),
                                ),
                                onTap: (){
                                  widget.set();
                                  Navigator.of(context).pop();
                                },
                              ),
                              SizedBox(width: 10,),


                              Text(
                                "Select Card",
                                style: TextStyle(
                                    color: Color(0xff454545),
                                    fontFamily: "Open Sans Bold",
                                    fontSize: 22.0,fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 35.0),
                        card.isNotEmpty?  Container(
                          height: MediaQuery.of(context).size.height/1.5,
                          child: ListView.builder(
                              itemCount: card.length,
                              itemBuilder: (_,index){

                            return InkWell(
                              onTap: (){
                                setState(() {
                                  cardindex=index;
                                  for(int i =0; i< card.length; i++){
                                    if(i == index)
                                    {
                                      if(card[i].selected == true){
                                        card[i].selected = false;
                                      }else{
                                       card[i].selected = true;
                                      }
                                    }
                                    else{
                                      card[i].selected = false;
                                    }
                                  }
                                });
                                if(card[index].selected==true){
                                  crdnum=card[index].cardno;
                                  crdexp=card[index].cardexp;
                                  crdcvc=card[index].cardcvc;
                                  selec=card[index].selected;
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (_) => PaymentMethod(),
                                      ));
                                 // Navigator.pop(context);
                                  // PaymentMethod()
                                }
                              },
                              child:_buildCreditCard(
                                  color:card[index].selected==true? Color(0xffFF0000):Color(0xFFBCBDC1),
                                  cardHolder: "Ugur Ates",
                                  cardNumber:card[index].cardno)
                            );
                          }),
                        ):
                        Text('Add Your Card Please',style: TextStyle(fontSize: 25,color: Colors.black),),
                        // _buildCreditCard(
                        //     color: Color(0xffFF0000),
                        //     cardHolder: "Ugur Ates",
                        //     cardNumber: "1234 5783 1231 9123"),
                        // SizedBox(height: 8.0),
                        // _buildCreditCard(
                        //     color: Color(0xffE1E1E1),
                        //     cardHolder: "Ugur Ates",
                        //     cardNumber: "1234 5783 1231 9123"),
                        // SizedBox(height: h * 0.0165),
                        _addCard(),
                  //      SizedBox(height: h * 0.184),

                      ],
                    ),
                  ),
                ],
              ),
            )),
        bottomNavigationBar:
        Container(
          padding: EdgeInsets.only(bottom: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "SELECT ANY CARD",
                style: TextStyle(

                    color: Color(0xff454545),
                    fontFamily: "Open Sans Bold",
                    fontSize: 12.0,fontWeight: FontWeight.bold),
              ),
              // SizedBox(height: 10,)

            ],
          ),
        ),

      ),
    );
  }
}