// import 'package:flutter/material.dart';
//
// class raised extends StatefulWidget {
//   @override
//   _LaundryState createState() => _LaundryState();
// }
//
//
// class raised extends StatefulWidget {
//   int number = 0;
//
//   void subtractNumbers() {
//     setState(() {
//       number = number - 1;
//     });
//   }
//
//   void addNumbers() {
//     setState(() {
//       number = number + 1;
//     });
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//      child: RaisedButton(
//         child: Container(
//             child:Text('Edit')
//         ),
//         onPressed: (){
//           showDialog(context: context,
//               builder: (BuildContext context) =>
//                   AlertDialog(
//                     title: Row(
//                       children: [
//                         Text("Customized "),
//                         Spacer(),
//                         IconButton(icon:Icon(Icons.cancel),onPressed: (){
//                           Navigator.pop(context);
//                         },)
//                       ],
//                     ),
//
//                     content: Container(
//                       height: 400,
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           Text("Add Addtional Terms"),
//                           Row(
//                             children: [
//                               Text("Pant"),
//                               Spacer(),
//                               IconButton(icon:Icon(Icons.remove_circle_outline),
//                                 onPressed: (){
//                                   subtractNumbers();
//                                 },),
//                               Text('$number'),
//
//                               IconButton(icon:Icon(Icons.add_circle_outline),
//                                 onPressed: (){
//                                   addNumbers();
//                                 },),
//
//
//                             ],
//                           ),
//                           Row(
//                             children: [
//                               Text("Shirt"),
//                               Spacer(),
//                               IconButton(icon:Icon(Icons.remove_circle_outline),
//                                 onPressed: (){
//                                   subtractNumbers();
//                                 },),
//                               Text('$number'),
//
//                               IconButton(icon:Icon(Icons.add_circle_outline),
//                                 onPressed: (){
//                                   addNumbers();
//                                 },),
//
//
//                             ],
//                           ),
//
//                           Row(
//                             children: [
//                               Text("UnderWear"),
//                               Spacer(),
//                               IconButton(icon:Icon(Icons.remove_circle_outline),
//                                 onPressed: (){
//                                   subtractNumbers();
//                                 },),
//                               Text('$number'),
//
//                               IconButton(icon:Icon(Icons.add_circle_outline),
//                                 onPressed: (){
//                                   addNumbers();
//                                 },),
//
//
//                             ],
//                           ),
//
//                           Row(
//                             children: [
//                               Text("Jacket Coat"),
//                               Spacer(),
//                               IconButton(icon:Icon(Icons.remove_circle_outline),
//                                 onPressed: (){
//                                   subtractNumbers();
//                                 },),
//                               Text('$number'),
//
//                               IconButton(icon:Icon(Icons.add_circle_outline),
//                                 onPressed: (){
//                                   addNumbers();
//                                 },),
//
//
//                             ],
//                           ),
//
//
//
//                           Spacer(),
//                           FlatButton(
//                             child: new Text('Book Now',style: TextStyle(color: Colors.green),),
//                             onPressed: () {
//                               Navigator.of(context).pop();
//                             },
//                           ),
//                           // FlatButton(
//                           //   child: new Text('SEARCH',style: TextStyle(color: Colors.green)),
//                           //   onPressed: () {
//                           //     Navigator.of(context).pop();
//                           //   },
//                           // )
//
//
//
//
//                         ],
//                       ),
//                     ),
//                   )
//
//           );
//         },
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';

class raised extends StatefulWidget {
  @override
  _raisedState createState() => _raisedState();
}

class _raisedState extends State<raised> {
  int _number = 0;

  void subtractNumbers() {
    setState(() {
      _number = _number - 1;
    });
  }

  void addNumbers() {
    setState(() {
      _number = _number + 1;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Container(

        child: RaisedButton(
          color: Color(0xFF64DD17),
        child: Container(

            child:Text('Edit')
        ),
        onPressed: (){
          showDialog(context: context,
              builder: (BuildContext context) =>
                  AlertDialog(
                    title: Row(
                      children: [
                        Text("Customized "),
                        Spacer(),
                        IconButton(icon:Icon(Icons.cancel),onPressed: (){
                          Navigator.pop(context);
                        },)
                      ],
                    ),

                    content: Container(
                      height: 400,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Add Addtional Terms"),
                          Row(
                            children: [
                              Text("Pant"),
                              Spacer(),
                              IconButton(icon:Icon(Icons.remove_circle_outline),
                                onPressed: (){
                                  subtractNumbers();
                                },),
                              Text(_number.toString()),

                              IconButton(icon:Icon(Icons.add_circle_outline),
                                onPressed: (){
                                  addNumbers();
                                },),


                            ],
                          ),
                          Row(
                            children: [
                              Text("Shirt"),
                              Spacer(),
                              IconButton(icon:Icon(Icons.remove_circle_outline),
                                onPressed: (){
                                  subtractNumbers();
                                },),
                              Text(_number.toString()),

                              IconButton(icon:Icon(Icons.add_circle_outline),
                                onPressed: (){
                                  addNumbers();
                                },),


                            ],
                          ),

                          Row(
                            children: [
                              Text("UnderWear"),
                              Spacer(),
                              IconButton(icon:Icon(Icons.remove_circle_outline),
                                onPressed: (){
                                  subtractNumbers();
                                },),
                              Text(_number.toString()),

                              IconButton(icon:Icon(Icons.add_circle_outline),
                                onPressed: (){
                                  addNumbers();
                                },),


                            ],
                          ),

                          Row(
                            children: [
                              Text("Jacket Coat"),
                              Spacer(),
                              IconButton(icon:Icon(Icons.remove_circle_outline),
                                onPressed: (){
                                  subtractNumbers();
                                },),
                              Text(_number.toString()),

                              IconButton(icon:Icon(Icons.add_circle_outline),
                                onPressed: (){
                                  addNumbers();
                                },),


                            ],
                          ),



                          Spacer(),
                          Container(
                            width: MediaQuery.of(context).size.width,
                            //color: Colors.green,
                            decoration:BoxDecoration(
                                color: Colors.green,
                                borderRadius:BorderRadius.circular(10)
                            ),

                            child: FlatButton(
                              child: new Text('Book Now',style: TextStyle(color: Colors.white),),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ),
                          // FlatButton(
                          //   child: new Text('SEARCH',style: TextStyle(color: Colors.green)),
                          //   onPressed: () {
                          //     Navigator.of(context).pop();
                          //   },
                          // )




                        ],
                      ),
                    ),
                  )

          );
        },
      ),
    );
  }
}
