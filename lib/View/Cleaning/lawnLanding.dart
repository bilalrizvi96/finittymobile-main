// import '../../widgets/widgets.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
//
// import '../../Component/alert/alertDialog.dart';
// import 'package:charles_app/Model/Cleaning/cleaningCard.dart';
// import 'package:charles_app/Model/Cleaning/cleaningList.dart';
// import 'package:charles_app/View/Cleaning/cleaningLanding.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// bool selected= true;
// bool selected2= true;
// bool selected3= true;
// bool selected4= true;
//
// class lawnLanding extends StatefulWidget {
//   @override
//   _lawnLandingState createState() => _lawnLandingState();
// }
//
// class _lawnLandingState extends State<lawnLanding>
//     with TickerProviderStateMixin {
//   @override
//   Widget build(BuildContext context) {
//
//
//     TabController controller;
//
//     @override
//     void initState(){
//       super.initState();
//       controller=new TabController(length: 3, vsync: this);
//     }
//
//     return SafeArea(
//       child:
//       SingleChildScrollView(
//         child: Container(
//
//           color:Colors.white,
//           child: Stack(
//             children:[
//               Padding(
//                 padding: const EdgeInsets.only(left:0,),
//                 child: Column(
//                   // mainAxisAlignment: MainAxisAlignment.start,
//                   // crossAxisAlignment: CrossAxisAlignment.start,
//                   children: [
//
//                     DefaultTabController(
//                       length: 1,
//                       initialIndex: 0,
//                       child : Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           TabBar(
//                             isScrollable: true,
//                             controller: controller,
//                             labelPadding: EdgeInsets.symmetric(horizontal: 0),
//                             unselectedLabelColor: Colors.grey,
//                             labelColor: Colors.black,
//                             indicatorColor: Colors.transparent,
//                             tabs: [
//                               Container(
//                                 height: 40,
//                                 // alignment: Alignment.center,
//                                 padding: EdgeInsets.only(left:2),
//                                 child: Text(
//                                   "Lawn Mowing", style: Styles().openBold(size: 25.0),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           //  Row(
//                           // //   mainAxisAlignment: MainAxisAlignment.center,
//                           //    children: [
//                           //      Padding(
//                           //        padding: const EdgeInsets.only(left:0.0),
//                           //        child: Text("Paid by Lawn Area",style: Styles().openRegular(size: 9.0),),
//                           //      ),
//                           //    ],
//                           //  ),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//                               Container(
//                                 height: MediaQuery.of(context).size.height/2.1,
//                                 child:
//                                 TabBarView(children: [
//                                   Padding(
//                                     padding: const EdgeInsets.only(left:0,right:0.0),
//                                     child: StaggeredGridView.countBuilder(
//                                       physics: AlwaysScrollableScrollPhysics(),
//                                       controller: new ScrollController(keepScrollOffset: false),
//                                       scrollDirection: Axis.vertical,
//                                       crossAxisCount: 4,
//                                       // addAutomaticKeepAlives: true,
//                                       itemCount: CleaningLawnMowingTabs. cleaningLawnMowingTabsList.length,
//
//                                       itemBuilder: (_, index) {
//                                         return InkWell(
//                                           onTap: (){
//                                             setState(() {
//                                               for(int i =0; i< CleaningLawnMowingTabs. cleaningLawnMowingTabsList.length; i++){
//                                                 if(i == index)
//                                                 {
//                                                   if(CleaningLawnMowingTabs. cleaningLawnMowingTabsList[i].selected == true){
//                                                     CleaningLawnMowingTabs. cleaningLawnMowingTabsList[i].selected = false;
//                                                   }else{
//                                                     CleaningLawnMowingTabs. cleaningLawnMowingTabsList[i].selected = true;}
//                                                 }
//                                                 else{
//                                                   CleaningLawnMowingTabs. cleaningLawnMowingTabsList[i].selected = false;
//
//
//                                                 }
//                                               }
//                                             });
//                                           },
//                                           child: SingleChildScrollView(
//                                             child: AnimatedContainer(
//                                               duration: Duration(milliseconds: 300),
//                                               decoration: BoxDecoration(
//                                                   border: Border.all(color: CleaningLawnMowingTabs. cleaningLawnMowingTabsList[index].selected==true?Color(0xFFFF0000):Color(0xFFEFEFEF) ),
//                                                   borderRadius: BorderRadius.circular(10),
//                                                   color: Colors.white
//
//                                               ),
//                                               height:
//                                               CleaningLawnMowingTabs. cleaningLawnMowingTabsList[index].selected ==false ? 80:120,
//                                               width: 160,
//                                               child: Column(
//                                                 mainAxisAlignment: MainAxisAlignment.start,
//                                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                                 children: [
//                                                   Container(
//                                                     height: 30,
//                                                     decoration: BoxDecoration(
//                                                         color: CleaningLawnMowingTabs. cleaningLawnMowingTabsList[index].selected==true?Color(0xFFFF0000):Color(0xFFEFEFEF),
//                                                         borderRadius: BorderRadius.only(
//                                                           topRight: Radius.circular(5),
//                                                           topLeft: Radius.circular(5),
//                                                         )
//                                                     ),
//                                                     child: Padding(
//                                                       padding: const EdgeInsets.only(left:8.0,right: 8),
//                                                       child: Center(
//                                                         child: Row(
//                                                           crossAxisAlignment: CrossAxisAlignment.center,
//                                                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                           children: [
//                                                             Text(CleaningLawnMowingTabs. cleaningLawnMowingTabsList[index].time,style: Styles().openBold(size: 14.0,color: CleaningLawnMowingTabs. cleaningLawnMowingTabsList[index].selected==true?Colors.white:Colors.black),),
//                                                             Text(CleaningLawnMowingTabs. cleaningLawnMowingTabsList[index].money,style: Styles().openBold(size: 14.0,color: CleaningLawnMowingTabs. cleaningLawnMowingTabsList[index].selected==true?Colors.white:Colors.black),),
//
//                                                           ],
//                                                         ),
//                                                       ),
//                                                     ),
//                                                   ),
//                                                   Padding(
//                                                     padding: const EdgeInsets.only(left:10.0, right: 10,top:10),
//                                                     child: Row(
//                                                       children: [
//                                                         Text(CleaningLawnMowingTabs. cleaningLawnMowingTabsList[index].text, style: Styles().openRegular(size: 11.0),),
//                                                         Spacer(),
//                                                         Text(CleaningLawnMowingTabs. cleaningLawnMowingTabsList[index].text2, style: Styles().openRegular(size: 11.0),),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                   Spacer(),
//                                                   Expanded(child: Padding(
//                                                     padding: const EdgeInsets.only(left:10.0),
//                                                     child: SingleChildScrollView(
//                                                       child: Column(
//                                                         children: [
//                                                           SizedBox(height: 5,),
//                                                           alertD(),
//                                                           SizedBox(height: 10,),
//
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ))
//                                                 ],
//                                               ),
//                                             ),
//                                           ),
//                                         );
//
//                                       },
//
//                                       staggeredTileBuilder: (int index) =>
//                                       //new StaggeredTile.fit(4),
//                                       new StaggeredTile.count(2, CleaningLawnMowingTabs. cleaningLawnMowingTabsList[index].selected ==false ?  1.2: 2),
//                                       mainAxisSpacing: 10.0,
//                                       crossAxisSpacing: 10.0,
//
//                                     ),
//                                   ),
//
//                                   // Backyard work starts
//
//                                 ],),
//                               ),
//                             ],
//
//                           ),
//
//
//
//                           // Container(
//                           //   height: MediaQuery.of(context).size.height/2.4,
//                           //   child:
//                           //   TabBarView(children: [
//                           //     Row(
//                           //       //crossAxisAlignment: CrossAxisAlignment.start,
//                           //       mainAxisAlignment: MainAxisAlignment.start,
//                           //       children: [
//                           //         Column(
//                           //           mainAxisAlignment: MainAxisAlignment.start,
//                           //           children: [
//                           //             InkWell(
//                           //               onTap: (){
//                           //                 setState(() {
//                           //                   selected=!selected;
//                           //                   selected2= true;
//                           //                   selected3= true;
//                           //                   selected4= true;
//                           //                 });
//                           //               },
//                           //               child: Container(
//                           //                 decoration: BoxDecoration(
//                           //                   borderRadius: BorderRadius.circular(5),
//                           //                   color: selected ? Colors.white : Colors.red,
//                           //                 ),
//                           //                 child: Card(
//                           //                   child: AnimatedContainer(
//                           //                     duration: Duration(milliseconds: 300),
//                           //                     decoration: BoxDecoration(
//                           //                       borderRadius: BorderRadius.circular(10),
//                           //                       // color: selected ? Colors.white : Color(0xFFFC7594),
//                           //                     ),
//                           //                     height: selected ? 120 : 120,
//                           //                     width: 160,
//                           //                     child: Column(
//                           //                       mainAxisAlignment: MainAxisAlignment.start,
//                           //                       crossAxisAlignment: CrossAxisAlignment.start,
//                           //                       children: [
//                           //                         Container(
//                           //                           height: 35,
//                           //                           decoration: BoxDecoration(
//                           //                               color: selected==false?Colors.red:Color(0xFFEFEFEF),
//                           //                               borderRadius: BorderRadius.only(
//                           //                                 topRight: Radius.circular(5),
//                           //                                 topLeft: Radius.circular(5),
//                           //                               )
//                           //                           ),
//                           //                           child: Padding(
//                           //                             padding: const EdgeInsets.only(left:8.0,right: 8),
//                           //                             child: Center(
//                           //                               child: Row(
//                           //                                 crossAxisAlignment: CrossAxisAlignment.start,
//                           //                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           //                                 children: [
//                           //                                   Text("Small",style: TextStyle(color:  selected==false?Colors.white:(Colors.black))),
//                           //                                   Text("\$40",style: TextStyle(color:  selected==false?Colors.white:(Colors.black))),
//                           //                                 ],
//                           //                               ),
//                           //                             ),
//                           //                           ),
//                           //                         ),
//                           //                         Padding(
//                           //                           padding: const EdgeInsets.only(left:10.0, right: 10,top:10),
//                           //                           child: Row(
//                           //                             children: [
//                           //                               Text("Upto square ft", style: TextStyle(color:  selected==false?Colors.black:(Colors.black),),),
//                           //                               Spacer(),
//                           //                               Text("1500")
//                           //                             ],
//                           //                           ),
//                           //                         ),
//                           //                         Padding(
//                           //                           padding: const EdgeInsets.only(left:10.0, right: 10,top:10),
//                           //                           child: Row(
//                           //                             children: [
//                           //                               Text("Upto square ft", style: TextStyle(color:  selected==false?Colors.black:(Colors.black),),),
//                           //                               Spacer(),
//                           //                               Text("140")
//                           //                             ],
//                           //                           ),
//                           //                         ),
//                           //                         Spacer(),
//                           //                         Expanded(child: Padding(
//                           //                           padding: const EdgeInsets.only(left:10.0),
//                           //                           child: alertD(),
//                           //                         ))
//                           //                       ],
//                           //                     ),
//                           //                   ),
//                           //                 ),
//                           //               ),
//                           //             ),
//                           //
//                           //             InkWell(
//                           //               onTap: (){
//                           //                 setState(() {
//                           //                   selected2=!selected2;
//                           //                   selected= true;
//                           //                   selected3= true;
//                           //                   selected4= true;
//                           //                 });
//                           //               },
//                           //               child: Container(
//                           //                 decoration: BoxDecoration(
//                           //                   borderRadius: BorderRadius.circular(10),
//                           //                   color: selected2 ? Colors.white : Colors.red,
//                           //                 ),
//                           //                 child: Card(
//                           //                   child: AnimatedContainer(
//                           //                     duration: Duration(milliseconds: 300),
//                           //                     decoration: BoxDecoration(
//                           //                       borderRadius: BorderRadius.circular(5),
//                           //                       // color: selected2 ? Colors.white : Color(0xFFFC7594),
//                           //                     ),
//                           //                     height: selected2 ? 120 : 120,
//                           //                     width: 160,
//                           //                     child: Column(
//                           //                       mainAxisAlignment: MainAxisAlignment.start,
//                           //                       crossAxisAlignment: CrossAxisAlignment.start,
//                           //                       children: [
//                           //                         Container(
//                           //                           height: 35,
//                           //                           decoration: BoxDecoration(
//                           //                               color: selected2==false?Colors.red:Color(0xFFEFEFEF),
//                           //                               borderRadius: BorderRadius.only(
//                           //                                 topRight: Radius.circular(5),
//                           //                                 topLeft: Radius.circular(5),
//                           //                               )
//                           //                           ),
//                           //                           child: Padding(
//                           //                             padding: const EdgeInsets.only(left:8.0,right: 8),
//                           //                             child: Center(
//                           //                               child: Row(
//                           //                                 crossAxisAlignment: CrossAxisAlignment.start,
//                           //                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           //                                 children: [
//                           //                                   Text("Large",style: TextStyle(color:  selected2==false?Colors.white:(Colors.black))),
//                           //                                   Text("\$120",style: TextStyle(color:  selected2==false?Colors.white:(Colors.black))),
//                           //                                 ],
//                           //                               ),
//                           //                             ),
//                           //                           ),
//                           //                         ),
//                           //                         Padding(
//                           //                           padding: const EdgeInsets.only(left:10.0, right: 10,top:10),
//                           //                           child: Row(
//                           //                             children: [
//                           //                               Text("square ft", style: TextStyle(color:  selected==false?Colors.black:(Colors.black),),),
//                           //                               Spacer(),
//                           //                               Text("3001-4500")
//                           //                             ],
//                           //                           ),
//                           //                         ),
//                           //                         Padding(
//                           //                           padding: const EdgeInsets.only(left:10.0, right: 10,top:10),
//                           //                           child: Row(
//                           //                             children: [
//                           //                               Text("square m", style: TextStyle( color:  selected==false?Colors.black:(Colors.black),),),
//                           //                               Spacer(),
//                           //                               Text("281-420")
//                           //                             ],
//                           //                           ),
//                           //                         ),
//                           //                         Spacer(),
//                           //                         Expanded(child: Padding(
//                           //                           padding: const EdgeInsets.only(left:10.0),
//                           //                           child: alertD(),
//                           //                         ))
//                           //                       ],
//                           //                     ),
//                           //                   ),
//                           //                 ),
//                           //               ),
//                           //             ),
//                           //           ],
//                           //         ),
//                           //         Column(
//                           //           mainAxisAlignment: MainAxisAlignment.start,
//                           //           children: [
//                           //             InkWell(
//                           //               onTap: (){
//                           //                 setState(() {
//                           //                   selected3=!selected3;
//                           //                   selected= true;
//                           //                   selected2= true;
//                           //                   selected4= true;
//                           //                 });
//                           //               },
//                           //               child: Container(
//                           //                 decoration: BoxDecoration(
//                           //                   borderRadius: BorderRadius.circular(10),
//                           //                   color: selected3 ? Colors.white : Colors.red,
//                           //                 ),
//                           //                 child: Card(
//                           //                   child: AnimatedContainer(
//                           //                     duration: Duration(milliseconds: 300),
//                           //                     decoration: BoxDecoration(
//                           //                       borderRadius: BorderRadius.circular(5),
//                           //                       // color: selected3 ? Colors.white : Color(0xFFFC7594),
//                           //                     ),
//                           //                     height: selected3 ? 120 : 120,
//                           //                     width: 160,
//                           //                     child: Column(
//                           //                       mainAxisAlignment: MainAxisAlignment.start,
//                           //                       crossAxisAlignment: CrossAxisAlignment.start,
//                           //                       children: [
//                           //                         Container(
//                           //                           height: 30,
//                           //                           decoration: BoxDecoration(
//                           //                               color: selected3==false?Colors.red:Color(0xFFEFEFEF),
//                           //                               borderRadius: BorderRadius.only(
//                           //                                 topRight: Radius.circular(5),
//                           //                                 topLeft: Radius.circular(5),
//                           //                               )
//                           //                           ),
//                           //                           child: Padding(
//                           //                             padding: const EdgeInsets.only(left:8.0,right: 8),
//                           //                             child: Center(
//                           //                               child: Row(
//                           //                                 crossAxisAlignment: CrossAxisAlignment.start,
//                           //                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           //                                 children: [
//                           //                                   Text("Medium",style: TextStyle(color:  selected3==false?Colors.white:(Colors.black))),
//                           //                                   Text("\$50",style: TextStyle(color:  selected3==false?Colors.white:(Colors.black))),
//                           //                                 ],
//                           //                               ),
//                           //                             ),
//                           //                           ),
//                           //                         ),
//                           //                         Padding(
//                           //                           padding: const EdgeInsets.only(left:10.0, right: 10,top:10),
//                           //                           child: Row(
//                           //                             children: [
//                           //                               Text("square ft", style:TextStyle(color: selected==false?Colors.black:(Colors.black),),),
//                           //                               Spacer(),
//                           //                               Text("1500-3000")
//                           //                             ],
//                           //                           ),
//                           //                         ),
//                           //                         Padding(
//                           //                           padding: const EdgeInsets.only(left:10.0, right: 10,top:10),
//                           //                           child: Row(
//                           //                             children: [
//                           //                               Text("square m", style: TextStyle(color:  selected==false?Colors.black:(Colors.black),),),
//                           //                               Spacer(),
//                           //                               Text("141-280")
//                           //                             ],
//                           //                           ),
//                           //                         ),
//                           //                         Spacer(),
//                           //                         Expanded(child: Padding(
//                           //                           padding: const EdgeInsets.only(left:10.0),
//                           //                           child: alertD(),
//                           //                         ))
//                           //                       ],
//                           //                     ),
//                           //                   ),
//                           //                 ),
//                           //               ),
//                           //             ),
//                           //
//                           //             InkWell(
//                           //               onTap: (){
//                           //                 setState(() {
//                           //                   selected4=!selected4;
//                           //                   selected= true;
//                           //                   selected3= true;
//                           //                   selected2= true;
//                           //                 });
//                           //               },
//                           //               child: Container(
//                           //                 decoration: BoxDecoration(
//                           //                   borderRadius: BorderRadius.circular(10),
//                           //                   color: selected4 ? Colors.white : Colors.red,
//                           //                 ),
//                           //                 child: Card(
//                           //                   child: AnimatedContainer(
//                           //                     duration: Duration(milliseconds: 300),
//                           //                     decoration: BoxDecoration(
//                           //                       borderRadius: BorderRadius.circular(5),
//                           //                       // color: selected4 ? Colors.white : Color(0xFFFC7594),
//                           //                     ),
//                           //                     height: selected4 ? 120 : 120,
//                           //                     width: 160,
//                           //                     child: Column(
//                           //                       mainAxisAlignment: MainAxisAlignment.start,
//                           //                       crossAxisAlignment: CrossAxisAlignment.start,
//                           //                       children: [
//                           //                         Container(
//                           //                           height: 30,
//                           //                           decoration: BoxDecoration(
//                           //                               color: selected4==false?Colors.red:Color(0xFFEFEFEF),
//                           //                               borderRadius: BorderRadius.only(
//                           //                                 topRight: Radius.circular(5),
//                           //                                 topLeft: Radius.circular(5),
//                           //                               )
//                           //                           ),
//                           //                           child: Padding(
//                           //                             padding: const EdgeInsets.only(left:8.0,right: 8),
//                           //                             child: Center(
//                           //                               child: Row(
//                           //                                 crossAxisAlignment: CrossAxisAlignment.start,
//                           //                                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           //                                 children: [
//                           //                                   Text("Extra Large",style: TextStyle(color:  selected4==false?Colors.white:(Colors.black))),
//                           //                                   Text("\$180",style: TextStyle(color:  selected4==false?Colors.white:(Colors.black))),
//                           //                                 ],
//                           //                               ),
//                           //                             ),
//                           //                           ),
//                           //                         ),
//                           //                         Padding(
//                           //                           padding: const EdgeInsets.only(left:10.0, right: 10,top:10),
//                           //                           child: Row(
//                           //                             children: [
//                           //                               Text("square ft", style: TextStyle(color:  selected==false?Colors.black:(Colors.black),),),
//                           //                               Spacer(),
//                           //                               Text("4501-6000")
//                           //                             ],
//                           //                           ),
//                           //                         ),
//                           //                         Padding(
//                           //                           padding: const EdgeInsets.only(left:10.0, right: 10,top:10),
//                           //                           child: Row(
//                           //                             children: [
//                           //                               Text("square m", style: TextStyle(color:  selected==false?Colors.black:(Colors.black),),),
//                           //                               Spacer(),
//                           //                               Text("421-560")
//                           //                             ],
//                           //                           ),
//                           //                         ),
//                           //                         Spacer(),
//                           //                         Expanded(child: Padding(
//                           //                           padding: const EdgeInsets.only(left:10.0),
//                           //                           child: alertD(),
//                           //                         ))
//                           //                       ],
//                           //                     ),
//                           //                   ),
//                           //                 ),
//                           //               ),
//                           //             ),
//                           //           ],
//                           //         ),
//                           //       ],
//                           //     ),
//                           //   ],),
//                           // ),
//                         ],
//                       ),
//                     ),
//
//
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
