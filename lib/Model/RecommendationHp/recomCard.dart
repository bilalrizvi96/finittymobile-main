import 'package:charles_app/Model/RecommendationHp/recomList.dart';
import 'package:flutter/material.dart';

class RecommendedCard extends StatefulWidget {
  final Recommended recommended;
  final int ind;

  const RecommendedCard({Key key, this.ind, this.recommended})
      : super(key: key);
  @override
  Recommendedone createState() => Recommendedone(this.recommended);
}

class Recommendedone extends State<RecommendedCard> {
  final Recommended recommended;
  @override
  void initState() {
    // TODO: implement initState

    // img(image);

    super.initState();
    //img(image);
  }

  Recommendedone(this.recommended);
  String img(image) {
    return image;
  }

//  Function ontap(){
//    Navigator.of(context).push(MaterialPageRoute(builder:(_)=>check()));
//  }
  @override
  Widget build(BuildContext context) {
    var _counter;
    return Container(
      padding: EdgeInsets.only(left: 10, bottom: 5),
      margin: EdgeInsets.only(right: 20),
      height: MediaQuery.of(context).size.height / 1.1,
      width: MediaQuery.of(context).size.width / 1.5,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
        color: recommended.color,
        // image: DecorationImage(
        //   image: AssetImage(recommended.image1),
        //   // image: const DecorationImage(
        //   //   image:Image.asset(name);
        //   fit: BoxFit.cover,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.only(right:20, top:10),
            child: Align(
              alignment: Alignment.topRight,
              child: Container(
                height: MediaQuery.of(context).size.height / 12,
                child: Image.asset(recommended.image1),
              ),
            ),
          ),
          Container(
              height: MediaQuery.of(context).size.height / 14,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                Text(
                  recommended.text,
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                       fontFamily: 'opsb'),
                  textAlign: TextAlign.center,
                ),
                Text(
                  recommended.text2,
                  style: TextStyle(
                      fontSize: 10,
                      color: Colors.white,
                      fontFamily: 'opsb'),
                  textAlign: TextAlign.center,
                )
              ]))
        ],
      ),
    );
  }
}