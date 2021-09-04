// import 'package:circular_check_box/circular_check_box.dart';
// import 'package:flutter/material.dart';
//
// class Page46two extends StatefulWidget {
//   @override
//   _Page46State createState() => _Page46State();
// }
//
// class _Page46State extends State<Page46two> {
//   String expiryDate = "01/2025";
//   bool selected = true;
//
//   Stack _buildLogosBlock({@required Color color}) {
//     return Stack(
//       children: [
//         Positioned(
//           top: 10.5,
//           right: 0.0,
//           child: Container(
//             height: 18.0,
//             width: 18.0,
//             child: CircularCheckBox(
//                 value: this.selected,
//                 checkColor: Colors.white,
//                 activeColor: Colors.green,
//                 inactiveColor: Colors.grey,
//                 disabledColor: Colors.grey,
//                 onChanged: (val) => this.setState(() {
//                   this.selected = !this.selected;
//                 })),
//           ),
//         ),
//         Container(
//           margin: EdgeInsets.only(top: 30.5),
//           child: Row(
//             mainAxisAlignment: MainAxisAlignment.spaceBetween,
//             children: <Widget>[
//               Container(
//                 margin: EdgeInsets.only(left: 30.5),
//                 child: Image.asset(
//                   "assets/chip.png",
//                   width: 30.72,
//                   height: 20.56,
//                   fit: BoxFit.cover,
//                 ),
//               ),
//               Container(
//                 margin: EdgeInsets.only(right: 32.03),
//                 child: Text(
//                   expiryDate,
//                   style: TextStyle(
//                       fontFamily: "Avenir Book",
//                       color: color == Color(0xffFF0000)
//                           ? Colors.white
//                           : Colors.black,
//                       fontSize: 10.0,
//                       fontWeight: FontWeight.bold),
//                 ),
//               )
//             ],
//           ),
//         ),
//       ],
//     );
//   }
//
//   Card _buildCreditCard(
//       {@required Color color,
//         @required String cardNumber,
//         @required String cardHolder}) {
//     return Card(
//       elevation: 4.0,
//       color: color,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.circular(14),
//       ),
//       child: Container(
//         height: 190,
//         width: 333,
//         padding: const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 22.0),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: <Widget>[
//             _buildLogosBlock(color: color),
//             Padding(
//               padding: const EdgeInsets.only(left: 28.86, top: 16.0),
//               child: Text(
//                 '$cardNumber',
//                 style: TextStyle(
//                   color:
//                   color == Color(0xffFF0000) ? Colors.white : Colors.black,
//                   fontSize: 22,
//                 ),
//               ),
//             ),
//             Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: <Widget>[
//                 Column(
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   children: <Widget>[
//                     Container(
//                       padding: const EdgeInsets.only(left: 28.86, top: 16.0),
//                       child: Text(
//                         'Card Holder',
//                         style: TextStyle(
//                             fontFamily: "Avenir Book",
//                             color: color == Color(0xffFF0000)
//                                 ? Colors.white
//                                 : Colors.black,
//                             fontSize: 9,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     ),
//                     Container(
//                       padding: const EdgeInsets.only(left: 28.86, top: 16.0),
//                       child: Text(
//                         '$cardHolder',
//                         style: TextStyle(
//                             fontFamily: "Avenir Heavy",
//                             color: color == Color(0xffFF0000)
//                                 ? Colors.white
//                                 : Colors.black,
//                             fontSize: 15,
//                             fontWeight: FontWeight.bold),
//                       ),
//                     )
//                   ],
//                 ),
//                 Container(
//                   margin: EdgeInsets.only(right: 30.27),
//                   child: Image.asset(
//                     "assets/mastercard.png",
//                     height: 50,
//                     width: 50,
//                   ),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget _addCard() {
//     return InkWell(
//       onTap: () {
//         Navigator.pushNamed(context, '/page45');
//       },
//       child: Container(
//         width: double.infinity,
//         height: 70.0,
//         child: Card(
//             elevation: 2.0,
//             shadowColor: Colors.grey,
//             // shadowColor: Color(0xff00000014),
//             child: Padding(
//               padding: const EdgeInsets.only(left: 10.0, top: 23.0),
//               child: Text(
//                 "+  Add Card",
//                 style: TextStyle(
//                     fontFamily: "Open Sans Bold",
//                     color: Color(0xff454545),
//                     fontSize: 18.0,
//                     fontWeight: FontWeight.bold),
//               ),
//             )),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     double h = MediaQuery.of(context).size.height;
//     return Scaffold(
//       backgroundColor: Color(0xffFFFFFF),
//       body: SingleChildScrollView(
//           child: Stack(
//             children: [
//               Positioned(
//                   right: 22.0,
//                   top: 46.0,
//                   child: Container(
//                       width: 111.42,
//                       height: 135,
//                       child: Image.asset("assets/Group 9637.png"))),
//               Container(
//                 margin: EdgeInsets.only(left: 35.5, right: 35.5),
//                 child: Column(
//                   children: [
//                     Container(
//                       margin: EdgeInsets.only(top: 38.0),
//                       child: Row(
//                         children: [
//                           IconButton(
//                               iconSize: 30.0,
//                               icon: Icon(
//                                 Icons.navigate_before,
//                                 color: Color(0xff454545),
//                               ),
//                               onPressed: null),
//                           Text(
//                             "Select Card",
//                             style: TextStyle(
//                                 color: Color(0xff454545),
//                                 fontFamily: "Open Sans Bold",
//                                 fontSize: 22.0),
//                           ),
//                         ],
//                       ),
//                     ),
//                     // SizedBox(height: 35.0),
//                     // _buildCreditCard(
//                     //     color: Color(0xffFF0000),
//                     //     cardHolder: "Ugur Ates",
//                     //     cardNumber: "1234 5783 1231 9123"),
//                     // SizedBox(height: 8.0),
//                     // _buildCreditCard(
//                     //     color: Color(0xffE1E1E1),
//                     //     cardHolder: "Ugur Ates",
//                     //     cardNumber: "1234 5783 1231 9123"),
//                     SizedBox(height: h * 0.0165),
//                     _addCard(),
//                     SizedBox(height: h * 0.184),
//                     Text(
//                       "SELECT ANY CARD",
//                       style: TextStyle(
//                           color: Color(0xff454545),
//                           fontFamily: "Open Sans Bold",
//                           fontSize: 10.0),
//                     ),
//                     SizedBox(height: h * 0.03),
//                   ],
//                 ),
//               ),
//             ],
//           )),
//     );
//   }
// }
