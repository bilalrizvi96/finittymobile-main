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
// class PersonalFootNurse extends StatefulWidget {
//   @override
//   _homeViewState createState() => _homeViewState();
// }
//
// class _homeViewState extends State<PersonalFootNurse>
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
//                       length: 1,
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
//                                       "Personal Foot Care", style: Styles().openBold(size: 24.0),
//                                     ),
//                                   ),
//
//                                 ],
//                               ),
//                             ],
//                           ),
//                           Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             children: [
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
//                                         itemCount: FootTab.FoottabList.length,
//
//                                         itemBuilder: (_, index) {
//                                           return InkWell(
//                                             onTap: (){
//                                               setState(() {
//                                                 for(int i =0; i< FootTab.FoottabList.length; i++){
//                                                   if(i == index)
//                                                   {
//                                                     if(FootTab.FoottabList[i].selected == true){
//                                                       FootTab.FoottabList[i].selected = false;
//                                                     }else{
//                                                       FootTab.FoottabList[i].selected = true;}
//                                                   }
//                                                   else{
//                                                     FootTab.FoottabList[i].selected = false;
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
//                                                     border: Border.all(color: FootTab.FoottabList[index].selected==true?Color(0xFFff0000):Color(0xFFEFEFEF) ),
//                                                     borderRadius: BorderRadius.circular(10),
//                                                     color: Colors.white
//
//                                                 ),
//                                                 height:
//                                                 FootTab.FoottabList[index].selected ==false ? 110:140,
//                                                 width: 160,
//                                                 child: Column(
//                                                   mainAxisAlignment: MainAxisAlignment.start,
//                                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                                   children: [
//                                                     Container(
//                                                       height: 30,
//                                                       decoration: BoxDecoration(
//                                                           color: FootTab.FoottabList[index].selected==true?Color(0xFFff0000):Color(0xFFEFEFEF),
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
//                                                               Text(FootTab.FoottabList[index].time,style: Styles().openBold(size: 14.0,color: FootTab.FoottabList[index].selected==true?Colors.white:Colors.black),),
//                                                               Text(FootTab.FoottabList[index].money,style: Styles().openBold(size: 14.0,color: FootTab.FoottabList[index].selected==true?Colors.white:Colors.black),),
//                                                             ],
//                                                           ),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     Container(
//                                                       height: 70,
//                                                       child: Padding(
//                                                         padding: const EdgeInsets.only(left:10.0, right: 10,top:10),
//                                                         child: Text(FootTab.FoottabList[index].text, style: Styles().openRegular(size: 10.0),),
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
//                                         new StaggeredTile.count(2, FootTab.FoottabList[index].selected ==false ?  1.6: 2),
//                                         mainAxisSpacing: 10.0,
//                                         crossAxisSpacing: 10.0,
//
//                                       ),
//                                     ),
//
//                                     // Backyard work starts
//
//                                   ],),
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
