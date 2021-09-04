import 'package:charles_app/API/API.dart';
import 'package:charles_app/BaseUrl/api.dart';
import 'package:charles_app/BaseUrl/variableGloable.dart';
import 'package:charles_app/View/Homepage/Home.dart';
import 'package:charles_app/View/bottom.dart';
import 'package:charles_app/View/splash.dart';
import 'package:charles_app/widgets/widgets.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:progress_dialog/progress_dialog.dart';

class otpScreen extends StatefulWidget {

  String varificationId;
  bool Login;

  otpScreen({this.varificationId,this.Login});
  @override
  _otpScreenState createState() => _otpScreenState();
}

class _otpScreenState extends State<otpScreen> with TickerProviderStateMixin {
  AnimationController controller;
  bool textvisibility = true;
  bool textvisibility2 = false;
  ProgressDialog pr;
  TextEditingController otp = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  final databaseReference = FirebaseDatabase.instance.reference();


  var test = 100;
  void initState() {
    pr = new ProgressDialog(context);
    controller = AnimationController(
        duration: Duration(
          seconds: 5,
        ),
        vsync: this,
        upperBound: 300,
        lowerBound: 0);
    controller.reverse(from: 300);
    controller.addListener(() {
      setState(() {});
      print(controller.value);
    });

    super.initState();
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
        resizeToAvoidBottomInset : false,
        body: SingleChildScrollView(
          //height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                  child: Text(
                    'Hello',
                      style:Styles().monsRegular(size: 54.0,color: Colors.black))
                  ),
              SizedBox(
                height: 7,
              ),
              Align(
                  alignment: Alignment.center,
                  child: Text(
                    "OTP sent again!",
                    style: TextStyle(
                      fontSize: 17,
                      fontFamily: "monr",
                      color: Colors.black,
                      // fontWeight: FontWeight.bold
                    ),
                  )),

