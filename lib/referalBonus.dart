
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:percent_indicator/linear_percent_indicator.dart';

class ReferalBonus extends StatefulWidget
{
  final double currentProgress;
  final double height;
  final Color foregroundColor;
  final int duration = 3000;

  ReferalBonus({
    this.currentProgress,
    this.height = 5,
    this.foregroundColor = Colors.red});
  @override
  _ReferalBonusState createState() => _ReferalBonusState();
}

class _ReferalBonusState extends State<ReferalBonus> with SingleTickerProviderStateMixin{

  AnimationController controller;
  Animation<double> animation;
  bool check = false;

  @override
  void initState() {
    super.initState();

    controller = AnimationController(
        duration: const Duration(milliseconds: 2000), vsync: this);
    animation = Tween(begin: 0.0, end: 1.0).animate(controller)
      ..addListener(() {
        setState(() {
          // the state that has changed here is the animation object’s value
        });
      });
    controller.forward();
  }
  void onAnimationEnd(){
    if(animation.value == 1.0)
      {
        setState(() {
          check = true;
        });
      }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.grey[200],
        body: SingleChildScrollView(
          child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:180.0,top: 30,right: 10),
                  child: Container(
                    alignment: Alignment.topRight,
                    height: 210,
                    width: 250,
                    child: Opacity(
                        opacity: 0.3,
                        child: Image.asset("lib/assets/images/logo.png")),
                  ),
                ),
                SingleChildScrollView(
                  padding: EdgeInsets.all(30),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          InkWell(
                              onTap: ()=>{
                                Navigator.pop(context)
                              },
                              child: Icon(Icons.arrow_back_ios,)
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left:12.0),
                            child: Text("Bonus", style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18),),
                          ),

                          // searchAnimate(),
                        ],
                      ),

                      SizedBox(height: 100,),
                      Center(child: Image.asset('lib/assets/images/bonus.png'),),
                      SizedBox(height: 20,),
                      Center(child:
                      Text(check == false? 'Current Status':"Congratulations!!",style: TextStyle(fontSize: 24,fontFamily: 'opsr',fontWeight: FontWeight.bold),),
                      ),
                      SizedBox(height: 5,),
                      Center(child: Text(check == false? 'Almost there!':"You can redeem your Bonus Now!",style: TextStyle(fontSize: 10,fontFamily: 'opsr'),),),
                      SizedBox(height: 20,),
                      Center( child: LinearPercentIndicator(
                      //  width: MediaQuery.of(context).size.width/1.1,
                        animation: true,
                        animationDuration: 3000,
                        lineHeight: 30.0,
                        backgroundColor: Colors.white,
                        onAnimationEnd: onAnimationEnd,
                        percent: animation.value,
                        center: Text("Redeem",style: TextStyle(color: Colors.white),),
                        linearStrokeCap: LinearStrokeCap.butt,
                        progressColor: Colors.red,
                      ),),
                      SizedBox(height: 5,),
                      Center(child: Text(check == false? '15/20 \$':"20/20 \$",style: TextStyle(fontSize: 12,fontFamily: 'opsr',fontWeight: FontWeight.bold),),),
                      SizedBox(height: 50,),
                      Center(child: Container(
                       // width: MediaQuery.of(context).size.width/1.1,
                        child: Text("On every service booked and friend invited Finity gives you a bonus.On every service booked and friend invited Finity gives you a bonusOn every service booked and friend invited Finity gives you a bonus",textAlign: TextAlign.center,style: TextStyle(fontSize: 10,fontFamily: 'opsr'),),

                      )),
                      SizedBox(height: 50,),
                      Container(
                        height: 130,
                       // width: MediaQuery.of(context).size.width/1.1,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(Radius.circular(5)),

                        ),
                        child: Row(
                          children: [
                            Stack(
                              children: [
                                Container(
                                   // width: 100,
                                    height: 149,
                                    child: Image.asset('lib/assets/images/refCont.png',fit: BoxFit.fill,)),
                                Padding(
                                  padding: const EdgeInsets.only(left:28.0),
                                  child: Container(
                                      width: 120,
                                      height: 150,
                                      child: Image.asset('lib/assets/images/refCont1.png')),
                                ),
                              ],
                            ),
                            SizedBox(width: 15,),

                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                              SizedBox(height: 25,),

                              Text("Refer Now!",style: TextStyle(fontSize: 18,fontFamily: 'opsr',fontWeight: FontWeight.bold),),
                              SizedBox(height: 5,),
                              Text("Refer a Friend & Receive",style: TextStyle(fontSize: 12,fontFamily: 'opsr',),),
                              SizedBox(height:10),
                              Container(
                                width: 60,
                                height: 30,
                                decoration: BoxDecoration(
                                  color: Colors.red,
                                  borderRadius: BorderRadius.all(Radius.circular(25)),
                                ),
                                child: Center(child: Text('20\$',style: TextStyle(color: Colors.white,fontSize: 15),)),
                              ),


                            ],)
                          ],
                        ),

                      ),

                      SizedBox(height: 25,),

                    ],
                  ),
                )

              ]),
        ),
      ),
    );
  }
}

