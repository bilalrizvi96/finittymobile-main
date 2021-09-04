import 'package:charles_app/BaseUrl/variableGloable.dart';
import 'package:charles_app/muben/carddetails.dart';
import 'package:charles_app/muben/selectcard.dart';
import 'package:charles_app/muben/orderconfirmation.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         buttonColor: Color(0xffFF0000),
//         primaryColor: Color(0xffFF0000),
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       initialRoute: '/',
//       // routes: {
//       //   '/': (context) => Page6(),
//       //   '/page6': (context) => Page6(),
//       //   '/messages': (context) => Messeges(),
//       //   '/page18': (context) => Page18(),
//       //   '/page39': (context) => Page39(),
//       //   '/page40': (context) => Page40(),
//       //   '/page45': (context) => Page45(),
//       //   '/page46': (context) => Page46(),
//       // },
//     );
//   }
// }

class PaymentMethod extends StatefulWidget {
  PaymentMethod({
    Key key,
  }) : super(key: key);

  @override
  _PaymentMethodState createState() => _PaymentMethodState();
}

class _PaymentMethodState extends State<PaymentMethod> {
  String expiryDate = "01/2025";
  bool _viewdetails = false;
  String _total = "20\$";
  void set()
  {
    setState(() {

    });
  }
  GestureDetector _buildCreditCard(
      {@required Color color,
      @required String cardNumber,
      @required String cardHolder}) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (_) => SelectCard(set: set,),
            ));
      },
      child: Card(
        elevation: 4.0,
        color: color,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(14),
        ),
        child: Container(
          height: 200,
          width: 350,
          padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              _buildLogosBlock(),
              Padding(
                padding: const EdgeInsets.only(left: 28.86, top: 16.0),
                child: Text(
                  '$cardNumber',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  _buildDetailsBlock(
                    label: 'Card Holder',
                    value: cardHolder,
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
      ),
    );
  }

  Column _buildDetailsBlock({@required String label, @required String value}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Container(
          padding: const EdgeInsets.only(left: 28.86, top: 16.0),
          child: Text(
            '$label',
            style: TextStyle(
                color: Colors.grey, fontSize: 9, fontWeight: FontWeight.bold),
          ),
        ),
        Container(
          padding: const EdgeInsets.only(left: 28.86, top: 16.0),
          child: Text(
            '$value',
            style: TextStyle(
                fontFamily: "Avenir Heavy",
                color: Colors.white,
                fontSize: 15,
                fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }

  Container _buildLogosBlock() {
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
              "01/2025",
              style: TextStyle(
                  fontFamily: "Avenir Book",
                  color: Color(0xffF7F7F7),
                  fontSize: 10.0,
                  fontWeight: FontWeight.bold),
            ),
          )
        ],
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
               height: 800,
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
                            onTap: () {
                              Navigator.of(context).pop();
                            },
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Payment Method",
                            style: TextStyle(
                                color: Color(0xff454545),
                                fontFamily: "Open Sans Bold",
                                fontSize: 22.0,
                                fontWeight: FontWeight.bold),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 35.0),
                    _buildCreditCard(
                        color: Color(0xffFF0000),
                        cardHolder: "Ugur Ates",
                        cardNumber: selec==false ? "Add a card" : crdnum),
                    SizedBox(height: 8.0),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (_) => DetailsCard(),
                            ));
                      },
                      child: Container(
                        alignment: Alignment.topRight,
                        child: Text(
                          "Update Payment Method ",
                          style: TextStyle(
                              color: Color(0xff454545),
                              fontFamily: "Open Sans Semibold",
                              fontSize: 12.0),
                        ),
                      ),
                    ),
                    SizedBox(height: h * 0.10),
                    Container(
                      width: double.infinity,
                      height: 40.0,
                      child: TextField(
                        controller: coupon,
                        //maxLines: 2,
                        decoration: InputDecoration(
                            hintStyle: TextStyle(
                                //height: 10,
                                fontFamily: "Open Sans",
                                fontSize: 16.0,
                                color: Color(0xff737680)),
                            enabledBorder: InputBorder.none,
                            fillColor: Color(0xffF8F9FA),
                            filled: true,
                            border: new OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffEEEEEE)),
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(6.0),
                              ),
                            ),
                            hintText: "Apply Coupon...",
                            suffixIcon: RaisedButton(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                child: Text(
                                  "Apply",
                                  style: TextStyle(
                                    color: Color(0xffFFFFFF),
                                  ),
                                ),
                                color: Color(0xff5E605F),
                                onPressed: () {})),
                      ),
                    ),
                    SizedBox(height: h * 0.05),
                    Container(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Order Details",
                            style: TextStyle(
                                fontFamily: "Open Sans Bold",
                                fontSize: 24.0,
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(height: h * 0.015),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Date",
                                style: TextStyle(
                                    fontSize: 14.0, color: Color(0xff999999)),
                              ),
                              Text(
                                  selectTime.toString() + " " + selectDate,
                                style: TextStyle(
                                    fontSize: 14.0, color: Color(0xff999999)),
                              ),
                            ],
                          ),
                          SizedBox(height: h * 0.005),
                          Padding(
                            padding: const EdgeInsets.only(left: 20,right: 20),
                            child: Divider(),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Loaction",
                                style: TextStyle(
                                    fontSize: 14.0, color: Color(0xff999999)),
                              ),
                              Spacer(),
                              Container(
                                width: MediaQuery.of(context).size.width/2,
                                child: Text(
                                  first == null
                                      ? 'Address'
                                      : first.toString(),
                                  style: TextStyle(
                                      fontSize: 14.0, color: Color(0xff999999)),
                                  maxLines: 2,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: h * 0.015),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Service Details",
                                style: TextStyle(
                                    fontFamily: "Open Sans Semibold",
                                    fontSize: 20.0,
                                    fontWeight: FontWeight.bold),
                              ),
                              GestureDetector(
                                onTap: () {
                                  // if(_viewdetails==false){
                                  //   setState(() {
                                  //     _viewdetails=true;
                                  //     _total="22\$";
                                  //   });
                                  // }
                                  // }else if(_viewdetails==true){
                                  //   setState(() {
                                  //     _viewdetails=false;
                                  //     _total="20\$";
                                  //   });
                                  // }
                                },
                                child: Text(
                                  _viewdetails == false
                                      ? "View Details"
                                      : "Hide Details",
                                  style: TextStyle(
                                      fontFamily: "Open Sans Semibold",
                                      fontSize: 16.0,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFFF0000)),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: h * 0.010),
                          Visibility(
                            visible: _viewdetails,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Laundry",
                                      style: TextStyle(
                                          fontFamily: "Open Sans",
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                                SizedBox(height: h * 0.010),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      vl.title.toString(),
                                      style: TextStyle(
                                          fontSize: 10.0,
                                          color: Color(0xff454545)),
                                    ),
                                    Text(
                                      money.toString(),
                                      style: TextStyle(
                                          fontSize: 10.0,
                                          color: Color(0xff454545)),
                                    ),
                                  ],
                                ),
                                SizedBox(height: h * 0.005),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "+ Belts",
                                      style: TextStyle(
                                          fontSize: 10.0,
                                          color: Color(0xff454545)),
                                    ),
                                    Text(
                                      "2",
                                      style: TextStyle(
                                          fontSize: 10.0,
                                          color: Color(0xff454545)),
                                    ),
                                  ],
                                ),
                                SizedBox(height: h * 0.005),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "+ Shoes",
                                      style: TextStyle(
                                          fontSize: 10.0,
                                          color: Color(0xff454545)),
                                    ),
                                    Text(
                                      "3",
                                      style: TextStyle(
                                          fontSize: 10.0,
                                          color: Color(0xff454545)),
                                    ),
                                  ],
                                ),
                                SizedBox(height: h * 0.010),
                              ],
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "Charges",
                                style: TextStyle(
                                    fontFamily: "Open Sans",
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                          SizedBox(height: h * 0.010),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                vl.title.toString(),
                                style: TextStyle(
                                    fontSize: 14.0, color: Color(0xff454545)),
                              ),
                              Text(
                                money.toString(),
                                style: TextStyle(
                                    fontSize: 14.0, color: Color(0xff454545)),
                              ),
                            ],
                          ),
                          SizedBox(height: h * 0.005),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Coupon",
                                style: TextStyle(
                                    fontSize: 14.0, color: Color(0xff454545)),
                              ),
                              Text(
                                "--",
                                style: TextStyle(
                                    fontSize: 14.0, color: Color(0xff454545)),
                              ),
                            ],
                          ),
                          SizedBox(height: h * 0.005),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Tax",
                                style: TextStyle(
                                    fontSize: 14.0, color: Color(0xff454545)),
                              ),
                              Text(
                                "2\$",
                                style: TextStyle(
                                    fontSize: 14.0, color: Color(0xff454545)),
                              ),
                            ],
                          ),
                          SizedBox(height: h * 0.005),



                        ],
                      ),
                    ),
                    SizedBox(height: h * 0.005),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "Addons",
                          style: TextStyle(
                              fontFamily: "Open Sans",
                              fontSize: 14.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                    SizedBox(height: h * 0.005),
                    new Expanded(
                      child: ListView.builder(
                        itemCount: selectedaddonsList.length,
                        itemBuilder: (context, i){
                          return    Padding(
                            padding: const EdgeInsets.only(top: 3),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  selectedaddonsnameList[i].toString(),
                                  style: TextStyle(
                                      fontSize: 14.0, color: Color(0xff454545)),
                                ),
                                Text(
                                  selectedaddonspriceList[i].toString(),
                                  style: TextStyle(
                                      fontSize: 14.0, color: Color(0xff454545)),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ],
          )),
          bottomNavigationBar: Container(
            height: MediaQuery.of(context).size.width / 4.5,
            child: Stack(
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  padding: EdgeInsets.only(left: 35),
                  // margin: EdgeInsets.symmetric(horizontal: 10,vertical: 10),
                  height: MediaQuery.of(context).size.width / 8.4,
                  width: MediaQuery.of(context).size.width / 1.1,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Total",
                        style: TextStyle(
                            fontFamily: "Open Sans Bold",
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0,
                            color: Color(0xff454545)),
                      ),
                      Text(
                        // _viewdetails==false?"20\$":"22\$",
                        money.toString(),
                        style: TextStyle(
                            fontFamily: "Open Sans Bold",
                            fontWeight: FontWeight.bold,
                            fontSize: 24.0,
                            color: Color(0xff454545)),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  top: 10,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                    height: MediaQuery.of(context).size.width / 8.4,
                    width: MediaQuery.of(context).size.width / 1.2,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Color(0xFFFF0000)),
                    child: FlatButton(
                        onPressed: () {
                          if (card.isNotEmpty) {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (_) => OrderConfirmation(),
                                ));
                          }
                          else{
                            Fluttertoast.showToast(
                                msg: "Please Select Your Card Or Add Your Card",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 3,
                                backgroundColor: Color(0xFFFF0000),
                                textColor: Colors.white,
                                fontSize: 16.0);
                          }
                        },
                        child: Text(
                          "Continue",
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ),
              ],
            ),
          )

          // Container(
          //   margin: EdgeInsets.symmetric(horizontal: 30,vertical: 20),
          //   color: Colors.red,
          //   height: 36.0,
          //   width: double.infinity,
          //   child: RaisedButton(
          //       shape: RoundedRectangleBorder(
          //         borderRadius: BorderRadius.circular(6.0),
          //       ),
          //       child: Text(
          //         "CONTINUE",
          //         style: TextStyle(
          //           fontSize: 10.0,
          //           fontFamily: "Open Sans Bold",
          //           color: Color(0xffFFFFFF),
          //         ),
          //       ),
          //       color: Colors.red,
          //       onPressed: () {
          //         Navigator.push(
          //             context,
          //             MaterialPageRoute(
          //               builder: (_) => Page39(),
          //             ));
          //       }),
          // ),

          ),
    );
  }
}
