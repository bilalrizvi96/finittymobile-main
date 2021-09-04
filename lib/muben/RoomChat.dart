import 'package:charles_app/muben/message_main.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RoomCleaning extends StatefulWidget {
  @override
  _RoomCleaningState createState() => _RoomCleaningState();
}

class _RoomCleaningState extends State<RoomCleaning> {
  @override
  Widget build(BuildContext context) {
    double h = MediaQuery.of(context).size.height;
    double w = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFFFFFFFF),
        body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Stack(
            children: [
              Positioned(
                  right: 22.0,
                  top: h*0.03,
                  child: Container(
                      width: 111.42,
                      height: 135,
                      child: Image.asset("lib/assets/Group 9637.png"))),
              Container(
                margin: EdgeInsets.only(left: 30.5, right: 30.5,top:h*0.025),
                child: Column(
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: w * 0.01,
                        ),
                        InkWell(
                            onTap: () => {Navigator.pop(context)},
                            child: Icon(
                              Icons.arrow_back_ios,
                            )
                        ),
                        SizedBox(
                          width: w*0.01,
                        ),
                        Text(
                          "Room - Cleaning",
                          style: TextStyle(
                              color: Color(0xff454545),
                              fontFamily: "Open Sans Bold",
                              fontSize: 24.0,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Spacer(),
                        myPopMenu(h,w),
                        SizedBox(
                          width: w * 0.03,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: h * 0.14,
                    ),
                    SingleChildScrollView(scrollDirection: Axis.vertical,
                      child: Column(
                        children: [
                          Column(crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                width: w*0.85,
                                // color: Color(0xffE1E1E1),
                                decoration: BoxDecoration(
                                    color: Color(0xffE1E1E1),
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0),topRight: Radius.circular(15.0),bottomRight: Radius.circular(15.0)),
                                    border: Border.all(color: Color(0xffE1E1E1))),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 13.0),
                                child: Text(
                                    """Hey Fly 9! \nI was tossing and turning all night! I haven’t \nslept a wink in 3 days! What’s keeping you \nup? Nothing, really."""),
                              ),
                              Text("Nov 4, 18:03",style:TextStyle(fontSize: 12,color:Color(0xFFBCC5D3)),),
                            ],
                          ),
                          SizedBox(
                            height: h*0.04,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Container(
                                width: w*0.85,
                                decoration: BoxDecoration(
                                    color: Color(0xFF5E605F),
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0),topRight: Radius.circular(15.0),bottomLeft: Radius.circular(15.0)),
                                    border: Border.all(color: Color(0xffE1E1E1))),
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15.0, vertical: 13.0),
                                child: Text(
                                  """Where are you going?I am going to the \nsalon for my haircut. What hairstyle would \nyou like?""",
                                  style: TextStyle(color: Color(0xffBCC5D3),fontSize: 14),
                                ),
                              ),
                              Text("Nov 4, 18:03",style:TextStyle(fontSize: 12,color:Color(0xFFBCC5D3)),),
                            ],
                          ),
                          SizedBox(
                            height: h*0.04,
                          ),
                          Row(mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Container(
                                    width: w*0.3,
                                    height: h*0.15,
                                    child:ClipRRect(
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0),topRight: Radius.circular(15.0),bottomRight: Radius.circular(15.0)),
                                        child: Image.asset("lib/assets/images/promotionimage2.jpg",fit: BoxFit.fill,)
                                    ),
                                  ),
                                  Container(
                                    width: w*0.3,
                                    child: Text(
                                      "Nov 4, 18:03",
                                      textAlign: TextAlign.end,
                                      style:TextStyle(fontSize: 12,color:Color(0xFFBCC5D3)),
                                    ),
                                  )
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                            height: h*0.04,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Column(crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    alignment: Alignment.centerLeft,
                                    height: h * 0.07,
                                    width: w * 0.22,
                                    // color: Color(0xffE1E1E1),
                                    decoration: BoxDecoration(
                                        color: Color(0xff5E605F),
                                        borderRadius: BorderRadius.only(topLeft: Radius.circular(15.0),topRight: Radius.circular(15.0),bottomLeft: Radius.circular(15.0)),
                                        border: Border.all(color: Color(0xff5E605F))),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 15.0, vertical: 13.0),
                                    child: Text(
                                      "Thanks.",
                                      style: TextStyle(color: Color(0xffBCC5D3)),
                                    ),
                                  ),
                                  Text("Nov 4, 18:03",style:TextStyle(fontSize: 12,color:Color(0xFFBCC5D3)),),
                                ],
                              ),
                            ],
                          ),

                        ],),
                    ),
                    SizedBox(height: h*0.035,),
                    Container(
                      height: h*0.068,
                      child: TextField(
                        decoration: InputDecoration(
                            enabledBorder: InputBorder.none,
                            fillColor: Color(0xffF8F9FA),
                            filled: true,
                            border: new OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffEEEEEE)),
                              borderRadius: const BorderRadius.all(
                                const Radius.circular(6.0),
                              ),
                            ),
                            hintText: "Type your message...",
                            hintStyle: TextStyle(
                                fontStyle: FontStyle.italic,
                                fontFamily: "Open Sans",
                                fontSize: 14.0,
                                color: Color(0xff737680)),
                            suffixIcon: RaisedButton(color:Color(0xFFFF0000),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(6.0),
                                ),
                                child: Container(
                                  color: Color(0xFFFF0000),
                                  width: w * 0.068,
                                  //margin: ,
                                  child: Icon(
                                    Icons.send,
                                    color: Colors.white,
                                  ),
                                ),
                                onPressed: () {})),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
  Widget myPopMenu(double h,double w) {
    return PopupMenuButton(
        child: Container(
          margin: EdgeInsets.only(top: h*0.0007),
          child: Card(
            elevation: 1,
            child: Icon(Icons.more_vert),
          ),
        ),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        offset: Offset(0, 50),
        itemBuilder: (context) => [
          PopupMenuItem(
              value: 1,
              child: Row(
                children: <Widget>[
                  Container(
                    child: Icon(Icons.person_outline,color: Colors.white,size: 20,),

                    decoration: BoxDecoration(
                        color: Color(0xFFF34C43),
                        borderRadius: BorderRadius.circular(15.0)
                    ),
                  ),
                  SizedBox(width: 8,),
                  Text('Block User',style: TextStyle(fontSize: 15,color: Color(0xFF858585)))
                ],
              )),
          PopupMenuItem(
              value: 2,
              child: Row(
                children: <Widget>[
                  Container(
                    child: Icon(Icons.delete_outline,color: Colors.white,size: 20,),
                    decoration: BoxDecoration(
                        color: Color(0xFFF34C43),
                        borderRadius: BorderRadius.circular(15.0)
                    ),
                  ),
                  SizedBox(width: 8,),
                  Text('Clear Chat',style: TextStyle(fontSize: 15,color: Color(0xFF858585)))
                ],
              )),
        ]);
  }
}