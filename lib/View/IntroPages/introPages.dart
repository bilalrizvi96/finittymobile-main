// import 'package:charles_app/View/indexed.dart';
// import 'package:charles_app/View/login/Loginnn.dart';
// import 'package:charles_app/assets/appColors/appColors.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
//
//
//
//
// class IntroPage extends StatefulWidget {
//   @override
//   _IntroPageState createState() => _IntroPageState();
// }
//
// class _IntroPageState extends State<IntroPage> {
//   PageController controller = PageController();
//   int pageIndex = 0;
//   String userName;
//   String image;
//
//   int bottomSelectedIndex = 0;
//
//
//   void pageChanged(int index) {
//     setState(() {
//       bottomSelectedIndex = index;
//     });
//   }
//   Widget Firstpage(){
//     return Container(
//       height: MediaQuery.of(context).size.height,
//       width: MediaQuery.of(context).size.width,
// //                decoration: BoxDecoration(
// //                    image: DecorationImage(image: AssetImage('assets/logo.png')))
//       child: Column(
//         children: [
//           GestureDetector(
//             onTap: (){
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) =>
//                       Loginn(),
//                 ),
//               );
//             },
//             child: Container(
//               margin: EdgeInsets.only(top: 30,right: 30),
//               //padding:EdgeInsets.only(right:20,),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Text("Skip",style: TextStyle(color: Colors.grey ,fontSize: 18,fontWeight: FontWeight.bold),),
//                   SizedBox(width: 5,),
//                   Icon(Icons.navigate_next)
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(height: 50,),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//
//               Container(
//                 height: MediaQuery.of(context).size.height / 2.8,
//                 child: Image(
//                   image: AssetImage('lib/assets/images/charles.png'),
//                   height: 218,
//                   width: 245,
//                 ),
//               ),
//               Center(
//                 child: Container(
//                   width: MediaQuery.of(context).size.width / 1.0,
//                   child: Column(
//                     children: <Widget>[
//                       Text(
//                         "Cleaning",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             fontFamily: 'monm',
//
//                             fontSize: 31,
//                             color: Color.fromRGBO(82, 84, 93, 1)),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 32, vertical: 5.0),
//                         child: Text(
//                           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontFamily: 'monr',
//                             color: Color.fromRGBO(82, 84, 93, 1),
//                             fontSize: 14.0,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//   Widget SecondPage(){
//     return  Container(
//       height: MediaQuery.of(context).size.height,
//       width: MediaQuery.of(context).size.width,
// //                decoration: BoxDecoration(
// //                    image: DecorationImage(image: AssetImage('assets/logo.png'))),
//       child: Column(
//         children: [
//           GestureDetector(
//             onTap: (){
//               Navigator.push(
//                 context,
//                 MaterialPageRoute(
//                   builder: (context) =>
//                       Loginn(),
//                 ),
//               );
//             },
//             child: Container(
//               margin: EdgeInsets.only(top: 30,right: 30),
//               //padding:EdgeInsets.only(right:20,),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   Text("Skip",style: TextStyle(color: Colors.grey ,fontSize: 18,fontWeight: FontWeight.bold),),
//                   SizedBox(width: 5,),
//                   Icon(Icons.navigate_next)
//                 ],
//               ),
//             ),
//           ),
//           SizedBox(height: 50,),
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               Container(
//                 height: MediaQuery.of(context).size.height / 2.8,
//                 child: Image(
//                   image: AssetImage('lib/assets/images/charles1.png'),
//                   height: 218,
//                   width: 245,
//                 ),
//               ),
//               Center(
//                 child: Container(
//                   width: MediaQuery.of(context).size.width / 1.0,
//                   child: Column(
//                     children: <Widget>[
//                       Text(
//                         "Caring",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             fontFamily: 'monm',
//
//                             fontSize: 31,
//                             color: Color.fromRGBO(82, 84, 93, 1)),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 32, vertical: 5.0),
//                         child: Text(
//                           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontFamily: 'monr',
//                             color: Color.fromRGBO(82, 84, 93, 1),
//                             fontSize: 14.0,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//   Widget thirdPage(){
//     return Container(
//       height: MediaQuery.of(context).size.height,
//       width: MediaQuery.of(context).size.width,
// //                decoration: BoxDecoration(
// //                    image: DecorationImage(image: AssetImage('assets/logo.png'))),
//       child: Column(
//
//         children: [
//           Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.center,
//             children: <Widget>[
//               GestureDetector(
//                 onTap: (){
//                   Navigator.push(
//                     context,
//                     MaterialPageRoute(
//                       builder: (context) =>
//                           Loginn(),
//                     ),
//                   );
//                 },
//                 child: Container(
//                   margin: EdgeInsets.only(top: 30,right: 30),
//                   //padding:EdgeInsets.only(right:20,),
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.end,
//                     children: [
//                       Text("Skip",style: TextStyle(color: Colors.grey ,fontSize: 18,fontWeight: FontWeight.bold),),
//                       SizedBox(width: 5,),
//                       Icon(Icons.navigate_next)
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(height: 50,),
//               Container(
//                 height: MediaQuery.of(context).size.height / 2.8,
//                 child: Image(
//                   image: AssetImage('lib/assets/images/charles2.png'),
//                   height: 218,
//                   width: 245,
//                 ),
//               ),
//               Center(
//                 child: Container(
//                   width: MediaQuery.of(context).size.width / 1.0,
//                   child: Column(
//                     children: <Widget>[
//                       Text(
//                         "Laundry",
//                         textAlign: TextAlign.center,
//                         style: TextStyle(
//                             fontFamily: 'monm',
//
//                             fontSize: 31,
//                             color: Color.fromRGBO(82, 84, 93, 1)
//                         ),
//                       ),
//                       Padding(
//                         padding: const EdgeInsets.symmetric(
//                             horizontal: 32, vertical: 5.0),
//                         child: Text(
//                           "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
//                           textAlign: TextAlign.center,
//                           style: TextStyle(
//                             fontFamily: 'monr',
//                             color: Color.fromRGBO(82, 84, 93, 1),
//                             fontSize: 14.0,
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
//   Widget buildPageView(){
//     return  PageView(
//       onPageChanged: (value) {
//         setState(() {
//           pageChanged(value);
//         });
//       },
//       controller: controller,
//       children: <Widget>[
//         Firstpage(),
//         SecondPage(),
//         thirdPage(),
//       ],
//     );
//   }
//   void bottomTapped(int index) {
//     setState(() {
//       bottomSelectedIndex = index;
//       controller.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
//     });
//   }
//   List<BottomNavigationBarItem> buildBottomNavBarItems() {
//     return [
//       BottomNavigationBarItem(
//           backgroundColor: Colors.red,
//           icon: new Icon(Icons.home),
//           title: new Text('First'),
//       ),
//       BottomNavigationBarItem(
//         backgroundColor: Colors.red,
//         icon: new Icon(Icons.search),
//         title: new Text('Second'),
//       ),
//       BottomNavigationBarItem(
//         backgroundColor: Colors.red,
//         icon: new Icon(Icons.navigate_next),
//         title: new Text('Second'),
//       ),
//
//     ];
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return SafeArea(
//       child: Scaffold(
//         body: buildPageView(),
//         bottomNavigationBar: BottomNavigationBar(
//           currentIndex: bottomSelectedIndex,
//           onTap: (index){
//             bottomTapped(index);
//           },
//           items: buildBottomNavBarItems(),
//         ),
//         // bottomNavigationBar: Positioned(
//         //       bottom: 20.0,
//         //       child: Center(
//         //         child: SizedBox(
//         //           width: MediaQuery.of(context).size.width,
//         //           child: Column(
//         //             crossAxisAlignment: CrossAxisAlignment.center,
//         //             children: <Widget>[
//         //               Padding(
//         //                 padding: const EdgeInsets.all(8.0),
//         //                 child: Row(
//         //                   mainAxisAlignment: MainAxisAlignment.center,
//         //                   children: <Widget>[
//         //                     Container(
//         //                       margin: EdgeInsets.all(2.0),
//         //                       height: 8,
//         //                       width: 8,
//         //                       decoration: BoxDecoration(
//         //                           shape: BoxShape.circle,
//         //                           color: pageIndex == 0
//         //                               ? Color.fromRGBO(243, 76, 67, 1)
//         //                               : Color.fromRGBO(243, 76, 67, 0.16)
//         //                       ),
//         //                     ),
//         //                     Container(
//         //                       margin: EdgeInsets.all(2.0),
//         //                       height: 8,
//         //                       width: 8,
//         //                       decoration: BoxDecoration(
//         //                           shape: BoxShape.circle,
//         //                           color: pageIndex == 1
//         //                               ? Color.fromRGBO(243, 76, 67, 1)
//         //                               : Color.fromRGBO(243, 76, 67, 0.16)
//         //
//         //                       ),
//         //                     ),
//         //                     Container(
//         //                       margin: EdgeInsets.all(2),
//         //                       height: 8,
//         //                       width: 8,
//         //                       decoration: BoxDecoration(
//         //                           shape: BoxShape.circle,
//         //                           color: pageIndex == 2
//         //                               ? Color.fromRGBO(243, 76, 67, 1)
//         //                               : Color.fromRGBO(243, 76, 67, 0.16)
//         //                       ),
//         //                     ),
//         //                     // Container(
//         //                     //   margin: EdgeInsets.all(2.0),
//         //                     //   height: 8,
//         //                     //   width:8,                            decoration: BoxDecoration(
//         //                     //     shape: BoxShape.circle,
//         //                     //     color: pageIndex == 3
//         //                     //         ? Color.fromRGBO(243, 76, 67, 1)
//         //                     //         : Color.fromRGBO(243, 76, 67, 0.16)
//         //                     // ),
//         //                     // )
//         //                   ],
//         //                 ),
//         //               ),
//         //               Row(
//         //                 mainAxisAlignment: MainAxisAlignment.center,
//         //                 children: <Widget>[
//         //                   Opacity(
//         //                     opacity: pageIndex != 4 ? 1.0 : 0.0,
//         //                   ),
//         //                   pageIndex != 4
//         //                       ? InkWell(
//         //                     child: Container(
//         //                       width:
//         //                       MediaQuery.of(context).size.width / 1.2,
//         //                       height: 50,
//         //                       decoration: BoxDecoration(
//         //                         color:appColors.redColor,
//         //                         borderRadius: BorderRadius.circular(60.0),
//         //                       ),
//         //                       child: Center(
//         //                           child: new Text("Next",
//         //                               style: const TextStyle(
//         //                                   fontFamily: 'asdf',
//         //                                   color: Colors.white,
//         //                                   fontWeight: FontWeight.bold,
//         //                                   //fontStyle: FontStyle.normal,
//         //                                   fontSize: 16.0))),
//         //                     ),
//         //                     onTap: () {
//         //
//         //                       },
//         //                   )
//         //                       : Center()
//         //                 ],
//         //               ),
//         //
//         //             ],
//         //           ),
//         //         ),
//         //       ),
//         //     )
//
//       ),
//     );
//   }
// }
//
//



import 'package:charles_app/View/login/Loginnn.dart';
import 'package:charles_app/assets/appColors/appColors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';




class IntroPage extends StatefulWidget {
  @override
  _IntroPageState createState() => _IntroPageState();
}

class _IntroPageState extends State<IntroPage> {
  PageController controller = PageController();
  int pageIndex = 0;
  String userName;
  String image;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Stack(
        children: <Widget>[
          PageView(
            onPageChanged: (value) {
              setState(() {
                pageIndex = value;
              });
            },
            controller: controller,
            children: <Widget>[
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
//                decoration: BoxDecoration(
//                    image: DecorationImage(image: AssetImage('assets/logo.png'))),
                child: Column(
                  children: [
                 InkWell(
                   onTap: (){Navigator.push(
                       context,
                       MaterialPageRoute(
                         builder: (context) =>
                             Loginn(),
                       ),
                     );},
                   child: Container(
                    margin: EdgeInsets.only(top: 50,right: 30),
                    //padding:EdgeInsets.only(right:20,),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text("Skip",style: TextStyle(color: Colors.grey ,fontSize: 18,fontWeight: FontWeight.bold),),
                        SizedBox(width: 5,),
                        Icon(Icons.navigate_next)
                      ],
                    ),
                    ),
                 ),
                    SizedBox(height: 50,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height / 2.8,
                          child: Image(
                            image: AssetImage('lib/assets/images/charles.png'),
                            height: 218,
                            width: 245,
                          ),
                        ),
                        Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.0,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "Cleaning",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'monm',

                                      fontSize: 31,
                                      color: Color.fromRGBO(82, 84, 93, 1)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 32, vertical: 5.0),
                                  child: Text(
                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'monr',
                                      color: Color.fromRGBO(82, 84, 93, 1),
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
//                decoration: BoxDecoration(
//                    image: DecorationImage(image: AssetImage('assets/logo.png'))),
                child: Column(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Loginn(),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 50,right: 30),
                        //padding:EdgeInsets.only(right:20,),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Skip",style: TextStyle(color: Colors.grey ,fontSize: 18,fontWeight: FontWeight.bold),),
                            SizedBox(width: 5,),
                            Icon(Icons.navigate_next)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 50,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height / 2.8,
                          child: Image(
                            image: AssetImage('lib/assets/images/charles1.png'),
                            height: 218,
                            width: 245,
                          ),
                        ),
                        Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.0,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "Caring",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'monm',

                                      fontSize: 31,
                                      color: Color.fromRGBO(82, 84, 93, 1)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 32, vertical: 5.0),
                                  child: Text(
                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'monr',
                                      color: Color.fromRGBO(82, 84, 93, 1),
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
//               Container(
//                 height: MediaQuery.of(context).size.height,
//                 width: MediaQuery.of(context).size.width,
// //                decoration: BoxDecoration(
// //                    image: DecorationImage(image: AssetImage('assets/logo.png'))),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   crossAxisAlignment: CrossAxisAlignment.center
//                       height: MediaQuery.of(context).size.height / 2.8,
//                       child: Image(
//                         image: AssetImage('lib/assets/images/charles2.png'),
//                         height: 218,
//                         width: 245,
//                       ),
//                     ),
//                     Center(
//                       child: Container(
//                         width: MediaQuery.of(context).size.width / 1.0,
//                         child: Column(
//                           children: <Widget>[
//                             Text(
//                               "Education",
//                               textAlign: TextAlign.center,
//                               style: TextStyle(
//                                   fontFamily: 'monm',
//
//                                   fontSize: 31,
//                                   color: Color.fromRGBO(82, 84, 93, 1)),
//                             ),
//                             Padding(
//                               padding: const EdgeInsets.symmetric(
//                                   horizontal: 32, vertical: 5.0),
//                               child: Text(
//                                 "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
//                                 textAlign: TextAlign.center,
//                                 style: TextStyle(
//                                   fontFamily: 'monr',
//                                   color: Color.fromRGBO(82, 84, 93, 1),
//                                   fontSize: 14.0,
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
              Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
//                decoration: BoxDecoration(
//                    image: DecorationImage(image: AssetImage('assets/logo.png'))),
                child: Column(
                  children: [
                    InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                Loginn(),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(top: 50,right: 30),
                        //padding:EdgeInsets.only(right:20,),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text("Skip",style: TextStyle(color: Colors.grey ,fontSize: 18,fontWeight: FontWeight.bold),),
                            SizedBox(width: 5,),
                            Icon(Icons.navigate_next)
                          ],
                        ),
                      ),
                    ),
                    SizedBox(height: 50,),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Container(
                          height: MediaQuery.of(context).size.height / 2.8,
                          child: Image(
                            image: AssetImage('lib/assets/images/charles2.png'),
                            height: 218,
                            width: 245,
                          ),
                        ),
                        Center(
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.0,
                            child: Column(
                              children: <Widget>[
                                Text(
                                  "Laundry",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'monm',

                                      fontSize: 31,
                                      color: Color.fromRGBO(82, 84, 93, 1)
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 32, vertical: 5.0),
                                  child: Text(
                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      fontFamily: 'monr',
                                      color: Color.fromRGBO(82, 84, 93, 1),
                                      fontSize: 14.0,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 20.0,
            child: Center(
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Container(
                            margin: EdgeInsets.all(2.0),
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: pageIndex == 0
                                    ? Color.fromRGBO(243, 76, 67, 1)
                                    : Color.fromRGBO(243, 76, 67, 0.16)
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(2.0),
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: pageIndex == 1
                                    ? Color.fromRGBO(243, 76, 67, 1)
                                    : Color.fromRGBO(243, 76, 67, 0.16)

                            ),
                          ),
                          Container(
                            margin: EdgeInsets.all(2),
                            height: 8,
                            width: 8,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: pageIndex == 2
                                    ? Color.fromRGBO(243, 76, 67, 1)
                                    : Color.fromRGBO(243, 76, 67, 0.16)
                            ),
                          ),
                          // Container(
                          //   margin: EdgeInsets.all(2.0),
                          //   height: 8,
                          //   width:8,                            decoration: BoxDecoration(
                          //     shape: BoxShape.circle,
                          //     color: pageIndex == 3
                          //         ? Color.fromRGBO(243, 76, 67, 1)
                          //         : Color.fromRGBO(243, 76, 67, 0.16)
                          // ),
                          // )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Opacity(
                          opacity: pageIndex != 4 ? 1.0 : 0.0,
                        ),
                        pageIndex != 4
                            ? InkWell(
                          child: Container(
                            width:
                            MediaQuery.of(context).size.width / 1.2,
                            height: 50,
                            decoration: BoxDecoration(
                              // gradient: LinearGradient(colors: <Color>[
                              //   Color.fromRGBO(248, 7, 89, 1),
                              //   Color.fromRGBO(243, 76, 67, 1)


                              // ], begin: Alignment.bottomLeft),
//                              color: Color.fromRGBO(119, 0, 0, 1),
                              color:appColors.redColor,

                              borderRadius: BorderRadius.circular(60.0),
                            ),
                            child: Center(
                                child: new Text("Next",
                                    style: const TextStyle(
                                        fontFamily: 'asdf',
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        //fontStyle: FontStyle.normal,
                                        fontSize: 16.0))),
                          ),
                          onTap: () {
                            pageIndex=pageIndex+1;
                            controller.animateToPage(pageIndex, duration: Duration(milliseconds: 500), curve: Curves.ease);
                            if(pageIndex==3){
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      Loginn(),
                                ),
                              );
                            }

                            // Navigator.push(
                            //   context,
                            //   MaterialPageRoute(
                            //     builder: (context) =>
                            //         Loginn(),
                            //   ),
                            // );
                            //                  _settingModalBottomSheet(context);
                          },
                        )
                            : Center()
                      ],
                    ),

                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}



