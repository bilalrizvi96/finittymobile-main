import 'dart:math';
import 'dart:ui';

import 'package:charles_app/BaseUrl/api.dart';
import 'package:charles_app/BaseUrl/variableGloable.dart';
import 'package:charles_app/Model/CompleteBookingModel.dart';
import 'package:charles_app/Model/Newbookingmodal.dart';
import 'package:charles_app/Model/OngoingBookingModel.dart';
import 'package:charles_app/View/splash.dart';
import 'package:dio/dio.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

import 'Cartmodal.dart';

class API{


  static Future RatingAPI(var vendorid,var userid,var rating){
    success = "false";
    Dio dio = new Dio();
    String url=baseurl+'/api/vendorRating';
    FormData formData = new FormData.fromMap({

      'vendor_id': vendorid,
      'user_id': userid,
      'rating': rating,

    });
    dio.post(url, data: formData,options: Options(
      contentType: "application/json",

    ),
    ).then((response){
      Map<String, dynamic> data = response.data;
      var status = data['success'];

      if(response.statusCode == 200){
        if(status != null){
          // usertoken = data['success']['token'];
          //
          // user = data['success']['user'];
          // username = user['name'];
          // useremail = user['email'];
          // userid = user['id'].toString();
          // userphone = user['phone'];
          //
          // SplashTest.sharedPreferences.setString("usertoken", usertoken.toString());
          // SplashTest.sharedPreferences.setString("username", username.toString());
          // SplashTest.sharedPreferences.setString("useremail", useremail.toString());
          // SplashTest.sharedPreferences.setString("userid", userid.toString());
          // SplashTest.sharedPreferences.setString("userphone", userphone.toString());
          success = "true";
          print('done');
        }
        else{
          success = "error";
          print('error');
        }
      }
      else{
        success = "error";
        throw Exception('Failed to Fetch Vendors');
      }
    }).catchError(onError);

  }

  static signupAPI(var fullname,var phone,var email, var pass){
    success = "false";
    Dio dio = new Dio();
    String url=baseurl+'/api/signup';
    FormData formData = new FormData.fromMap({
      'name': fullname.toString(),
      'phone': code+phone.toString(),
      'email': email.toString(),
      'password': pass.toString(),
      'role':"user",
    });
    dio.post(url, data: formData,options: Options(
      contentType: "application/json",
    ),
    ).then((response){
      Map<String, dynamic> data = response.data;
      var status = data['success'];
      if(response.statusCode == 200){
        if(status != null){
          usertoken = data['success']['token'];
          user = data['success']['user'];
          username = user['name'];
          useremail = user['email'];
          userid = user['id'].toString();
          userphone = user['phone'];
          SplashTest.sharedPreferences.setString("usertoken", usertoken.toString());
          SplashTest.sharedPreferences.setString("username", username.toString());
          SplashTest.sharedPreferences.setString("useremail", useremail.toString());
          SplashTest.sharedPreferences.setString("userid", userid.toString());
          SplashTest.sharedPreferences.setString("userphone", userphone.toString());
          success = "true";
          print('done');
        }
        else{
          success = "error";
          print('error');
        }
      }
      else{
        success = "error";
        throw Exception('Failed to Fetch Vendors');
      }
    }).catchError(onError);

  }
 static onError(dynamic error){
    success = "error";
  }
  static CheckoutAPI(
      var firebaseid,
      var number,
      var exp_month,
      var exp_year,
      var cvc,
      var amount,
      var userId,
      var packageId,
      var service,
      var latitude,
      var longitude,
      var address,
      var note,
      var preferred_date_from,
      var preferred_date_to,
      var imageDetails,
      var subpkgnam,

      )
 async {
    success = "false";

    Dio dio = new Dio();
    String url=baseurl+'/api/checkout';
    FormData formData = new FormData.fromMap({
      'userFirebaseId':firebaseid,
      'number': number.toString(),
      'exp_month': int.parse(exp_month),
      'exp_year': exp_year.toString(),
      'cvc': int.parse(cvc.toString()),
      'amount':amount.toString(),
      'userId':userId.toString(),
      'packageId':packageId.toString(),
      'service':service.toString(),
      'latitude':latitude.toString(),
      'longitude':longitude.toString(),
      'address':address.toString(),
      'image':null,
      // "image": imageslist.length != 0
      //     ? await MultipartFile.fromFile(imageslist[0].toString(),
      //     filename: imageslist[0].toString().split('/').last)
      //     : null,
      'note':note.toString(),
      'preferred_date_from':preferred_date_from,
      'preferred_date_to':preferred_date_to,
      'recurring':statusswitch,
      'vendor_id':null,
      'repetition':statusswitch==1?rectitle:"",
      'subpkgname':subpkgnam.toString(),
      'addon_id':addons_id,
      'cartItems':CartModel.encodeMusics(globalCartList),
    });
    dio.post(url, data: formData,options: Options(
      contentType: "application/json",
    ),
    ).then((response){

      Map<String, dynamic> data = response.data;
       status = data['success'];
      if(response.statusCode == 200){
        if(status != null){
          success = "true";
          print('done');
          pr.hide();
        }
        else{
          success = "error";
          print('error');
        }
      }
      else{
        success = "error";
        throw Exception('Failed To Send Details');

      }
    }).catchError(onError);

  }
  static double distance1(double lat1, double lon1, double lat2, double lon2)
  {
    var R = 6371; // Radius of the earth in km
    var dLat = deg2rad(lat2 - lat1); // deg2rad below
    var dLon = deg2rad(lon2 - lon1);
    var a =
        sin(dLat / 2) * sin(dLat / 2) +
            cos(deg2rad(lat1)) *
                cos(deg2rad(lat2)) *
                sin(dLon / 2) *
                sin(dLon / 2);
    var c = 2 * atan2(sqrt(a), sqrt(1 - a));
    var d = R * c; // Distance in km
    d=( d * 1000);
    //d = d * 1000;

    return d;
  }
  static double deg2rad(double deg)
  {
    return deg * (pi / 180);
  }
  static  double rad2deg(double rad)
  {
    return (rad * 180) / pi;
  }

