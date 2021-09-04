import 'package:flutter/material.dart';

class Payments extends StatelessWidget {

  List<Widget> containers = [
    Container(
      child: ShowAll(),
    ),
    Container(child: InProgress()),
  ];

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return MaterialApp(
        home: DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.grey[100],
              title: Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: Row(
                  children: [
                    Text(
                      'Payments', style: TextStyle(
                        color: Colors.black, fontSize: 20, fontWeight: FontWeight.bold
                    ),),
                    Spacer(),
                    Container(
                      width: size.width/2.8,height: 30,
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(15)),
                      child: TextFormField(
                        cursorColor: Colors.grey,
                        style: TextStyle(color: Colors.grey, fontSize: 12),
                        decoration: new InputDecoration(
                            border: InputBorder.none,
                            focusedBorder: InputBorder.none,
                            enabledBorder: InputBorder.none,
                            errorBorder: InputBorder.none,
                            disabledBorder: InputBorder.none,
                            contentPadding: EdgeInsets.only(bottom: 16,left: 5),
                            hintText: "Search Service",
                            hintStyle: TextStyle(color: Colors.grey, fontSize: 12)),
                      )
                      ,),
                    SizedBox(width: 10),CircleAvatar(radius: 20,backgroundImage: NetworkImage("https://images.pexels.com/photos/220453/pexels-photo-220453.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500"),)
                  ],
                ),
              ),


              bottom: TabBar(
                indicatorPadding: EdgeInsets.symmetric(horizontal: 30),
                indicatorColor:Color(0xFFFF0000),
                labelPadding: EdgeInsets.symmetric(horizontal: 50.0),
                labelColor: Color(0xFFFF0000),
                unselectedLabelColor: Colors.grey[400],
                isScrollable: true,
                tabs: <Widget>[
                  Tab(
                    child: Text(
                        "Show All"
                    ),
                  ),
                  Tab(
                    child: Text(
                        "In Progress"
                    ),
                  ),

                ],
              ),
            ),
            body: TabBarView(children: containers),
          ),
        )
    );

  }
}


class ShowAll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Container(
      color: Colors.grey[100],
      child:  ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal:  5),
          // scrollDirection: Axis.va,
          itemCount: 5,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(5.0),
              child: Container(

                decoration: BoxDecoration( color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                ),
                height: MediaQuery.of(context).size.height / 7.6,
                width: MediaQuery.of(context).size.width/2.4,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Cleaning', style: TextStyle(
                          color: Colors.grey[800], fontSize: 18, fontWeight: FontWeight.bold
                      ),),
                      Text('2 Bags', style: TextStyle(fontSize: 16
                      ),),
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            Icon(Icons.date_range, size: 15,color: Colors.grey[500],) , SizedBox(width: 5,),Text(' 20,April,2021',style: TextStyle(fontSize: 10 , color: Colors.grey[500],)),
                            VerticalDivider(thickness: 1,color: Colors.grey,),

                            Icon(Icons.date_range, size: 15,color: Colors.grey[500],), SizedBox(width: 5,),  Text(' 20,April,2021',style: TextStyle(fontSize: 10 , color: Colors.grey[500])),
                            Spacer(),
                            Text('\$50.00', style: TextStyle(color: Color(0xFFFF0000),),),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          }),

    );
  }
}
class InProgress extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: Text(
            'No record'
        ),
      ),
    );
  }
}