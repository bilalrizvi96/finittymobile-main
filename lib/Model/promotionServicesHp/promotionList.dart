import 'package:flutter/cupertino.dart';

class ProServices {
  var image1;
  String text;
  String text2;

  ProServices(this.image1, this.text, this.text2);
}

List<ProServices> proservices = [
  ProServices('lib/assets/images/promotionimage.png', '2 Room', 'cleaning'),
  ProServices('lib/assets/images/promotionimage2.jpg', 'Full Home', 'cleaning'),
  ProServices('lib/assets/images/promotionimage4.png', 'Pool cleaning', 'cleaning')
];