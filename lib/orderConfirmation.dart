import 'package:flutter/material.dart';

class OrderConfirmation extends StatefulWidget {
  @override
  _OrderConfirmationState createState() => _OrderConfirmationState();
}

class _OrderConfirmationState extends State<OrderConfirmation> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(30),
                child: Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    height: 150,
                    width: 150,
                    child: Image(image: AssetImage('assets/jahaz.png',)
                    ),
                  ),
                ),
              ),

              Column(
                  children: [
                    Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Container(
                          width: 250,
                          child: Row(
                            children: const <Widget>[
                              Icon(
                                Icons.arrow_back_ios,
                                color: Colors.black,
                                size: 20.0,
                              ),
                              Text('Order Confirmation',style: TextStyle( fontSize: 24)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:25),
                      child: InkWell(
                        onTap: ()
                        {
//                        Navigator.push(
//                          context,
////                          MaterialPageRoute(builder: (context) => Select()),
//                        );
                        },
                        child: Container(
                            height: 200,
                            child: Image(
                                image: AssetImage('assets/masterC.png',)
                            )
                        ),
                      ),
                    ),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.only(top: 180),
                          child: Container(
                            width: 200,
                            color: Colors.grey[200],
                            child: TextFormField(
                              decoration: new InputDecoration(
                                hintText: 'Apply Coupon...',
                                contentPadding: EdgeInsets.all(8),
                                isDense: true,
                                border: new OutlineInputBorder(
                                    borderSide: new BorderSide(color: Colors.grey)
                                ),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 173,),
                          child: RaisedButton(
                            textColor: Colors.white,
                            color: Color.fromRGBO(53, 59, 81, 1),
                            onPressed: () {},
                            child: const Text('Apply', style: TextStyle(fontSize: 18)),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Align(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 60),
                              child: Text('Cleaning - 1 Bag',style: TextStyle( fontSize: 11)),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 60),
                              child: Text(r'30$',style: TextStyle( fontSize: 11)),
                            ),

                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: Align(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 60),
                              child: Text('Coupon',style: TextStyle( fontSize: 11,color: Colors.grey[400])),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 60),
                              child: Text(r'- - -',style: TextStyle( fontSize: 11,color: Colors.grey[400])),
                            ),

                          ],
                        ),
                      ),
                    ),

                    Padding(
                      padding: const EdgeInsets.only(top: 7),
                      child: Align(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 60),
                              child: Text('Tax',style: TextStyle( fontSize: 11),),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 60),
                              child: Text(r'2$',style: TextStyle( fontSize: 11)),
                            ),

                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 15),
                      child: Align(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 60),
                              child: Text('Total',style: TextStyle( fontSize: 20,fontWeight: FontWeight.bold)),
                            ),
                            Spacer(),
                            Padding(
                              padding: const EdgeInsets.only(right: 60),
                              child: Text(r'32$',style: TextStyle( fontSize: 20,fontWeight: FontWeight.bold)),
                            ),
                          ],
                        ),
                      ),
                    ),

                    Align(
                      alignment: Alignment.bottomCenter,
                      child: Container(
                        width: 300,
                        child: RaisedButton(
                          child: Text("CONTINUE"),
                          color: Color(0xff0091EA),
                          textColor: Colors.white,
                        ),
                      ),
                    ),
                  ]

              ),
            ]),
      ),
    );
  }
}