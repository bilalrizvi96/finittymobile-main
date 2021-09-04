
import 'package:charles_app/NotificationClasses/postRequest.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:progress_dialog/progress_dialog.dart';


import 'Constants.dart';
import 'databse.dart';

class Chat extends StatefulWidget {
  final String chatRoomId,name;
  final String reciuid;
  var image;
  Chat({this.chatRoomId,this.reciuid,this.image,this.name});

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  ProgressDialog pr;
  Stream<QuerySnapshot> chats;
  TextEditingController messageEditingController = new TextEditingController();
  DatabaseMethods databaseMethods = new DatabaseMethods();


  @override
  Widget chatMessages(){
    return StreamBuilder(
      stream: chats,
      builder: (context, snapshot){
        return snapshot.hasData ?  Container(
          height: MediaQuery.of(context).size.height/1.25,
          child: ListView.builder(
              itemCount: snapshot.data.documents.length,
              itemBuilder: (context, index){
                return MessageTile(
                  message: snapshot.data.documents[index].data["message"],
                  sendByMe: Constants.uid == snapshot.data.documents[index].data["sendBy"],
                );
              }),
        ) : Container();
      },
    );
  }

  addMessage() async{
    FirebaseUser user = await FirebaseAuth.instance.currentUser();
    String uid = user.uid;
    if (messageEditingController.text.isNotEmpty) {
      Map<String, dynamic> chatMessageMap = {
        //"sendBy": Constants.uid,
        "sendBy": uid,
        "message": messageEditingController.text,
        'time': DateTime.now().millisecondsSinceEpoch,
      };

      DatabaseMethods().addMessage(widget.chatRoomId, chatMessageMap);//chatroomid/myuid
    //  DatabaseMethods().addChatRoom(widget.chatRoomId+uid);

      setState(() {
        messageEditingController.text = "";
      });
    }
  }

  @override
  void initState() {
    DatabaseMethods().getChats(widget.chatRoomId,widget.reciuid).then((val) {
      setState(() {
        chats = val;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor:Color(0xFFFF0000),
        leading:  InkWell(
            onTap: (){
              Navigator.of(context).pop();
            },
            child: Icon(Icons.keyboard_backspace_outlined)),
        title:CircleAvatar(backgroundImage: NetworkImage(widget.image==null?'https://image.shutterstock.com/image-vector/ui-image-placeholder-wireframes-apps-260nw-1037719204.jpg':widget.image) ,),

        actions: [
          Padding(
            padding: const EdgeInsets.only(right:150, top: 15.0),
            child: Text(widget.name==null?"NULL": widget.name, style: TextStyle(fontSize: 18),),
          ),

        ],
      ),
//        appBar: AppBar(
//          backgroundColor: Color.fromRGBO(119, 0, 0, 1),
//          title: Image.asset(
//            "assets/logo.png",
//            height: 40,
//          ),    elevation: 0.0,
//      centerTitle: false,
//      ),
      body: Container(
        child: Stack(
          children: [
            chatMessages(),
            Container(
              alignment: Alignment.bottomCenter,
              margin: EdgeInsets.symmetric(horizontal: 8,vertical: 5),
              width: double.infinity,
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 5),
                decoration: BoxDecoration(
                  color: Color(0xFFFF0000),
                  borderRadius: BorderRadius.circular(30.0),
                  border: Border.all(color: Colors.white),
                ),
                //  color: Color(0xFF000000),
                child: Row(
                  children: [
                    Expanded(
                        child: TextField(
                          controller: messageEditingController,
                          decoration: InputDecoration(
                            hintText: "Type a message ..",
                            hintStyle: TextStyle(
                              color: Colors.white,
                              fontSize: 16,
                            ),

                            border: InputBorder.none,
                          ),
                        )),
                    SizedBox(width: 8,),
                    //VerticalDivider(color: Colors.white,endIndent: 1,indent: 1,width: 10,),
                    SizedBox(width: 8,),
                    GestureDetector(
                      onTap: () async {
                        FirebaseUser user = await FirebaseAuth.instance.currentUser();
                        String uid = user.uid;
                        databaseMethods.updatecustomermsgstatus(uid,widget.reciuid);
                        databaseMethods.addcustomerchatstatus();
                        addMessage();
                        postRequest().sendnotification("Chat Message",widget.reciuid, "Send you message");                      },
                      child:  Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                                colors: [
                                  const Color(0xFFFFFFFF),
                                  const Color(0xFFFFFFFF)
                                ],
                                begin: FractionalOffset.topLeft,
                                end: FractionalOffset.bottomRight
                            ),
                            borderRadius: BorderRadius.circular(40)
                        ),
                        padding: EdgeInsets.all(10),
                        child:Center(
                          child: Icon(
                            Icons.send,
                            color: Color(0xFFFF0000),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}

class MessageTile extends StatelessWidget {
  final String message;
  final bool sendByMe;

  MessageTile({@required this.message, @required this.sendByMe});


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
          top: 8,
          bottom: 8,
          left: sendByMe ? 0 : 24,
          right: sendByMe ? 24 : 0),
      alignment: sendByMe ? Alignment.centerRight : Alignment.centerLeft,
      child: Container(
        margin: sendByMe
            ? EdgeInsets.only(left: 30)
            : EdgeInsets.only(right: 30),
        padding: EdgeInsets.only(
            top: 17, bottom: 17, left: 20, right: 20),
        decoration: BoxDecoration(
            borderRadius: sendByMe ? BorderRadius.only(
                topLeft: Radius.circular(23),
                topRight: Radius.circular(23),
                bottomLeft: Radius.circular(23)
            ) :
            BorderRadius.only(
                topLeft: Radius.circular(23),
                topRight: Radius.circular(23),
                bottomRight: Radius.circular(23)),
//            gradient: LinearGradient(
//              colors: sendByMe ? [
//                const Color(0xff007EF4),
//                const Color(0xff2A75BC)
//              ]
//                  : [
//                const Color(0xFFFFFFFF),
//                const Color(0xFFFFFFFF)
//              ],
//            )
            color: sendByMe ? Colors.grey[500] :  Color(0xFFFF0000)
        ),
        child: Text(message,
            textAlign: TextAlign.start,
            style: TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontFamily: 'OverpassRegular',
                )),
      ),
    );
  }
}

