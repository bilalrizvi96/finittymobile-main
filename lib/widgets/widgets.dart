import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Styles{
  TextStyle openBold ({size,color}){
    return TextStyle(
      fontFamily: 'opsb',
      fontWeight: FontWeight.bold,
      fontSize: size,
      color: color

    );
  }


  TextStyle openRegular ({size,color}){
    return TextStyle(
        fontFamily: 'opsr',
        fontSize: size,
        color: color

    );
  }
  TextStyle openRegular2(){
    return TextStyle(
        fontFamily: 'opsr',
      fontSize: 12,
      color: Color(0xffBCBDC1),
    );
  }
  TextStyle rubik ({size,color}){
    return TextStyle(
        fontFamily: 'rubikl',
        fontSize: size,
        color: color

    );
  }
  TextStyle robo ({size,color}){
    return TextStyle(
        fontFamily: 'rob',
        fontSize: size,
        color: color

    );
  }
  TextStyle monsRegular ({size,color}){
    return  TextStyle(
    fontSize: size,
      color: color,

      fontFamily: "monr",
// fontWeight: FontWeight.bold
);
}


  TextStyle monsBold ({size,color}){
    return  TextStyle(
      fontSize: size,
      color: color,

      fontFamily: "monb",
// fontWeight: FontWeight.bold
    );
  }
}