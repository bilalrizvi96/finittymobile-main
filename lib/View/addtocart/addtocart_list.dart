import 'package:flutter/material.dart';

import 'addtocart.dart';
import 'addtocart_card.dart';



class CartList extends StatefulWidget {
  @override
  _CartListPageState createState() => _CartListPageState();

}
class _CartListPageState extends State<CartList> {

  List<AddtoCarts> searchResults;
  TextEditingController searchController = TextEditingController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    searchResults = addtocarts;

  }
  @override
  Widget build(BuildContext context) {
    // if(addtocarts==null)
    //   addtocarts = [];
    var size = MediaQuery.of(context).size;

    return  Scaffold(
      backgroundColor: Colors.white,
      //  appBar: AppBar(
      //    elevation: 0,
      //    title: Padding(
      //      padding: const EdgeInsets.only(left:10),
      //      child: Text("Notifications",style: TextStyle(color:Colors.black,fontSize: 17),),
      //    ),
      //    backgroundColor: Colors.white,
      // ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top:60.0,left: 35),
            child: Text("Notifications",style: TextStyle(color:Colors.black,fontSize: 22,fontWeight: FontWeight.bold),),
          ),
          Align(
            alignment: Alignment.topRight,
            child: Container(
              height: size.height / 5,
              width: size.width / 2.5,
              margin: EdgeInsets.only(top:50,),
              child: Opacity(
                opacity: 1.0,
                child: Image.asset(
                  'lib/assets/images/logo.png',
                ),
              ),
            ),
          ),

          Padding(
            padding: const EdgeInsets.only(top:70.0),
            child: Container(
              height: MediaQuery.of(context).size.height,
              width: MediaQuery.of(context).size.width,
              child:
              ListView.builder(
                  scrollDirection: Axis.vertical,
                  itemCount: addtocarts.length,
                  itemBuilder: (_, index) {
                    return Addtocart_Card(
                      addtocarts: addtocarts[index],
                    );
                  }
              ),

            ),
          ),

        ],
      ),
    );
  }
}