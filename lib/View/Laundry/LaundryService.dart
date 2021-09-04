import 'package:flutter/cupertino.dart';

class laundryService{
  String title;
  //String subText;
  Color clr;
  laundryService(this.title,this.clr);
}

List<laundryService> caring = [
  laundryService(
    'Wash & Iron',
    // 'Cleanin',
    Color(0xFFFF0000),


  ),

  laundryService(
      'Wash & Fold',
      // 'Cleaning',
      Color(0xFFFF6961)
  ),





];
