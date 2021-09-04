// import 'package:charles_app/Model/Cleaning/cleaningCard.dart';
// import 'package:charles_app/Model/Cleaning/cleaningList.dart';
// import 'package:flutter/material.dart';
//
// class CleaningBuilder extends StatefulWidget {
//   @override
//   _CleaningBuilderPageState createState() => _CleaningBuilderPageState();
//
// }
// class _CleaningBuilderPageState extends State<CleaningBuilder> {
//
//   @override
//   Widget build(BuildContext context) {
//     return  SafeArea(
//       child: Scaffold(
//         body: SingleChildScrollView(
//           child: Container(
//
//             height: MediaQuery.of(context).size.height/4.7,
//             width: MediaQuery.of(context).size.width,
//             child:
//             ListView.builder(
//                 scrollDirection: Axis.horizontal,
//                 itemCount: cleaingList.length,
//                 itemBuilder: (_, index) {
//                   return Cleaning_Card(
//                     cleaning: cleaingList[index],
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