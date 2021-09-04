
import 'package:charles_app/View/Laundry/Laundryclass.dart';
import 'package:charles_app/widgets/widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';






class laundry_Card extends StatefulWidget {
  final laundry caring;
  final int index;

  const laundry_Card({Key key,this.index, this.caring}) : super(key: key);
  @override
  laundry_Cards createState() => laundry_Cards(this.caring,this.index);

}
class laundry_Cards extends State<laundry_Card> {

  final laundry caring;
  final int index;
  @override

  laundry_Cards(this.caring,this.index);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: index == 0? EdgeInsets.only(left:30,): EdgeInsets.only(left:0),
      child: Container(
        width: 150,
        child: Card(
           color: caring.clr,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10)

          ),


          child: Padding(
            padding: const EdgeInsets.only(bottom:8.0,left: 8),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top:25.0),
                  child: Align(
                    alignment: Alignment.topCenter,
                    child: Image.asset(
                      caring.cImg,
                      height: MediaQuery.of(context).size.height / 10,
                      width: 100,
                    ),
                  ),
                ),

                Spacer(),
                Text(
                  caring.title,
                  textAlign: TextAlign.left,
                  style: Styles().openBold(size: 18.0,color: Colors.white),
                ),
                Padding(
                  padding: const EdgeInsets.only(top:0.0),
                  child: Text(
                      caring.subText,
                      style: Styles().openBold(size: 10.0,color: Colors.white),
                  ),
                ),
              ],
              ),
          ),
        ),
      ),
    );
  }

}

