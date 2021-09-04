import 'package:charles_app/API/API.dart';
import 'package:charles_app/BaseUrl/variableGloable.dart';
import 'package:charles_app/Component/dropDownFlags.dart';
import 'package:charles_app/View/login/Loginnn.dart';
import 'package:charles_app/View/login/otp.dart';
import 'package:charles_app/widgets/widgets.dart';
import 'package:firebase_auth/firebase_auth.dart';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress_dialog/progress_dialog.dart';

class Signup extends StatefulWidget {
  @override
  _SignupState createState() => _SignupState();
}

class _SignupState extends State<Signup> {
  TextEditingController fullname = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController Pass = TextEditingController();
  var clickstatus = true;
  ProgressDialog pr;

  final _formKey = GlobalKey<FormState>();

  void initState() {
    pr = new ProgressDialog(context);
  }



  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0),
                child: Text(
                  "Terms & Conditions",
                  style: TextStyle(
                      fontFamily: "soui",
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 30.0),
                child: Text(
                  "Privacy Policy",
                  style: TextStyle(
                      fontFamily: "soui",
                      fontStyle: FontStyle.italic,
                      decoration: TextDecoration.underline),
                ),
              ),
            ],
          ),
        ),
        body: SingleChildScrollView(
          child: Container(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: 25,
                  ),
                  Align(
                    alignment: Alignment.center,
                    child: Image.asset(
                      "lib/assets/images/loginlogo1.png",
                      height: 120,
                      width: 120,
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Text("Hello",
                          style: Styles()
                              .monsRegular(size: 54.0, color: Colors.black))),
                  SizedBox(
                    height: 7,
                  ),
                  Align(
                      alignment: Alignment.center,
                      child: Text("Let's create your account first",
                          style: Styles()
                              .monsRegular(size: 17.0, color: Colors.black))),
                  Padding(
                    padding: const EdgeInsets.only(left: 30, right: 30, top: 0),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: fullname,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter First Name';
                        }
                        return null;
                      },
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontFamily: "sour"),
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(50.0, 15.0, 40.0, 15.0),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Icon(
                            Icons.person,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                        hintText: "Full Name",
                        hintStyle: TextStyle(fontSize: 16, fontFamily: "sour"),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 30.0),
                    child: Row(
                      children: [
                        Container(
                          height: 50,
                          width: 89,
                          decoration: BoxDecoration(
                              border: Border(
                                  bottom: BorderSide(
                                      width: 0.7, color: Colors.grey))),
                          child: drop(),
                        ),
                        SizedBox(
                          width: 8,
                        ),
                        Flexible(
                          child: TextFormField(
                            keyboardType: TextInputType.phone,
                            controller: phone,
                            validator: (value) {
                              if (value.isEmpty) {
                                return 'Enter Phone Number';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.phone,
                                color: Colors.black,
                                size: 18.5,
                              ),
                              hintText: "Phone Number",
                              hintStyle:
                                  TextStyle(fontSize: 16, fontFamily: "sour"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, top: 10),
                    child: TextFormField(
                      keyboardType: TextInputType.text,
                      controller: email,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter Email';
                        }
                        return null;
                      },
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontFamily: "sour"),
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Icon(
                            Icons.email,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                        hintText: "Email",
                        hintStyle: TextStyle(fontSize: 16, fontFamily: "sour"),

//                            border: OutlineInputBorder(
//                                borderSide: BorderSide(color: Colors.blueAccent, width: 32.0),
//                                borderRadius: BorderRadius.circular(25.0)),
//                            focusedBorder: OutlineInputBorder(
//                                borderSide: BorderSide(color: Colors.white, width: 32.0),
//                                borderRadius: BorderRadius.circular(25.0)))),
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                        const EdgeInsets.only(left: 30, right: 30, top: 10),
                    child: TextFormField(
                      controller: Pass,
                      validator: (value) {
                        if (value.isEmpty) {
                          return 'Enter Password';
                        }
                        return null;
                      },
                      obscureText: true,
                      style: TextStyle(
                          fontSize: 16.0,
                          color: Colors.black,
                          fontFamily: "sour"),
                      decoration: InputDecoration(
                        contentPadding:
                            EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
                        prefixIcon: Padding(
                          padding: const EdgeInsets.only(right: 20.0),
                          child: Icon(
                            Icons.lock,
                            color: Colors.black,
                            size: 20,
                          ),
                        ),
                        hintText: "Password",
                        hintStyle: TextStyle(fontSize: 16, fontFamily: "sour"),

//                            border: OutlineInputBorder(
//                                borderSide: BorderSide(color: Colors.blueAccent, width: 32.0),
//                                borderRadius: BorderRadius.circular(25.0)),
//                            focusedBorder: OutlineInputBorder(
//                                borderSide: BorderSide(color: Colors.white, width: 32.0),
//                                borderRadius: BorderRadius.circular(25.0)))),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  InkWell(
                    child: Container(
                      width: MediaQuery.of(context).size.width / 1.3,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Color(0xFFFF0000),
//                              color: Color.fromRGBO(119, 0, 0, 1),

                        borderRadius: BorderRadius.circular(60.0),
                      ),
                      child: Center(
                          child: new Text("Sign Up",
                              style: const TextStyle(
                                  fontFamily: 'asdf',
                                  color: Colors.white,

                                  //fontStyle: FontStyle.normal,
                                  fontSize: 16.0))),
                    ),
                    onTap: () {
                      if (_formKey.currentState.validate()) {
                        clickstatus = false;
                        Name=fullname.text;
                        PhoneNumber=phone.text;
                        Email=email.text;
                        Password=Pass.text;
                        pr.show();
                        final phoneNu = phone.text.trim();
                        loginUser(phoneNu, context);

                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text(
                          "Dont't have an account?",
                          style: TextStyle(
                              fontFamily: "soui",
                              fontStyle: FontStyle.italic,
                              color: Colors.black,
                              fontSize: 15),
                          textAlign: TextAlign.right,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: InkWell(
                          child: Text(
                            " Sign in",
                            style: TextStyle(
                              fontFamily: "soui",
                              fontStyle: FontStyle.italic,
                              color: Colors.grey[800],
                              fontSize: 15,
                              decoration: TextDecoration.underline,
                            ),
                            textAlign: TextAlign.right,
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Loginn(),
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                      width: 150,
                      height: 35,
                      child: Image.asset("lib/assets/images/logos.png")),
                  SizedBox(
                    height: 10,
                  ),
                ],
              ),
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
              context, MaterialPageRoute(builder: (context) => otpScreen(varificationId:verificationId,Login:false)));
        },
        codeAutoRetrievalTimeout: null
    );
  }

}
