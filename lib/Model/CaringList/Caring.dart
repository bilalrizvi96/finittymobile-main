import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Caring{
  String title;
  String subText;
  Color clr;
  var img;
  var id;
  var visiblity;

  Caring(this.title,this.subText,this.clr, this.img, this.visiblity,this.id);
}


class Homesubcar{
  var name, id, cid;
  Homesubcar(this.id,this.name,this.cid);
}
class CaringRoomsTab{
  var time,money,text,cid,catname,ccid;
  var item;
  bool selected;

  CaringRoomsTab(this.time, this.money, this.text,this.item,this.cid,this.catname,this.selected,this.ccid);

}


class CaringItem{
  var id,title,price,quantity;
  CaringItem(this.id,this.title,this.price,this.quantity);
}

class Valsubitem{
  var title,price,quantity;
  Valsubitem(this.title,this.price,this.quantity);
}


