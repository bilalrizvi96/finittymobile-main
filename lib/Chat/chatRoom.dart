
import 'package:charles_app/BaseUrl/variableGloable.dart';
import 'package:charles_app/muben/RoomChat.dart';
import 'package:charles_app/muben/messeges.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';
import 'Constants.dart';
import 'chats.dart';
import 'databse.dart';
import 'helperFunctions.dart';

class ChatRoom extends StatefulWidget {
  @override
  _ChatRoomState createState() => _ChatRoomState();
}

class _ChatRoomState extends State<ChatRoom> {
  Stream chatRooms;

  ProgressDialog pr;
  Widget chatRoomsList() {
    return StreamBuilder(
      stream: chatRooms,
      builder: (context, snapshot) {
        return snapshot.hasData
            ? ListView.builder(
            itemCount: snapshot.data.documents.length,
            shrinkWrap: true,
            itemBuilder: (context, index) {
              String a = snapshot.data.documents[index].data['reciever'];
            //  Constants.reciuid = snapshot.data.documents[index].data['sender'];
              if(a == Constants.uid)
                {
                  String userName = snapshot.data.documents[index].data['name'];
                  String chatRoomId= snapshot.data.documents[index].data["reciever"];
                  String reciuid = snapshot.data.documents[index].data["sender"];
                  String status = snapshot.data.documents[index].data["driverstatus"];
                  String image = snapshot.data.documents[index].data["customerpic"];
                  return ChatRoomsTile(userName,chatRoomId,reciuid,status,image);
                }
              else {
                return Container();
              }
            })
            : Center(
          child: Container(
            child: Text( "No Chats",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold,color: Colors.white),),
          ),
        );
      },
    );
  }

  @override
  void initState() {
    getUserInfogetChats();
    super.initState();
  }

  getUserInfogetChats() async {
    Constants.myName = await HelperFunctions.getUserNameSharedPreference();
    var snapshot = DatabaseMethods().getUserChats(null);
    setState(() {
      if(snapshot != null ){
        chatRooms = snapshot;
        print(
            "we got the data + ${chatRooms.toString()} this is name  ${Constants.myName}");
      }

    });

  }

  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return  SafeArea(
      child: Scaffold(
        floatingActionButton: new FloatingActionButton(
          child: const Icon(Icons.add),
          backgroundColor: Color(0xff5E605F),
        ),
        backgroundColor: Color(0xffFFFFFF),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(
            children: [
              Positioned(
                  right: 22.0,
                  top: 46.0,
                  child: Container(
                      width: 111.42,
                      height: 135,
                      child: Image.asset("lib/assets/Group 9637.png"))),
              Container(
                margin: EdgeInsets.only(left: 30.5, right: 30.5),
                child: Column(
                  children: [
                    Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(top: 38.0, bottom: 22.0),
                      child: Text(
                        "Messages",
                        style: TextStyle(
                            color: Color(0xff454545),
                            fontFamily: "Open Sans Bold",
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold
                        ),
                      ),
                    ),
                    SizedBox(
                      height: h * 0.010,
                    ),
                    Container(
                      margin: EdgeInsets.only(left: 3.0, right: 3.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            width: w * 0.4,
                            height: 36.0,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5.0),
                                border: Border.all(
                                    color: Colors.black, width: 1.0)),
                            child: RaisedButton(
                              color: Colors.white,
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (_) =>Messeges(),
                                    ));
                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Text(
                                "SUPPORT",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontFamily: "Open Sans Bold",
                                    fontSize: 10.0),
                              ),
                            ),
                          ),
                          Container(
                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),color:Color(0xFFFF0000),),
                            width: w * 0.4,
                            height: 36.0,
                            child: RaisedButton(
                              color: Color(0xFFFF0000),
                              onPressed: () {

                              },
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Text(
                                "PROVIDER",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: "Open Sans Bold",
                                    fontSize: 10.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: h * 0.037,
                    ),
                    chatRoomsList(),
                  ],
                ),
              ),
            ],
          ),

        ),
        // body: Container(
        //   child: chatRoomsList(),
        // ),
      ),
    );
  }
}

class ChatRoomsTile extends StatefulWidget {
  final String userName;
  final String chatRoomId;
  String reciuid;
  String status;
  var image;
  var iconcolor;

  ChatRoomsTile(this.userName, this.chatRoomId, this.reciuid, this.status,this.image);


  @override
  _ChatRoomTileState createState() => _ChatRoomTileState();
}

class _ChatRoomTileState extends State<ChatRoomsTile> {

  FirebaseAuth _auth = FirebaseAuth.instance;
  DatabaseMethods databaseMethods=new DatabaseMethods();
  var iconcolor;
  //=Colors.red;

