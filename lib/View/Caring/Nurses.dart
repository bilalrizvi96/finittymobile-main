// import 'package:charles_app/Component/alert/alertDialog.dart';
// import 'package:charles_app/Model/CaringList/Caring.dart';
//
// import 'package:charles_app/Model/Cleaning/cleaningCard.dart';
// import 'package:charles_app/Model/Cleaning/cleaningList.dart';
// import 'package:charles_app/View/Cleaning/cleaningLanding.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
//
// import '../../widgets/widgets.dart';
//
//
//
// class Nurses extends StatefulWidget {
//   @override
//   _homeViewState createState() => _homeViewState();
// }
//
// class _homeViewState extends State<Nurses>
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
//       controller=new TabController(length: 2, vsync: this);
//     }
//
//     return SafeArea(
//       child: SingleChildScrollView(
//         child: Container(
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
//                       length: 2,
//                       initialIndex: 0,
//                       child : Column(
//                         //crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: [
//                           Row(
//                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                             children: [
//                               TabBar(
//                                 isScrollable: true,
//                                 controller: controller,
//                                 unselectedLabelColor: Colors.grey,
//                                 labelColor: Colors.black,
//                                 labelPadding: EdgeInsets.only(right: 20),
//                                 indicatorColor: Colors.transparent,
//                                 tabs: [
//                                   Container(
//                                     height: 40,
//                                     //alignment: Alignment.center,
//                                     child: Text(
//                                       "LPN", style: Styles().openBold(size: 24.0),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(left:60.0),
//                                     child: Container(
//                                       //alignment: Alignment.center,
//                                       height: 30,
//                                       child: Text(
//                                         "RPN", style: Styles().openBold(size: 24.0),
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ],
//                           ),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
//
//                               Container(
//                                 height: MediaQuery.of(context).size.height/2.2,
//                                 child:
//                                 TabBarView(
//                                   controller:controller ,
//                                   children: [
//
//                                     Padding(
//                                       padding: const EdgeInsets.only(left:0,right:0.0),
//                                       child: StaggeredGridView.countBuilder(
//                                         physics: AlwaysScrollableScrollPhysics(),
//                                         controller: new ScrollController(keepScrollOffset: false),
//                                         scrollDirection: Axis.vertical,
//                                         crossAxisCount: 4,
//                                         // addAutomaticKeepAlives: true,
//                                         itemCount: LPNTab.LPNtabList.length,
//
//                                         itemBuilder: (_, index) {
//                                           return InkWell(
//                                             onTap: (){
//                                               setState(() {
//                                                 for(int i =0; i< LPNTab.LPNtabList.length; i++){
//                                                   if(i == index)
//                                                   {
//                                                     if(LPNTab.LPNtabList[i].selected == true){
//                                                       LPNTab.LPNtabList[i].selected = false;
//                                                     }else{
//                                                       LPNTab.LPNtabList[i].selected = true;}
//                                                   }
//                                                   else{
//                                                     LPNTab.LPNtabList[i].selected = false;
//
//
//                                                   }
//                                                 }
//                                               });
//                                             },
//                                             child: SingleChildScrollView(
//                                               child: AnimatedContainer(
//                                                 duration: Duration(milliseconds: 300),
//                                                 decoration: BoxDecoration(
//                                                     border: Border.all(color: LPNTab.LPNtabList[index].selected==true?Color(0xFFff0000):Color(0xFFEFEFEF) ),
//                                                     borderRadius: BorderRadius.circular(10),
//                                                     color: Colors.white
//
//                                                 ),
//                                                 height:
//                                                 LPNTab.LPNtabList[index].selected ==false ? 110:140,
//                                                 width: 160,
//                                                 child: Column(
//                                                   mainAxisAlignment: MainAxisAlignment.start,
//                                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                                   children: [
//                                                     Container(
//                                                       height: 30,
//                                                       decoration: BoxDecoration(
//                                                           color: LPNTab.LPNtabList[index].selected==true?Color(0xFFff0000):Color(0xFFEFEFEF),
//                                                           borderRadius: BorderRadius.only(
//                                                             topRight: Radius.circular(5),
//                                                             topLeft: Radius.circular(5),
//                                                           )
//                                                       ),
//                                                       child: Padding(
//                                                         padding: const EdgeInsets.only(left:8.0,right: 8),
//                                                         child: Center(
//                                                           child: Row(
//                                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                             children: [
//                                                               Text(LPNTab.LPNtabList[index].time,style: Styles().openBold(size: 14.0,color: LPNTab.LPNtabList[index].selected==true?Colors.white:Colors.black),),
//                                                               Text(LPNTab.LPNtabList[index].money,style: Styles().openBold(size: 14.0,color: LPNTab.LPNtabList[index].selected==true?Colors.white:Colors.black),),
//                                                             ],
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     Container(
//                                                       height: 70,
//                                                       child: Padding(
//                                                         padding: const EdgeInsets.only(left:10.0, right: 10,top:10),
//                                                         child: Text(LPNTab.LPNtabList[index].text, style: Styles().openRegular(size: 10.0),),
//                                                       ),
//                                                     ),
//
//                                                     Expanded(child: Padding(
//                                                       padding: const EdgeInsets.only(left:10.0),
//                                                       child: SingleChildScrollView(
//                                                         child: Column(
//                                                           children: [
//                                                             SizedBox(height: 20,),
//                                                             alertD(),
//
//
//                                                           ],
//                                                         ),
//                                                       ),
//                                                     ))
//                                                   ],
//                                                 ),
//                                               ),
//                                             ),
//                                           );
//
//                                         },
//
//                                         staggeredTileBuilder: (int index) =>
//                                         //new StaggeredTile.fit(4),
//                                         new StaggeredTile.count(2, LPNTab.LPNtabList[index].selected ==false ?  1.6: 2.5),
//                                         mainAxisSpacing: 10.0,
//                                         crossAxisSpacing: 10.0,
//
//                                       ),
//                                     ),
//
//                                     // Backyard work starts
//
//                                     Padding(
//                                       padding: const EdgeInsets.only(left:0,right:0.0),
//                                       child: StaggeredGridView.countBuilder(
//                                         physics: AlwaysScrollableScrollPhysics(),
//                                         controller: new ScrollController(keepScrollOffset: false),
//                                         shrinkWrap: true,
//                                         scrollDirection: Axis.vertical,
//                                         crossAxisCount: 4,
//                                         // addAutomaticKeepAlives: true,
//                                         itemCount: RPNTab.RPNtabList.length,
//
//                                         itemBuilder: (_, index) {
//                                           return InkWell(
//                                             onTap: (){
//                                               setState(() {
//                                                 for(int i =0; i< RPNTab.RPNtabList.length; i++){
//                                                   if(i == index)
//                                                   {
//                                                     if(RPNTab.RPNtabList[i].selected == true){
//                                                       RPNTab.RPNtabList[i].selected = false;
//                                                     }else{
//                                                       RPNTab.RPNtabList[i].selected = true;}
//                                                   }
//                                                   else{
//                                                     RPNTab.RPNtabList[i].selected = false;
//
//
//                                                   }
//                                                 }
//                                               });
//                                             },
//                                             child: SingleChildScrollView(
//                                               child: AnimatedContainer(
//                                                 duration: Duration(milliseconds: 300),
//                                                 decoration: BoxDecoration(
//                                                     border: Border.all(color: RPNTab.RPNtabList[index].selected==true?Color(0xFFff0000):Color(0xFFEFEFEF) ),
//                                                     borderRadius: BorderRadius.circular(10),
//                                                     color: Colors.white
//
//                                                 ),
//                                                 height:
//                                                 RPNTab.RPNtabList[index].selected ==false ? 110:130,
//                                                 width: 160,
//                                                 child: Column(
//                                                   mainAxisAlignment: MainAxisAlignment.start,
//                                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                                   children: [
//                                                     Container(
//                                                       height: 30,
//                                                       decoration: BoxDecoration(
//                                                           color: RPNTab.RPNtabList[index].selected==true?Color(0xFFff0000):Color(0xFFEFEFEF),
//                                                           borderRadius: BorderRadius.only(
//                                                             topRight: Radius.circular(5),
//                                                             topLeft: Radius.circular(5),
//                                                           )
//                                                       ),
//                                                       child: Padding(
//                                                         padding: const EdgeInsets.only(left:8.0,right: 8),
//                                                         child: Center(
//                                                           child: Row(
//                                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                                             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                             children: [
//                                                               Text(RPNTab.RPNtabList[index].time,style: Styles().openBold(size: 14.0,color: RPNTab.RPNtabList[index].selected==true?Colors.white:Colors.black),),
//                                                               Text(RPNTab.RPNtabList[index].money,style: Styles().openBold(size: 14.0,color: RPNTab.RPNtabList[index].selected==true?Colors.white:Colors.black),),
//                                                             ],
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     Container(
//                                                       height: 70,
//                                                       child: Padding(
//                                                         padding: const EdgeInsets.only(left:10.0, right: 10,top:10),
//                                                         child: Text(RPNTab.RPNtabList[index].text, style: Styles().openRegular(size: 10.0),),
//                                                       ),
//                                                     ),
//                                                     //Spacer(),
//                                                     Expanded(child: Padding(
//                                                       padding: const EdgeInsets.only(left:10.0),
//                                                       child: SingleChildScrollView(
//                                                         child: Column(
//                                                           children: [
//                                                             SizedBox(height: 10,),
//                                                             alertD(),
//                                                             SizedBox(height: 10,),
//
//                                                           ],
//                                                         ),
//                                                       ),
//                                                     ))
//                                                   ],
//                                                 ),
//                                               ),
//                                             ),
//                                           );
//
//                                         },
//
//                                         staggeredTileBuilder: (int index) =>
//                                         //new StaggeredTile.fit(4),
//                                         new StaggeredTile.count(2, RPNTab.RPNtabList[index].selected ==false ?  1.6: 2),
//                                         mainAxisSpacing: 10.0,
//                                         crossAxisSpacing: 10.0,
//
//                                       ),
//                                     ),                              ],),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
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
