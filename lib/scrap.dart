// // AnimatedContainer(
// // duration: Duration(milliseconds: 300),
// // decoration: BoxDecoration(
// // border: Border.all(color: clelist[index].selected==true?Color(0xFFFF0000):Color(0xFFEFEFEF) ),
// // borderRadius: BorderRadius.circular(10),
// // color: Colors.white
// // ),
// // height: clelist[index].selected ==false ? 70:80,
// // //height: CleaningRoomsTab.cleaningRoomsTabList[index].selected ==false ? 100.0.h:150.0.h,
// // width: 160.0,
// // child: Column(
// // mainAxisAlignment: MainAxisAlignment.start,
// // crossAxisAlignment: CrossAxisAlignment.start,
// // children: [
// // Container(
// // height: 30,
// // decoration: BoxDecoration(
// // color: clelist[index].selected==true?Color(0xFFFF0000):Color(0xFFEFEFEF),
// // borderRadius: BorderRadius.only(
// // topRight: Radius.circular(5),
// // topLeft: Radius.circular(5),
// // )
// // ),
// // child: Padding(
// // padding: const EdgeInsets.only(left:8.0,right: 8),
// // child: Center(
// // child: Container(
// // child: Row(
// // crossAxisAlignment: CrossAxisAlignment.start,
// // mainAxisAlignment: MainAxisAlignment.spaceBetween,
// // children: [
// // Text(clelist[index].time,style: Styles().openBold(size: 14.0,color: clelist[index].selected==true?Colors.white:Colors.black),),
// // Text(clelist[index].money,style: Styles().openBold(size: 14.0,color: clelist[index].selected==true?Colors.white:Colors.black),),
// // ],
// // ),
// // ),
// // ),
// // ),
// // ),
// // SizedBox(height: 5,),
// // Container(height: 70,
// // child: Padding(
// // padding: const EdgeInsets.only(left:10.0, right: 10,),
// // child: Text(clelist[index].text, style:
// // //TextStyle(fontSize: h*0.019.sp),
// // Styles().openRegular(size: 11.0),
// // ),
// // ),
// // ),
// // //Spacer(),
// // Expanded(child: Padding(
// // padding: const EdgeInsets.only(left:10.0,top: 5),
// // child: SingleChildScrollView(
// // child: Column(
// // children: [
// // SizedBox(height:  15,),
// // alertD(),
// // ],
// // ),
// // ),
// // ))
// // ],
// // ),
// // ),
//
//
//
// Padding(
// padding: const EdgeInsets.only(left:0,right:0.0),
// child: StaggeredGridView.countBuilder(
// physics: AlwaysScrollableScrollPhysics(),
// controller: new ScrollController(keepScrollOffset: false),
// shrinkWrap: true,
// scrollDirection: Axis.vertical,
// crossAxisCount: 4,
// // addAutomaticKeepAlives: true,
// itemCount: CleaningHourlyTab.cleaningHourlyTabTabList.length,
//
// itemBuilder: (_, index) {
// return InkWell(
// onTap: (){
// setState(() {
// for(int i =0; i< CleaningHourlyTab.cleaningHourlyTabTabList.length; i++){
// if(i == index)
// {
// if(CleaningHourlyTab.cleaningHourlyTabTabList[i].selected == true){
// CleaningHourlyTab.cleaningHourlyTabTabList[i].selected = false;
// }else{
// CleaningHourlyTab.cleaningHourlyTabTabList[i].selected = true;}
// }
// else{
// CleaningHourlyTab.cleaningHourlyTabTabList[i].selected = false;
//
//
// }
// }
// });
// },
// child: SingleChildScrollView(
// child: AnimatedContainer(
// duration: Duration(milliseconds: 300),
// decoration: BoxDecoration(
// border: Border.all(color: CleaningHourlyTab.cleaningHourlyTabTabList[index].selected==true?Color(0xFFFF0000):Color(0xFFEFEFEF) ),
// borderRadius: BorderRadius.circular(10),
// color: Colors.white
//
// ),
// height:
// CleaningHourlyTab.cleaningHourlyTabTabList[index].selected ==false ? 80:120,
// width: 160,
// child: Column(
// mainAxisAlignment: MainAxisAlignment.start,
// crossAxisAlignment: CrossAxisAlignment.start,
// children: [
// Container(
// height: 30,
// decoration: BoxDecoration(
// color: CleaningHourlyTab.cleaningHourlyTabTabList[index].selected==true?Color(0xFFFF0000):Color(0xFFEFEFEF),
// borderRadius: BorderRadius.only(
// topRight: Radius.circular(5),
// topLeft: Radius.circular(5),
// )
// ),
// child: Padding(
// padding: const EdgeInsets.only(left:8.0,right: 8),
// child: Center(
// child: Row(
// crossAxisAlignment: CrossAxisAlignment.start,
// mainAxisAlignment: MainAxisAlignment.spaceBetween,
// children: [
// Text(CleaningHourlyTab.cleaningHourlyTabTabList[index].time,style: Styles().openBold(size: 14.0,color: CleaningHourlyTab.cleaningHourlyTabTabList[index].selected==true?Colors.white:Colors.black),),
// Text(CleaningHourlyTab.cleaningHourlyTabTabList[index].money,style: Styles().openBold(size: 14.0,color: CleaningHourlyTab.cleaningHourlyTabTabList[index].selected==true?Colors.white:Colors.black),),
// ],
// ),
// ),
// ),
// ),
// Padding(
// padding: const EdgeInsets.only(left:10.0, right: 10,top:10),
// child: Text(CleaningHourlyTab.cleaningHourlyTabTabList[index].text, style: Styles().openRegular(size: 11.0),),
// ),
// Spacer(),
// Expanded(child: Padding(
// padding: const EdgeInsets.only(left:10.0,),
// child: SingleChildScrollView(
// child: Column(
// children: [
//
// SizedBox(height: 5,),
// alertD(),
// ],
// // SizedBox(height: 5,),
//
//
// ),
// ),
// ))
// ],
// ),
// ),
// ),
// );
//
// },
//
// staggeredTileBuilder: (int index) =>
// //new StaggeredTile.fit(4),
// new StaggeredTile.count(2, CleaningHourlyTab.cleaningHourlyTabTabList[index].selected ==false ?  1.2: 2),
// mainAxisSpacing: 10.0,
// crossAxisSpacing: 10.0,
//
// ),
// ),



