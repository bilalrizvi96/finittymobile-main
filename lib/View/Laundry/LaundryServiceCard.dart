
import 'package:charles_app/View/Laundry/Laundryclass.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';


import 'LaundryService.dart';





class laundryService_Card extends StatefulWidget {
  final laundryService caringg;
  final int ind;

  const laundryService_Card({Key key,this.ind, this.caringg, laundry laundry_zohair, Color clr}) : super(key: key);
  @override
  laundryService_Cards createState() => laundryService_Cards(this.caringg);

}
class laundryService_Cards extends State<laundryService_Card> {

  final laundryService caringg;
  @override

  laundryService_Cards(this.caringg);

  @override
  Widget build(BuildContext context) {
    return Container(
     width: 150,
      height: 120,
      child: Card(
        color: caringg.clr,
        elevation: 5,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomRight: Radius.circular(10),
              bottomLeft: Radius.circular(10),
              topRight: Radius.circular(10),
              topLeft: Radius.circular(10)),

        ),


        child: Padding(
          padding: const EdgeInsets.only(bottom:8.0,left: 8),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              Spacer(),
              Text(
                caringg.title,
                textAlign: TextAlign.left,
                style: TextStyle(fontSize: 18.0,color: Colors.white),
              ),

            ],
          ),
        ),
      ),
    );
  }

}

