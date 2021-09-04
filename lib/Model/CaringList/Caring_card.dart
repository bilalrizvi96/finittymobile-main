// import 'package:charles_app/Model/CaringList/Caring.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
// import 'package:flutter/rendering.dart';
//
//
//
//
//
// class Caring_Card extends StatefulWidget {
//   final Caring caring;
//   final int ind;
//
//   const Caring_Card({Key key,this.ind, this.caring}) : super(key: key);
//   @override
//   Caring_Cards createState() => Caring_Cards(this.caring);
//
// }
// class Caring_Cards extends State<Caring_Card> {
//
//   final Caring caring;
//   @override
//
//   Caring_Cards(this.caring);
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 150,
//       child: Card(
//         //color: caring.clr,
//         elevation: 5,
//         shape: RoundedRectangleBorder(
//           borderRadius: BorderRadius.circular(10)
//         ),
//
//
//         child: Padding(
//           padding: const EdgeInsets.only(bottom:8.0,left: 8),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.start,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Padding(
//                 padding: const EdgeInsets.only(top:25.0),
//                 child: Align(
//                   alignment: Alignment.topCenter,
//                   child: Image.asset(
//                     caring.cImg,
//                     height: MediaQuery.of(context).size.height / 10,
//                     width: 100,
//                   ),
//                 ),
//               ),
//
//               Spacer(),
//               Text(
//                 caring.title,
//                 textAlign: TextAlign.left,
//                 style: TextStyle(fontSize: 18.0,color: Colors.white),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(top:3.0),
//                 child: Text(
//                     caring.subText,
//                     style: TextStyle(color: Colors.white, fontSize: 13)
//                 ),
//               ),
//             ],
//             ),
//         ),
//       ),
//     );
//   }
//
// }
//
