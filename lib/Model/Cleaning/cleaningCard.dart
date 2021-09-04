// import 'package:charles_app/Model/CaringList/Caring.dart';
// import 'package:charles_app/Model/Cleaning/cleaningList.dart';
// import 'package:charles_app/Model/Cleaning/cleaningList.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
// import 'package:flutter/rendering.dart';
//
//
//
//
//
// class Cleaning_Card extends StatefulWidget {
//   // final Cleaning cleaning;
//   final int ind;
//
//   const Cleaning_Card({Key key,this.ind, this.cleaning}) : super(key: key);
//   @override
//   Cleaning_Cards createState() => Cleaning_Cards(this.cleaning);
//
// }
// class Cleaning_Cards extends State<Cleaning_Card> {
//
//   final Cleaning cleaning;
//   @override
//
//   Cleaning_Cards(this.cleaning);
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 150,
//       child: InkWell(
//         onTap: (){
//           cleaning.visiblity = true;
//           cleaning.clr = Colors.red;
//         },
//         child: Card(
//           color: cleaning.clr,
//           elevation: 5,
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(10)
//           ),
//
//           child: Padding(
//             padding: const EdgeInsets.only(bottom:8.0,left: 8),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Align(
//                   alignment: Alignment.topCenter,
//                   child: Image.asset(
//                     cleaning.img,
//                     height: MediaQuery.of(context).size.height / 10,
//                     width: 100,
//                   ),
//                 ),
//                 Spacer(),
//                 Text(
//                   cleaning.title,
//                   textAlign: TextAlign.left,
//                   style: TextStyle(fontSize: 18.0,color: Colors.white),
//                 ),
//                 Padding(
//                   padding: const EdgeInsets.only(top:3.0),
//                   child: Text(
//                       cleaning.subText,
//                       style: TextStyle(color: Colors.white, fontSize: 13)
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
//
// }
//
