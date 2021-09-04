import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Cleaining{
  String title;
  String subText;
  Color clr;
  var img;
  var id;
  var visiblity;
  var addons;


  Cleaining(this.title,this.subText,this.clr, this.img, this.visiblity,this.id,this.addons);
}

class Addons{

  var id ;
  var title;
  var price;
  var parentid;
  var selected;
  var cattitle;
  Addons({this.id,this.title,this.price,this.parentid,this.selected, this.cattitle});

}

class Homesubcle{
  var name, id, cid;
  Homesubcle(this.id,this.name,this.cid);
}
class CleaningRoomsTab{
  var time,money,text,cid,catname,ccid,id;
  var item;
  bool selected;

  CleaningRoomsTab(this.time, this.money, this.text,this.item,this.cid,this.catname,this.selected,this.ccid,this.id);

}
class CleaningItem{

  var id,title,price,quantity,cid;
  CleaningItem(this.id,this.title,this.price,this.quantity,this.cid);
}
class Valsubitemcle{
  var title,price,quantity,indexid,unique,id;
  Valsubitemcle(this.title,this.price,this.quantity,this.indexid,this.unique,this.id);
}
class Selected{
  var indexx,money,title;
  Selected({this.indexx,this.money,this.title});
}
class ModalData{
  var title,price,quantity,id;
  ModalData({this.title,this.price,this.quantity,this.id});
}
class CardDetails{
  var cardno,cardexp,cardcvc;
  bool selected;
  CardDetails({this.cardno,this.cardexp,this.cardcvc,this.selected});
  factory CardDetails.fromJson(Map<String, dynamic> jsonData) {
    return CardDetails(
      cardno: jsonData['cardno'],
      cardexp: jsonData['cardexp'],
      cardcvc: jsonData['cardcvc'],
      selected: jsonData['selected'],

    );
  }

  static Map<String, dynamic> toMap(CardDetails cards) => {

    'cardno': cards.cardno,
    'cardexp': cards.cardexp,
    'cardcvc': cards.cardcvc,
    'selected': cards.selected,

  };

  static String encodeMusics(List<CardDetails> cart) => json.encode(
    cart
        .map<Map<dynamic, dynamic>>((music) => CardDetails.toMap(music))
        .toList(),
  );

  static List<CardDetails> decodeMusics(String cart){
    if(cart != null){
      return (json.decode(cart) as List<dynamic>)
          .map<CardDetails>((item) => CardDetails.fromJson(item))
          .toList();
    }
    else{
      return new List();
    }
  }


}
class Recurrent{
  var title;
  bool select;
  Recurrent(this.title,this.select);
}
List<Recurrent> rec=[
  Recurrent('Daily',false),
  Recurrent('weekly -15% off',false),
  Recurrent('Monthly',false),
];