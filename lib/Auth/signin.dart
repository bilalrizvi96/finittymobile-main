// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:flutter/material.dart';
// class Sigin extends StatefulWidget {
//   @override
//   _SiginState createState() => _SiginState();
// }
//
// class _SiginState extends State<Sigin> {
//   TextEditingController  ema = TextEditingController();
//   TextEditingController  pass = TextEditingController();
//   final GlobalKey<FormState> _formkey=  GlobalKey<FormState>();
//   // Signin() async{
//   //   final formstate = _formkey.currentState;
//   //   if(formstate.validate() ) {
//   //   formstate.save();
//   //   await FirebaseAuth.instance.signInWithEmailAndPassword(email: ema.text, password: pass.text);
//   //   SnackBar(content:Text("Signed in success"));
//   //   } else {
//   //     SnackBar(content: Text("Wrong email or password"),);
//   //   }
//   // }
//   @override
//   Widget build(BuildContext context) {
//     var size = MediaQuery.of(context).size;
//
//     return Scaffold(
//         appBar: AppBar(
//           title: Padding(
//             padding: const EdgeInsets.only(left:10),
//             child: Text("Sign In ",style: TextStyle(color:Colors.black,fontSize: 17),),
//           ),
//           backgroundColor: Colors.white,
//           leading: IconButton(icon: Icon(Icons.keyboard_backspace),),
//         ),
//         body:Form(
//           key: _formkey,
//           child: Column(
//             children: [
//               TextFormField(
//                 controller: ema,
//                 validator:(input){
//                   if(input.isEmpty){
//                     return 'Please Enter you Email';
//                   }
//                 },
//                 onSaved:(input) => ema.text = input,
//                 decoration: InputDecoration(
//                     labelText: 'Email'
//                 ),
//               ),
//               TextFormField(
//                 controller: pass,
//                 validator:(input){
//                   if(input.length < 6){
//                     return 'Please Enter you Password';
//                   }
//                 },
//                 onSaved:(input) => pass.text = input,
//                 decoration: InputDecoration(
//                     labelText: 'Password'
//                 ),
//                 obscureText: true,
//               ),
//
//               RaisedButton(
//                 onPressed: (){
//                   // Signin();
//                 },
//                 child: Text("Signin"),
//               )
//
//             ],
//           ),
//
//
//         )
//
//
//     );
//
//   }
//
// }