// import 'package:charles_app/Model/CaringList/Caring.dart';
// import 'package:charles_app/Model/CaringList/Caring_card.dart';
// import 'package:flutter/material.dart';
//
//
//
// class CaringList extends StatefulWidget {
//   @override
//   _CaringListPageState createState() => _CaringListPageState();
//
// }
// class _CaringListPageState extends State<CaringList> {
//
//   @override
//   Widget build(BuildContext context) {
//     return  SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Container(
//
//             height: MediaQuery.of(context).size.height/4,
//             width: MediaQuery.of(context).size.width,
//             child:
//             ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: caring.length,
//                 itemBuilder: (_, index) {
//                   return Caring_Card(
//                     caring: caring[index],
//                   );
//                 }
//             ),
//
//           ),
//         ),
//       ),
//     );
//   }
// }