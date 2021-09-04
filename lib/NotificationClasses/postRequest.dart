import 'dart:convert';


import 'package:charles_app/BaseUrl/variableGloable.dart';
import 'package:charles_app/View/splash.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:http/http.dart';


class postRequest{

  var list = SplashTest.toke;
  var length = SplashTest.toke.length;
  var i = 0;


  //static String bodyt = "dfg";
  //postRequest();

  makePostRequest(String tit , String body , String to)  async{
    // set up POST request arguments
    i++;
    String url = 'https://fcm.googleapis.com/fcm/send';
    Map<String, String> headers = {"Content-type": "application/json" , "Authorization": "key=AAAAvgpg48g:APA91bHOLh2Uz0H89Tzfccn0pjsb0TjW_f1ctlwn3uY54FyOI_PsRAWAa-_H6ryyzrJdgcC8zLYu_JXGWIxnuHbd4jxhokfUynqY1JTujV7T_wxhmEFw2kSBiALweiNHKW6jr-YTOE7E"};
    var json = jsonEncode({
      "notification": {"body": body , "title": tit ,  "sound": "default", "color": "#990000",},
      "priority": "high",
      "data": {"clickaction": "FLUTTERNOTIFICATIONCLICK", "id": "1", "status": "done"},
      "to": to,
    });
    //bodyt = "";
    //make POST request

    Response response = await post(url, headers: headers, body: json).whenComplete((){

      if(i<SplashTest.toke.length){
        makePostRequest("post" , "Someone Posted a job" , SplashTest.toke[i]);
      }

    });
    int statusCode = response.statusCode;
    // this API passes back the id of the new item added to the body
    var bodyt = response.body;
    print(bodyt.toString());
    //setState(() => _message = body);
    // {
    //   "title": "Hello",
    //   "body": "body text",
    //   "userId": 1,
    //   "id": 101
    // }
  }

  sendnotification(String a,String id,String b){
    SplashTest.toke.clear();
    final FirebaseDatabase database1 = FirebaseDatabase.instance;
    DatabaseReference ref2 = database1.reference().child('Tokens').child(id);
    ref2.once().then((DataSnapshot snapshot){
      Map<String, dynamic> mapOfMapss = Map.from( snapshot.value );
      mapOfMapss.values.forEach( (value2) {
        SplashTest.toke.add(value2);
        if(SplashTest.toke.length == 1) {
          makePostRequest(
              a, ""+username+" "+b, SplashTest.toke[0].toString());
          //  "Post", ""+Constants.username+" Posted a job",
        }
      });
    });
  }



}