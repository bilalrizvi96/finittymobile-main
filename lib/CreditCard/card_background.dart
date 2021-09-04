import 'package:flutter/material.dart';

class CardBackgrounds {
  CardBackgrounds._();

  static Widget black = new Container(
    width: double.maxFinite,
    height: double.maxFinite,
    color: Color(0xff0B0B0F),
  );
  static Widget red = new Container(
    width: double.maxFinite,
    height: double.maxFinite,
    color: Colors.red,
  );
  static Widget grey = new Container(
    width: double.maxFinite,
    height: double.maxFinite,
    color: Colors.grey,
  );

  static Widget white = new Container(
    width: double.maxFinite,
    height: double.maxFinite,
    color: Color(0xffF9F9FA),
  );
  static Widget blackGradient = new Container(
    width: double.maxFinite,
    height: double.maxFinite,
    decoration: BoxDecoration(
      gradient: LinearGradient(


        colors: [
          Colors.black,
          Colors.black,

        ]
      )
    ),
  );
}
