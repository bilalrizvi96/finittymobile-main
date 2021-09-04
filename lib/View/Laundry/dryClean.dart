import 'package:charles_app/Component/alert/alertDialog.dart';
import 'package:charles_app/Model/CaringList/Caring.dart';

import 'package:charles_app/Model/Cleaning/cleaningCard.dart';
import 'package:charles_app/Model/Cleaning/cleaningList.dart';
import 'package:charles_app/View/Cleaning/cleaningLanding.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

import '../../widgets/widgets.dart';
import 'Laundryclass.dart';



class DryClean extends StatefulWidget {
  @override
  _homeViewState createState() => _homeViewState();
}

class _homeViewState extends State<DryClean>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {


    TabController controller;

    @override
    void initState(){
      super.initState();
      controller=new TabController(length: 2, vsync: this);
    }

    return SafeArea(
      child: SingleChildScrollView(
        child: Container(
          color:Colors.white,
          child: Stack(
            children:[
              Padding(
                padding: const EdgeInsets.only(left:0,),
                child: Column(
                  // mainAxisAlignment: MainAxisAlignment.start,
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    DefaultTabController(
                      length: 4,
                      initialIndex: 0,
                      child : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:30,),
                            child: TabBar(

                              isScrollable: true,
                              controller: controller,
                              unselectedLabelColor: Colors.grey,
                              labelColor: Colors.black,
                              //labelPadding: EdgeInsets.only(right: 20),
                              labelPadding:EdgeInsets.only(right: 20),

                              indicatorColor: Colors.transparent,
                              tabs:

                              [
                                Text(
                                    "Men", style: Styles().openBold(size: 24.0)),
                                Padding(
                                  padding: const EdgeInsets.only(left:60.0),
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                        "Women", style: Styles().openBold(size: 24.0)
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left:60.0),
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                        "Kids", style: Styles().openBold(size: 24.0)
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left:60.0),
                                  child: Container(
                                    alignment: Alignment.center,
                                    child: Text(
                                        "Other", style: Styles().openBold(size: 24.0)
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),

                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 1,),


                              Padding(
                                padding: const EdgeInsets.only(left:30,right:30.0,top: 0),
                                child: Text('Slide to change',style:  Styles().openRegular(size: 9.0),),
                              ),
                              SizedBox(height: 10,),
                              Container(
                                height: MediaQuery.of(context).size.height/2.1,
                                child:
                                TabBarView(
                                  controller: controller,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.only(left:30,right:30.0,top: 0),
                                      child: StaggeredGridView.countBuilder(
                                        physics: AlwaysScrollableScrollPhysics(),
                                        controller: new ScrollController(keepScrollOffset: false),
                                        scrollDirection: Axis.vertical,
                                        crossAxisCount: 4,
                                        // addAutomaticKeepAlives: true,
                                        itemCount: LaundryTab.laundryTabbList.length,

                                        itemBuilder: (_, index) {
                                          return InkWell(
                                            onTap: (){
                                              setState(() {
                                                for(int i =0; i< LaundryTab.laundryTabbList.length; i++){
                                                  if(i == index)
                                                  {
                                                    if(LaundryTab.laundryTabbList[i].selected == true){
                                                      LaundryTab.laundryTabbList[i].selected = false;
                                                    }else{
                                                      LaundryTab.laundryTabbList[i].selected = true;}
                                                  }
                                                  else{
                                                    LaundryTab.laundryTabbList[i].selected = false;


                                                  }
                                                }
                                              });
                                            },
                                            child: SingleChildScrollView(
                                              child: AnimatedContainer(
                                                duration: Duration(milliseconds: 300),
                                                decoration: BoxDecoration(
                                                    border: Border.all(color: LaundryTab.laundryTabbList[index].selected==true?Color(0xFFff0000):Color(0xFFEFEFEF) ),
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: Colors.white

                                                ),
                                                height:
                                                LaundryTab.laundryTabbList[index].selected ==false ? 110:140,
                                                width: 160,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                          color: LaundryTab.laundryTabbList[index].selected==true?Color(0xFFff0000):Color(0xFFEFEFEF),
                                                          borderRadius: BorderRadius.only(
                                                            topRight: Radius.circular(5),
                                                            topLeft: Radius.circular(5),
                                                          )
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left:8.0,right: 8),
                                                        child: Center(
                                                          child: Row(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Text(LaundryTab.laundryTabbList[index].time,style: Styles().openBold(size: 14.0,color: LaundryTab.laundryTabbList[index].selected==true?Colors.white:Colors.black),),
                                                              Text(LaundryTab.laundryTabbList[index].money,style: Styles().openBold(size: 14.0,color: LaundryTab.laundryTabbList[index].selected==true?Colors.white:Colors.black),),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left:10.0, right: 10,top:10),
                                                      child: Container(
                                                        height: 60,
                                                        child: Row(
                                                          children: [
                                                            Text(LaundryTab.laundryTabbList[index].text, style: Styles().openRegular(size: 10.0)),
                                                            Spacer(),
                                                            Text(LaundryTab.laundryTabbList[index].text2, style: Styles().openRegular(size: 10.0)),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    //Spacer(),
                                                    Expanded(child: Padding(
                                                      padding: const EdgeInsets.only(left:10.0),
                                                      child: SingleChildScrollView(
                                                        child: Column(
                                                          children: [
                                                            SizedBox(height: 20,),
                                                            alertD(),
                                                            SizedBox(height: 10,),

                                                          ],
                                                        ),
                                                      ),
                                                    ))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );

                                        },

                                        staggeredTileBuilder: (int index) =>
                                        //new StaggeredTile.fit(4),
                                        new StaggeredTile.count(2, LaundryTab.laundryTabbList[index].selected ==false ?  1.6: 2),
                                        mainAxisSpacing: 10.0,
                                        crossAxisSpacing: 10.0,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:30,right:30.0,top: 0),
                                      child: StaggeredGridView.countBuilder(
                                        physics: AlwaysScrollableScrollPhysics(),
                                        controller: new ScrollController(keepScrollOffset: false),
                                        scrollDirection: Axis.vertical,
                                        crossAxisCount: 4,
                                        // addAutomaticKeepAlives: true,
                                        itemCount: LaundryTab.laundryTabbList.length,

                                        itemBuilder: (_, index) {
                                          return InkWell(
                                            onTap: (){
                                              setState(() {
                                                for(int i =0; i< LaundryTab.laundryTabbList.length; i++){
                                                  if(i == index)
                                                  {
                                                    if(LaundryTab.laundryTabbList[i].selected == true){
                                                      LaundryTab.laundryTabbList[i].selected = false;
                                                    }else{
                                                      LaundryTab.laundryTabbList[i].selected = true;}
                                                  }
                                                  else{
                                                    LaundryTab.laundryTabbList[i].selected = false;


                                                  }
                                                }
                                              });
                                            },
                                            child: SingleChildScrollView(
                                              child: AnimatedContainer(
                                                duration: Duration(milliseconds: 300),
                                                decoration: BoxDecoration(
                                                    border: Border.all(color: LaundryTab.laundryTabbList[index].selected==true?Color(0xFFff0000):Color(0xFFEFEFEF) ),
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: Colors.white

                                                ),
                                                height:
                                                LaundryTab.laundryTabbList[index].selected ==false ? 110:140,
                                                width: 160,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                          color: LaundryTab.laundryTabbList[index].selected==true?Color(0xFFff0000):Color(0xFFEFEFEF),
                                                          borderRadius: BorderRadius.only(
                                                            topRight: Radius.circular(5),
                                                            topLeft: Radius.circular(5),
                                                          )
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left:8.0,right: 8),
                                                        child: Center(
                                                          child: Row(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Text(LaundryTab.laundryTabbList[index].time,style: Styles().openBold(size: 14.0,color: LaundryTab.laundryTabbList[index].selected==true?Colors.white:Colors.black),),
                                                              Text(LaundryTab.laundryTabbList[index].money,style: Styles().openBold(size: 14.0,color: LaundryTab.laundryTabbList[index].selected==true?Colors.white:Colors.black),),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left:10.0, right: 10,top:10),
                                                      child: Container(
                                                        height: 60,
                                                        child: Row(
                                                          children: [
                                                            Text(LaundryTab.laundryTabbList[index].text, style: Styles().openRegular(size: 10.0)),
                                                            Spacer(),
                                                            Text(LaundryTab.laundryTabbList[index].text2, style: Styles().openRegular(size: 10.0)),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    // Spacer(),
                                                    Expanded(child: Padding(
                                                      padding: const EdgeInsets.only(left:10.0),
                                                      child: SingleChildScrollView(
                                                        child: Column(
                                                          children: [
                                                            SizedBox(height: 20,),
                                                            alertD(),
                                                            SizedBox(height: 10,),

                                                          ],
                                                        ),
                                                      ),
                                                    ))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );

                                        },

                                        staggeredTileBuilder: (int index) =>
                                        //new StaggeredTile.fit(4),
                                        new StaggeredTile.count(2, LaundryTab.laundryTabbList[index].selected ==false ?  1.6: 2),
                                        mainAxisSpacing: 10.0,
                                        crossAxisSpacing: 10.0,

                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:30,right:30.0,top: 0),
                                      child: StaggeredGridView.countBuilder(
                                        physics: AlwaysScrollableScrollPhysics(),
                                        controller: new ScrollController(keepScrollOffset: false),
                                        scrollDirection: Axis.vertical,
                                        crossAxisCount: 4,
                                        // addAutomaticKeepAlives: true,
                                        itemCount: LaundryTab.laundryTabbList.length,

                                        itemBuilder: (_, index) {
                                          return InkWell(
                                            onTap: (){
                                              setState(() {
                                                for(int i =0; i< LaundryTab.laundryTabbList.length; i++){
                                                  if(i == index)
                                                  {
                                                    if(LaundryTab.laundryTabbList[i].selected == true){
                                                      LaundryTab.laundryTabbList[i].selected = false;
                                                    }else{
                                                      LaundryTab.laundryTabbList[i].selected = true;}
                                                  }
                                                  else{
                                                    LaundryTab.laundryTabbList[i].selected = false;


                                                  }
                                                }
                                              });
                                            },
                                            child: SingleChildScrollView(
                                              child: AnimatedContainer(
                                                duration: Duration(milliseconds: 300),
                                                decoration: BoxDecoration(
                                                    border: Border.all(color: LaundryTab.laundryTabbList[index].selected==true?Color(0xFFff0000):Color(0xFFEFEFEF) ),
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: Colors.white

                                                ),
                                                height:
                                                LaundryTab.laundryTabbList[index].selected ==false ? 110:140,
                                                width: 160,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                          color: LaundryTab.laundryTabbList[index].selected==true?Color(0xFFff0000):Color(0xFFEFEFEF),
                                                          borderRadius: BorderRadius.only(
                                                            topRight: Radius.circular(5),
                                                            topLeft: Radius.circular(5),
                                                          )
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left:8.0,right: 8),
                                                        child: Center(
                                                          child: Row(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Text(LaundryTab.laundryTabbList[index].time,style: Styles().openBold(size: 14.0,color: LaundryTab.laundryTabbList[index].selected==true?Colors.white:Colors.black),),
                                                              Text(LaundryTab.laundryTabbList[index].money,style: Styles().openBold(size: 14.0,color: LaundryTab.laundryTabbList[index].selected==true?Colors.white:Colors.black),),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left:10.0, right: 10,top:10),
                                                      child: Container(
                                                        height: 60,
                                                        child: Row(
                                                          children: [
                                                            Text(LaundryTab.laundryTabbList[index].text, style: Styles().openRegular(size: 10.0)),
                                                            Spacer(),
                                                            Text(LaundryTab.laundryTabbList[index].text2, style: Styles().openRegular(size: 10.0)),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    // Spacer(),
                                                    Expanded(child: Padding(
                                                      padding: const EdgeInsets.only(left:10.0),
                                                      child: SingleChildScrollView(
                                                        child: Column(
                                                          children: [
                                                            SizedBox(height: 20,),
                                                            alertD(),
                                                            SizedBox(height: 10,),

                                                          ],
                                                        ),
                                                      ),
                                                    ))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );

                                        },

                                        staggeredTileBuilder: (int index) =>
                                        //new StaggeredTile.fit(4),
                                        new StaggeredTile.count(2, LaundryTab.laundryTabbList[index].selected ==false ?  1.6: 2),
                                        mainAxisSpacing: 10.0,
                                        crossAxisSpacing: 10.0,

                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left:30,right:30.0,top: 0),
                                      child: StaggeredGridView.countBuilder(
                                        physics: AlwaysScrollableScrollPhysics(),
                                        controller: new ScrollController(keepScrollOffset: false),
                                        scrollDirection: Axis.vertical,
                                        crossAxisCount: 4,
                                        // addAutomaticKeepAlives: true,
                                        itemCount: LaundryTab.laundryTabbList.length,

                                        itemBuilder: (_, index) {
                                          return InkWell(
                                            onTap: (){
                                              setState(() {
                                                for(int i =0; i< LaundryTab.laundryTabbList.length; i++){
                                                  if(i == index)
                                                  {
                                                    if(LaundryTab.laundryTabbList[i].selected == true){
                                                      LaundryTab.laundryTabbList[i].selected = false;
                                                    }else{
                                                      LaundryTab.laundryTabbList[i].selected = true;}
                                                  }
                                                  else{
                                                    LaundryTab.laundryTabbList[i].selected = false;


                                                  }
                                                }
                                              });
                                            },
                                            child: SingleChildScrollView(
                                              child: AnimatedContainer(
                                                duration: Duration(milliseconds: 300),
                                                decoration: BoxDecoration(
                                                    border: Border.all(color: LaundryTab.laundryTabbList[index].selected==true?Color(0xFFff0000):Color(0xFFEFEFEF) ),
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: Colors.white

                                                ),
                                                height:
                                                LaundryTab.laundryTabbList[index].selected ==false ? 110:140,
                                                width: 160,
                                                child: Column(
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      height: 30,
                                                      decoration: BoxDecoration(
                                                          color: LaundryTab.laundryTabbList[index].selected==true?Color(0xFFff0000):Color(0xFFEFEFEF),
                                                          borderRadius: BorderRadius.only(
                                                            topRight: Radius.circular(5),
                                                            topLeft: Radius.circular(5),
                                                          )
                                                      ),
                                                      child: Padding(
                                                        padding: const EdgeInsets.only(left:8.0,right: 8),
                                                        child: Center(
                                                          child: Row(
                                                            crossAxisAlignment: CrossAxisAlignment.start,
                                                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                            children: [
                                                              Text(LaundryTab.laundryTabbList[index].time,style: Styles().openBold(size: 14.0,color: LaundryTab.laundryTabbList[index].selected==true?Colors.white:Colors.black),),
                                                              Text(LaundryTab.laundryTabbList[index].money,style: Styles().openBold(size: 14.0,color: LaundryTab.laundryTabbList[index].selected==true?Colors.white:Colors.black),),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding: const EdgeInsets.only(left:10.0, right: 10,top:10),
                                                      child: Container(
                                                        height: 60,
                                                        child: Row(
                                                          children: [
                                                            Text(LaundryTab.laundryTabbList[index].text, style: Styles().openRegular(size: 10.0)),
                                                            Spacer(),
                                                            Text(LaundryTab.laundryTabbList[index].text2, style: Styles().openRegular(size: 10.0)),
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    //Spacer(),
                                                    Expanded(child: Padding(
                                                      padding: const EdgeInsets.only(left:10.0),
                                                      child: SingleChildScrollView(
                                                        child: Column(
                                                          children: [
                                                            SizedBox(height: 20,),
                                                            alertD(),
                                                            SizedBox(height: 10,),

                                                          ],
                                                        ),
                                                      ),
                                                    ))
                                                  ],
                                                ),
                                              ),
                                            ),
                                          );

                                        },

                                        staggeredTileBuilder: (int index) =>
                                        //new StaggeredTile.fit(4),
                                        new StaggeredTile.count(2, LaundryTab.laundryTabbList[index].selected ==false ?  1.6: 2),
                                        mainAxisSpacing: 10.0,
                                        crossAxisSpacing: 10.0,

                                      ),
                                    ),



                                    // Backyard work starts

                                  ],),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),

                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
