// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
//
// import '../../Component/alert/alertDialog.dart';
// import 'package:charles_app/Model/Cleaning/cleaningCard.dart';
// import 'package:charles_app/Model/Cleaning/cleaningList.dart';
// import 'package:charles_app/View/Cleaning/cleaningLanding.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
// import '../../widgets/widgets.dart';
//
// bool selected= true;
// bool selected2= true;
// bool selected3= true;
// bool selected4= true;
//
// class poolLanding extends StatefulWidget {
//   @override
//   _poolLandingState createState() => _poolLandingState();
// }
//
// class _poolLandingState extends State<poolLanding>
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
//           color:Colors.white,
//           child: Stack(
//             children:[
//               Padding(
//                 padding: const EdgeInsets.only(left:0,),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
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
//                               Text(
//                                 "Above-ground", style:  Styles().openBold(size: 24.0),
//                               ),
//                             ],
//                           ),
//                           Text("Regular pool maintainance",style:  Styles().openRegular(size: 9.0),),
//
//
//
//                           Container(
//                             height: MediaQuery.of(context).size.height/2.1,
//                             child:
//                             TabBarView(children: [
//                               Padding(
//                                 padding: const EdgeInsets.only(left:0,right:0,top: 10),
//                                 child: StaggeredGridView.countBuilder(
//                                   physics: AlwaysScrollableScrollPhysics(),
//                                   controller: new ScrollController(keepScrollOffset: false),
//                                   scrollDirection: Axis.vertical,
//                                   crossAxisCount: 4,
//                                   // addAutomaticKeepAlives: true,
//                                   itemCount: CleaningPoolTabs.cleaningPoolTabsList.length,
//
//                                   itemBuilder: (_, index) {
//                                     return InkWell(
//                                       onTap: (){
//                                         setState(() {
//                                           for(int i =0; i< CleaningPoolTabs.cleaningPoolTabsList.length; i++){
//                                             if(i == index)
//                                             {
//                                               if(CleaningPoolTabs.cleaningPoolTabsList[i].selected == true){
//                                                 CleaningPoolTabs.cleaningPoolTabsList[i].selected = false;
//                                               }else{
//                                                 CleaningPoolTabs.cleaningPoolTabsList[i].selected = true;}
//                                             }
//                                             else{
//                                               CleaningPoolTabs.cleaningPoolTabsList[i].selected = false;
//
//
//                                             }
//                                           }
//                                         });
//                                       },
//                                       child: SingleChildScrollView(
//                                         child: AnimatedContainer(
//                                           duration: Duration(milliseconds: 300),
//                                           decoration: BoxDecoration(
//                                               border: Border.all(color: CleaningPoolTabs.cleaningPoolTabsList[index].selected==true?Color(0xFFFF0000):Color(0xFFEFEFEF) ),
//                                               borderRadius: BorderRadius.circular(10),
//                                               color: Colors.white
//
//                                           ),
//                                           height:
//                                           CleaningPoolTabs.cleaningPoolTabsList[index].selected ==false ? 90:120,
//                                           width: 160,
//                                           child: Column(
//                                             mainAxisAlignment: MainAxisAlignment.start,
//                                             crossAxisAlignment: CrossAxisAlignment.start,
//                                             children: [
//                                               Container(
//                                                 height: 30,
//                                                 decoration: BoxDecoration(
//                                                     color: CleaningPoolTabs.cleaningPoolTabsList[index].selected==true?Color(0xFFFF0000):Color(0xFFEFEFEF),
//                                                     borderRadius: BorderRadius.only(
//                                                       topRight: Radius.circular(5),
//                                                       topLeft: Radius.circular(5),
//                                                     )
//                                                 ),
//                                                 child: Padding(
//                                                   padding: const EdgeInsets.only(left:8.0,right: 8),
//                                                   child: Center(
//                                                     child: Row(
//                                                       crossAxisAlignment: CrossAxisAlignment.start,
//                                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                       children: [
//                                                         Text(CleaningPoolTabs.cleaningPoolTabsList[index].time,style: Styles().openBold(size: 14.0,color: CleaningPoolTabs.cleaningPoolTabsList[index].selected==true?Colors.white:Colors.black),),
//                                                         Text(CleaningPoolTabs.cleaningPoolTabsList[index].money,style: Styles().openBold(size: 14.0,color: CleaningPoolTabs.cleaningPoolTabsList[index].selected==true?Colors.white:Colors.black),),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                               ),
//                                               Padding(
//                                                 padding: const EdgeInsets.only(left:5.0, right: 0,top:10),
//                                                 child: Row(
//                                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                   children: [
//                                                     Container(
//                                                         width:MediaQuery.of(context).size.width/4,
//                                                         child: Text(CleaningPoolTabs.cleaningPoolTabsList[index].text, textAlign: TextAlign.start,style: Styles().openRegular(size: 11.0),)),
//                                                     Padding(
//                                                       padding: const EdgeInsets.only(right:5.0),
//                                                       child: Text(CleaningPoolTabs.cleaningPoolTabsList[index].text2, style: Styles().openRegular(size: 11.0),),
//                                                     ),
//                                                   ],
//                                                 ),
//                                               ),
//                                               Spacer(),
//                                               Expanded(child: Padding(
//                                                 padding: const EdgeInsets.only(left:5.0),
//                                                 child: SingleChildScrollView(
//                                                   child: Column(
//                                                     children: [
//                                                       SizedBox(height: 0,),
//                                                       alertD(),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ))
//                                             ],
//                                           ),
//                                         ),
//                                       ),
//                                     );
//
//                                   },
//
//                                   staggeredTileBuilder: (int index) =>
//                                   //new StaggeredTile.fit(4),
//                                   new StaggeredTile.count(2, CleaningPoolTabs.cleaningPoolTabsList[index].selected ==false ?  1.3: 2),
//                                   mainAxisSpacing: 10.0,
//                                   crossAxisSpacing: 10.0,
//
//                                 ),
//                               ),
//
//                               // Backyard work starts
//
//                             ],),
//                           ),
//
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//
//     );
//   }
// }
