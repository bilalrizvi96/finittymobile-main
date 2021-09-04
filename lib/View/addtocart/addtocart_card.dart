import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';

import 'addtocart.dart';





class Addtocart_Card extends StatefulWidget {
  final AddtoCarts addtocarts;
  final int ind;

  const Addtocart_Card({Key key,this.ind, this.addtocarts}) : super(key: key);
  @override
  Addtocart_Cards createState() => Addtocart_Cards(this.addtocarts);

}
class Addtocart_Cards extends State<Addtocart_Card> {

  final AddtoCarts addtocarts;
  @override
  void initState() {
    // TODO: implement initState

    // img(image);


    super.initState();
    //img(image);

  }
  Addtocart_Cards(this.addtocarts);
  String img(image)
  {
    return image;
  }

//  Function ontap(){
//    Navigator.of(context).push(MaterialPageRoute(builder:(_)=>check()));
//  }
  @override
  Widget build(BuildContext context) {
    var _counter;
    return Padding(
      padding: EdgeInsets.all(10),
        //  padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Container(

          child: Card(
            color: Color(0xfffafafa),
              elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomRight: Radius.circular(5),
                  bottomLeft: Radius.circular(5),
                  topRight: Radius.circular(5),
                  topLeft: Radius.circular(5)),

            ),


              child: Stack(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:15,top: 10),
                    child: Row(
                    //  mainAxisAlignment: MainAxisAlignment.start,
               //       crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                           Container(
                             height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              image: DecorationImage(
                                image: AssetImage(
                                  addtocarts.image,
                                ),
                                fit: BoxFit.cover,
                              )
                            ),
                          ),
                        Padding(
                          padding: const EdgeInsets.only(top:3.0,left: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Padding(
                                padding: EdgeInsets.only(bottom: 5),
                                child: Text(
                                  addtocarts.name,
                                  textAlign: TextAlign.left,
                                  style: TextStyle(fontSize: 15.0,fontWeight: FontWeight.bold,color: Colors.black),
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: <Widget>[
                                  Row(

                                    children: <Widget>[

                                      Text("2 mins ago" ,style: TextStyle(fontSize: 11.0,color: Colors.black26))
                                      ]),

                                    ],
                                  ),

                            ],
                          ),
                        ),
                        Spacer(),
                        Icon(Icons.keyboard_arrow_down,color: Colors.grey),
                        SizedBox(width: 15,)
                      ]

                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left:15,top:60),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          addtocarts.textt,
                            style: TextStyle(color: Colors.black45)
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15,top:80),
                    child: Container(
                      height: MediaQuery.of(context).size.height/7,
                      width: MediaQuery.of(context).size.width/1.2,
                      child: Image.asset(addtocarts.uploadimage,
                      fit: BoxFit.cover,),
                      // decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(40),
                      //
                      // ),




                    ),
                  ),
                   //TextField
                  // Padding(
                  //   padding: const EdgeInsets.only(left: 15,top:80),
                  //   child: Container(
                  //
                  //    child:Text("We are going to fly in the End.")
                  //
                  //   ),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(left:15,right: 8,top: 200,bottom: 5),
                    child: Row(
                      children: [
                        Icon(Icons.share,color: Colors.grey,),
                        SizedBox(width: 150,),
                        Text("123"),
                        SizedBox(width: 5,),
                        Icon(Icons.comment,color: Colors.grey,),
                        SizedBox(width: 20,),
                        Text("123"),
                        SizedBox(width: 5,),
                        Icon(Icons.favorite_border,color: Colors.grey,),

                      ],
                    ),
                  )


                ],
              ),


          ),
        )

    );
  }

}

