import 'package:flutter/cupertino.dart';

class Recommended {
  var image1;
  String text;
  String text2;
  Color color;

  Recommended(this.image1, this.text, this.text2, this.color);
}

List<Recommended> recommended = [
  Recommended(
      'lib/assets/images/recomendationimage1.png', '2 Room', 'cleaning', Color.fromRGBO(39, 154, 172, 1)),
  Recommended(
      'lib/assets/images/recomendationimage1.png', 'Full Home', 'cleaning', Color(0xFF4DCFFF)),
  Recommended('lib/assets/images/recomendationimage1.png', 'Pool cleaning', 'cleaning',
      Color(0xFF263238))
];