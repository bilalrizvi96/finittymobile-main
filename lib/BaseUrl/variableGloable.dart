import 'package:charles_app/API/Cartmodal.dart';
import 'package:charles_app/BaseUrl/api.dart';
import 'package:charles_app/Model/CaringList/Caring.dart';
import 'package:charles_app/Model/Cleaning/cleaningList.dart';
import 'package:charles_app/Model/CompleteBookingModel.dart';
import 'package:charles_app/Model/Newbookingmodal.dart';
import 'package:charles_app/Model/OngoingBookingModel.dart';
import 'package:charles_app/View/splash.dart';
import 'package:charles_app/muben/mapaddress.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_masked_text/flutter_masked_text.dart';
import 'package:geolocator/geolocator.dart';

import 'package:image_picker/image_picker.dart';
import 'package:location/location.dart';
import 'package:progress_dialog/progress_dialog.dart';
//cleaning
var subcatCleaning=new List();
var subcatCleaningid=new List();


//new booking all global work here
List<newbooking> newbookinglist=new List();
List<OnGoingbookingModel> OnGoingbookinglist=new List();
List<CompletebookingModel> Completebookinglist=new List();



List<bool> size1 = new List();
List<double> height1 = new List();


//*****************************************

//user current lat lng
var lat;
var lng;

var currentaddress;
Position latlong;

var holdrecord=0;

// var addresses;
var newbookingAPI=baseurl+"/api/booking/";
var OngoingbookingAPI=baseurl+"/api/customer/ongoingOrders/";
var CompletebookingAPI=baseurl+"/api/customer/completedOrders/";

var seladd=new List();
var id;
var category;
var selectedIndextab = 1;
var selectedIndextabcar = 5;
//login1.
var success,user,username,
    useremail,
    userid=SplashTest.sharedPreferences.getString("userid"),
    userphone,
    usertoken ;


//caring

var homesubcarpkgid=new List();
// var fcaringlist=new List();
// var fcaringlistid=new List();
var caringlistcatid=new List();
var subcatCaring=new List();
var subcatCaringid=new List();
var categorycaring;

var pkgdata;
 final List <Tab> mytab=new List();
 var valhomecarname=new List();
var valhomecarid=new List();
var valcarlist=new List();
var valcarlistid=new List();
var valhomecarcid=new List();
var valsubpkgitemid=new List();
var pakgid,pkgname,subpkgname;
var status;
//customize
var valindex=new List();
//cardriveaway
var selectindexsave = 0;
var vl,money;

//16 feb ka updated
var selectedaddonsList = new List();
var selectedaddonsnameList = new List();
var selectedaddonspriceList = new List();
//checkout walay cartitems
List<CartModel> globalCartList= new List();
// coma seprated Addons id
String addons_id;

var selectindex;
TextEditingController address =new TextEditingController();
var preferdate;
TextEditingController note =new TextEditingController();
var prefertime ;
String selectTime;
String selectDate ;
var totime;
bool Globalind=false;
PickedFile images;
List imageslist = new List();
TextEditingController coupon =new TextEditingController();
//creditcard
var cardnumber =new MaskedTextController(mask: '0000000000000000');
var expdate =new MaskedTextController(mask: '00-00');
var cvc =new MaskedTextController(mask: '000');
var crdnum="",crdexp,crdcvc;
bool selec=false;
//List<CardDetails> card=new List();
List<CardDetails> card = CardDetails.decodeMusics(SplashTest.sharedPreferences.getString("creditcard"));
var cardindex;
//Map
LocationData cLoc;
var first,addresses;

//checkoutapi
var statusswitch=0,rectitle;

//progress dialog
ProgressDialog  pr;
String code="+92";
var Name,PhoneNumber,Email,Password;