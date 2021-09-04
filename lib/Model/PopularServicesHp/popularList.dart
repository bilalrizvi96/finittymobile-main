import 'package:flutter/cupertino.dart';

class PopularServices {
  var image;
  String text;
  String text2;

  Color cardcolor;
  PopularServices(this.image, this.text, this.text2, this.cardcolor);
}

List<PopularServices> pservices = [
  PopularServices(
      'lib/assets/images/snow2.png', 'Snow', 'cleaning', Color(0xFFBCBDC1)),
  PopularServices(
      'lib/assets/images/house.png', 'Home/Office', 'cleaning', Color(0xFFBCBDC1)),
  PopularServices(
      'lib/assets/images/ib1.png', 'Wash & Fold', 'Cleaning', Color(0xFFBCBDC1)),
  PopularServices(
      'lib/assets/images/psw.png', 'PSW', 'Caring', Color(0xFFBCBDC1))
];