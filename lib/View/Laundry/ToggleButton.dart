import 'package:flutter/material.dart';
import 'package:getflutter/getflutter.dart';


// class toggle extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text(
//             "ToggleApp",
//           ),
//         ),
//         body: Center(
//           child: GFToggle(
//
//             duration: Duration(milliseconds: 100),
//             onChanged:(val){},
//             value: null,
//             type: GFToggleType.android,
//           ),
//         ),
//       ),
//     );
//   }
// }
class toggle extends StatefulWidget {
  @override
  _toggleState createState() => _toggleState();
}

class _toggleState extends State<toggle> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: GFToggle(

        duration: Duration(milliseconds: 100),
        onChanged:(val){},
        value: null,
        enabledTrackColor: Color(0xFFE4E4E4),
        enabledThumbColor: Colors.red,
        type: GFToggleType.android,
      ),
    );
  }
}