  static newbookings(var url) async{
    Dio dio = new Dio();
    try {
      await dio.get(url).then((response) {
        if(response.statusCode==200){
          newbookinglist.clear();
          var data = response.data;
          var check = data['success']['records'];

          for (Map i in check) {
            var dis= distance1(lat, lng, i['latitude'], i['longitude']);
            var durationS=dis/50.0;
              newbookinglist.add(newbooking(
                  id:i['id'],
                  address:i['address'],
                  clr:Colors.green,
                  service:i['service'],
                  preferred_date_from:i['preferred_date_from'],
                  visiblity:false,height: 88.0,
                  price: i['price'],
                  duration: durationS.toStringAsFixed(2)
              ));

          }
        }

      }).catchError((error){
        print(error);
      });
    } catch (e) {
      print(e);
    }
  }

  static OnGoingbookings(var url) async{
    Dio dio = new Dio();
    try {
      await dio.get(url).then((response) {
        if(response.statusCode==200){
          OnGoingbookinglist.clear();
          var data = response.data;
          var check = data['success']['records'];

          for (Map i in check) {
            var dis= distance1(lat, lng, i['latitude'], i['longitude']);
            var durationS=dis/50.0;
            OnGoingbookinglist.add(OnGoingbookingModel(
                id:i['id'],
                address:i['address'],
                clr:Colors.green,
                service:i['service'],
                preferred_date_from:i['preferred_date_from'],
                visiblity:false,
                height: 88.0,
                price: i['price'],
                duration: durationS.toStringAsFixed(2),
                name: i['user']['name'],
                vendor_firebase_id: i['vendor_firebase_id']
            ));

          }
        }

      }).catchError((error){
        print(error);
      });
    } catch (e) {
      print(e);
    }
  }


  static Completebookings(var url) async{
    Dio dio = new Dio();
    try {
      await dio.get(url).then((response) {
        if(response.statusCode==200){
          Completebookinglist.clear();
          var data = response.data;
          var check = data['success']['records'];

          for (Map i in check) {
            var dis= distance1(lat, lng, i['latitude'], i['longitude']);
            var durationS=dis/50.0;
            Completebookinglist.add(CompletebookingModel(
                id:i['id'],
                address:i['address'],
                clr:Colors.green,
                service:i['service'],
                preferred_date_from:i['preferred_date_from'],
                visiblity:false,
                height: 88.0,
                price: i['price'],
                duration: durationS.toStringAsFixed(2),
                name: i['user']['name'],
                vendor_id:i['vendor_id']
            ));

          }
        }

      }).catchError((error){
        print(error);
      });
    } catch (e) {
      print(e);
    }
  }



}

