// import 'package:charles_app/View/Cleaning/CustomStepper.dart';
// import 'package:charles_app/View/Cleaning/cleaningView.dart';
// import 'package:charles_app/widgets/widgets.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter/painting.dart';
//
// class BottomModal {
//   var val;
//   // var modal=new List();
//   // BottomModal(this.modal);
//   settingModalBottomSheet(context, coloring) {
//     showModalBottomSheet(
//         backgroundColor: Colors.transparent,
//         isScrollControlled: true,
//         context: context,
//         builder: (BuildContext bc) {
//           return Container(
//             decoration: BoxDecoration(
//               borderRadius: BorderRadius.only(
//                   topRight: Radius.circular(15), topLeft: Radius.circular(15)),
//               color: Colors.white,
//             ),
//             child: Wrap(
//               children: [
//                 Padding(
//                   padding: const EdgeInsets.only(left: 18.0, right: 18),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         height: 20,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(right: 10.0, left: 10),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             Text(
//                               "Customize",
//                               style:
//                                   TextStyle(fontFamily: "monb", fontSize: 19),
//                             ),
//                             // Spacer(),
//                             Text(
//                               "70\$",
//                               style:
//                                   TextStyle(fontFamily: "monb", fontSize: 22),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(right: 5.0, left: 5),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Container(
//                               width: MediaQuery.of(context).size.width / 2.4,
//                               height: 60,
//                               child: Card(
//                                   color: coloring,
//                                   child: Center(
//                                       child: Text(
//                                     "Regular",
//                                     style: TextStyle(
//                                         fontFamily: "opsb",
//                                         color: Colors.white),
//                                   ))),
//                             ),
//                             Container(
//                               width: MediaQuery.of(context).size.width / 2.4,
//                               height: 60,
//                               child: Card(
//                                   color: Color(0xFFBCBDC1),
//                                   child: Column(
//                                     mainAxisAlignment: MainAxisAlignment.center,
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     children: [
//                                       Text(
//                                         "Express",
//                                         style: TextStyle(
//                                             fontFamily: "opsb",
//                                             color: Colors.white),
//                                       ),
//                                       Text(
//                                         "Within 3 Hrs: \$ x1.5",
//                                         style: TextStyle(
//                                             fontSize: 11,
//                                             fontFamily: "opsb",
//                                             color: Colors.white),
//                                       ),
//                                     ],
//                                   )),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: 5,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(right: 10.0, left: 10),
//                         child: Row(
//                           children: [
//                             Text("Name",
//                                 style: TextStyle(
//                                     fontFamily: "opsb", fontSize: 16)),
//                             Spacer(),
//                             Text("Qty",
//                                 style: TextStyle(
//                                     fontFamily: "opsb", fontSize: 16)),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: 5,
//                       ),
//                       Container(
//                         height: 200,
//                         child: ListView.builder(
//                             itemCount: modaldata.length,
//                             scrollDirection: Axis.vertical,
//                             itemBuilder: (_, index) {
//                               return Row(
//                                 children: [
//                                   Text(modaldata[index].title,
//                                       style: TextStyle(
//                                           fontFamily: "opbb",
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 14)),
//                                   Spacer(),
//                                   Text(modaldata[index].price,
//                                       style: TextStyle(
//                                           fontFamily: "opbb",
//                                           fontWeight: FontWeight.bold,
//                                           fontSize: 13)),
//                                   SizedBox(
//                                     width: 4,
//                                   ),
//                                   Container(
//                                     child: CustomStepper(
//                                       lowerLimit: 0,
//                                       upperLimit: 200,
//                                       stepValue: 2,
//                                       iconSize: 22.0,
//                                       value: int.parse(modaldata[index].quantity)==int.parse(modaldata[index].quantity)?val=modaldata[index].price:val*=,
//                                     ),
//                                   )
//                                 ],
//                               );
//                             }),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.only(
//                           left: 10.0,
//                         ),
//                         child: Text(
//                           "Addon Services",
//                           style: TextStyle(fontFamily: "opsb", fontSize: 14),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 10,
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.all(10.0),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           //crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Column(
//                               children: [
//                                 Container(
//                                   width: 90,
//                                   height: 30,
//                                   decoration: BoxDecoration(
//                                       color: Color(0xFFE4E4E4),
//                                       borderRadius:
//                                           BorderRadius.all(Radius.circular(5))),
//                                   child: Center(
//                                       child: Text("Bags/Discard",
//                                           style: Styles().robo(size: 12.0))),
//                                 ),
//                                 SizedBox(
//                                   height: 5,
//                                 ),
//                                 Container(
//                                     width: 90,
//                                     // color: Colors.blue,
//                                     child: Center(child: Text("15\$"))),
//                               ],
//                             ),
//                             //SizedBox(width: 10,),
//                             Column(
//                               children: [
//                                 Container(
//                                   width: 60,
//                                   height: 30,
//                                   decoration: BoxDecoration(
//                                       color: Color(0xFFE4E4E4),
//                                       borderRadius:
//                                           BorderRadius.all(Radius.circular(5))),
//                                   child: Center(
//                                       child: Text("Trimming",
//                                           style: Styles().robo(size: 12.0))),
//                                 ),
//                                 SizedBox(
//                                   height: 5,
//                                 ),
//                                 Container(
//                                     width: 60,
//                                     // color: Colors.blue,
//                                     child: Center(child: Text("25\$"))),
//                               ],
//                             ),
//                             // SizedBox(width: 10,),
//                             Column(
//                               children: [
//                                 Container(
//                                   width: 60,
//                                   height: 30,
//                                   decoration: BoxDecoration(
//                                       color: Color(0xFFE4E4E4),
//                                       borderRadius:
//                                           BorderRadius.all(Radius.circular(5))),
//                                   child: Center(
//                                       child: Text("Edging",
//                                           style: Styles().robo(size: 12.0))),
//                                 ),
//                                 SizedBox(
//                                   height: 5,
//                                 ),
//                                 Container(
//                                     //width:70,
//                                     // color: Colors.blue,
//                                     child: Center(child: Text("25\$"))),
//                               ],
//                             ),
//                             // SizedBox(width: 10,),
//                             Column(
//                               children: [
//                                 Container(
//                                   width: 60,
//                                   height: 30,
//                                   decoration: BoxDecoration(
//                                       color: Color(0xFFE4E4E4),
//                                       borderRadius:
//                                           BorderRadius.all(Radius.circular(5))),
//                                   child: Center(
//                                       child: Text("Tall Grass",
//                                           style: Styles().robo(size: 12.0))),
//                                 ),
//                                 SizedBox(
//                                   height: 5,
//                                 ),
//                                 Container(
//                                     width: 60,
//                                     // color: Colors.blue,
//                                     child: Center(child: Text("20\$"))),
//                               ],
//                             ),
//                             // SizedBox(width: 10,),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                       InkWell(
//                         onTap: () {
//                           //sth
//                         },
//                         child: Padding(
//                           padding: const EdgeInsets.only(left: 5.0),
//                           child: Container(
//                             width: MediaQuery.of(context).size.width,
//                             height: 50,
//                             child: Card(
//                                 color: coloring,
//                                 child: Center(
//                                     child: Text(
//                                   "Book now",
//                                   style: TextStyle(
//                                       fontFamily: "opsb", color: Colors.white),
//                                 ))),
//                           ),
//                         ),
//                       ),
//                       SizedBox(
//                         height: 20,
//                       ),
//                     ],
//                   ),
//                 )
//               ],
//             ),
//           );
//         });
//   }
//
//   // settingModalBottomSheet1(context, coloring) {
//   //   showModalBottomSheet(
//   //       backgroundColor: Colors.transparent,
//   //       isScrollControlled: true,
//   //       context: context,
//   //       builder: (BuildContext bc) {
//   //         return Container(
//   //           decoration: BoxDecoration(
//   //             borderRadius: BorderRadius.only(
//   //                 topRight: Radius.circular(15), topLeft: Radius.circular(15)),
//   //             color: Colors.white,
//   //           ),
//   //           child: Wrap(
//   //             children: [
//   //               Padding(
//   //                 padding: const EdgeInsets.only(left: 18.0, right: 18),
//   //                 child: Column(
//   //                   mainAxisAlignment: MainAxisAlignment.start,
//   //                   crossAxisAlignment: CrossAxisAlignment.start,
//   //                   children: [
//   //                     SizedBox(
//   //                       height: 20,
//   //                     ),
//   //                     Padding(
//   //                       padding: const EdgeInsets.only(right: 10.0, left: 10),
//   //                       child: Row(
//   //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //                         children: [
//   //                           Text(
//   //                             "Customize",
//   //                             style:
//   //                                 TextStyle(fontFamily: "monb", fontSize: 19),
//   //                           ),
//   //                           // Spacer(),
//   //                           Text(
//   //                             "70\$",
//   //                             style:
//   //                                 TextStyle(fontFamily: "monb", fontSize: 22),
//   //                           ),
//   //                         ],
//   //                       ),
//   //                     ),
//   //                     SizedBox(
//   //                       height: 10,
//   //                     ),
//   //                     Padding(
//   //                       padding: const EdgeInsets.only(right: 5.0, left: 5),
//   //                       child: Row(
//   //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //                         crossAxisAlignment: CrossAxisAlignment.start,
//   //                         children: [
//   //                           Container(
//   //                             width: MediaQuery.of(context).size.width / 2.4,
//   //                             height: 60,
//   //                             child: Card(
//   //                                 color: coloring,
//   //                                 child: Center(
//   //                                     child: Text(
//   //                                   "LNP",
//   //                                   style: TextStyle(
//   //                                       fontFamily: "opsb",
//   //                                       color: Colors.white),
//   //                                 ))),
//   //                           ),
//   //                           Container(
//   //                             width: MediaQuery.of(context).size.width / 2.4,
//   //                             //width: 180, // before 165
//   //                             height: 60,
//   //                             child: Card(
//   //                                 color: Color(0xFFBCBDC1),
//   //                                 child: Center(
//   //                                     child: Text(
//   //                                   "RPN",
//   //                                   style: TextStyle(
//   //                                       fontFamily: "opsb",
//   //                                       color: Colors.white),
//   //                                 ))),
//   //                           ),
//   //                         ],
//   //                       ),
//   //                     ),
//   //                     SizedBox(
//   //                       height: 5,
//   //                     ),
//   //                     Padding(
//   //                       padding: const EdgeInsets.only(right: 10.0, left: 10),
//   //                       child: Row(
//   //                         children: [
//   //                           Text("Name",
//   //                               style: TextStyle(
//   //                                   fontFamily: "opsb", fontSize: 16)),
//   //                           Spacer(),
//   //                           Text("Qty",
//   //                               style: TextStyle(
//   //                                   fontFamily: "opsb", fontSize: 16)),
//   //                         ],
//   //                       ),
//   //                     ),
//   //                     SizedBox(
//   //                       height: 5,
//   //                     ),
//   //                     Padding(
//   //                       padding: const EdgeInsets.only(right: 10.0, left: 10),
//   //                       child: Row(
//   //                         children: [
//   //                           Text("Hours:",
//   //                               style: TextStyle(
//   //                                   fontFamily: "opbb",
//   //                                   fontWeight: FontWeight.bold,
//   //                                   fontSize: 14)),
//   //                           Spacer(),
//   //                           Text("89\$ ",
//   //                               style: TextStyle(
//   //                                   fontFamily: "opbb",
//   //                                   fontWeight: FontWeight.bold,
//   //                                   fontSize: 13)),
//   //                           SizedBox(
//   //                             width: 4,
//   //                           ),
//   //                           Container(
//   //                             child: CustomStepper(
//   //                               lowerLimit: 0,
//   //                               upperLimit: 20,
//   //                               stepValue: 1,
//   //                               iconSize: 22.0,
//   //                               value: 0,
//   //                             ),
//   //                           )
//   //                         ],
//   //                       ),
//   //                     ),
//   //                     SizedBox(
//   //                       height: 20,
//   //                     ),
//   //                     InkWell(
//   //                       onTap: () {
//   //                         //sth
//   //                       },
//   //                       child: Padding(
//   //                         padding: const EdgeInsets.only(left: 5.0),
//   //                         child: Container(
//   //                           width: MediaQuery.of(context).size.width,
//   //                           height: 50,
//   //                           child: Card(
//   //                               color: coloring,
//   //                               child: Center(
//   //                                   child: Text(
//   //                                 "Book now",
//   //                                 style: TextStyle(
//   //                                     fontFamily: "opsb", color: Colors.white),
//   //                               ))),
//   //                         ),
//   //                       ),
//   //                     ),
//   //                     SizedBox(
//   //                       height: 20,
//   //                     ),
//   //                   ],
//   //                 ),
//   //               )
//   //             ],
//   //           ),
//   //         );
//   //       });
//   // }
//   //
//   // settingModalBottomSheet2(context, coloring) {
//   //   showModalBottomSheet(
//   //       backgroundColor: Colors.transparent,
//   //       isScrollControlled: true,
//   //       context: context,
//   //       builder: (BuildContext bc) {
//   //         return Container(
//   //           decoration: BoxDecoration(
//   //             borderRadius: BorderRadius.only(
//   //                 topRight: Radius.circular(15), topLeft: Radius.circular(15)),
//   //             color: Colors.white,
//   //           ),
//   //           child: Wrap(
//   //             children: [
//   //               Padding(
//   //                 padding: const EdgeInsets.only(left: 18, right: 18),
//   //                 child: Column(
//   //                   mainAxisAlignment: MainAxisAlignment.start,
//   //                   crossAxisAlignment: CrossAxisAlignment.start,
//   //                   children: [
//   //                     SizedBox(
//   //                       height: 20,
//   //                     ),
//   //                     Padding(
//   //                       padding: const EdgeInsets.only(left: 7.0, right: 7),
//   //                       child: Row(
//   //                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //                         children: [
//   //                           Text(
//   //                             "Customize",
//   //                             style:
//   //                                 TextStyle(fontFamily: "monb", fontSize: 19),
//   //                           ),
//   //                           Text(
//   //                             "70\$",
//   //                             style:
//   //                                 TextStyle(fontFamily: "monb", fontSize: 22),
//   //                           ),
//   //                         ],
//   //                       ),
//   //                     ),
//   //                     SizedBox(
//   //                       height: 10,
//   //                     ),
//   //                     Row(
//   //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//   //                       crossAxisAlignment: CrossAxisAlignment.start,
//   //                       children: [
//   //                         Container(
//   //                           width: MediaQuery.of(context).size.width / 2.4,
//   //                           height: 60,
//   //                           child: Card(
//   //                               color: coloring,
//   //                               child: Center(
//   //                                   child: Text(
//   //                                 "Regular",
//   //                                 style: TextStyle(
//   //                                     fontFamily: "opsb", color: Colors.white),
//   //                               ))),
//   //                         ),
//   //                         Container(
//   //                           width: MediaQuery.of(context).size.width / 2.4,
//   //                           height: 60,
//   //                           child: Card(
//   //                               color: Color(0xFFBCBDC1),
//   //                               child: Center(
//   //                                   child: Text(
//   //                                 "Express",
//   //                                 style: TextStyle(
//   //                                     fontFamily: "opsb", color: Colors.white),
//   //                               ))),
//   //                         ),
//   //                       ],
//   //                     ),
//   //                     SizedBox(
//   //                       height: 5,
//   //                     ),
//   //                     Padding(
//   //                       padding: const EdgeInsets.only(left: 7.0, right: 7),
//   //                       child: Column(
//   //                         children: [
//   //                           Row(
//   //                             children: [
//   //                               Text("Name",
//   //                                   style: TextStyle(
//   //                                       fontFamily: "opsb", fontSize: 16)),
//   //                               Spacer(),
//   //                               Text("Qty",
//   //                                   style: TextStyle(
//   //                                       fontFamily: "opsb", fontSize: 16)),
//   //                             ],
//   //                           ),
//   //                           SizedBox(
//   //                             height: 5,
//   //                           ),
//   //                           Row(
//   //                             children: [
//   //                               Text("Purse",
//   //                                   style: TextStyle(
//   //                                       fontFamily: "rob",
//   //                                       fontWeight: FontWeight.bold,
//   //                                       fontSize: 14)),
//   //                               Spacer(),
//   //                               Text("89\$",
//   //                                   style: TextStyle(
//   //                                       fontFamily: "rob",
//   //                                       fontWeight: FontWeight.bold,
//   //                                       fontSize: 13)),
//   //                               SizedBox(
//   //                                 width: 4,
//   //                               ),
//   //                               Container(
//   //                                 child: CustomStepper(
//   //                                   lowerLimit: 0,
//   //                                   upperLimit: 20,
//   //                                   stepValue: 1,
//   //                                   iconSize: 22.0,
//   //                                   value: 0,
//   //                                 ),
//   //                               )
//   //                             ],
//   //                           ),
//   //                           SizedBox(
//   //                             height: 5,
//   //                           ),
//   //                           Row(
//   //                             children: [
//   //                               Text("Curtains",
//   //                                   style: TextStyle(
//   //                                       fontFamily: "rob",
//   //                                       fontWeight: FontWeight.bold,
//   //                                       fontSize: 14)),
//   //                               Spacer(),
//   //                               Text("89\$",
//   //                                   style: TextStyle(
//   //                                       fontFamily: "rob",
//   //                                       fontWeight: FontWeight.bold,
//   //                                       fontSize: 13)),
//   //                               SizedBox(
//   //                                 width: 4,
//   //                               ),
//   //                               Container(
//   //                                 child: CustomStepper(
//   //                                   lowerLimit: 0,
//   //                                   upperLimit: 20,
//   //                                   stepValue: 1,
//   //                                   iconSize: 22.0,
//   //                                   value: 0,
//   //                                 ),
//   //                               )
//   //                             ],
//   //                           ),
//   //                           SizedBox(
//   //                             height: 5,
//   //                           ),
//   //                           Row(
//   //                             children: [
//   //                               Text("Belts",
//   //                                   style: TextStyle(
//   //                                       fontFamily: "rob",
//   //                                       fontWeight: FontWeight.bold,
//   //                                       fontSize: 14)),
//   //                               Spacer(),
//   //                               Text("89\$",
//   //                                   style: TextStyle(
//   //                                       fontFamily: "rob",
//   //                                       fontWeight: FontWeight.bold,
//   //                                       fontSize: 13)),
//   //                               SizedBox(
//   //                                 width: 4,
//   //                               ),
//   //                               Container(
//   //                                 child: CustomStepper(
//   //                                   lowerLimit: 0,
//   //                                   upperLimit: 20,
//   //                                   stepValue: 1,
//   //                                   iconSize: 22.0,
//   //                                   value: 0,
//   //                                 ),
//   //                               )
//   //                             ],
//   //                           ),
//   //                           SizedBox(
//   //                             height: 5,
//   //                           ),
//   //                           Row(
//   //                             children: [
//   //                               Text("Wardrobes",
//   //                                   style: TextStyle(
//   //                                       fontFamily: "rob",
//   //                                       fontWeight: FontWeight.bold,
//   //                                       fontSize: 14)),
//   //                               Spacer(),
//   //                               Text("89\$",
//   //                                   style: TextStyle(
//   //                                       fontFamily: "rob",
//   //                                       fontWeight: FontWeight.bold,
//   //                                       fontSize: 13)),
//   //                               SizedBox(
//   //                                 width: 4,
//   //                               ),
//   //                               Container(
//   //                                 child: CustomStepper(
//   //                                   lowerLimit: 0,
//   //                                   upperLimit: 20,
//   //                                   stepValue: 1,
//   //                                   iconSize: 22.0,
//   //                                   value: 0,
//   //                                 ),
//   //                               )
//   //                             ],
//   //                           ),
//   //                           SizedBox(
//   //                             height: 5,
//   //                           ),
//   //                           Row(
//   //                             children: [
//   //                               Text("Attachment",
//   //                                   style: TextStyle(
//   //                                       fontFamily: "rob",
//   //                                       fontWeight: FontWeight.bold,
//   //                                       fontSize: 14)),
//   //                               Spacer(),
//   //                               Text("89\$",
//   //                                   style: TextStyle(
//   //                                       fontFamily: "rob",
//   //                                       fontWeight: FontWeight.bold,
//   //                                       fontSize: 13)),
//   //                               SizedBox(
//   //                                 width: 4,
//   //                               ),
//   //                               Container(
//   //                                 child: CustomStepper(
//   //                                   lowerLimit: 0,
//   //                                   upperLimit: 20,
//   //                                   stepValue: 1,
//   //                                   iconSize: 22.0,
//   //                                   value: 0,
//   //                                 ),
//   //                               )
//   //                             ],
//   //                           ),
//   //                         ],
//   //                       ),
//   //                     ),
//   //                     SizedBox(
//   //                       height: 20,
//   //                     ),
//   //                     InkWell(
//   //                       onTap: () {
//   //                         //sth
//   //                       },
//   //                       child: Container(
//   //                         width: MediaQuery.of(context).size.width,
//   //                         height: 50,
//   //                         child: Card(
//   //                             color: coloring,
//   //                             child: Center(
//   //                                 child: Center(
//   //                                     child: Text(
//   //                               "Book now",
//   //                               style: TextStyle(
//   //                                   fontFamily: "opsb", color: Colors.white),
//   //                             )))),
//   //                       ),
//   //                     ),
//   //                     SizedBox(
//   //                       height: 20,
//   //                     ),
//   //                   ],
//   //                 ),
//   //               )
//   //             ],
//   //           ),
//   //         );
//   //       });
//   // }
// }
