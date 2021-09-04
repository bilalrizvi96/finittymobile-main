import 'package:charles_app/BaseUrl/variableGloable.dart';
import 'package:charles_app/Model/servicesHomePage/servicesList.dart';
import 'package:charles_app/View/Caring/CaringView.dart';
import 'package:charles_app/View/Cleaning/cleaningView.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:charles_app/Model/CardlistModel.dart';
import 'package:progress_dialog/progress_dialog.dart';


import '../CardlistModel.dart';
import 'servicesBuilder.dart';

class ServiceCard extends StatefulWidget {
  final Services services;
  final int ind;
  final bool flag;
  final int inde;

  const ServiceCard({Key key, this.ind, this.services, this.flag, this.inde}) : super(key: key);
  @override
  ServiceCards createState() => ServiceCards(this.services, this.ind ,this.flag, this.inde);
}

class ServiceCards extends State<ServiceCard> with TickerProviderStateMixin{
  final Services services;
  int index;
  final bool flag;
  final int inde;
  var namee = new List();
  var total = new List();
  var texttopposion = 40;
  @override
  void initState() {
    pr = new ProgressDialog(context);
    // TODO: implement initState

    // img(image);

    super.initState();

    //img(image);
  }

  ServiceCards(this.services, this.index, this.flag, this.inde);
  String img(image) {
    return image;
  }

//  Function ontap(){
//    Navigator.of(context).push(MaterialPageRoute(builder:(_)=>check()));
//  }
  Widget diff(){

    return index == Servicebuilder.indexx ?Container(
      //color: services.cardcolor,
      padding: EdgeInsets.symmetric(horizontal:5.0,vertical: 2.0),
      height: MediaQuery.of(context).size.height/1.2,
      width: MediaQuery.of(context).size.width/1.83,
      child: ListView.builder(
        itemCount:  services.namelist.length,
        itemBuilder: (BuildContext context, int index) {
          return Container(
            margin: EdgeInsets.only(top: 5),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(5),
              ),
              color: Colors.white,
            ),
            height:MediaQuery.of(context).size.height/25,
            child: Padding(
              padding: const EdgeInsets.only(left: 8.0 , right: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(

                      child: Flexible(child: Text(services.namelist[index],style: TextStyle(fontFamily: 'mmonm',fontSize: 14, fontWeight: FontWeight.w600)))),
                  Text(services.totalist[index]+" near you",style:TextStyle(fontFamily: 'mmonr',fontSize: 14)),
                ],
              ),
            ),
          );
        },
      ),
    ) :
    Container();
  }

  Widget image(){
    return index != Servicebuilder.indexx ? Container(
      //padding: EdgeInsets.only(top: 30),
      alignment: Alignment.topCenter,
      width: MediaQuery.of(context).size.width / 2.12,
      height: MediaQuery.of(context).size.height,
      child: Image.asset(services.image1),
    ): Container(
      alignment: Alignment.topCenter,
      width: MediaQuery.of(context).size.width / 2.12,
      height: MediaQuery.of(context).size.height,
      child: Image.asset(services.image1),
    );

  }

  Widget text(){
    return index != Servicebuilder.indexx ? Positioned(
    top:180,
      child: Container(

        // height: MediaQuery.of(context).size.height,
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 8.0,),
                  child: Text(
                    services.text,
                    style: TextStyle(
                        fontFamily: 'mmonb',
                        color: Colors.white,
                        fontSize: 25),
                  ),
                ),
                SizedBox(height: 20,),
                Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text(
                    "42 near you",
                    style: TextStyle(
                        fontFamily: 'mmonr',
                        color: Colors.white,
                        fontSize: 14),
                  ),
                ),
                DelayedDisplay(slidingCurve: Curves.fastLinearToSlowEaseIn,
                  delay: Duration(milliseconds: 300),
                  child:index == Servicebuilder.indexx?diff():Container(),),

              ],
            ),
          ],
        ),
      ),
    ):
    Positioned(
      top: 40,
      child: Container(
        // height: MediaQuery.of(context).size.height,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Text(
                services.text,
                style: TextStyle(
                    fontFamily: 'mmonb',
                    color: Colors.white,
                    fontSize: 20),
              ),
            ),
            SizedBox(height: 3,),
            DelayedDisplay(slidingCurve: Curves.fastLinearToSlowEaseIn,
              delay: Duration(milliseconds: 300),
              child:index == Servicebuilder.indexx?diff():Container(),),
            // diff(),

          ],
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    var _counter;
    namee = new List();
    total = new List();
    return InkWell(
      onTap: () {
       // cleaningView.DataCalling();
         pr.show();
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => services.nav));
        //pr.hide();
        //
        // Navigator.push(
        //   context,
        //   MaterialPageRoute(builder: (_) => services.nav),
        // );
      },
      child: Container(
          // alignment: Alignment.topCenter,
          padding: EdgeInsets.only(right: 10),

          height: MediaQuery.of(context).size.height ,
          width: MediaQuery.of(context).size.width / 2.3,
          // decoration: BoxDecoration(
          //   borderRadius: BorderRadius.all(
          //     Radius.circular(15),
          //   ),
          //   // color: services.cardcolor,
          // ),

        //  alignment: Alignment.bottomCenter,
          //height: MediaQuery.of(context).size.height/2,
         // width: MediaQuery.of(context).size.width / 3.1,
          child: Stack(
          //  mainAxisAlignment: MainAxisAlignment.end,
          //  crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: 17),
                padding: EdgeInsets.only(top: 10),
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width / 1.8,
                child: Image.asset(services.background,fit: BoxFit.fill,),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(
                    Radius.circular(12),
                  ),
                   color: services.cardcolor,
                ),
              ),

              Center(
                child: Container(
                  padding: EdgeInsets.only(right:20),
                    height: MediaQuery.of(context).size.height,

                    child: image()
                ),
              ),
              // Container(
              //   padding: EdgeInsets.only(top: 30),
              //   alignment: Alignment.topCenter,
              //   width: MediaQuery.of(context).size.width / 2.24,
              //   height: MediaQuery.of(context).size.height,
              //   child: Image.asset(services.image1),
              // ),
              text(),

            ],
          )
      ),

      // child: Container(
      //   //height: MediaQuery.of(context).size.height/5 ,
      //   width: MediaQuery.of(context).size.width / 2.5,
      //   padding: EdgeInsets.only(right: 8),
      //   child: Stack(
      //     children: [
      //       // Padding(
      //       //   padding: const EdgeInsets.only(top:25,left: 4),
      //       //   child: Container(
      //       //
      //       //     decoration: BoxDecoration(
      //       //       color: Colors.blue,
      //       //       borderRadius: BorderRadius.all(
      //       //         Radius.circular(10),
      //       //       ),
      //       //       // color: services.cardcolor,
      //       //     ),
      //       //     height: 122,
      //       //     width: MediaQuery.of(context).size.width/3.1,
      //       //
      //       //
      //       //   ),
      //       // ),
      //       Image.asset(
      //         services.background,
      //         // color: Colors.transparent,
      //         height: MediaQuery.of(context).size.height,
      //         width: MediaQuery.of(context).size.width/1,
      //       ),
      //       Stack(
      //         // alignment: Alignment.bottomCenter,
      //         children: [
      //           // Padding(
      //           //   padding: const EdgeInsets.only(left: 10, top: 20),
      //           Padding(
      //             padding: const EdgeInsets.only(top:10),
      //             child: Container(
      //               height: 150,
      //               width: MediaQuery.of(context).size.width / 3,
      //               decoration: BoxDecoration(
      //                 borderRadius: BorderRadius.all(
      //                   Radius.circular(10),
      //                 ),
      //                 // color: services.cardcolor,
      //               ),
      //               // padding: EdgeInsets.only(bottom: 20),
      //               alignment: Alignment.bottomCenter,
      //
      //               child: Column(
      //                 mainAxisAlignment: MainAxisAlignment.start,
      //                 crossAxisAlignment: CrossAxisAlignment.start,
      //                 children: [
      //                   Padding(
      //                     padding: const EdgeInsets.only(top:75),
      //                     child: Center(
      //                       child: Text(
      //                         services.text,
      //                         style: TextStyle(
      //                             fontFamily:'opsr',
      //                             color: Colors.white, fontSize: 18),
      //                       ),
      //                     ),
      //                   ),
      //                   Center(
      //                     child: Text(
      //                       services.text2,
      //                       style: TextStyle(
      //                           fontFamily:'monr',
      //                           color: Colors.white,
      //                           fontSize: 12),
      //                     ),
      //                   )
      //                 ],
      //               ),
      //             ),
      //           ),
      //           Padding(
      //             padding: const EdgeInsets.only(left:8.0,),
      //             child: Image.asset(
      //               services.image1,
      //               height: MediaQuery.of(context).size.height / 9,
      //               width: 100,
      //             ),
      //           ),
      //
      //         ],
      //       ),
      //     ],
      //   ),
      // ),
    );
  }

}
