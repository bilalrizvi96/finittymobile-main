import 'package:charles_app/Chat/Constants.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  String name;
  Future<void> addUserInfo(userData) async {
    Firestore.instance.collection("users").add(userData).catchError((e) {
      print(e.toString());
    });
  }

  getChats(String chatRoomId,String reciuid) async{
//    FirebaseUser user = await FirebaseAuth.instance.currentUser();
//    String uid = user.uid;
    return Firestore.instance
        .collection("chatRoom")
        .document(chatRoomId+reciuid)//meri + uskiid
        .collection("chats")
        .orderBy('time')
        .snapshots();
  }

  getmychatstatus(){
    return Firestore.instance
        .collection("chatRoom")
        .document("DriverChatStatus")//meri + uskiid
        .get();
  }

//  Future<bool> addcustomerchatstatus() async{
//    Map<String, Object> chatRoom = {
//      "customerchatstatus":"unseen",
//    };
//    Firestore.instance
//        .collection("chatRoom")
//        .document("CustomerChatStatus")
//        .setData (chatRoom)
//        .catchError((e) {
//      print(e);
//    });
//  }

  Future<bool> addcustomerchatstatus(){
//    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    Map<String, Object> chatRoom = {
      "customerstatus":"seen",
      "customerpic":"null",
      "driverName":"null",
      "driverstatus":"null",
      "name":"null",
      "pic":"null",
      "reciever":"1iDkt5LapEZGmSMIRTx63WIlYzI2",
      "sender":"1iDkt5LapEZGmSMIRTx63WIlYzI2",
    };
    Map<String, Object> chatRooms = {
      "time":15511,
      "message":"yes",
      "sendBy":'1iDkt5LapEZGmSMIRTx63WIlYzI2'
    };
    Firestore.instance
        .collection("chatRoom")
        .document("CustomerChatStatus")
        .setData (chatRoom)
        .catchError((e) {
      print(e);
    });


  }


  updatedrivermychatstatus(){
    Map<String, Object> chatRoom = {
      "customerstatus":"seen",
      "customerpic":"null",
      "driverName":"null",
      "driverstatus":"null",
      "name":"null",
      "pic":"null",
      "reciever":"1iDkt5LapEZGmSMIRTx63WIlYz",
      "sender":"1iDkt5LapEZGmSMIRTx63WIlYz",

    };
    Map<String, Object> chatRooms = {
      "time":15511,
      "message":"yes",
      "sendBy":'1iDkt5LapEZGmSMIRTx63WIlYzI2'
    };
    Firestore.instance
        .collection("chatRoom")
        .document("DriverChatStatus")
        .setData(chatRoom)
        .catchError((e) {
      print(e);
    });

  }


  updatedrivermsgstatus(String chatRoomId,String reciuid){
    Map<String, Object> chatRoom = {
      "driverstatus":"seen",
    };
    Firestore.instance
        .collection("chatRoom")
        .document(chatRoomId+reciuid)
        .updateData(chatRoom)
        .catchError((e) {
      print(e);
    });
  }

  updatecustomermsgstatus(String chatRoomId,String reciuid){
    Map<String, Object> chatRoom = {
      "customerstatus":"unseen",
    };
    Firestore.instance
        .collection("chatRoom")
        .document(chatRoomId+reciuid)
        .updateData(chatRoom)
        .catchError((e) {
      print(e);
    });
  }

  Future<void> addMessage(String chatRoomId, chatMessageData) async{
//    FirebaseUser user = await FirebaseAuth.instance.currentUser();
//    String uid = user.uid;

    Firestore.instance.collection("chatRoom")
        .document(chatRoomId+Constants.reciuid)//meri + uskiid
        .collection("chats")
        .add(chatMessageData).catchError((e){
      print(e.toString());
    });
  }

  getUserChats(String itIsMyName) {
    return Firestore.instance
        .collection("chatRoom")
        .where('users', arrayContains: itIsMyName)
        .snapshots();
  }

}