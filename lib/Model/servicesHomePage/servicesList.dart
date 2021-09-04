import 'package:charles_app/View/Caring/CaringView.dart';
import 'package:charles_app/View/Cleaning/cleaningView.dart';
import 'package:charles_app/View/Laundry/Laundry.dart';
import 'package:charles_app/assets/appColors/appColors.dart';
import 'package:flutter/cupertino.dart';

class Services {
    var image1;
  String text;
  String text2;
  Color cardcolor;
  var name;
    var name1;
    var name2;
    var name3;
    var name4;
    var total;
    var total1;
    var total2;
    var total3;
    var total4;
    var nav;
  var background;
  var ind;

  var namelist = new List();
  var totalist= new List();

  Services({this.image1, this.text, this.text2
    , this.cardcolor, this.nav,this.background , this.ind,this.name,this.name1,this.name2,
  this.name3,this.total,this.total1
  ,this.total2,this.total3,this.name4,this.total4 , this.namelist , this.totalist});
}

List<String> namelistCleaning = [
  'Home/Office',
  'Snow',
  'Lawn',
  'Pool',
];

List<String> totallistCleaning = [
  '4',
  '5',
  '6',
  '7',
];

List<String> namelistCaring = [
  'Sitter',
  'PSW',
  'Nurse',
  'Foot Nurse',
  'Dentist',
];

List<String> totallistCaring = [
  '4',
  '5',
  '6',
  '85',
  '85',
];

List<String> namelistLaundary = [
  'Wash Iron',
  'Wash & Fold',
  'Dry Clean',
];

List<String> totallistLaundary = [
  '4',
  '5',
  '6',
];




List<Services> services = [
  Services(image1:"lib/assets/images/Group.png", text:'CLEANING', text2:'', cardcolor:appColors.redColor, nav:cleaningView() , background: "lib/assets/images/cleaningList.png" ,ind: 0 ,
    name:'Snow',
     total: '4',name1: 'Home/Office',total1: '5',
      name2: "Lawn",total2: '6',name3: 'Pool',total3: '85', namelist: namelistCleaning, totalist: totallistCleaning),
  Services(image1:"lib/assets/images/icon.png",text:'CARING', text2:'', cardcolor:Color(0xFF4DCFFF),  nav:CaringCh(),background: "lib/assets/images/caringlist.png", ind: 1,
      name:'Sitter',
      total: '4',name1: 'PSW',total1: '5',
      name2: "Nurse",total2: '6',name3: 'Foot Nurse',total3: '85',name4: 'Dentist',total4: '85',
      namelist: namelistCaring, totalist: totallistCaring
  ),
  Services(image1:"lib/assets/images/Group3.png", text:'LAUNDRY', text2:'', cardcolor:Color(0xFF4CAF50), nav:Laundry(),background: "lib/assets/images/laundrylist.png",ind: 2,
      name:'Wash Iron',
      total: '4',name1: 'Wash & Fold',total1: '5',
      name2: "Dry Clean",total2: '6',
      namelist: namelistLaundary, totalist: totallistLaundary),
 // Services( 'Laundry', '99 near you', Color(0xFF1BD741), Laundry())
];