              SizedBox(
                height: 25,
              ),
              Center(
                child: Form(
                  key: _formKey,
                  child: Container(
                    alignment: Alignment.center,
                    width: MediaQuery.of(context).size.width / 1.3,
                    child: Theme(
                      data: new ThemeData(
                          primaryColor: Colors.grey[400],
                          accentColor: Colors.grey[400],
                          hintColor: Colors.green),
                      child: TextFormField(
                          keyboardType: TextInputType.phone,
                          validator: (value) {
                            if (value.isEmpty) {
                              return 'Enter Code Number';
                            }
                            return null;
                          },
                          controller: otp,
                          decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.phone_in_talk,
                                size: 20,
                                color: Colors.black,
                              ),
                              hintText: "Enter OTP",
                              hintStyle: TextStyle(
                                  fontFamily: "sour", color: Colors.black))

                      ),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 40, right: 40),
                color: Colors.red,
                height: 2,
                width: controller.value,
                child: Text(''),
              ),
              Align(
                  alignment: Alignment.topRight,
                  child: Container(
                    padding: EdgeInsets.only(right: 30),
                    child: FlatButton(
                      onPressed: () {
                        setState(() {
                          test = 50;
                          if (controller.value != 0) {
                            textvisibility = true;
                            textvisibility2 = false;
                          } else if (controller.value == 0) {
                            textvisibility = false;
                            textvisibility2 = true;
                            print(textvisibility);
                          }
                        });
                        initState();
                      },
                      child: Text('Resend',style: Styles().rubik(size: 14.0,color: Colors.black),),
                    ),
                  )),
              Center(
                child: Container(
                  height: 50,
                  width: 280,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0xFFF34C4329).withOpacity(0.2),
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: Offset(0, 2),
                      )
                    ],
                    color: Color(0xFFFF0000),
                  ),
                  child: FlatButton(
                    textColor: Colors.white,
                    disabledColor: Colors.grey,
                    disabledTextColor: Colors.black,
                    padding: EdgeInsets.all(8.0),
                    splashColor: Color(0xFFFC7594),
                    onPressed: ()async {
                      FirebaseAuth _auth = FirebaseAuth.instance;
                      if(otp.text != "null"){
                        if(_formKey.currentState.validate()){
                          final code = otp.text.trim();
                          AuthCredential credential = PhoneAuthProvider.getCredential(verificationId: widget.varificationId,
                              smsCode: code);
                          AuthResult result = await _auth.signInWithCredential(credential);

                          FirebaseUser user = result.user;

                          if(user != null){
                            if(widget.Login==true){
                              DataCalling(PhoneNumber, Password);
                              waittologin();
                            }else{
                              API.signupAPI(Name,PhoneNumber,Email,Password);
                              waittosignup(user.uid);
                            }

                          }else{
                            print("Error");
                          }
                        }

                      }else{
                        Fluttertoast.showToast(
                            msg: "Please Enter Correct Code",
                            toastLength: Toast.LENGTH_SHORT,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 3,
                            backgroundColor: Colors.green,
                            textColor: Colors.white,
                            fontSize: 16.0);
                      }

                    },
                    child: Text(
                      "Submit",
                      style: TextStyle(
                          fontSize: 13.0,
                          color: Colors.white,
                          fontFamily: "monr"),
                    ),
                  ),
                ),
              ),
              Center(
                child: Visibility(
                    visible: textvisibility,
                    child: Container(
                      child: Text(
                        'Your One Time Password has been sent to your mobile phone. Please enter the number below.',
                        textAlign: TextAlign.center,
                      ),
                      height: MediaQuery.of(context).size.height / 4,
                      width: 200,
                      alignment: Alignment.center,
                    )),
              ),
              Center(
                child: Visibility(
                    visible: textvisibility2,
                    child: Container(
                      child: Text(
                        'Your One Time Password has been sent to your mobile phone again. Please enter the number below.',
                        textAlign: TextAlign.center,
                      ),
                      height: MediaQuery.of(context).size.height / 4,
                      width: 200,
                      alignment: Alignment.center,
                    )),
              ),
              //Spacer(),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Padding(
              //       padding: const EdgeInsets.only(left: 18.0),
              //       child: Text(
              //         "Terms & Conditions",
              //         style: TextStyle(
              //             fontFamily: "soui",
              //             fontStyle: FontStyle.italic,
              //             decoration: TextDecoration.underline),
              //       ),
              //     ),
              //     Padding(
              //       padding: const EdgeInsets.only(right: 18.0),
              //       child: Text(
              //         "Privacy Policy",
              //         style: TextStyle(
              //             fontFamily: "soui",
              //             fontStyle: FontStyle.italic,
              //             decoration: TextDecoration.underline),
              //       ),
              //     ),
              //   ],
              // ),
            ],
          ),
        ),
      ),
    );
  }
  void waittosignup(String id) async {
    await Future.delayed(const Duration(seconds: 3), () {
      if (success == 'true') {
        databaseReference.child("Customers").child(id).set({
          'uid': id,
          'Name': username,
          'userphone': userphone,
        });
        pr.hide();
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => home_sc(inde: 2,)));
      } else if (success == 'error') {
        pr.hide();
        Fluttertoast.showToast(
            msg:  status,
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);
      } else {
        waittosignup(id);
      }
    });
  }
  DataCalling(var PhoneNumber, var pass){
    success = "false";
    Dio dio = new Dio();
    String url=baseurl+'/api/login';
    FormData formData = new FormData.fromMap({
      'password': pass.toString(),
      'phone': code+PhoneNumber.toString(),
      'role':"user",
    });
    dio.post(url, data: formData,options: Options(
      contentType: "application/json",

    ),
    ).then((response){

      Map<String, dynamic> data = response.data;
      var status = data['success'];
      if(response.statusCode == 200){
        if(status != null){
          usertoken = data['success']['token'];
          user = data['success']['user'];
          username = user['name'];
          useremail = user['email'];
          userid = user['id'].toString();
          userphone = user['phone'];
          success = "true";
          SplashTest.sharedPreferences.setString("usertoken", usertoken.toString());
          SplashTest.sharedPreferences.setString("username", username.toString());
          SplashTest.sharedPreferences.setString("useremail", useremail.toString());
          SplashTest.sharedPreferences.setString("userid", userid.toString());
          SplashTest.sharedPreferences.setString("userphone", userphone.toString());
          print('done');
        }
        else{
          success = "error";
          print('error');
        }
      }
      else{
        success = "error";
        throw Exception('Failed to Fetch Vendors');
      }
    }).catchError(onError);

  }
  onError(dynamic error){
    success = "error";
  }
  void waittologin() async {
    await Future.delayed(const Duration(seconds: 1), () {
      if(success == 'true'){
        pr.hide();
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => home_sc(inde: 2,)));
      }
      else if(success == 'error'){
        pr.hide();
        Fluttertoast.showToast(
            msg: "'Incorrect Email and Password'",
            toastLength: Toast.LENGTH_SHORT,
            gravity: ToastGravity.CENTER,
            timeInSecForIosWeb: 3,
            backgroundColor: Colors.green,
            textColor: Colors.white,
            fontSize: 16.0);

      }
      else {
        waittologin();
      }

    });

  }
}
