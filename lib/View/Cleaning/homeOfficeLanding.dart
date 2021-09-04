// import 'package:charles_app/BaseUrl/variableGloable.dart';
// import 'package:charles_app/Component/alert/alertDialog.dart';
// import 'package:charles_app/Model/CaringList/Caring.dart';
// import 'package:charles_app/Model/Cleaning/cleaningList.dart';
// import 'package:charles_app/View/Cleaning/cleaningView.dart';
// import 'package:charles_app/View/setLocation.dart';
//
//
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
//
// import '../../widgets/widgets.dart';
//
//
//
// class homeView extends StatefulWidget {
//   int  selectedIndex;
//   homeView(_selectedIndex){
//     this.selectedIndex = _selectedIndex;
//     _homeViewState().DataCalling();
//     set();
//   }
//   void set(){
//
//   }
//
//   @override
//   _homeViewState createState() => _homeViewState();
// }
//
// //CleaningRoomsTab cletab;
// List<CleaningRoomsTab> clelist = new List();
// List<Homesubcar> homesubcat=new List();
// TabController controller;
//
// class _homeViewState extends State<homeView>
//     with TickerProviderStateMixin {
//   var uppertabindex = 0;
//   var lowertabindex = 0 ;
//
//   void DataCalling() {
//
//     clelist = new List();
//     clelist.clear();
//     // setState(() {
//     // //  var sle=widget._selectedIndex;
//     // });
//     homesubcat.clear();
//     pkglength.clear();
//
//     subcatCleaning.forEach((jsonString) {
//       for (var val in jsonString) {
//         if (val['cleaning_category_id'].toString() == selectedIndextab.toString()) {
//           // Homesubcatt.add(val['name']);
//           homesubcat.add(Homesubcat(val['id'], val['name']));
//
//           var pkgdata = val['packages'];
//           pkglength.add(pkgdata.length);
//           pkgdata.forEach((jsonString) {
//             if (jsonString['cleaning_package_category_id'] == val['id']) {
//
//               clelist.add(CleaningRoomsTab(jsonString['name'],
//                   "\$ " + jsonString['price'].toString(),
//                   jsonString['description']
//                   ,jsonString['items_id'].toString(),jsonString['cleaning_package_category_id'].toString(),val['name'],false));
//             }
//           });
//         }
//       }
//
//         controller=new TabController(length: homesubcat.length, vsync: this);
//
//         controller.addListener(() {
//           setState(() {
//             //DataCalling();
//             uppertabindex = controller.index;
//             //DataCalling();
//             //clelist.clear();
//             if(uppertabindex==0){
//               lowertabindex = 0;
//             }
//             else{
//               lowertabindex = pkglength[controller.index];
//             }
//             list();
//           });
//         });
//     });
//
//
//
//   }
//     //});
//
//   var pkglength = new List();
//
//   @override
//   void initState() {
//
//     // TODO: implement initState
//     super.initState();
//
//     DataCalling();
//   }
//
//   List<Widget> list(){
//
//       return List<Widget>.generate(
//           homesubcat.length, (int index){
//          print("homesub"+homesubcat[uppertabindex].id.toString());
//          print("clelist"+clelist[lowertabindex].id.toString());
//         if (homesubcat[uppertabindex].id.toString() == clelist[lowertabindex].id.toString()){
//
//
//           fclelist.clear();
//           for(var val in clelist){
//             print("val"+val.id.toString());
//             if (val.id == clelist[lowertabindex].id){
//               fclelist.add(val);
//             }
//           }
//           return new Padding(
//             padding: const EdgeInsets.only(left:0,right:0.0,),
//             child: StaggeredGridView.countBuilder(
//               physics: AlwaysScrollableScrollPhysics(),
//               controller: new ScrollController(keepScrollOffset: false),
//               scrollDirection: Axis.vertical,
//               crossAxisCount: 4,
//               // addAutomaticKeepAlives: true,
//               itemCount:fclelist.length,
//
//               itemBuilder: (_, index) {
//                 return InkWell(
//                   onTap: (){
//
//                     for(int i =0; i< fclelist.length; i++){
//                       if(i == index)
//                       {
//                         if(fclelist[i].selected == true){
//                           fclelist[i].selected = false;
//                         }else{
//                           fclelist[i].selected = true;}
//                       }
//                       else{
//                         fclelist[i].selected = false;
//
//
//                       }
//                     }
//
//                   },
//                   child: AnimatedContainer(
//                     duration: Duration(milliseconds: 300),
//                     decoration: BoxDecoration(
//                         border: Border.all(color: fclelist[index].selected==true?Color(0xFFFF0000):Color(0xFFEFEFEF) ),
//                         borderRadius: BorderRadius.circular(10),
//                         color: Colors.white
//                     ),
//                     height: fclelist[index].selected ==false ? 70:80,
//                     //height: CleaningRoomsTab.cleaningRoomsTabList[index].selected ==false ? 100.0.h:150.0.h,
//                     width: 160.0,
//                     child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Container(
//                           height: 30,
//                           decoration: BoxDecoration(
//                               color: fclelist[index].selected==true?Color(0xFFFF0000):Color(0xFFEFEFEF),
//                               borderRadius: BorderRadius.only(
//                                 topRight: Radius.circular(5),
//                                 topLeft: Radius.circular(5),
//                               )
//                           ),
//                           child: Padding(
//                             padding: const EdgeInsets.only(left:8.0,right: 8),
//                             child: Center(
//                               child: Container(
//                                 child: Row(
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(fclelist[index].time,maxLines: 2,softWrap: true,style: Styles().openBold(size: 14.0,color: fclelist[index].selected==true?Colors.white:Colors.black),),
//                                     Spacer(),
//                                     Text(fclelist[index].money,style: Styles().openBold(size: 14.0,color: fclelist[index].selected==true?Colors.white:Colors.black),),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: 5,),
//                         Container(height: 70,
//                           child: Padding(
//                             padding: const EdgeInsets.only(left:10.0, right: 10,),
//                             child: Text(fclelist[index].text, style:
//                             //TextStyle(fontSize: h*0.019.sp),
//                             Styles().openRegular(size: 11.0),
//                             ),
//                           ),
//                         ),
//                         //Spacer(),
//                         Expanded(child: Padding(
//                           padding: const EdgeInsets.only(left:10.0,top: 5),
//                           child: SingleChildScrollView(
//                             child: Column(
//                               children: [
//                                 SizedBox(height:  15,),
//                                 alertD(),
//                               ],
//                             ),
//                           ),
//                         ))
//                       ],
//                     ),
//                   ),
//                 );
//
//               },
//
//               staggeredTileBuilder: (int index) =>
//               //new StaggeredTile.fit(4),
//               new StaggeredTile.count(2, clelist[index].selected ==false ?  1.52: 2),
//               mainAxisSpacing: 10.0,
//               crossAxisSpacing: 10.0,
//
//             ),
//           );
//         }
//         return Container();
//
//
//       });
//
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double h=MediaQuery.of(context).size.height;
//     double w=MediaQuery.of(context).size.width;
//     var text = MediaQuery.of(context).textScaleFactor;
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
//                     DefaultTabController(
//                       length: homesubcat.length,
//                       initialIndex: 0,
//                       child : SingleChildScrollView(
//                         child: Column(
//                           //crossAxisAlignment: CrossAxisAlignment.stretch,
//                           children: [
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 TabBar(
//                                   isScrollable: true,
//                                   controller: controller,
//                                   unselectedLabelColor: Colors.grey,
//                                   labelColor: Colors.black,
//                                   labelPadding: EdgeInsets.only(right: 20),
//                                   indicatorColor: Colors.transparent,
//                                   tabs: List<Widget>.generate(
//                                       homesubcat.length, (int index){
//                                    // print(homesubcat[index].name);
//
//                                     return new Container(
//                                       height: 40,
//                                       margin: EdgeInsets.only(left: 10),
//                                       //alignment: Alignment.center,
//                                       child: Text('${homesubcat[index].name}',
//                                         style: Styles().openBold(size: 22.0),
//                                       ),
//                                     );
//
//                                   }),
//                                 ),
//                               ],
//                             ),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//
//
//                                 SingleChildScrollView(
//                                   child: Padding(
//                                     padding: const EdgeInsets.only(left:0,top: 0,right: 0),
//                                     child: Container(
//                                       //  margin: EdgeInsets.only(bottom: 10),
//                                       height: h /1.9,
//                                       child:
//                                       TabBarView(
//                                         controller:controller ,
//                                         children:list(),
//                                       ),
//                                     ),
//                                   ),
//                                 ),
//                               ],
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
//
//   }
//   //   List<Widget> list = <Widget>[
//   //  new Padding(
//   //     padding: const EdgeInsets.only(left:0,right:0.0,),
//   //     child: StaggeredGridView.countBuilder(
//   //       physics: AlwaysScrollableScrollPhysics(),
//   //       controller: new ScrollController(keepScrollOffset: false),
//   //       scrollDirection: Axis.vertical,
//   //       crossAxisCount: 4,
//   //       // addAutomaticKeepAlives: true,
//   //       itemCount: clelist.length,
//   //
//   //       itemBuilder: (_, index) {
//   //         return InkWell(
//   //           onTap: (){
//   //
//   //               for(int i =0; i< clelist.length; i++){
//   //                 if(i == index)
//   //                 {
//   //                   if(clelist[i].selected == true){
//   //                     clelist[i].selected = false;
//   //                   }else{
//   //                     clelist[i].selected = true;}
//   //                 }
//   //                 else{
//   //                   clelist[i].selected = false;
//   //
//   //
//   //                 }
//   //               }
//   //
//   //           },
//   //           child: AnimatedContainer(
//   //             duration: Duration(milliseconds: 300),
//   //             decoration: BoxDecoration(
//   //                 border: Border.all(color: clelist[index].selected==true?Color(0xFFFF0000):Color(0xFFEFEFEF) ),
//   //                 borderRadius: BorderRadius.circular(10),
//   //                 color: Colors.white
//   //             ),
//   //             height: clelist[index].selected ==false ? 70:80,
//   //             //height: CleaningRoomsTab.cleaningRoomsTabList[index].selected ==false ? 100.0.h:150.0.h,
//   //             width: 160.0,
//   //             child: Column(
//   //               mainAxisAlignment: MainAxisAlignment.start,
//   //               crossAxisAlignment: CrossAxisAlignment.start,
//   //               children: [
//   //                 Container(
//   //                   height: 30,
//   //                   decoration: BoxDecoration(
//   //                       color: clelist[index].selected==true?Color(0xFFFF0000):Color(0xFFEFEFEF),
//   //                       borderRadius: BorderRadius.only(
//   //                         topRight: Radius.circular(5),
//   //                         topLeft: Radius.circular(5),
//   //                       )
//   //                   ),
//   //                   child: Padding(
//   //                     padding: const EdgeInsets.only(left:8.0,right: 8),
//   //                     child: Center(
//   //                       child: Container(
//   //                         child: Row(
//   //                           crossAxisAlignment: CrossAxisAlignment.start,
//   //                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //                           children: [
//   //                             Text(clelist[index].time,style: Styles().openBold(size: 14.0,color: clelist[index].selected==true?Colors.white:Colors.black),),
//   //                             Text(clelist[index].money,style: Styles().openBold(size: 14.0,color: clelist[index].selected==true?Colors.white:Colors.black),),
//   //                           ],
//   //                         ),
//   //                       ),
//   //                     ),
//   //                   ),
//   //                 ),
//   //                 SizedBox(height: 5,),
//   //                 Container(height: 70,
//   //                   child: Padding(
//   //                     padding: const EdgeInsets.only(left:10.0, right: 10,),
//   //                     child: Text(clelist[index].text, style:
//   //                     //TextStyle(fontSize: h*0.019.sp),
//   //                     Styles().openRegular(size: 11.0),
//   //                     ),
//   //                   ),
//   //                 ),
//   //                 //Spacer(),
//   //                 Expanded(child: Padding(
//   //                   padding: const EdgeInsets.only(left:10.0,top: 5),
//   //                   child: SingleChildScrollView(
//   //                     child: Column(
//   //                       children: [
//   //                         SizedBox(height:  15,),
//   //                         alertD(),
//   //                       ],
//   //                     ),
//   //                   ),
//   //                 ))
//   //               ],
//   //             ),
//   //           ),
//   //         );
//   //
//   //       },
//   //
//   //       staggeredTileBuilder: (int index) =>
//   //       //new StaggeredTile.fit(4),
//   //       new StaggeredTile.count(2, clelist[index].selected ==false ?  1.52: 2),
//   //       mainAxisSpacing: 10.0,
//   //       crossAxisSpacing: 10.0,
//   //
//   //     ),
//   //   ),
//   // ];
// }
//
