import 'package:flutter/material.dart';




class BookingIDS extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    int pageIndex = 3;



    return Scaffold(
      backgroundColor: Colors.grey[200],

      body: Stack(

        children: <Widget>[

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
          Padding(
            padding: const EdgeInsets.only(left:18.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(height: 20,),
                Row(
                  children: [
                    SizedBox(width: 10,),
                    InkWell(
                        onTap: ()=>{
                          Navigator.pop(context)
                        },
                        child: Icon(Icons.arrow_back_ios,)
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left:5.0),
                      child: Text("Booking ID# F55848", style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18),),
                    ),

                    // searchAnimate(),
                  ],
                ),

                SizedBox(height: 50,),


                Row(

                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(8.0),
                      height: 30,
                      width: 30,
                      child: Icon(Icons.check,color: Colors.white,),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:pageIndex >= 0 ?  Border.all(color: Colors.red, width: 2):Border.all(color:Colors.grey , width: 2),
                          color: pageIndex >= 0  ? Colors.red : Colors.white),
                    ),

                    Container(
                      margin: EdgeInsets.only(left:8.0),
                      width: MediaQuery.of(context).size.width/1.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text('Pool Professional',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                              Spacer(),

                              Text('View',style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w400,color: pageIndex ==1  ?Colors.red : Colors.black ),),

                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0,right: 10.0),
                            child: Text('Your order #212423 was placed on 23th November 2020.'),
                          )
                        ],
                      ),
                    ),

                  ],
                ),
                 Container(
                   height: 70,
                  width: 2,
                  color: Colors.grey,
                  margin: const EdgeInsets.only(left: 20.0, ),
                 ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(8.0),
                      height: 30,
                      width: 30,
                      child: Icon(Icons.check,color: Colors.white,),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:pageIndex > 1  ?  Border.all(color: Colors.red, width: 2):Border.all(color:Colors.grey , width: 2),
                          color: pageIndex > 1  ? Colors.red : Colors.white),
                    ),

                    Padding( padding: EdgeInsets.only(top:0.0),
                      child: Container(
                        margin: EdgeInsets.only(left:8.0),
                        width: MediaQuery.of(context).size.width/1.5,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Text('Processing',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                                Spacer(),

                                Text('Cancel',style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w400,color: pageIndex ==2?Colors.red: Colors.black ),),

                              ],
                            ),
                            Padding(
                              padding: EdgeInsets.only(top: 10.0,right: 10.0),
                              child: Text('Your order still needs to be processed by our store before sending it to you.'),
                            )
                          ],
                        ),
                      ),
                    )

                  ],
                ),
                Container(
                  height: 70,
                  width: 2,
                  color: Colors.grey,
                  margin: const EdgeInsets.only(left: 20.0, ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(8.0),
                      height: 30,
                      width: 30,
                      child: Icon(Icons.check,color: Colors.white,),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:pageIndex > 2  ?  Border.all(color: Colors.red, width: 2):Border.all(color:Colors.grey , width: 2),
                          color: pageIndex > 2 ? Colors.red : Colors.white),
                    ),

                    Container(
                      margin: EdgeInsets.only(left:8.0),
                      width: MediaQuery.of(context).size.width/1.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text('Picked up',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                              Spacer(),

                              Text('',style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w400,color: pageIndex ==3?Colors.red : Colors.black ),),

                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0,right: 10.0),
                            child: Text('Your order has been picked up by one of our couriers and its on your way.'),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 70,
                  width: 2,
                  color: Colors.grey,
                  margin: const EdgeInsets.only(left: 20.0, ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(8.0),
                      height: 30,
                      width: 30,
                      child: Icon(Icons.check,color: Colors.white,),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:pageIndex > 3  ?  Border.all(color: Colors.red, width: 2):Border.all(color:Colors.grey , width: 2),
                          color: pageIndex > 3  ? Colors.red : Colors.white),
                    ),

                    Container(
                      margin: EdgeInsets.only(left:8.0),
                      width: MediaQuery.of(context).size.width/1.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text('Delivering',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                              Spacer(),

                              Text('',style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w400,color: pageIndex >3?Colors.red: Colors.black ),),

                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0,right: 10.0),
                            child: Text('The package is on your way. Make sure to be at the location to meet the courier.'),
                          )
                        ],
                      ),
                    ),
                  ],
                ),Container(
                  height: 70,
                  width: 2,
                  color: Colors.grey,
                  margin: const EdgeInsets.only(left: 20.0, ),
                ),
                Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.all(8.0),
                      height: 30,
                      width: 30,
                      child: Icon(Icons.check,color: Colors.white,),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border:pageIndex >4 ?  Border.all(color: Colors.red, width: 2):Border.all(color:Colors.grey , width: 2),
                          color: pageIndex >4 ? Colors.red : Colors.white),
                    ),

                    Container(
                      margin: EdgeInsets.only(left:8.0),
                      width: MediaQuery.of(context).size.width/1.5,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text('Delivered',style: TextStyle(fontSize: 20.0,fontWeight: FontWeight.bold),),
                              Spacer(),

                              Text('Tip Deliver',style: TextStyle(fontSize: 10.0,fontWeight: FontWeight.w400,color: pageIndex == 5?Colors.red : Colors.black ),),

                            ],
                          ),
                          Padding(
                            padding: EdgeInsets.only(top: 10.0,right: 10.0),
                            child: Text('It seems like the package has arrived to you. Hope you are happy with it!'),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }


}