  @override
  void initState() {
    chat();
    // TODO: implement initState
    if(widget.status=="seen"){
      setState(() {
        iconcolor=Colors.white;
      });
    }
    else if(widget.status=="unseen"){
      setState(() {
        iconcolor=Colors.red;
      });
    }
    super.initState();
  }
  chat()async{
    final FirebaseUser user = await _auth.currentUser();
    Constants.myName = user.uid;
    Constants.uid =  user.uid;
    Constants.name = username;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () async {
        final FirebaseUser user = await _auth.currentUser();
        final uid = user.uid;
         databaseMethods.updatedrivermsgstatus(uid,widget.reciuid);
        Constants.uid = uid;
        Constants.reciuid =widget.reciuid;
        //  databaseMethods.addChatRoom(uid+Constants.reciuid);
        Navigator.push(context, MaterialPageRoute(builder: (context) =>
            Chat(chatRoomId: uid,reciuid:widget.reciuid, image: widget.image,name: widget.userName,//meri uid
            )));

      },
      child: Container(
        height: 75.5,
        width: 500,
        child: Row(
          children: [
            Container(
              width: 50,
              height: 50,
              child: CircleAvatar(
                radius: 30,
                backgroundImage: NetworkImage(widget.image==null?'https://image.shutterstock.com/image-vector/ui-image-placeholder-wireframes-apps-260nw-1037719204.jpg':widget.image),
                backgroundColor: Colors.transparent,),
            ),
            Flexible(
              child: ListTile(
                title: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      widget.userName == null ? "null": widget.userName,
                      style: TextStyle(
                        color: Color(0xff161F39),
                        fontSize: 16.0,
                      ),
                    ),
                    Text(
                      "12:00",
                      style: TextStyle(fontSize: 12.0, color: Color(0xffBCC5D3)),
                    ),
                  ],
                ),
                subtitle: Text(widget.userName == null ? "null": widget.userName,
                    style: TextStyle(fontSize: 13.0, color: Color(0xffBCC5D3))),
              ),
            ),
          ],
        ),
      ),
      // child: Column(
      //   children: <Widget>[
      //     Padding(
      //       padding: const EdgeInsets.all(8.0),
      //       child: Card(
      //         elevation: 5,
      //         child: Container(
      //           decoration: BoxDecoration( color: Colors.grey[100],borderRadius: BorderRadius.circular(10)),
      //
      //           padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
      //           child: Row(
      //             children: [
      //               CircleAvatar(backgroundImage: NetworkImage(widget.image==null?'https://image.shutterstock.com/image-vector/ui-image-placeholder-wireframes-apps-260nw-1037719204.jpg':widget.image), radius: 25,),
      //               SizedBox(
      //                 width: 12,
      //               ),
      //               Text(widget.userName == null ? "null": widget.userName,
      //                   textAlign: TextAlign.start,
      //                   style: TextStyle(
      //                       color: Colors.black,
      //                       fontSize: 20,
      //                       fontFamily: 'OverpassRegular',
      //                       fontWeight: FontWeight.w500)),
      //               Spacer(),
      //               Icon(
      //                 Icons.add_comment,
      //                 color: iconcolor,
      //               )
      //             ],
      //
      //           ),
      //
      //         ),
      //       ),
      //     ),
      //   ],
      // ),

    );
  }

}



//class ChatRoomsTile extends StatelessWidget {
//  final String userName;
//  final String chatRoomId;
//  String reciuid;
//  String status;
//  var iconcolor=Colors.red;
//
//  FirebaseAuth _auth = FirebaseAuth.instance;
//  DatabaseMethods databaseMethods=new DatabaseMethods();
//  ChatRoomsTile({this.userName,@required this.chatRoomId,this.reciuid,this.status});
//
//
//
//
//
//  @override
//  Widget build(BuildContext context) {
//    return GestureDetector(
//      onTap: () async {
//       // databaseMethods.updateseenstatus();
//        final FirebaseUser user = await _auth.currentUser();
//         final uid = user.uid;
//         Constants.uid = uid;
//         Constants.reciuid = reciuid;
//      //  databaseMethods.addChatRoom(uid+Constants.reciuid);
//        Navigator.push(context, MaterialPageRoute(
//            builder: (context) => Chat(
//              chatRoomId: uid,reciuid:reciuid//meri uid
//            )
//        ));
//      },
//      child: Column(
//        children: <Widget>[
//          Container(
//            color: Colors.grey[200],
//            padding: EdgeInsets.symmetric(horizontal: 24, vertical: 24),
//            child: Row(
//              children: [
//                Container(
//                  height: 30,
//                  width: 30,
//                  decoration: BoxDecoration(
//                      color: Color.fromRGBO(119, 0, 0, 1),
//                      borderRadius: BorderRadius.circular(18)),
//                  child: Padding(
//                    padding: const EdgeInsets.only(top:4.0),
//                    child: Text(userName.substring(0, 1),
//                        textAlign: TextAlign.center,
//                        style: TextStyle(
//                            color: Colors.black,
//                            fontSize: 18,
//                            fontFamily: 'OverpassRegular',
//                            fontWeight: FontWeight.w300)),
//                  ),
//                ),
//                SizedBox(
//                  width: 12,
//                ),
//                Text(userName,
//                    textAlign: TextAlign.start,
//                    style: TextStyle(
//                        color: Colors.black,
//                        fontSize: 16,
//                        fontFamily: 'OverpassRegular',
//                        fontWeight: FontWeight.w300)),
//
//                SizedBox(
//                  width: 146,
//                ),
//                Icon(
//                  Icons.add_comment,
//                  color: iconcolor,
//                )
//
//
//              ],
//
//            ),
//
//          ),
//          SizedBox(
//            height: 5,
//          ),
//
//        ],
//      ),
//
//    );
//  }
//}
