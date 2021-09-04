

import 'package:charles_app/BaseUrl/api.dart';
import 'package:charles_app/Component/dropDownFlags.dart';
import 'package:charles_app/View/login/forgotPassword.dart';
import 'package:charles_app/View/login/otp.dart';
import 'package:charles_app/View/login/signup.dart';
import 'package:charles_app/assets/appColors/appColors.dart';
import 'package:charles_app/widgets/widgets.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:charles_app/BaseUrl/variableGloable.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress_dialog/progress_dialog.dart';
import '../bottom.dart';
import '../splash.dart';


class Loginn extends StatefulWidget {
  @override
  _LoginnState createState() => _LoginnState();
}
// var Email1, Password1;
// bool loginsuccess=false;
// var exceptions;
// FirebaseAuth _auth = FirebaseAuth.instance;
class _LoginnState extends State<Loginn> {


  TextEditingController email= TextEditingController();
  TextEditingController Pass= TextEditingController();
  var clickstatus=true;
  ProgressDialog pr;
  final _formKey = GlobalKey<FormState>();


  @override
  void initState() {
    pr= new ProgressDialog(context);
  }




  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(

        // resizeToAvoidBottomPadding: true,
        bottomNavigationBar: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left:30.0),
                  child: Text("Terms & Conditions", style: TextStyle(fontFamily: "soui",
                      fontStyle: FontStyle.italic, decoration: TextDecoration.underline),),
                ),
                Padding(
                  padding: const EdgeInsets.only(right:30.0),
                  child: Text("Privacy Policy", style: TextStyle(fontFamily: "soui",
                      fontStyle: FontStyle.italic,decoration: TextDecoration.underline),),
                ),
              ],
            ),
          ),
        ),
         resizeToAvoidBottomInset : true,
        body: Container(
          color: Colors.white,
          padding: EdgeInsets.only(left: 35,right: 35),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 25,),
                Align(
                  alignment: Alignment.center,
                  child: Image.asset("lib/assets/images/loginlogo1.png",height: 120,width: 120,),
                ),
                SizedBox(height: 5,),
                Align(
                    alignment: Alignment.center,
                    child: Text("Hello",style:Styles().monsRegular(size: 54.0,color: Colors.black))
                ),
                SizedBox(height: 7,),
                Align(
                    alignment: Alignment.center,
                    child: Text("Sign in to your account",style: Styles().monsRegular(size: 17.0,color: Colors.black))
                ),
                SizedBox(height: 20,),
                Form(

                  key: _formKey,
                  child: Column(
                    children: [
                      Container(
                        //margin: EdgeInsets.symmetric(horizontal: 30.0),
                        child: Row(
                          children: [
                            Container(
                              height: 50,
                              width: 89,
                              decoration: BoxDecoration(
                                  border: Border(bottom: BorderSide(width: 0.7, color: Colors.black))
                              ),
                              child: drop(),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            Flexible(


                              child: Container(
                                // height: _isInvalid ? 100 : 50,


                                child: TextFormField(
                                  validator: (value) {

                                    if (value.isEmpty) {
                                      return 'Enter Phone Number';
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.number,
                                  controller: email,
                                  decoration: InputDecoration(

                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(color: Colors.black),
                                      ),
                                      prefixIcon: Icon(
                                        Icons.phone,
                                        color: Colors.black,
                                        size: 18.5,
                                      ),
                                      hintText: "Phone Number",
                                      hintStyle: TextStyle(color: Colors.black)),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: TextFormField(

                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter Password';
                            }
                            return null;
                          },
                          style: TextStyle(
                              fontSize: 16.0,
                              color: Colors.black,
                              fontFamily: "sour"
                          ),
                          controller: Pass,
                          obscureText: true,
                          decoration: InputDecoration(
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(color: Colors.black),
                            ),
                            contentPadding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                            prefixIcon: Padding(
                              padding: const EdgeInsets.only(right:25),
                              child: Icon(Icons.lock,color: Colors.black,size: 20,),
                            ),
                            hintText: "Password",
                            hintStyle: TextStyle(
                              fontSize: 16,
                              fontFamily: "sour",
                              color: Colors.black,

                            ),
//                            border: OutlineInputBorder(
//                                borderSide: BorderSide(color: Colors.blueAccent, width: 32.0),
//                                borderRadius: BorderRadius.circular(25.0)),
//                            focusedBorder: OutlineInputBorder(
//                                borderSide: BorderSide(color: Colors.white, width: 32.0),
//                                borderRadius: BorderRadius.circular(25.0)))),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                         Navigator.push(context, MaterialPageRoute(
                             builder: (context)=>forgotPw()));
                  },
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        "Forgot your password?",
                        style: Styles().rubik(size: 14.0,color: Colors.black),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20,),
                InkWell(
                  child: Container(
                    width:
                    MediaQuery.of(context).size.width / 1.3,
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
                        child: new Text("Sign in",
                            style: const TextStyle(
                                fontFamily: 'asdf',
                                color: Colors.white,

                                //fontStyle: FontStyle.normal,
                                fontSize: 16.0))),
                  ),
                  onTap: () {
                    clickstatus=false;
                    if(_formKey.currentState.validate()){
                      pr.show();
                      final phoneNu = email.text.trim();
                      PhoneNumber=email.text.toString();
                      Password=Pass.text.toString();
                      loginUser(phoneNu, context);

                    }
                  },
                ),
                SizedBox(height: 8,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center ,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: Text(
                        "Dont't have an account?",style: TextStyle(
                          fontFamily: "soui",
                          fontStyle: FontStyle.italic,
                          color: Colors.black,
                          fontSize: 15),textAlign: TextAlign.right,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 10),
                      child: InkWell(
                        child: Text(
                          " Sign up",style: TextStyle(
                          fontFamily: "soui",
                          fontStyle: FontStyle.italic,
                          color: Colors.grey[800],
                          fontSize: 15,
                          decoration: TextDecoration.underline,
                        ),textAlign: TextAlign.right,
                        ),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Signup(),
                            ),
                          );
                        },
                      ),
                    ),

                  ],
                ),
                SizedBox(height: 10,),
                Container(
                    width: 150,
                    height: 35,
                    child: Image.asset("lib/assets/images/logos.png")
                ),
                SizedBox(height: 15,),
                Container(

                  height: 40,
                  width:100,
                  decoration:BoxDecoration(
                      borderRadius:BorderRadius.circular(30),
                    color: Colors.white,
                    boxShadow: [BoxShadow(
                      color: Colors.red.withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 1,
                      offset: Offset(0,5),
                    )],
                  ),
                  child: FlatButton(
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(8.0),
                    splashColor: Color(0xFFFC7594),
                    onPressed: () {
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => cleaningLanding()));
                    },
                    child: Text(
                      "Skip",
                      style: TextStyle(fontSize: 15.0, color:appColors.redColor, fontFamily: "sspsb"),
                    ),
                  ),
                ),
                SizedBox(height: 25,),
                // Align(
                //   alignment: Alignment.bottomCenter,
                //   child:
                // ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future<bool> loginUser(String phone, BuildContext context) async{
    FirebaseAuth _auth = FirebaseAuth.instance;

    _auth.verifyPhoneNumber(
        phoneNumber: code+phone.toString(),
        timeout: Duration(seconds: 60),
        verificationCompleted: (AuthCredential credential) async{

        },
        verificationFailed: (AuthException exception){
          print(exception);
        },
        codeSent: (String verificationId, [int forceResendingToken]){
          pr.hide();
          Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => otpScreen(varificationId:verificationId,Login:true)));
        },
        codeAutoRetrievalTimeout: null
    );
  }


}