// for(wid in homesubcat.length){
//
// };
// new ListView.builder(
//    itemCount: homesubcat.length,
//   itemBuilder: Padding(
//     padding: const EdgeInsets.only(left:0,right:0.0,),
//     child: StaggeredGridView.countBuilder(
//       physics: AlwaysScrollableScrollPhysics(),
//       controller: new ScrollController(keepScrollOffset: false),
//       scrollDirection: Axis.vertical,
//       crossAxisCount: 4,
//       // addAutomaticKeepAlives: true,
//       itemCount: clelist.length,
//
//       itemBuilder: (_, index) {
//         return InkWell(
//           onTap: (){
//
//             for(int i =0; i< clelist.length; i++){
//               if(i == index)
//               {
//                 if(clelist[i].selected == true){
//                   clelist[i].selected = false;
//                 }else{
//                   clelist[i].selected = true;}
//               }
//               else{
//                 clelist[i].selected = false;
//
//
//               }
//             }
//
//           },
//           child: AnimatedContainer(
//             duration: Duration(milliseconds: 300),
//             decoration: BoxDecoration(
//                 border: Border.all(color: clelist[index].selected==true?Color(0xFFFF0000):Color(0xFFEFEFEF) ),
//                 borderRadius: BorderRadius.circular(10),
//                 color: Colors.white
//             ),
//             height: clelist[index].selected ==false ? 70:80,
//             //height: CleaningRoomsTab.cleaningRoomsTabList[index].selected ==false ? 100.0.h:150.0.h,
//             width: 160.0,
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Container(
//                   height: 30,
//                   decoration: BoxDecoration(
//                       color: clelist[index].selected==true?Color(0xFFFF0000):Color(0xFFEFEFEF),
//                       borderRadius: BorderRadius.only(
//                         topRight: Radius.circular(5),
//                         topLeft: Radius.circular(5),
//                       )
//                   ),
//                   child: Padding(
//                     padding: const EdgeInsets.only(left:8.0,right: 8),
//                     child: Center(
//                       child: Container(
//                         child: Row(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(clelist[index].time,style: Styles().openBold(size: 14.0,color: clelist[index].selected==true?Colors.white:Colors.black),),
//                             Text(clelist[index].money,style: Styles().openBold(size: 14.0,color: clelist[index].selected==true?Colors.white:Colors.black),),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ),
//                 ),
//                 SizedBox(height: 5,),
//                 Container(height: 70,
//                   child: Padding(
//                     padding: const EdgeInsets.only(left:10.0, right: 10,),
//                     child: Text(clelist[index].text, style:
//                     //TextStyle(fontSize: h*0.019.sp),
//                     Styles().openRegular(size: 11.0),
//                     ),
//                   ),
//                 ),
//                 //Spacer(),
//                 Expanded(child: Padding(
//                   padding: const EdgeInsets.only(left:10.0,top: 5),
//                   child: SingleChildScrollView(
//                     child: Column(
//                       children: [
//                         SizedBox(height:  15,),
//                         alertD(),
//                       ],
//                     ),
//                   ),
//                 ))
//               ],
//             ),
//           ),
//         );
//
//       },
//
//       staggeredTileBuilder: (int index) =>
//       //new StaggeredTile.fit(4),
//       new StaggeredTile.count(2, clelist[index].selected ==false ?  1.52: 2),
//       mainAxisSpacing: 10.0,
//       crossAxisSpacing: 10.0,
//
//     ),
//   ),
//
// ),
// Padding(
//   padding: const EdgeInsets.only(left:0,right:0.0,),
//   child: StaggeredGridView.countBuilder(
//     physics: AlwaysScrollableScrollPhysics(),
//     controller: new ScrollController(keepScrollOffset: false),
//     scrollDirection: Axis.vertical,
//     crossAxisCount: 4,
//     // addAutomaticKeepAlives: true,
//     itemCount: clelist.length,
//
//     itemBuilder: (_, index) {
//       return InkWell(
//         onTap: (){
//           setState(() {
//             for(int i =0; i< clelist.length; i++){
//               if(i == index)
//               {
//                 if(clelist[i].selected == true){
//                   clelist[i].selected = false;
//                 }else{
//                   clelist[i].selected = true;}
//               }
//               else{
//                 clelist[i].selected = false;
//
//
//               }
//             }
//           });
//         },
//         child: AnimatedContainer(
//           duration: Duration(milliseconds: 300),
//           decoration: BoxDecoration(
//               border: Border.all(color: clelist[index].selected==true?Color(0xFFFF0000):Color(0xFFEFEFEF) ),
//               borderRadius: BorderRadius.circular(10),
//               color: Colors.white
//           ),
//           height: clelist[index].selected ==false ? 70:80,
//           //height: CleaningRoomsTab.cleaningRoomsTabList[index].selected ==false ? 100.0.h:150.0.h,
//           width: 160.0,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Container(
//                 height: 30,
//                 decoration: BoxDecoration(
//                     color: clelist[index].selected==true?Color(0xFFFF0000):Color(0xFFEFEFEF),
//                     borderRadius: BorderRadius.only(
//                       topRight: Radius.circular(5),
//                       topLeft: Radius.circular(5),
//                     )
//                 ),
//                 child: Padding(
//                   padding: const EdgeInsets.only(left:8.0,right: 8),
//                   child: Center(
//                     child: Container(
//                       child: Row(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           Text(clelist[index].time,style: Styles().openBold(size: 14.0,color: clelist[index].selected==true?Colors.white:Colors.black),),
//                           Text(clelist[index].money,style: Styles().openBold(size: 14.0,color: clelist[index].selected==true?Colors.white:Colors.black),),
//                         ],
//                       ),
//                     ),
//                   ),
//                 ),
//               ),
//               SizedBox(height: 5,),
//               Container(height: 70,
//                 child: Padding(
//                   padding: const EdgeInsets.only(left:10.0, right: 10,),
//                   child: Text(clelist[index].text, style:
//                   //TextStyle(fontSize: h*0.019.sp),
//                   Styles().openRegular(size: 11.0),
//                   ),
//                 ),
//               ),
//               //Spacer(),
//               Expanded(child: Padding(
//                 padding: const EdgeInsets.only(left:10.0,top: 5),
//                 child: SingleChildScrollView(
//                   child: Column(
//                     children: [
//                       SizedBox(height:  15,),
//                       alertD(),
//                     ],
//                   ),
//                 ),
//               ))
//             ],
//           ),
//         ),
//       );
//
//     },
//
//     staggeredTileBuilder: (int index) =>
//     //new StaggeredTile.fit(4),
//     new StaggeredTile.count(2, clelist[index].selected ==false ?  1.52: 2),
//     mainAxisSpacing: 10.0,
//     crossAxisSpacing: 10.0,
//
//   ),
// ),

// Backyard work starts