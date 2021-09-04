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
// class Sitters extends StatefulWidget {
//   @override
//   _homeViewState createState() => _homeViewState();
// }
//
// class _homeViewState extends State<Sitters>
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
//                       length:3,
//                       initialIndex: 0,
//                       child : SingleChildScrollView(
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Padding(
//                               padding: const EdgeInsets.only(left:0,),
//                               child: TabBar(
//
//                                 isScrollable: true,
//                                 physics: AlwaysScrollableScrollPhysics(),
//                                 controller: controller,
//                                 unselectedLabelColor: Colors.grey,
//                                 labelColor: Colors.black,
//                                 labelPadding: EdgeInsets.only(right: 0),
//
//                                 indicatorColor: Colors.transparent,
//                                 tabs:
//                                 [
//                                   Text(
//                                       "Sitter", style: Styles().openBold(size: 24.0)),
//
//                                   Padding(
//                                     padding: const EdgeInsets.only(left:40.0),
//                                     child: Container(
//                                       alignment: Alignment.center,
//                                       child: Text(
//                                         "Baby Sitter", style: Styles().openBold(size: 24.0),
//                                       ),
//                                     ),
//                                   ),
//                                   Padding(
//                                     padding: const EdgeInsets.only(left:40.0),
//                                     child: Container(
//                                       alignment: Alignment.center,
//                                       child: Text(
//                                           "Pet Sitter", style: Styles().openBold(size: 24.0)
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//
//                             SingleChildScrollView(
//                               child: Padding(
//                                 padding: const EdgeInsets.only(left:0,top: 0,right: 0),
//                                 child: Container(
//                                   height: MediaQuery.of(context).size.height/1.9,
//                                   child:
//                                   TabBarView(
//                                     controller: controller,
//                                     children: [
//                                       Padding(
//                                         padding: const EdgeInsets.only(left:0,right:0.0),
//                                         child: Column(
//
//                                           crossAxisAlignment: CrossAxisAlignment.start,
//                                           children: [
//                                             Text('17+ Years Old',style:  Styles().openRegular(size: 9.0),),
//                                             SizedBox(height: 10,),
//                                             StaggeredGridView.countBuilder(
//                                               physics: AlwaysScrollableScrollPhysics(),
//                                               controller: new ScrollController(keepScrollOffset: true),
//                                               shrinkWrap: true,
//                                               scrollDirection: Axis.vertical,
//                                               crossAxisCount: 4,
//                                               // addAutomaticKeepAlives: true,
//                                               itemCount: CaringTab.caringtabList.length,
//
//                                               itemBuilder: (_, index) {
//                                                 return InkWell(
//                                                   onTap: (){
//                                                     setState(() {
//                                                       for(int i =0; i< CaringTab.caringtabList.length; i++){
//                                                         if(i == index)
//                                                         {
//                                                           if(CaringTab.caringtabList[i].selected == true){
//                                                             CaringTab.caringtabList[i].selected = false;
//                                                           }else{
//                                                             CaringTab.caringtabList[i].selected = true;}
//                                                         }
//                                                         else{
//                                                           CaringTab.caringtabList[i].selected = false;
//
//
//                                                         }
//                                                       }
//                                                     });
//                                                   },
//                                                   child: SingleChildScrollView(
//                                                     scrollDirection: Axis.vertical,
//                                                     child: AnimatedContainer(
//                                                       duration: Duration(milliseconds: 300),
//                                                       decoration: BoxDecoration(
//                                                           border: Border.all(color: CaringTab.caringtabList[index].selected==true?Color(0xFFff0000):Color(0xFFEFEFEF) ),
//                                                           borderRadius: BorderRadius.circular(10),
//                                                           color: Colors.white
//
//                                                       ),
//                                                       height:
//                                                       CaringTab.caringtabList[index].selected ==false ? 90:120,
//                                                       width: 160,
//                                                       child: Column(
//                                                         mainAxisAlignment: MainAxisAlignment.start,
//                                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                                         children: [
//                                                           Container(
//                                                             height: 30,
//                                                             decoration: BoxDecoration(
//                                                                 color: CaringTab.caringtabList[index].selected==true?Color(0xFFff0000):Color(0xFFEFEFEF),
//                                                                 borderRadius: BorderRadius.only(
//                                                                   topRight: Radius.circular(5),
//                                                                   topLeft: Radius.circular(5),
//                                                                 )
//                                                             ),
//                                                             child: Padding(
//                                                               padding: const EdgeInsets.only(left:8.0,right: 8),
//                                                               child: Center(
//                                                                 child: Row(
//                                                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                   children: [
//                                                                     Text(CaringTab.caringtabList[index].time,style: Styles().openBold(size: 14.0,color: CaringTab.caringtabList[index].selected==true?Colors.white:Colors.black),),
//                                                                     Text(CaringTab.caringtabList[index].money,style: Styles().openBold(size: 14.0,color: CaringTab.caringtabList[index].selected==true?Colors.white:Colors.black),),
//
//                                                                   ],
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           ),
//                                                           Padding(
//                                                             padding: const EdgeInsets.only(left:10.0, right: 10,top:10),
//                                                             child: Text(CaringTab.caringtabList[index].text, style:  Styles().openRegular(size: 10.0),),
//                                                           ),
//                                                           Spacer(),
//                                                           Expanded(child: Padding(
//                                                             padding: const EdgeInsets.only(left:10.0),
//                                                             child: SingleChildScrollView(
//                                                               child: Column(
//                                                                 children: [
//
//                                                                   alertD(),
//
//
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ))
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 );
//
//                                               },
//
//                                               staggeredTileBuilder: (int index) =>
//                                               //new StaggeredTile.fit(4),
//                                               new StaggeredTile.count(2, CaringTab.caringtabList[index].selected ==false ?  1.4 : 2),
//                                               mainAxisSpacing: 10.0,
//                                               crossAxisSpacing: 10.0,
//
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.only(left:0,right:0.0),
//                                         child: Column(
//
//                                           crossAxisAlignment: CrossAxisAlignment.start,
//                                           children: [
//                                             Text('3 - 16 Years Old',style:  Styles().openRegular(size: 9.0),),
//                                             SizedBox(height: 10,),
//                                             StaggeredGridView.countBuilder(
//                                               physics: AlwaysScrollableScrollPhysics(),
//                                               controller: new ScrollController(keepScrollOffset: true),
//                                               shrinkWrap: true,
//                                               scrollDirection: Axis.vertical,
//                                               crossAxisCount: 4,
//                                               // addAutomaticKeepAlives: true,
//                                               itemCount: CaringTab.caringtabList.length,
//
//                                               itemBuilder: (_, index) {
//                                                 return InkWell(
//                                                   onTap: (){
//                                                     setState(() {
//                                                       for(int i =0; i< CaringTab.caringtabList.length; i++){
//                                                         if(i == index)
//                                                         {
//                                                           if(CaringTab.caringtabList[i].selected == true){
//                                                             CaringTab.caringtabList[i].selected = false;
//                                                           }else{
//                                                             CaringTab.caringtabList[i].selected = true;}
//                                                         }
//                                                         else{
//                                                           CaringTab.caringtabList[i].selected = false;
//
//
//                                                         }
//                                                       }
//                                                     });
//                                                   },
//                                                   child: SingleChildScrollView(
//                                                     child: AnimatedContainer(
//                                                       duration: Duration(milliseconds: 300),
//                                                       decoration: BoxDecoration(
//                                                           border: Border.all(color: CaringTab.caringtabList[index].selected==true?Color(0xFFff0000):Color(0xFFEFEFEF) ),
//                                                           borderRadius: BorderRadius.circular(10),
//                                                           color: Colors.white
//
//                                                       ),
//                                                       height:
//                                                       CaringTab.caringtabList[index].selected ==false ? 90:120,
//                                                       width: 160,
//                                                       child: Column(
//                                                         mainAxisAlignment: MainAxisAlignment.start,
//                                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                                         children: [
//                                                           Container(
//                                                             height: 30,
//                                                             decoration: BoxDecoration(
//                                                                 color: CaringTab.caringtabList[index].selected==true?Color(0xFFff0000):Color(0xFFEFEFEF),
//                                                                 borderRadius: BorderRadius.only(
//                                                                   topRight: Radius.circular(5),
//                                                                   topLeft: Radius.circular(5),
//                                                                 )
//                                                             ),
//                                                             child: Padding(
//                                                               padding: const EdgeInsets.only(left:8.0,right: 8),
//                                                               child: Center(
//                                                                 child: Row(
//                                                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                   children: [
//                                                                     Text(CaringTab.caringtabList[index].time,style: Styles().openBold(size: 14.0,color: CaringTab.caringtabList[index].selected==true?Colors.white:Colors.black),),
//                                                                     Text(CaringTab.caringtabList[index].money,style: Styles().openBold(size: 14.0,color: CaringTab.caringtabList[index].selected==true?Colors.white:Colors.black),),
//
//                                                                   ],
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           ),
//                                                           Padding(
//                                                             padding: const EdgeInsets.only(left:10.0, right: 10,top:10),
//                                                             child: Text(CaringTab.caringtabList[index].text, style:  Styles().openRegular(size: 10.0),),
//                                                           ),
//                                                           Spacer(),
//                                                           Expanded(child: Padding(
//                                                             padding: const EdgeInsets.only(left:10.0),
//                                                             child: SingleChildScrollView(
//                                                               child: Column(
//                                                                 children: [
//                                                                   alertD(),
//
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ))
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 );
//
//                                               },
//
//                                               staggeredTileBuilder: (int index) =>
//                                               //new StaggeredTile.fit(4),
//                                               new StaggeredTile.count(2, CaringTab.caringtabList[index].selected ==false ?  1.4 : 2),
//                                               mainAxisSpacing: 10.0,
//                                               crossAxisSpacing: 10.0,
//
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//                                       Padding(
//                                         padding: const EdgeInsets.only(left:0,right:0.0),
//                                         child: Column(
//
//                                           crossAxisAlignment: CrossAxisAlignment.start,
//                                           children: [
//                                             Text('',style:  Styles().openRegular(size: 9.0),),
//                                             SizedBox(height: 10,),
//                                             StaggeredGridView.countBuilder(
//                                               physics: AlwaysScrollableScrollPhysics(),
//                                               controller: new ScrollController(keepScrollOffset: true),
//                                               shrinkWrap: true,
//                                               scrollDirection: Axis.vertical,
//                                               crossAxisCount: 4,
//                                               // addAutomaticKeepAlives: true,
//                                               itemCount: CaringTab.caringtabList.length,
//
//                                               itemBuilder: (_, index) {
//                                                 return InkWell(
//                                                   onTap: (){
//                                                     setState(() {
//                                                       for(int i =0; i< CaringTab.caringtabList.length; i++){
//                                                         if(i == index)
//                                                         {
//                                                           if(CaringTab.caringtabList[i].selected == true){
//                                                             CaringTab.caringtabList[i].selected = false;
//                                                           }else{
//                                                             CaringTab.caringtabList[i].selected = true;}
//                                                         }
//                                                         else{
//                                                           CaringTab.caringtabList[i].selected = false;
//
//
//                                                         }
//                                                       }
//                                                     });
//                                                   },
//                                                   child: SingleChildScrollView(
//                                                     child: AnimatedContainer(
//                                                       duration: Duration(milliseconds: 300),
//                                                       decoration: BoxDecoration(
//                                                           border: Border.all(color: CaringTab.caringtabList[index].selected==true?Color(0xFFff0000):Color(0xFFEFEFEF) ),
//                                                           borderRadius: BorderRadius.circular(10),
//                                                           color: Colors.white
//
//                                                       ),
//                                                       height:
//                                                       CaringTab.caringtabList[index].selected ==false ? 90:120,
//                                                       width: 160,
//                                                       child: Column(
//                                                         mainAxisAlignment: MainAxisAlignment.start,
//                                                         crossAxisAlignment: CrossAxisAlignment.start,
//                                                         children: [
//                                                           Container(
//                                                             height: 30,
//                                                             decoration: BoxDecoration(
//                                                                 color: CaringTab.caringtabList[index].selected==true?Color(0xFFff0000):Color(0xFFEFEFEF),
//                                                                 borderRadius: BorderRadius.only(
//                                                                   topRight: Radius.circular(5),
//                                                                   topLeft: Radius.circular(5),
//                                                                 )
//                                                             ),
//                                                             child: Padding(
//                                                               padding: const EdgeInsets.only(left:8.0,right: 8),
//                                                               child: Center(
//                                                                 child: Row(
//                                                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                                                   children: [
//                                                                     Text(CaringTab.caringtabList[index].time,style: Styles().openBold(size: 14.0,color: CaringTab.caringtabList[index].selected==true?Colors.white:Colors.black),),
//                                                                     Text(CaringTab.caringtabList[index].money,style: Styles().openBold(size: 14.0,color: CaringTab.caringtabList[index].selected==true?Colors.white:Colors.black),),
//
//                                                                   ],
//                                                                 ),
//                                                               ),
//                                                             ),
//                                                           ),
//                                                           Padding(
//                                                             padding: const EdgeInsets.only(left:10.0, right: 10,top:10),
//                                                             child: Text(CaringTab.caringtabList[index].text, style:  Styles().openRegular(size: 10.0),),
//                                                           ),
//                                                           Spacer(),
//                                                           Expanded(child: Padding(
//                                                             padding: const EdgeInsets.only(left:10.0),
//                                                             child: SingleChildScrollView(
//                                                               child: Column(
//                                                                 children: [
//                                                                   alertD(),
//                                                                   SizedBox(height: 10,),
//
//                                                                 ],
//                                                               ),
//                                                             ),
//                                                           ))
//                                                         ],
//                                                       ),
//                                                     ),
//                                                   ),
//                                                 );
//
//                                               },
//
//                                               staggeredTileBuilder: (int index) =>
//                                               //new StaggeredTile.fit(4),
//                                               new StaggeredTile.count(2, CaringTab.caringtabList[index].selected ==false ?  1.4 : 2),
//                                               mainAxisSpacing: 10.0,
//                                               crossAxisSpacing: 10.0,
//
//                                             ),
//                                           ],
//                                         ),
//                                       ),
//
//
//                                     ],),
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
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
