import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  Function onpressed;
  String text;
  IconData leadicon;
  String endtext = 'a';
  Button({this.endtext, @required this.onpressed, this.text, this.leadicon});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height / 19,
      child: FlatButton(
        onPressed: onpressed,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 5),
              width: MediaQuery.of(context).size.width / 2.5,
              child: Text(
                text,
                textAlign: TextAlign.start,
                style: TextStyle(fontSize: 15, color: Colors.black, fontFamily: "opsr", fontWeight: FontWeight.bold),
              ),
            ),
            Spacer(),
            Container(
              child: Icon(leadicon),
            ),
          ],
        ),
      ),
    );
  }
}
