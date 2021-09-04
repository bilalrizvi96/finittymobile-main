import 'package:charles_app/assets/appColors/appColors.dart';
import 'package:flutter/material.dart';

class forgotPw extends StatefulWidget {
  @override
  _forgotPwState createState() => _forgotPwState();
}

class _forgotPwState extends State<forgotPw> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 25,),
              Align(
                alignment: Alignment.center,
                child: Image.asset("lib/assets/images/loginlogo.png",height: 120,width: 120,),
              ),
              SizedBox(height: 5,),
              Align(
                  alignment: Alignment.center,
                  child: Text("Hello",style: TextStyle(
                      fontSize: 40,
                      color: Colors.black,
                      fontFamily: "monb",
                      // fontWeight: FontWeight.bold
                  ),)
              ),
              SizedBox(height: 7,),
              Align(
                  alignment: Alignment.center,
                  child: Text("Enter your mobile number",style: TextStyle(
                      fontSize: 17,
                      fontFamily: "monr",
                      color: Colors.black,
                      // fontWeight: FontWeight.bold
                  ),)
              ),
              SizedBox(height: 60,),
              Center(
                child: Container(
                  height: 30,
                  width: 300,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.phone_in_talk, size: 20, color: Colors.black,),
                      hintText: "Mobile Number",
                      hintStyle: TextStyle(fontFamily: "sour", color: Colors.black)
                    ),
                    keyboardType: TextInputType.number,
                    //cursorHeight: 25,
                    onChanged: (value) {},
                  ),
                ),
              ),
              SizedBox(height: 30,),
              Center(
                child: Container(
                  height: 50,
                  width:280,
                  decoration:BoxDecoration(
                    borderRadius:BorderRadius.circular(30),
                    boxShadow: [BoxShadow(
                      color: Color(0xFFF34C4329).withOpacity(0.2),
                      blurRadius: 10,
                      spreadRadius: 1,
                      offset: Offset(0,2),
                    )],
                    color:appColors.redColor,
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
                      "Send Code",
                      style: TextStyle(fontSize: 13.0, color: Colors.white, fontFamily: "monr"),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 12,),
              Center(
                child: Container(
                    width: 202,
                    child: Text("Enter the mobile number associated with your account, and we’ll help you get your password reset", textAlign: TextAlign.center,)),
              ),
              Spacer(),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left:18.0),
                    child: Text("Terms & Conditions", style: TextStyle(fontFamily: "soui",
                        fontStyle: FontStyle.italic, decoration: TextDecoration.underline),),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right:18.0),
                    child: Text("Privacy Policy", style: TextStyle(fontFamily: "soui",
                        fontStyle: FontStyle.italic,decoration: TextDecoration.underline),),
                  ),
                ],
              ),

            ],
          ),
        ),
      ),

    );
  }
}
