

import 'package:charles_app/Model/servicesHomePage/servicesCard.dart';
import 'package:charles_app/Model/servicesHomePage/servicesList.dart';
import 'package:charles_app/View/Caring/CaringView.dart';
import 'package:charles_app/View/Cleaning/cleaningView.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';

import '../CardlistModel.dart';

class Servicebuilder extends StatefulWidget {
  static var indexx = 0;

  @override
  _ServicebuilderState createState() => _ServicebuilderState();
}

class _ServicebuilderState extends State<Servicebuilder> with SingleTickerProviderStateMixin{
  List<Services> servicesvar;
  TextEditingController searchController = TextEditingController();
  AnimationController _controller;
  Animation<Offset> _offsetFloat;
  @override
  void initState() {

    // TODO: implement initState
    super.initState();
    _controller = AnimationController(
      vsync: this,
      //  reverseDuration: Duration(seconds: 6),
      duration: const Duration(milliseconds: 500),



    );
    _offsetFloat = Tween(begin: Offset(5.0,0.0), end:Offset(0.0,0.0))
        .animate(CurvedAnimation(

      curve: Curves.easeInOut,
      parent: _controller,

    ));

    _offsetFloat.addListener((){
      setState((){

      });
    });
    _controller.forward();
  }
  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }
  @override
  Widget build(BuildContext context) {
    //CaringCh.DataCalling1();
  //  cleaningView.DataCalling();


    if (services == null) services = [];
    return Container(
      padding: EdgeInsets.only(top: 8,bottom: 8,left: 0),
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height/2.4 ,
      width: MediaQuery.of(context).size.width,
      child:SlideTransition(
        position: _offsetFloat,
        child: PageView.builder(
          physics: BouncingScrollPhysics(),
          reverse: false,
          itemCount: services.length,
          controller: PageController(viewportFraction: 0.64,keepPage: true,initialPage: 0),
          onPageChanged: (int index) => setState(() { Servicebuilder.indexx = index; }),
          itemBuilder: (_, i) {
            return Transform.scale(
              scale: i == Servicebuilder.indexx ? 1: 0.8,
              child:ServiceCard(
                services: services[i],
                ind: i,
              ),
            );
          },
        ),
      ),

    );
  }
}

// ListView.builder(
// scrollDirection: Axis.horizontal,
// itemCount: services.length,
//
// itemBuilder: (_, index) {
//
// return Transform.scale(
// scale: index==services[index].ind?2:0.9,
// child:
// );
// }
// ),