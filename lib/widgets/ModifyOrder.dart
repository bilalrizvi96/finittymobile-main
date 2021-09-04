import 'package:charles_app/API/Cartmodal.dart';
import 'package:charles_app/BaseUrl/variableGloable.dart';
import 'package:charles_app/View/Cleaning/RoundedIconButton.dart';
import 'package:charles_app/View/Cleaning/cleaningView.dart';
import 'package:flutter/material.dart';

class ModifyOrder extends StatefulWidget {
  @override
  _ModifyOrderState createState() => _ModifyOrderState();
}

class _ModifyOrderState extends State<ModifyOrder> {

  addcounter(int index) {
    modaldata[index].quantity =
        (int.parse(modaldata[index].quantity) + 1).toString();
    var a = money.split(' ');
    setState(() {
      money = (int.parse(a[1]) + int.parse(modaldata[index].price)).toString();
      money = "\$ " + money;
      money = money;
    });
  }
  deccounter(int index) {
    modaldata[index].quantity =
        (int.parse(modaldata[index].quantity) - 1).toString();
    var a = money.split(' ');
    setState(() {
      money = (int.parse(a[1]) - int.parse(modaldata[index].price)).toString();
      money = "\$ " + money;
    });
  }

  Widget card(index) {
    return Card(
      elevation: 1,
      child: Container(
        width: 20,
        child: Text(
          modaldata[index].quantity.toString(),
          style: TextStyle(
            fontSize: 22.0 * 0.8,
          ),
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        leading: InkWell(
            onTap: (){
              // Navigator.push(
              //     context,
              //     MaterialPageRoute(
              //       builder: (_) =>Mainpage(),
              //     ));
            },
            child: Icon(Icons.arrow_back_ios,color: Colors.black,)

        ),
        backgroundColor: Colors.white,

        title: new Text("My Bookings" , style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold,fontSize: 18),),
      ),
      body:  Container(
        padding: const EdgeInsets.only(left: 18.0, right: 18),
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 20,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0, left: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Customize",
                    style:
                    TextStyle(fontFamily: "monb", fontSize: 19),
                  ),
                  // Spacer(),
                  Text("70\$",
                    style:
                    TextStyle(fontFamily: "monb", fontSize: 22),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 5.0, left: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 2.4,
                    height: 60,
                    child: Card(
                        color: Color(0xFFFF0000),
                        child: Center(
                            child: Text(
                              "Regular",
                              style: TextStyle(
                                  fontFamily: "opsb",
                                  color: Colors.white),
                            ))),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 2.4,
                    height: 60,
                    child: Card(
                        color: Color(0xFFBCBDC1),
                        child: Column(
                          mainAxisAlignment:
                          MainAxisAlignment.center,
                          crossAxisAlignment:
                          CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Express",
                              style: TextStyle(
                                  fontFamily: "opsb",
                                  color: Colors.white),
                            ),
                            Text(
                              "Within 3 Hrs: \$ x1.5",
                              style: TextStyle(
                                  fontSize: 11,
                                  fontFamily: "opsb",
                                  color: Colors.white),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Padding(
              padding: const EdgeInsets.only(right: 10.0, left: 10),
              child: Row(
                children: [
                  Text("Name",
                      style: TextStyle(
                          fontFamily: "opsb", fontSize: 16)),
                  Spacer(),
                  Text("Qty",
                      style: TextStyle(
                          fontFamily: "opsb", fontSize: 16)),
                ],
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Container(
              height: MediaQuery.of(context).size.height / 5,
              child: ListView.builder(
                  itemCount: modaldata.length,
                  scrollDirection: Axis.vertical,
                  key: UniqueKey(),
                  itemBuilder: (_, index) {
                    var val = modaldata[index].quantity;
                    return Row(
                      children: [
                        Text(modaldata[index].title,
                            style: TextStyle(
                                fontFamily: "opbb",
                                fontWeight: FontWeight.bold,
                                fontSize: 14)),
                        Spacer(),
                        Text(modaldata[index].price,
                            style: TextStyle(
                                fontFamily: "opbb",
                                fontWeight: FontWeight.bold,
                                fontSize: 13)),
                        SizedBox(
                          width: 4,
                        ),
                        Container(
                          child: Row(
                            mainAxisAlignment:
                            MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 20,
                                child: RoundedIconButton(
                                  icon: Icons.remove,
                                  iconSize: 22.0,
                                  onPress: () {
                                    setState(() {
                                      deccounter(index);
                                    });
                                  },
                                ),
                              ),
                              card(index),
                              Container(
                                width: 20,
                                child: RoundedIconButton(
                                  icon: Icons.add,
                                  iconSize: 22.0,
                                  onPress: () {
                                    setState(() {
                                      addcounter(index);
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    );
                  }),
            ),
            SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10.0,
              ),
              child: Text(
                "Addon Services",
                style: TextStyle(fontFamily: "opsb", fontSize: 14),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            caringcatlist[selctedtabind].addons.length==0?
            Container(
              child:
              Padding(
                padding: const EdgeInsets.only(left: 10),
                child: Text("No Addons Service Avaiable"),
              ),):
            Container(
              height: 80,
              width: MediaQuery.of(context).size.width,
              child: ListView.builder(
                  physics: const AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: caringcatlist[selctedtabind].addons.length,
                  itemBuilder: (_, index) {
                    //return addons(caringcatlist[selctedtabind].addons[index]);
                    return InkWell(
                      onTap: (){

                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            InkWell(
                              onTap: () {
                                setState(() {
                                  if(caringcatlist[selctedtabind].addons[index].selected==true)
                                  {
                                    caringcatlist[selctedtabind].addons[index].selected=false;
                                    var mon=money.split(' ');
                                    int aa = int.parse(mon[1]);
                                    money=(aa-caringcatlist[selctedtabind].addons[index].price).toString();
                                    money=money = "\$ " + money;
                                    selectedaddonsList.remove(caringcatlist[selctedtabind].addons[index].id);

                                  }
                                  else{
                                    caringcatlist[selctedtabind].addons[index].selected=true;

                                    var mon=money.split(' ');
                                    int aa = int.parse(mon[1]);
                                    money=(aa+caringcatlist[selctedtabind].addons[index].price).toString();
                                    money=money = "\$ " + money;

                                    selectedaddonsList.add(caringcatlist[selctedtabind].addons[index].id);

                                  }


                                });

                              },
                              child: Column(
                                children: [
                                  Container(
                                    width: 90,
                                    height: 30,
                                    decoration: BoxDecoration(
                                        color: caringcatlist[selctedtabind].addons[index].selected==false?Color(0xFFE4E4E4):Color(0xFFFF0000),
                                        borderRadius: BorderRadius.all(Radius.circular(5))),
                                    child: Center(
                                        child: Text(
                                            caringcatlist[selctedtabind].addons[index].title == null
                                                ? "Bags/Discard"
                                                : caringcatlist[selctedtabind].addons[index].title,
                                            style: TextStyle(
                                                fontFamily:'rob',
                                                fontSize: 12,
                                                color: caringcatlist[selctedtabind].addons[index].selected==false?Colors.black:Colors.white
                                            ))),
                                  ),
                                  SizedBox(
                                    height: 5,

                                    ///kal dehkta hai
                                  ),
                                  Container(
                                      width: 90,
                                      // color: Colors.blue,
                                      child: Center(
                                          child: Text(caringcatlist[selctedtabind].addons[index].price == null
                                              ? "15\$"
                                              : caringcatlist[selctedtabind].addons[index].price.toString()+" \$"))),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 20,
            ),
            InkWell(
              onTap: () {
                //sth
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: InkWell(
                  onTap: () {
                    globalCartList.clear();
                    for(int i=0;i<modaldata.length;i++)
                    {
                      globalCartList.add(CartModel(
                        items_id: modaldata[i].id,
                        item_quantity: modaldata[i].quantity,
                        item_name: modaldata[i].title,
                        item_description: modaldata[i].title,
                        item_price: modaldata[i].price,
                        total_price: (int.parse(modaldata[i].price)*int.parse(modaldata[i].quantity)).toString(),
                      ));
                    }

                    for(int i=0;i<selectedaddonsList.length;i++)
                    {
                      if(i==0)
                      {
                        addons_id=selectedaddonsList[i].toString();
                      }
                      else
                      {
                        addons_id+=","+selectedaddonsList[i].toString();
                      }


                    }

                    print(addons_id);

                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => CarDriveAway()));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: 50,
                    child: Card(
                        color: Color(0xFFFF0000),
                        child: Center(
                            child: Text(
                              "Book now",
                              style: TextStyle(
                                  fontFamily: "opsb",
                                  color: Colors.white),
                            ))),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
