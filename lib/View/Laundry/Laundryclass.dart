import 'package:flutter/cupertino.dart';

class laundry{
  String title;
  String subText;
  Color clr;
  var cImg;

  laundry({this.title,this.subText,this.clr,this.cImg});

  static List<laundry> laundryList(){
    var lst = new List<laundry>();

    lst.add(new laundry(title:"Wash & Iron",clr:Color(0xFFBCBDC1),subText: "Laundry",cImg: "lib/assets/images/laundryone.png"));
    lst.add(new laundry(title:"Wash & Fold",clr:Color(0xFFBCBDC1),subText: "Laundry",cImg: "lib/assets/images/ib1.png"));
    lst.add(new laundry(title:"Dry Clean",clr:Color(0xFFBCBDC1),subText: "Laundry",cImg: "lib/assets/images/ib2.png"));
    return lst;
  }


}




// List<laundry> laundryList = [
//   laundry(
//       'Wash & Iron',
//       'Laundry',
//       Color(0xFF64DD17),
//     'lib/assets/images/laundryone.png'
//
//
//   ),
//
//   laundry(
//       'Wash & Fold',
//       'Laundry',
//       Color(0xFF64DD17),
//       'lib/assets/images/laundryone.png'
//
//   ),
//
//   laundry(
//       'Dry Clean',
//       'Laundry',
//       Color(0xFF64DD17),
//       'lib/assets/images/laundryone.png'
//
//   ),
// ];



class LaundryTab{
  var time,money,text,text2;
  bool selected;
  int height;

  LaundryTab(this.time, this.money, this.text,this.text2,this.selected);

  static List<LaundryTab> laundryTabbList=[
    LaundryTab( "1 Bag",
        "\$20",
        "Pent:\nShirt:\nStocks:\nUnderwear:\n","5\n5\n5\n5\n",false,),
    LaundryTab( "1 Bag",
      "\$20",
      "Pent:\nShirt:\nStocks:\nUnderwear:\n","5\n5\n5\n5\n",false,),
    LaundryTab( "1 Bag",
      "\$20",
      "Pent:\nShirt:\nStocks:\nUnderwear:\n","5\n5\n5\n5\n",false,),
    LaundryTab( "1 Bag",
      "\$20",
      "Pent:\nShirt:\nStocks:\nUnderwear:\n","5\n5\n5\n5\n",false,),
  ];
}


// class KidsTab{
//   var bag,money,quantity,type;
//   bool selected;
//
//   KidsTab(this.bag, this.money, this.type,this.quantity,this.selected);
//
//   static List<KidsTab> kidstabList=[
//     KidsTab( "1 Bag",
//       "\$84",
//       "pant: \nShirt \nSocks \nUnderwear",
//       "5  \n5 \n5 \n5",
//       false,),
//     KidsTab( "5 Bag",
//       "\$140",
//       "pant: \nShirt \nSocks \nUnderwear",
//       "5 \n5 \n5 \n5",false,),
//     KidsTab( "8 Bag",
//       "\$224",
//       "pant: \nShirt \nSocks \nUnderwear",
//       "5  \n5 \n5 \n5",false,),
//     KidsTab( "12 Bag",
//       "\$336",
//       "pant: \nShirt \nSocks \nUnderwear",
//       "5  \n5 \n5 \n5",false,),
//   ];
// }
// class OthersTab{
//   var bag,money,quantity,type;
//   bool selected;
//
//   OthersTab(this.bag, this.money, this.type,this.quantity,this.selected);
//
//   static List<OthersTab> otherstabList=[
//     OthersTab( "1 Bag",
//       "\$84",
//       "pant: \nShirt \nSocks \nUnderwear",
//       "5  \n5 \n5 \n5",
//       false,),
//     OthersTab( "5 Bag",
//       "\$140",
//       "pant: \nShirt \nSocks \nUnderwear",
//       "5 \n5 \n5 \n5",false,),
//     OthersTab( "8 Bag",
//       "\$224",
//       "pant: \nShirt \nSocks \nUnderwear",
//       "5  \n5 \n5 \n5",false,),
//     OthersTab( "12 Bag",
//       "\$336",
//       "pant: \nShirt \nSocks \nUnderwear",
//       "5  \n5 \n5 \n5",false,),
//   ];
// }
//
//
// class MenTab{
//   var bag,money,quantity,type;
//   bool selected;
//
//   MenTab(this.bag, this.money, this.type,this.quantity,this.selected);
//
//   static List<MenTab> MenTabList=[
//     MenTab( "1 Bag",
//       "\$84",
//       "pant: \nShirt \nSocks \nUnderwear",
//       "5  \n5 \n5 \n5",
//       false,),
//     MenTab( "5 Bag",
//       "\$140",
//       "pant: \nShirt \nSocks \nUnderwear",
//       "5 \n5 \n5 \n5",false,),
//     MenTab( "8 Bag",
//       "\$224",
//       "pant: \nShirt \nSocks \nUnderwear",
//       "5  \n5 \n5 \n5",false,),
//     MenTab( "12 Bag",
//       "\$336",
//       "pant: \nShirt \nSocks \nUnderwear",
//       "5  \n5 \n5 \n5",false,),
//   ];
// }
//
//
// class MenTab{
//   var bag,money,quantity,type;
//   bool selected;
//
//   MenTab(this.bag, this.money, this.type,this.quantity,this.selected);
//
//   static List<MenTab> MenTabList=[
//     MenTab( "1 Bag",
//       "\$84",
//       "pant: \nShirt \nSocks \nUnderwear",
//       "5  \n5 \n5 \n5",
//       false,),
//     MenTab( "5 Bag",
//       "\$140",
//       "pant: \nShirt \nSocks \nUnderwear",
//       "5 \n5 \n5 \n5",false,),
//     MenTab( "8 Bag",
//       "\$224",
//       "pant: \nShirt \nSocks \nUnderwear",
//       "5  \n5 \n5 \n5",false,),
//     MenTab( "12 Bag",
//       "\$336",
//       "pant: \nShirt \nSocks \nUnderwear",
//       "5  \n5 \n5 \n5",false,),
//   ];
// }