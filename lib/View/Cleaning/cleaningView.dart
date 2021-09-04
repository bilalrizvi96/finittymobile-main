import 'package:charles_app/API/Cartmodal.dart';
import 'package:charles_app/BaseUrl/api.dart';
import 'package:charles_app/BaseUrl/variableGloable.dart';
import 'package:charles_app/Component/alert/alertDialog.dart';
import 'package:charles_app/Model/Cleaning/cleaningList.dart';
import 'package:charles_app/NotificationClasses/postRequest.dart';
import 'package:charles_app/View/Caring/CarDriveAway.dart';
import 'package:charles_app/View/splash.dart';
import 'package:dio/dio.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../../widgets/widgets.dart';
import 'RoundedIconButton.dart';

class cleaningView extends StatefulWidget {
  @override
  _cleaningViewState createState() => _cleaningViewState();
}

List<Cleaining> caringcatlist = new List();
var selctedtabind;
//var addons = [];
var a = -1;
var b = 0;
var l1 = [];
var catname = [];
List<Addons> addonslist = new List();


var image = <String>[
  "lib/assets/images/house.png",
  "lib/assets/images/snow2.png",
  "lib/assets/images/garden.png",
  "lib/assets/images/pool.png",
  // Image.asset("lib/assets/images/Group 9649.png"),
  // Image.asset("lib/assets/images/Group 11061.png"),
  // Image.asset("lib/assets/images/Group 9650.png"),
  // Image.asset("lib/assets/images/Group 9651.png"),
  // Icons.person_outline,
];
// List<String> image = [
//   "lib/assets/images/Home.png",
//   "lib/assets/images/snow2.png",
//   "lib/assets/images/psw.png",
//   "lib/assets/images/pool1.png",
//  ];
List<CleaningRoomsTab> carlist = new List();
List<Homesubcle> homesubcarpkg = new List();
List<CleaningItem> caringitem = new List();
List<Valsubitemcle> valsubitem = new List();
List<Selected> firstindex = new List();
List<ModalData> modaldata = new List();
TabController controller;

ScrollController scrollController = ScrollController(
  initialScrollOffset: 10, // or whatever offset you wish
  keepScrollOffset: true,
);

class _cleaningViewState extends State<cleaningView>
    with TickerProviderStateMixin {
  void Model() {
    money = valcarlist[selectindex].money;
    modaldata.clear();
    for (vl in firstindex) {
      var ind = vl.indexx;
      for (var vi in valsubitem) {
        if (vi.indexid == ind.toString()) {
          modaldata.add(ModalData(
            title: vi.title,
            price: vi.price,
            quantity: vi.quantity,
            id: vi.id,
          ));
        }
      }
    }
  }

  var valid = 0;
  var bool = false;
  var customizeflag = false;
  var uppertabindex = 0;
  var lowertabindex = 0;
  var pkglength = new List();

  int countOccurrencesUsingWhereMethod(var list, String element) {
    if (list == null || list.isEmpty) {
      return 0;
    }

    var foundElements = list.where((e) => e.cattitle == element);
    return foundElements.length;
  }

  void DataCalling1() {
    String url = baseurl + "/api/cleaning";
    Dio dio = new Dio();
    carlist.clear();
    int imindex= -1;
    addonslist.clear();
    caringitem.clear();
    caringlistcatid.clear();
    homesubcarpkg.clear();
    homesubcarpkgid.clear();
    pkglength.clear();

    try {
      dio.get(url).then((response) {
        subcatCaring.clear();
        Map ad;

        if (response.statusCode == 200) {
          Map<String, dynamic> data = response.data;
          var check = data['success']['records'];
          for (Map i in check) {
            pkgname = i['name'];
            caringcatlist.clear();
            homesubcarpkg.clear();
            carlist.clear();
            caringitem.clear();
            for (Map caringcat in i['categories']) {
              imindex=imindex+1;
              addonslist = new List();
              var addon = caringcat['addons'];
              for (ad in addon) {
                if (ad['status'] == 1 &&
                    caringcat['id'] == ad['cleaning_category_id']) {
                    addonslist.add(Addons(
                    id: ad['id'],
                    title: ad['name'],
                    price: ad['price'],
                    cattitle: ad['title'],
                    parentid: ad['cleaning_category_id'],
                    selected: false,
                  ));
                }
              }
              caringcatlist.add(Cleaining(
                  caringcat['name'],
                  'Cleaning',
                  Colors.red,
                  // "lib/assets/images/house.png",
                  image[imindex],
               //  image[imindex],
                  true,
                  caringcat['id'],
                  addonslist));

              for (Map homesubcarpkges in caringcat['package_categories']) {
                  pkgdata = homesubcarpkges['packages'];
                  pkglength.add(pkgdata.length);
                  homesubcarpkg.add(Homesubcle(
                      homesubcarpkges['id'],
                      homesubcarpkges['name'],
                      homesubcarpkges['cleaning_category_id'].toString(),
                ));
                for (Map subsubpkg in homesubcarpkges['packages']) {
                  carlist.add(CleaningRoomsTab(
                      subsubpkg['name'],
                      "\$ " + subsubpkg['price'].toString(),
                      subsubpkg['description'],
                      subsubpkg['items_id'].toString(),
                      subsubpkg['cleaning_package_category_id'].toString(),
                      homesubcarpkges['name'],
                      false,
                      homesubcarpkges['cleaning_category_id'],
                      subsubpkg['id'].toString()));
                  for (Map subpkgitem in subsubpkg['items']) {
                    caringitem.add(CleaningItem(
                        subpkgitem['id'],
                        subpkgitem['title'],
                        subpkgitem['price'],
                        subpkgitem['quantity'],
                        subpkgitem['package_id']));
                  }
                }
              }
            }
            setState(() {
              checkcontroller();
              pr.hide();
            });
          }

          var title = "";
          l1.clear();
          for (int i = 0; i < caringcatlist[selctedtabind].addons.length; i++) {
            if (title != caringcatlist[selctedtabind].addons[i].cattitle) {
              l1.add(countOccurrencesUsingWhereMethod(
                  caringcatlist[selctedtabind].addons,
                  caringcatlist[selctedtabind].addons[i].cattitle));
              title = caringcatlist[selctedtabind].addons[i].cattitle;
            }
          }
          catname.clear();
          for (int i = 0; i < caringcatlist[selctedtabind].addons.length; i++) {
            if (catname
                .contains(caringcatlist[selctedtabind].addons[i].cattitle)) {
            } else {
              catname.add(caringcatlist[selctedtabind].addons[i].cattitle);
            }
          }
        }
      });
    } catch (e) {}
  }

  void checkcontroller() async {
    valhomecarname.clear();
    valhomecarid.clear();
    setState(() {
      valcarlist.clear();
      valsubitem.clear();
      valindex.clear();
    });

    bool = true;
    setState(() {
      if (homesubcarpkg != null) {
        for (var val in homesubcarpkg) {
          if (val.cid.toString() == selectedIndextab.toString()) {
            valhomecarname.add(val.name.toString());
            valhomecarid.add(val.id.toString());
            valhomecarcid.add(val.cid.toString());
          }
        }
        subitemindex = 0;
        list();

        controller =
            new TabController(length: valhomecarname.length, vsync: this);
        uppertabindex = 0;
        lowertabindex = 0;

        controller.addListener(() {
          setState(() {
            firstindex.clear();
            valcarlist[selectindexsave].selected = false;
            customizeflag = false;
            //valid =controller.index;
            uppertabindex = controller.index;
            print(uppertabindex);

            if (uppertabindex == 0) {
              lowertabindex = 0;
              print(lowertabindex);
            } else {
              lowertabindex = 0;
              var i = controller.index;
              var a = 0;
              for (int j = i; j > 0; j--) {
                lowertabindex += pkglength[a];
                a++;
              }
            }
          });
        });
      }
    });
  }

  _onSelected(int i) {
    bool = false;
    setState(() {
      selectedIndextab = i;
    });
  }

  var subitemindex = 0;

  var item;

  void subItem(var id) {
    for (item in caringitem) {
      if (valcl.id.toString() == item.cid.toString()) {
        print(id);
        if (id.contains(item.id.toString())) {
          var b = Valsubitemcle(
              item.title,
              item.price.toString(),
              item.quantity,
              valsubpkgitemid.length.toString(),
              (item.title.toString() +
                      item.price.toString() +
                      item.quantity.toString() +
                      valsubpkgitemid.length.toString())
                  .toString(),
              item.id);
          var a = valsubitem.where((element) => element.unique == b.unique);
          if (a.isEmpty) {
            valsubitem.add(Valsubitemcle(
                item.title,
                item.price.toString(),
                item.quantity,
                valsubpkgitemid.length.toString(),
                (item.title.toString() +
                        item.price.toString() +
                        item.quantity.toString() +
                        valsubpkgitemid.length.toString())
                    .toString(),
                item.id));
            valindex.add(valsubpkgitemid.length);
          }
          // setState(() {
          //   inner();
          // });
        }
      }
    }
  }

  var val, pri;

  addcounter(int index) {
    modaldata[index].quantity =
        (int.parse(modaldata[index].quantity) + 1).toString();
    var a = money.split(' ');
    setState(() {
      money = (int.parse(a[1]) + int.parse(modaldata[index].price)).toString();
      money = "\$ " + money;
      money = money;
      b = 0;
    });
  }

  deccounter(int index) {
    modaldata[index].quantity =
        (int.parse(modaldata[index].quantity) - 1).toString();
    var a = money.split(' ');
    setState(() {
      money = (int.parse(a[1]) - int.parse(modaldata[index].price)).toString();
      money = "\$ " + money;
      b = 0;
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

  Widget settingModalBottomSheet(context, coloring) {
    showModalBottomSheet(
        backgroundColor: Colors.transparent,
        isScrollControlled: true,
        context: context,
        builder: (context) {
          return StatefulBuilder(builder: (BuildContext context,
              StateSetter setState /*You can rename this!*/) {
            return Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.only(
                    topRight: Radius.circular(15),
                    topLeft: Radius.circular(15)),
                color: Colors.white,
              ),
              child: Wrap(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0, right: 18),
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
                              Text(
                                money.toString() == null
                                    ? ""
                                    : money.toString(),
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
                                    color: coloring,
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
                              Padding(
                                padding: const EdgeInsets.only(top:4.0),
                                child: Icon(Icons.keyboard_arrow_down_sharp),
                              ),

                              Spacer(),
                              Text("Qty", style: TextStyle(
                                      fontFamily: "opsb", fontSize: 16)),
                              Padding(
                                padding: const EdgeInsets.only(top:4.0),
                                child: Icon(Icons.keyboard_arrow_down_sharp),
                              ),

                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          color: Colors.grey[100],
                          height: MediaQuery.of(context).size.height / 8,
                          child: ListView.builder(
                              itemCount: modaldata.length,
                              scrollDirection: Axis.vertical,
                              key: UniqueKey(),
                              itemBuilder: (_, index) {
                                val = modaldata[index].quantity;
                                return Padding(
                                  padding: const EdgeInsets.only(left:10.0),
                                  child: Column(
                                    children: [
                                      Row(
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
                                                Padding(
                                                  padding: const EdgeInsets.only(right:12.0),
                                                  child: Container(
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
                                                ),
                                              ],
                                            ),
                                          )
                                        ],
                                      ),
                                      Divider()
                                    ],
                                  ),
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
                        caringcatlist[selctedtabind].addons.length == 0
                            ? Container(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text("No Addons Service Avaiable"),
                                ),
                              )
                            : l1.length >= 1
                                ? Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(left: 10),
                                        child: Text(catname[0]),
                                      ),
                                      Container(
                                          height: 90,
                                          width:
                                              MediaQuery.of(context).size.width,
                                          child: ListView.builder(
                                              padding: const EdgeInsets.all(8),
                                              scrollDirection: Axis.horizontal,
                                              itemCount:
                                                  caringcatlist[selctedtabind]
                                                      .addons
                                                      .length,
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                return catname[0] ==
                                                        caringcatlist[
                                                                selctedtabind]
                                                            .addons[index]
                                                            .cattitle
                                                    ? Padding(
                                                        padding:
                                                            const EdgeInsets
                                                                .all(4.0),
                                                        child: InkWell(
                                                          onTap: () {
                                                            setState(() {
                                                              if (caringcatlist[selctedtabind].addons[index].selected == true) {
                                                                caringcatlist[
                                                                        selctedtabind]
                                                                    .addons[
                                                                        index]
                                                                    .selected = false;
                                                                var mon = money
                                                                    .split(' ');
                                                                int aa =
                                                                    int.parse(
                                                                        mon[1]);
                                                                money = (aa -
                                                                        caringcatlist[selctedtabind]
                                                                            .addons[index]
                                                                            .price)
                                                                    .toString();
                                                                money = money =
                                                                    "\$ " +
                                                                        money;
                                                                selectedaddonsList.remove(
                                                                    caringcatlist[
                                                                            selctedtabind]
                                                                        .addons[
                                                                            index]
                                                                        .id);
                                                                selectedaddonsnameList.remove(
                                                                    caringcatlist[
                                                                            selctedtabind]
                                                                        .addons[
                                                                            index]
                                                                        .title);
                                                                selectedaddonspriceList.remove(
                                                                    caringcatlist[
                                                                            selctedtabind]
                                                                        .addons[
                                                                            index]
                                                                        .price);
                                                              } else {
                                                                caringcatlist[
                                                                        selctedtabind]
                                                                    .addons[
                                                                        index]
                                                                    .selected = true;

                                                                var mon = money
                                                                    .split(' ');
                                                                int aa =
                                                                    int.parse(
                                                                        mon[1]);
                                                                money = (aa +
                                                                        caringcatlist[selctedtabind]
                                                                            .addons[index]
                                                                            .price)
                                                                    .toString();
                                                                money = money =
                                                                    "\$ " +
                                                                        money;

                                                                selectedaddonsList.add(
                                                                    caringcatlist[
                                                                            selctedtabind]
                                                                        .addons[
                                                                            index]
                                                                        .id);
                                                                selectedaddonsnameList.add(
                                                                    caringcatlist[
                                                                            selctedtabind]
                                                                        .addons[
                                                                            index]
                                                                        .title);
                                                                selectedaddonspriceList.add(
                                                                    caringcatlist[
                                                                            selctedtabind]
                                                                        .addons[
                                                                            index]
                                                                        .price);
                                                              }
                                                            });
                                                          },
                                                          child: Column(
                                                            children: [
                                                              Container(
                                                                width: 90,
                                                                height: 30,
                                                                decoration: BoxDecoration(
                                                                    color: caringcatlist[selctedtabind].addons[index].selected ==
                                                                            false
                                                                        ? Color(
                                                                            0xFFE4E4E4)
                                                                        : Color(
                                                                            0xFFFF0000),
                                                                    borderRadius:
                                                                        BorderRadius.all(
                                                                            Radius.circular(5))),
                                                                child: Center(
                                                                    child: Text(
                                                                        caringcatlist[selctedtabind].addons[index].title == null
                                                                            ? "Bags/Discard"
                                                                            : caringcatlist[selctedtabind]
                                                                                .addons[
                                                                                    index]
                                                                                .title,
                                                                        style: TextStyle(
                                                                            fontFamily:
                                                                                'rob',
                                                                            fontSize:
                                                                                12,
                                                                            color: caringcatlist[selctedtabind].addons[index].selected == false
                                                                                ? Colors.black
                                                                                : Colors.white))),
                                                              ),
                                                              SizedBox(
                                                                height: 5,

                                                                ///kal dehkta hai
                                                              ),
                                                              Container(
                                                                  width: 90,
                                                                  // color: Colors.blue,
                                                                  child: Center(
                                                                      child: Text(caringcatlist[selctedtabind].addons[index].price ==
                                                                              null
                                                                          ? "15\$"
                                                                          : caringcatlist[selctedtabind].addons[index].price.toString() +
                                                                              " \$"))),
                                                            ],
                                                          ),
                                                        ),
                                                      )
                                                    : Container();
                                              })
                                          // child: SingleChildScrollView(
                                          //   child: Column(
                                          //       children: List.generate(l1.length, (index) {
                                          //         b += l1[index];
                                          //     return Column(
                                          //       children: [
                                          //         Text(caringcatlist[selctedtabind].addons[b-1].cattitle.toString()),
                                          //         Container(
                                          //           height: 80,
                                          //           child: ListView.builder(
                                          //               controller: scrollController,
                                          //               physics: const AlwaysScrollableScrollPhysics(),
                                          //               shrinkWrap: true,
                                          //               scrollDirection: Axis.horizontal,
                                          //               itemCount: l1[index],
                                          //               itemBuilder: (_, index) {
                                          //                 //return addons(caringcatlist[selctedtabind].addons[index]);
                                          //                 print(index);
                                          //                 ++a;
                                          //                 return InkWell(
                                          //                   onTap: () {},
                                          //                   child: Padding(
                                          //                     padding:
                                          //                         const EdgeInsets.all(10.0),
                                          //                     child: Row(
                                          //                       mainAxisAlignment:
                                          //                           MainAxisAlignment
                                          //                               .spaceBetween,
                                          //                       //crossAxisAlignment: CrossAxisAlignment.start,
                                          //                       children: [
                                          //                         InkWell(
                                          //                           onTap: () {
                                          //                             b = 0;
                                          //                             a = -1;
                                          //                             setState(() {
                                          //                               if (caringcatlist[
                                          //                                           selctedtabind]
                                          //                                       .addons[index]
                                          //                                       .selected ==
                                          //                                   true) {
                                          //                                 caringcatlist[
                                          //                                         selctedtabind]
                                          //                                     .addons[index]
                                          //                                     .selected = false;
                                          //                                 var mon = money
                                          //                                     .split(' ');
                                          //                                 int aa = int.parse(
                                          //                                     mon[1]);
                                          //                                 money = (aa -
                                          //                                         caringcatlist[
                                          //                                                 selctedtabind]
                                          //                                             .addons[
                                          //                                                 index]
                                          //                                             .price)
                                          //                                     .toString();
                                          //                                 money = money =
                                          //                                     "\$ " + money;
                                          //                                 selectedaddonsList.remove(
                                          //                                     caringcatlist[
                                          //                                             selctedtabind]
                                          //                                         .addons[
                                          //                                             index]
                                          //                                         .id);
                                          //                                 selectedaddonsnameList
                                          //                                     .remove(caringcatlist[
                                          //                                             selctedtabind]
                                          //                                         .addons[
                                          //                                             index]
                                          //                                         .title);
                                          //                                 selectedaddonspriceList
                                          //                                     .remove(caringcatlist[
                                          //                                             selctedtabind]
                                          //                                         .addons[
                                          //                                             index]
                                          //                                         .price);
                                          //                               } else {
                                          //                                 caringcatlist[
                                          //                                         selctedtabind]
                                          //                                     .addons[index]
                                          //                                     .selected = true;
                                          //
                                          //                                 var mon = money
                                          //                                     .split(' ');
                                          //                                 int aa = int.parse(
                                          //                                     mon[1]);
                                          //                                 money = (aa +
                                          //                                         caringcatlist[
                                          //                                                 selctedtabind]
                                          //                                             .addons[
                                          //                                                 index]
                                          //                                             .price)
                                          //                                     .toString();
                                          //                                 money = money =
                                          //                                     "\$ " + money;
                                          //
                                          //                                 selectedaddonsList.add(
                                          //                                     caringcatlist[
                                          //                                             selctedtabind]
                                          //                                         .addons[
                                          //                                             index]
                                          //                                         .id);
                                          //                                 selectedaddonsnameList
                                          //                                     .add(caringcatlist[
                                          //                                             selctedtabind]
                                          //                                         .addons[
                                          //                                             index]
                                          //                                         .title);
                                          //                                 selectedaddonspriceList
                                          //                                     .add(caringcatlist[
                                          //                                             selctedtabind]
                                          //                                         .addons[
                                          //                                             index]
                                          //                                         .price);
                                          //                               }
                                          //                             });
                                          //                           },
                                          //                           child: Column(
                                          //                             children: [
                                          //                               Container(
                                          //                                 width: 90,
                                          //                                 height: 30,
                                          //                                 decoration: BoxDecoration(
                                          //                                     color: caringcatlist[selctedtabind]
                                          //                                                 .addons[
                                          //                                                     a]
                                          //                                                 .selected ==
                                          //                                             false
                                          //                                         ? Color(
                                          //                                             0xFFE4E4E4)
                                          //                                         : Color(
                                          //                                             0xFFFF0000),
                                          //                                     borderRadius: BorderRadius
                                          //                                         .all(Radius
                                          //                                             .circular(
                                          //                                                 5))),
                                          //                                 child: Center(
                                          //                                     child: Text(
                                          //                                         caringcatlist[selctedtabind]
                                          //                                                     .addons[
                                          //                                                         a]
                                          //                                                     .title ==
                                          //                                                 null
                                          //                                             ? "Bags/Discard"
                                          //                                             : caringcatlist[selctedtabind]
                                          //                                                 .addons[
                                          //                                                     a]
                                          //                                                 .title,
                                          //                                         style: TextStyle(
                                          //                                             fontFamily:
                                          //                                                 'rob',
                                          //                                             fontSize:
                                          //                                                 12,
                                          //                                             color: caringcatlist[selctedtabind].addons[a].selected ==
                                          //                                                     false
                                          //                                                 ? Colors.black
                                          //                                                 : Colors.white))),
                                          //                               ),
                                          //                               SizedBox(
                                          //                                 height: 5,
                                          //
                                          //                                 ///kal dehkta hai
                                          //                               ),
                                          //                               Container(
                                          //                                   width: 90,
                                          //                                   // color: Colors.blue,
                                          //                                   child: Center(
                                          //                                       child: Text(caringcatlist[selctedtabind]
                                          //                                                   .addons[
                                          //                                                       a]
                                          //                                                   .price ==
                                          //                                               null
                                          //                                           ? "15\$"
                                          //                                           : caringcatlist[selctedtabind]
                                          //                                                   .addons[a]
                                          //                                                   .price
                                          //                                                   .toString() +
                                          //                                               " \$"))),
                                          //                             ],
                                          //                           ),
                                          //                         ),
                                          //                       ],
                                          //                     ),
                                          //                   ),
                                          //
                                          //                 );
                                          //
                                          //
                                          //               }),
                                          //         ),
                                          //       ],
                                          //     );
                                          //   })),
                                          // ),
                                          ),
                                    ],
                                  )
                                : Container(),
                        l1.length >= 2
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(catname[1]),
                                  ),
                                  Container(
                                      height: 90,
                                      width: MediaQuery.of(context).size.width,
                                      child: ListView.builder(
                                          padding: const EdgeInsets.all(8),
                                          scrollDirection: Axis.horizontal,
                                          itemCount:
                                              caringcatlist[selctedtabind]
                                                  .addons
                                                  .length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return catname[1] ==
                                                    caringcatlist[selctedtabind]
                                                        .addons[index]
                                                        .cattitle
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          if (caringcatlist[
                                                                      selctedtabind]
                                                                  .addons[index]
                                                                  .selected ==
                                                              true) {
                                                            caringcatlist[
                                                                    selctedtabind]
                                                                .addons[index]
                                                                .selected = false;
                                                            var mon = money
                                                                .split(' ');
                                                            int aa = int.parse(
                                                                mon[1]);
                                                            money = (aa -
                                                                    caringcatlist[
                                                                            selctedtabind]
                                                                        .addons[
                                                                            index]
                                                                        .price)
                                                                .toString();
                                                            money = money =
                                                                "\$ " + money;
                                                            selectedaddonsList.remove(
                                                                caringcatlist[
                                                                        selctedtabind]
                                                                    .addons[
                                                                        index]
                                                                    .id);
                                                            selectedaddonsnameList
                                                                .remove(caringcatlist[
                                                                        selctedtabind]
                                                                    .addons[
                                                                        index]
                                                                    .title);
                                                            selectedaddonspriceList
                                                                .remove(caringcatlist[
                                                                        selctedtabind]
                                                                    .addons[
                                                                        index]
                                                                    .price);
                                                          } else {
                                                            caringcatlist[
                                                                    selctedtabind]
                                                                .addons[index]
                                                                .selected = true;

                                                            var mon = money
                                                                .split(' ');
                                                            int aa = int.parse(
                                                                mon[1]);
                                                            money = (aa +
                                                                    caringcatlist[
                                                                            selctedtabind]
                                                                        .addons[
                                                                            index]
                                                                        .price)
                                                                .toString();
                                                            money = money =
                                                                "\$ " + money;

                                                            selectedaddonsList.add(
                                                                caringcatlist[
                                                                        selctedtabind]
                                                                    .addons[
                                                                        index]
                                                                    .id);
                                                            selectedaddonsnameList
                                                                .add(caringcatlist[
                                                                        selctedtabind]
                                                                    .addons[
                                                                        index]
                                                                    .title);
                                                            selectedaddonspriceList
                                                                .add(caringcatlist[
                                                                        selctedtabind]
                                                                    .addons[
                                                                        index]
                                                                    .price);
                                                          }
                                                        });
                                                      },
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            width: 90,
                                                            height: 30,
                                                            decoration: BoxDecoration(
                                                                color: caringcatlist[selctedtabind]
                                                                            .addons[
                                                                                index]
                                                                            .selected ==
                                                                        false
                                                                    ? Color(
                                                                        0xFFE4E4E4)
                                                                    : Color(
                                                                        0xFFFF0000),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            5))),
                                                            child: Center(
                                                                child: Text(
                                                                    caringcatlist[selctedtabind]
                                                                                .addons[
                                                                                    index]
                                                                                .title ==
                                                                            null
                                                                        ? "Bags/Discard"
                                                                        : caringcatlist[selctedtabind]
                                                                            .addons[
                                                                                index]
                                                                            .title,
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'rob',
                                                                        fontSize:
                                                                            12,
                                                                        color: caringcatlist[selctedtabind].addons[index].selected ==
                                                                                false
                                                                            ? Colors.black
                                                                            : Colors.white))),
                                                          ),
                                                          SizedBox(
                                                            height: 5,

                                                            ///kal dehkta hai
                                                          ),
                                                          Container(
                                                              width: 90,
                                                              // color: Colors.blue,
                                                              child: Center(
                                                                  child: Text(caringcatlist[selctedtabind]
                                                                              .addons[
                                                                                  index]
                                                                              .price ==
                                                                          null
                                                                      ? "15\$"
                                                                      : caringcatlist[selctedtabind]
                                                                              .addons[index]
                                                                              .price
                                                                              .toString() +
                                                                          " \$"))),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                : Container();
                                          })
                                      // child: SingleChildScrollView(
                                      //   child: Column(
                                      //       children: List.generate(l1.length, (index) {
                                      //         b += l1[index];
                                      //     return Column(
                                      //       children: [
                                      //         Text(caringcatlist[selctedtabind].addons[b-1].cattitle.toString()),
                                      //         Container(
                                      //           height: 80,
                                      //           child: ListView.builder(
                                      //               controller: scrollController,
                                      //               physics: const AlwaysScrollableScrollPhysics(),
                                      //               shrinkWrap: true,
                                      //               scrollDirection: Axis.horizontal,
                                      //               itemCount: l1[index],
                                      //               itemBuilder: (_, index) {
                                      //                 //return addons(caringcatlist[selctedtabind].addons[index]);
                                      //                 print(index);
                                      //                 ++a;
                                      //                 return InkWell(
                                      //                   onTap: () {},
                                      //                   child: Padding(
                                      //                     padding:
                                      //                         const EdgeInsets.all(10.0),
                                      //                     child: Row(
                                      //                       mainAxisAlignment:
                                      //                           MainAxisAlignment
                                      //                               .spaceBetween,
                                      //                       //crossAxisAlignment: CrossAxisAlignment.start,
                                      //                       children: [
                                      //                         InkWell(
                                      //                           onTap: () {
                                      //                             b = 0;
                                      //                             a = -1;
                                      //                             setState(() {
                                      //                               if (caringcatlist[
                                      //                                           selctedtabind]
                                      //                                       .addons[index]
                                      //                                       .selected ==
                                      //                                   true) {
                                      //                                 caringcatlist[
                                      //                                         selctedtabind]
                                      //                                     .addons[index]
                                      //                                     .selected = false;
                                      //                                 var mon = money
                                      //                                     .split(' ');
                                      //                                 int aa = int.parse(
                                      //                                     mon[1]);
                                      //                                 money = (aa -
                                      //                                         caringcatlist[
                                      //                                                 selctedtabind]
                                      //                                             .addons[
                                      //                                                 index]
                                      //                                             .price)
                                      //                                     .toString();
                                      //                                 money = money =
                                      //                                     "\$ " + money;
                                      //                                 selectedaddonsList.remove(
                                      //                                     caringcatlist[
                                      //                                             selctedtabind]
                                      //                                         .addons[
                                      //                                             index]
                                      //                                         .id);
                                      //                                 selectedaddonsnameList
                                      //                                     .remove(caringcatlist[
                                      //                                             selctedtabind]
                                      //                                         .addons[
                                      //                                             index]
                                      //                                         .title);
                                      //                                 selectedaddonspriceList
                                      //                                     .remove(caringcatlist[
                                      //                                             selctedtabind]
                                      //                                         .addons[
                                      //                                             index]
                                      //                                         .price);
                                      //                               } else {
                                      //                                 caringcatlist[
                                      //                                         selctedtabind]
                                      //                                     .addons[index]
                                      //                                     .selected = true;
                                      //
                                      //                                 var mon = money
                                      //                                     .split(' ');
                                      //                                 int aa = int.parse(
                                      //                                     mon[1]);
                                      //                                 money = (aa +
                                      //                                         caringcatlist[
                                      //                                                 selctedtabind]
                                      //                                             .addons[
                                      //                                                 index]
                                      //                                             .price)
                                      //                                     .toString();
                                      //                                 money = money =
                                      //                                     "\$ " + money;
                                      //
                                      //                                 selectedaddonsList.add(
                                      //                                     caringcatlist[
                                      //                                             selctedtabind]
                                      //                                         .addons[
                                      //                                             index]
                                      //                                         .id);
                                      //                                 selectedaddonsnameList
                                      //                                     .add(caringcatlist[
                                      //                                             selctedtabind]
                                      //                                         .addons[
                                      //                                             index]
                                      //                                         .title);
                                      //                                 selectedaddonspriceList
                                      //                                     .add(caringcatlist[
                                      //                                             selctedtabind]
                                      //                                         .addons[
                                      //                                             index]
                                      //                                         .price);
                                      //                               }
                                      //                             });
                                      //                           },
                                      //                           child: Column(
                                      //                             children: [
                                      //                               Container(
                                      //                                 width: 90,
                                      //                                 height: 30,
                                      //                                 decoration: BoxDecoration(
                                      //                                     color: caringcatlist[selctedtabind]
                                      //                                                 .addons[
                                      //                                                     a]
                                      //                                                 .selected ==
                                      //                                             false
                                      //                                         ? Color(
                                      //                                             0xFFE4E4E4)
                                      //                                         : Color(
                                      //                                             0xFFFF0000),
                                      //                                     borderRadius: BorderRadius
                                      //                                         .all(Radius
                                      //                                             .circular(
                                      //                                                 5))),
                                      //                                 child: Center(
                                      //                                     child: Text(
                                      //                                         caringcatlist[selctedtabind]
                                      //                                                     .addons[
                                      //                                                         a]
                                      //                                                     .title ==
                                      //                                                 null
                                      //                                             ? "Bags/Discard"
                                      //                                             : caringcatlist[selctedtabind]
                                      //                                                 .addons[
                                      //                                                     a]
                                      //                                                 .title,
                                      //                                         style: TextStyle(
                                      //                                             fontFamily:
                                      //                                                 'rob',
                                      //                                             fontSize:
                                      //                                                 12,
                                      //                                             color: caringcatlist[selctedtabind].addons[a].selected ==
                                      //                                                     false
                                      //                                                 ? Colors.black
                                      //                                                 : Colors.white))),
                                      //                               ),
                                      //                               SizedBox(
                                      //                                 height: 5,
                                      //
                                      //                                 ///kal dehkta hai
                                      //                               ),
                                      //                               Container(
                                      //                                   width: 90,
                                      //                                   // color: Colors.blue,
                                      //                                   child: Center(
                                      //                                       child: Text(caringcatlist[selctedtabind]
                                      //                                                   .addons[
                                      //                                                       a]
                                      //                                                   .price ==
                                      //                                               null
                                      //                                           ? "15\$"
                                      //                                           : caringcatlist[selctedtabind]
                                      //                                                   .addons[a]
                                      //                                                   .price
                                      //                                                   .toString() +
                                      //                                               " \$"))),
                                      //                             ],
                                      //                           ),
                                      //                         ),
                                      //                       ],
                                      //                     ),
                                      //                   ),
                                      //
                                      //                 );
                                      //
                                      //
                                      //               }),
                                      //         ),
                                      //       ],
                                      //     );
                                      //   })),
                                      // ),
                                      ),
                                ],
                              )
                            : Container(),
                        l1.length >= 3
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(catname[2]),
                                  ),
                                  Container(
                                      height: 90,
                                      width: MediaQuery.of(context).size.width,
                                      child: ListView.builder(
                                          padding: const EdgeInsets.all(8),
                                          scrollDirection: Axis.horizontal,
                                          itemCount:
                                              caringcatlist[selctedtabind]
                                                  .addons
                                                  .length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return catname[2] ==
                                                    caringcatlist[selctedtabind]
                                                        .addons[index]
                                                        .cattitle
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          if (caringcatlist[
                                                                      selctedtabind]
                                                                  .addons[index]
                                                                  .selected ==
                                                              true) {
                                                            caringcatlist[
                                                                    selctedtabind]
                                                                .addons[index]
                                                                .selected = false;
                                                            var mon = money
                                                                .split(' ');
                                                            int aa = int.parse(
                                                                mon[1]);
                                                            money = (aa -
                                                                    caringcatlist[
                                                                            selctedtabind]
                                                                        .addons[
                                                                            index]
                                                                        .price)
                                                                .toString();
                                                            money = money =
                                                                "\$ " + money;
                                                            selectedaddonsList.remove(
                                                                caringcatlist[
                                                                        selctedtabind]
                                                                    .addons[
                                                                        index]
                                                                    .id);
                                                            selectedaddonsnameList
                                                                .remove(caringcatlist[
                                                                        selctedtabind]
                                                                    .addons[
                                                                        index]
                                                                    .title);
                                                            selectedaddonspriceList
                                                                .remove(caringcatlist[
                                                                        selctedtabind]
                                                                    .addons[
                                                                        index]
                                                                    .price);
                                                          } else {
                                                            caringcatlist[
                                                                    selctedtabind]
                                                                .addons[index]
                                                                .selected = true;

                                                            var mon = money
                                                                .split(' ');
                                                            int aa = int.parse(
                                                                mon[1]);
                                                            money = (aa +
                                                                    caringcatlist[
                                                                            selctedtabind]
                                                                        .addons[
                                                                            index]
                                                                        .price)
                                                                .toString();
                                                            money = money =
                                                                "\$ " + money;

                                                            selectedaddonsList.add(
                                                                caringcatlist[
                                                                        selctedtabind]
                                                                    .addons[
                                                                        index]
                                                                    .id);
                                                            selectedaddonsnameList
                                                                .add(caringcatlist[
                                                                        selctedtabind]
                                                                    .addons[
                                                                        index]
                                                                    .title);
                                                            selectedaddonspriceList
                                                                .add(caringcatlist[
                                                                        selctedtabind]
                                                                    .addons[
                                                                        index]
                                                                    .price);
                                                          }
                                                        });
                                                      },
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            width: 90,
                                                            height: 30,
                                                            decoration: BoxDecoration(
                                                                color: caringcatlist[selctedtabind]
                                                                            .addons[
                                                                                index]
                                                                            .selected ==
                                                                        false
                                                                    ? Color(
                                                                        0xFFE4E4E4)
                                                                    : Color(
                                                                        0xFFFF0000),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            5))),
                                                            child: Center(
                                                                child: Text(
                                                                    caringcatlist[selctedtabind]
                                                                                .addons[
                                                                                    index]
                                                                                .title ==
                                                                            null
                                                                        ? "Bags/Discard"
                                                                        : caringcatlist[selctedtabind]
                                                                            .addons[
                                                                                index]
                                                                            .title,
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'rob',
                                                                        fontSize:
                                                                            12,
                                                                        color: caringcatlist[selctedtabind].addons[index].selected ==
                                                                                false
                                                                            ? Colors.black
                                                                            : Colors.white))),
                                                          ),
                                                          SizedBox(
                                                            height: 5,

                                                            ///kal dehkta hai
                                                          ),
                                                          Container(
                                                              width: 90,
                                                              // color: Colors.blue,
                                                              child: Center(
                                                                  child: Text(caringcatlist[selctedtabind]
                                                                              .addons[
                                                                                  index]
                                                                              .price ==
                                                                          null
                                                                      ? "15\$"
                                                                      : caringcatlist[selctedtabind]
                                                                              .addons[index]
                                                                              .price
                                                                              .toString() +
                                                                          " \$"))),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                : Container();
                                          })
                                      // child: SingleChildScrollView(
                                      //   child: Column(
                                      //       children: List.generate(l1.length, (index) {
                                      //         b += l1[index];
                                      //     return Column(
                                      //       children: [
                                      //         Text(caringcatlist[selctedtabind].addons[b-1].cattitle.toString()),
                                      //         Container(
                                      //           height: 80,
                                      //           child: ListView.builder(
                                      //               controller: scrollController,
                                      //               physics: const AlwaysScrollableScrollPhysics(),
                                      //               shrinkWrap: true,
                                      //               scrollDirection: Axis.horizontal,
                                      //               itemCount: l1[index],
                                      //               itemBuilder: (_, index) {
                                      //                 //return addons(caringcatlist[selctedtabind].addons[index]);
                                      //                 print(index);
                                      //                 ++a;
                                      //                 return InkWell(
                                      //                   onTap: () {},
                                      //                   child: Padding(
                                      //                     padding:
                                      //                         const EdgeInsets.all(10.0),
                                      //                     child: Row(
                                      //                       mainAxisAlignment:
                                      //                           MainAxisAlignment
                                      //                               .spaceBetween,
                                      //                       //crossAxisAlignment: CrossAxisAlignment.start,
                                      //                       children: [
                                      //                         InkWell(
                                      //                           onTap: () {
                                      //                             b = 0;
                                      //                             a = -1;
                                      //                             setState(() {
                                      //                               if (caringcatlist[
                                      //                                           selctedtabind]
                                      //                                       .addons[index]
                                      //                                       .selected ==
                                      //                                   true) {
                                      //                                 caringcatlist[
                                      //                                         selctedtabind]
                                      //                                     .addons[index]
                                      //                                     .selected = false;
                                      //                                 var mon = money
                                      //                                     .split(' ');
                                      //                                 int aa = int.parse(
                                      //                                     mon[1]);
                                      //                                 money = (aa -
                                      //                                         caringcatlist[
                                      //                                                 selctedtabind]
                                      //                                             .addons[
                                      //                                                 index]
                                      //                                             .price)
                                      //                                     .toString();
                                      //                                 money = money =
                                      //                                     "\$ " + money;
                                      //                                 selectedaddonsList.remove(
                                      //                                     caringcatlist[
                                      //                                             selctedtabind]
                                      //                                         .addons[
                                      //                                             index]
                                      //                                         .id);
                                      //                                 selectedaddonsnameList
                                      //                                     .remove(caringcatlist[
                                      //                                             selctedtabind]
                                      //                                         .addons[
                                      //                                             index]
                                      //                                         .title);
                                      //                                 selectedaddonspriceList
                                      //                                     .remove(caringcatlist[
                                      //                                             selctedtabind]
                                      //                                         .addons[
                                      //                                             index]
                                      //                                         .price);
                                      //                               } else {
                                      //                                 caringcatlist[
                                      //                                         selctedtabind]
                                      //                                     .addons[index]
                                      //                                     .selected = true;
                                      //
                                      //                                 var mon = money
                                      //                                     .split(' ');
                                      //                                 int aa = int.parse(
                                      //                                     mon[1]);
                                      //                                 money = (aa +
                                      //                                         caringcatlist[
                                      //                                                 selctedtabind]
                                      //                                             .addons[
                                      //                                                 index]
                                      //                                             .price)
                                      //                                     .toString();
                                      //                                 money = money =
                                      //                                     "\$ " + money;
                                      //
                                      //                                 selectedaddonsList.add(
                                      //                                     caringcatlist[
                                      //                                             selctedtabind]
                                      //                                         .addons[
                                      //                                             index]
                                      //                                         .id);
                                      //                                 selectedaddonsnameList
                                      //                                     .add(caringcatlist[
                                      //                                             selctedtabind]
                                      //                                         .addons[
                                      //                                             index]
                                      //                                         .title);
                                      //                                 selectedaddonspriceList
                                      //                                     .add(caringcatlist[
                                      //                                             selctedtabind]
                                      //                                         .addons[
                                      //                                             index]
                                      //                                         .price);
                                      //                               }
                                      //                             });
                                      //                           },
                                      //                           child: Column(
                                      //                             children: [
                                      //                               Container(
                                      //                                 width: 90,
                                      //                                 height: 30,
                                      //                                 decoration: BoxDecoration(
                                      //                                     color: caringcatlist[selctedtabind]
                                      //                                                 .addons[
                                      //                                                     a]
                                      //                                                 .selected ==
                                      //                                             false
                                      //                                         ? Color(
                                      //                                             0xFFE4E4E4)
                                      //                                         : Color(
                                      //                                             0xFFFF0000),
                                      //                                     borderRadius: BorderRadius
                                      //                                         .all(Radius
                                      //                                             .circular(
                                      //                                                 5))),
                                      //                                 child: Center(
                                      //                                     child: Text(
                                      //                                         caringcatlist[selctedtabind]
                                      //                                                     .addons[
                                      //                                                         a]
                                      //                                                     .title ==
                                      //                                                 null
                                      //                                             ? "Bags/Discard"
                                      //                                             : caringcatlist[selctedtabind]
                                      //                                                 .addons[
                                      //                                                     a]
                                      //                                                 .title,
                                      //                                         style: TextStyle(
                                      //                                             fontFamily:
                                      //                                                 'rob',
                                      //                                             fontSize:
                                      //                                                 12,
                                      //                                             color: caringcatlist[selctedtabind].addons[a].selected ==
                                      //                                                     false
                                      //                                                 ? Colors.black
                                      //                                                 : Colors.white))),
                                      //                               ),
                                      //                               SizedBox(
                                      //                                 height: 5,
                                      //
                                      //                                 ///kal dehkta hai
                                      //                               ),
                                      //                               Container(
                                      //                                   width: 90,
                                      //                                   // color: Colors.blue,
                                      //                                   child: Center(
                                      //                                       child: Text(caringcatlist[selctedtabind]
                                      //                                                   .addons[
                                      //                                                       a]
                                      //                                                   .price ==
                                      //                                               null
                                      //                                           ? "15\$"
                                      //                                           : caringcatlist[selctedtabind]
                                      //                                                   .addons[a]
                                      //                                                   .price
                                      //                                                   .toString() +
                                      //                                               " \$"))),
                                      //                             ],
                                      //                           ),
                                      //                         ),
                                      //                       ],
                                      //                     ),
                                      //                   ),
                                      //
                                      //                 );
                                      //
                                      //
                                      //               }),
                                      //         ),
                                      //       ],
                                      //     );
                                      //   })),
                                      // ),
                                      ),
                                ],
                              )
                            : Container(),
                        l1.length >= 4
                            ? Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(left: 10),
                                    child: Text(catname[3]),
                                  ),
                                  Container(
                                      height: 90,
                                      width: MediaQuery.of(context).size.width,
                                      child: ListView.builder(
                                          padding: const EdgeInsets.all(8),
                                          scrollDirection: Axis.horizontal,
                                          itemCount:
                                              caringcatlist[selctedtabind]
                                                  .addons
                                                  .length,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return catname[3] ==
                                                    caringcatlist[selctedtabind]
                                                        .addons[index]
                                                        .cattitle
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            4.0),
                                                    child: InkWell(
                                                      onTap: () {
                                                        setState(() {
                                                          if (caringcatlist[
                                                                      selctedtabind]
                                                                  .addons[index]
                                                                  .selected ==
                                                              true) {
                                                            caringcatlist[
                                                                    selctedtabind]
                                                                .addons[index]
                                                                .selected = false;
                                                            var mon = money
                                                                .split(' ');
                                                            int aa = int.parse(
                                                                mon[1]);
                                                            money = (aa -
                                                                    caringcatlist[
                                                                            selctedtabind]
                                                                        .addons[
                                                                            index]
                                                                        .price)
                                                                .toString();
                                                            money = money =
                                                                "\$ " + money;
                                                            selectedaddonsList.remove(
                                                                caringcatlist[
                                                                        selctedtabind]
                                                                    .addons[
                                                                        index]
                                                                    .id);
                                                            selectedaddonsnameList
                                                                .remove(caringcatlist[
                                                                        selctedtabind]
                                                                    .addons[
                                                                        index]
                                                                    .title);
                                                            selectedaddonspriceList
                                                                .remove(caringcatlist[
                                                                        selctedtabind]
                                                                    .addons[
                                                                        index]
                                                                    .price);
                                                          } else {
                                                            caringcatlist[
                                                                    selctedtabind]
                                                                .addons[index]
                                                                .selected = true;

                                                            var mon = money
                                                                .split(' ');
                                                            int aa = int.parse(
                                                                mon[1]);
                                                            money = (aa +
                                                                    caringcatlist[
                                                                            selctedtabind]
                                                                        .addons[
                                                                            index]
                                                                        .price)
                                                                .toString();
                                                            money = money =
                                                                "\$ " + money;

                                                            selectedaddonsList.add(
                                                                caringcatlist[
                                                                        selctedtabind]
                                                                    .addons[
                                                                        index]
                                                                    .id);
                                                            selectedaddonsnameList
                                                                .add(caringcatlist[
                                                                        selctedtabind]
                                                                    .addons[
                                                                        index]
                                                                    .title);
                                                            selectedaddonspriceList
                                                                .add(caringcatlist[
                                                                        selctedtabind]
                                                                    .addons[
                                                                        index]
                                                                    .price);
                                                          }
                                                        });
                                                      },
                                                      child: Column(
                                                        children: [
                                                          Container(
                                                            width: 90,
                                                            height: 30,
                                                            decoration: BoxDecoration(
                                                                color: caringcatlist[selctedtabind]
                                                                            .addons[
                                                                                index]
                                                                            .selected ==
                                                                        false
                                                                    ? Color(
                                                                        0xFFE4E4E4)
                                                                    : Color(
                                                                        0xFFFF0000),
                                                                borderRadius: BorderRadius
                                                                    .all(Radius
                                                                        .circular(
                                                                            5))),
                                                            child: Center(
                                                                child: Text(
                                                                    caringcatlist[selctedtabind]
                                                                                .addons[
                                                                                    index]
                                                                                .title ==
                                                                            null
                                                                        ? "Bags/Discard"
                                                                        : caringcatlist[selctedtabind]
                                                                            .addons[
                                                                                index]
                                                                            .title,
                                                                    style: TextStyle(
                                                                        fontFamily:
                                                                            'rob',
                                                                        fontSize:
                                                                            12,
                                                                        color: caringcatlist[selctedtabind].addons[index].selected ==
                                                                                false
                                                                            ? Colors.black
                                                                            : Colors.white))),
                                                          ),
                                                          SizedBox(
                                                            height: 5,

                                                            ///kal dehkta hai
                                                          ),
                                                          Container(
                                                              width: 90,
                                                              // color: Colors.blue,
                                                              child: Center(
                                                                  child: Text(caringcatlist[selctedtabind]
                                                                              .addons[
                                                                                  index]
                                                                              .price ==
                                                                          null
                                                                      ? "15\$"
                                                                      : caringcatlist[selctedtabind]
                                                                              .addons[index]
                                                                              .price
                                                                              .toString() +
                                                                          " \$"))),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                : Container();
                                          })
                                      // child: SingleChildScrollView(
                                      //   child: Column(
                                      //       children: List.generate(l1.length, (index) {
                                      //         b += l1[index];
                                      //     return Column(
                                      //       children: [
                                      //         Text(caringcatlist[selctedtabind].addons[b-1].cattitle.toString()),
                                      //         Container(
                                      //           height: 80,
                                      //           child: ListView.builder(
                                      //               controller: scrollController,
                                      //               physics: const AlwaysScrollableScrollPhysics(),
                                      //               shrinkWrap: true,
                                      //               scrollDirection: Axis.horizontal,
                                      //               itemCount: l1[index],
                                      //               itemBuilder: (_, index) {
                                      //                 //return addons(caringcatlist[selctedtabind].addons[index]);
                                      //                 print(index);
                                      //                 ++a;
                                      //                 return InkWell(
                                      //                   onTap: () {},
                                      //                   child: Padding(
                                      //                     padding:
                                      //                         const EdgeInsets.all(10.0),
                                      //                     child: Row(
                                      //                       mainAxisAlignment:
                                      //                           MainAxisAlignment
                                      //                               .spaceBetween,
                                      //                       //crossAxisAlignment: CrossAxisAlignment.start,
                                      //                       children: [
                                      //                         InkWell(
                                      //                           onTap: () {
                                      //                             b = 0;
                                      //                             a = -1;
                                      //                             setState(() {
                                      //                               if (caringcatlist[
                                      //                                           selctedtabind]
                                      //                                       .addons[index]
                                      //                                       .selected ==
                                      //                                   true) {
                                      //                                 caringcatlist[
                                      //                                         selctedtabind]
                                      //                                     .addons[index]
                                      //                                     .selected = false;
                                      //                                 var mon = money
                                      //                                     .split(' ');
                                      //                                 int aa = int.parse(
                                      //                                     mon[1]);
                                      //                                 money = (aa -
                                      //                                         caringcatlist[
                                      //                                                 selctedtabind]
                                      //                                             .addons[
                                      //                                                 index]
                                      //                                             .price)
                                      //                                     .toString();
                                      //                                 money = money =
                                      //                                     "\$ " + money;
                                      //                                 selectedaddonsList.remove(
                                      //                                     caringcatlist[
                                      //                                             selctedtabind]
                                      //                                         .addons[
                                      //                                             index]
                                      //                                         .id);
                                      //                                 selectedaddonsnameList
                                      //                                     .remove(caringcatlist[
                                      //                                             selctedtabind]
                                      //                                         .addons[
                                      //                                             index]
                                      //                                         .title);
                                      //                                 selectedaddonspriceList
                                      //                                     .remove(caringcatlist[
                                      //                                             selctedtabind]
                                      //                                         .addons[
                                      //                                             index]
                                      //                                         .price);
                                      //                               } else {
                                      //                                 caringcatlist[
                                      //                                         selctedtabind]
                                      //                                     .addons[index]
                                      //                                     .selected = true;
                                      //
                                      //                                 var mon = money
                                      //                                     .split(' ');
                                      //                                 int aa = int.parse(
                                      //                                     mon[1]);
                                      //                                 money = (aa +
                                      //                                         caringcatlist[
                                      //                                                 selctedtabind]
                                      //                                             .addons[
                                      //                                                 index]
                                      //                                             .price)
                                      //                                     .toString();
                                      //                                 money = money =
                                      //                                     "\$ " + money;
                                      //
                                      //                                 selectedaddonsList.add(
                                      //                                     caringcatlist[
                                      //                                             selctedtabind]
                                      //                                         .addons[
                                      //                                             index]
                                      //                                         .id);
                                      //                                 selectedaddonsnameList
                                      //                                     .add(caringcatlist[
                                      //                                             selctedtabind]
                                      //                                         .addons[
                                      //                                             index]
                                      //                                         .title);
                                      //                                 selectedaddonspriceList
                                      //                                     .add(caringcatlist[
                                      //                                             selctedtabind]
                                      //                                         .addons[
                                      //                                             index]
                                      //                                         .price);
                                      //                               }
                                      //                             });
                                      //                           },
                                      //                           child: Column(
                                      //                             children: [
                                      //                               Container(
                                      //                                 width: 90,
                                      //                                 height: 30,
                                      //                                 decoration: BoxDecoration(
                                      //                                     color: caringcatlist[selctedtabind]
                                      //                                                 .addons[
                                      //                                                     a]
                                      //                                                 .selected ==
                                      //                                             false
                                      //                                         ? Color(
                                      //                                             0xFFE4E4E4)
                                      //                                         : Color(
                                      //                                             0xFFFF0000),
                                      //                                     borderRadius: BorderRadius
                                      //                                         .all(Radius
                                      //                                             .circular(
                                      //                                                 5))),
                                      //                                 child: Center(
                                      //                                     child: Text(
                                      //                                         caringcatlist[selctedtabind]
                                      //                                                     .addons[
                                      //                                                         a]
                                      //                                                     .title ==
                                      //                                                 null
                                      //                                             ? "Bags/Discard"
                                      //                                             : caringcatlist[selctedtabind]
                                      //                                                 .addons[
                                      //                                                     a]
                                      //                                                 .title,
                                      //                                         style: TextStyle(
                                      //                                             fontFamily:
                                      //                                                 'rob',
                                      //                                             fontSize:
                                      //                                                 12,
                                      //                                             color: caringcatlist[selctedtabind].addons[a].selected ==
                                      //                                                     false
                                      //                                                 ? Colors.black
                                      //                                                 : Colors.white))),
                                      //                               ),
                                      //                               SizedBox(
                                      //                                 height: 5,
                                      //
                                      //                                 ///kal dehkta hai
                                      //                               ),
                                      //                               Container(
                                      //                                   width: 90,
                                      //                                   // color: Colors.blue,
                                      //                                   child: Center(
                                      //                                       child: Text(caringcatlist[selctedtabind]
                                      //                                                   .addons[
                                      //                                                       a]
                                      //                                                   .price ==
                                      //                                               null
                                      //                                           ? "15\$"
                                      //                                           : caringcatlist[selctedtabind]
                                      //                                                   .addons[a]
                                      //                                                   .price
                                      //                                                   .toString() +
                                      //                                               " \$"))),
                                      //                             ],
                                      //                           ),
                                      //                         ),
                                      //                       ],
                                      //                     ),
                                      //                   ),
                                      //
                                      //                 );
                                      //
                                      //
                                      //               }),
                                      //         ),
                                      //       ],
                                      //     );
                                      //   })),
                                      // ),
                                      ),
                                ],
                              )
                            : Container(),
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
                                for (int i = 0; i < modaldata.length; i++) {
                                  globalCartList.add(CartModel(
                                    items_id: modaldata[i].id,
                                    item_quantity: modaldata[i].quantity,
                                    item_name: modaldata[i].title,
                                    item_description: modaldata[i].title,
                                    item_price: modaldata[i].price,
                                    total_price: (int.parse(
                                                modaldata[i].price) *
                                            int.parse(modaldata[i].quantity))
                                        .toString(),
                                  ));
                                }

                                for (int i = 0;
                                    i < selectedaddonsList.length;
                                    i++) {
                                  if (i == 0) {
                                    addons_id =
                                        selectedaddonsList[i].toString();
                                  } else {
                                    addons_id +=
                                        "," + selectedaddonsList[i].toString();
                                  }
                                }

                                print(addons_id);

                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => CarDriveAway()));
                              },
                              child: Container(
                                width: MediaQuery.of(context).size.width,
                                height: 50,
                                child: Card(
                                    color: coloring,
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
                  )
                ],
              ),
            );
          });
        });
    // showModalBottomSheet(
    //     backgroundColor: Colors.transparent,
    //     isScrollControlled: true,
    //     context: context,
    //     builder: (context) {
    //
    //     });
  }

  Widget inner(var subitemindex) {
    print(subitemindex);
    return ListView.builder(
        itemCount: valsubitem.length,
        scrollDirection: Axis.vertical,
        itemBuilder: (_, index1) {
          if (subitemindex == int.parse(valsubitem[index1].indexid) &&
              valcl.id.toString() == item.cid.toString()) {
            //print(subitemindex);
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                    left: 10,
                    right: 10,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        valsubitem[index1].quantity.toString(),
                        style:
                            //TextStyle(fontSize: h*0.019.sp),
                            Styles().openRegular(size: 11.0),
                      ),
                      SizedBox(
                        width: 3,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 4.2,
                        child: Text(
                          valsubitem[index1].title.toString(),
                          style:
                              //TextStyle(fontSize: h*0.019.sp),
                              Styles().openRegular(size: 11.0),
                          maxLines: 2,
                        ),
                      ),
                  //    Spacer(),
                      // Text(
                      //   valsubitem[index1].price.toString(),
                      //   style:
                      //       //TextStyle(fontSize: h*0.019.sp),
                      //       Styles().openRegular(size: 11.0),
                      // ),
                    ],
                  ),
                ),
              ],
            );
          }
          return Container();
          //valsubitem.clear();
        });
  }

  var valcl, sel;

  List<Widget> list() {
    valcarlist.clear();
    valsubitem.clear();
    valindex.clear();
    //

    return List<Widget>.generate(valhomecarid.length, (index) {
      valcarlist.clear();
      valsubitem.clear();
      valindex.clear();
      valsubpkgitemid.clear();
      //caringitem.clear();

      for (valcl in carlist) {
        //await Future.delayed(const Duration(seconds: 1), () {
        if (valhomecarid[uppertabindex].toString() == valcl.cid
            // &&
            // valhomecarcid[lowertabindex].toString() != 0.toString()
            ) {
          valcarlist.add(valcl);
          //valsubpkgitemid.clear();
          valsubpkgitemid.add(valcl.item.split(','));
          for (var c in valsubpkgitemid) {
            subItem(c);
          }
        }
      }

      return new Padding(
        padding: const EdgeInsets.only(
          left: 0,
          right: 0.0,
        ),
        child: StaggeredGridView.countBuilder(
          physics: AlwaysScrollableScrollPhysics(),
          controller: new ScrollController(keepScrollOffset: false),
          scrollDirection: Axis.vertical,
          crossAxisCount: 4,
          // addAutomaticKeepAlives: true,
          itemCount: valcarlist.length,

          itemBuilder: (context, index) {
            subitemindex = index + 1;
            //inner();
            return InkWell(
              onTap: () {
                setState(() {
                  for (int i = 0; i < valcarlist.length; i++) {
                    if (i == index) {
                      firstindex.clear();
                      if (valcarlist[i].selected == true) {
                        Globalind=false;
                        customizeflag = false;
                        valcarlist[i].selected = false;
                        //firstindex.clear();
                      } else {
                        Globalind=true;
                        selectindexsave = i;
                        money = valcarlist[index].money;
                        selectindex = index;
                        customizeflag = true;
                        valcarlist[i].selected = true;
                        pakgid = valcarlist[i].id;

                        firstindex.add(Selected(
                            indexx: i + 1,
                            money: valcarlist[index].money,
                            title: valcarlist[index].time));
                      }
                    } else {
                      valcarlist[i].selected = false;

                    }
                  }
                });
              },
              child: AnimatedContainer(
                duration: Duration(milliseconds: 300),
                decoration: BoxDecoration(
                    border: Border.all(
                        color: valcarlist[index].selected == true
                            ? Color(0xFFFF0000)
                            : Color(0xFFEFEFEF)),
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                height: valcarlist[index].selected == false ? 70 : 80,
                //height: CleaningRoomsTab.cleaningRoomsTabList[index].selected ==false ? 100.0.h:150.0.h,
                width: 160.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      height: 30,
                      decoration: BoxDecoration(
                          color: valcarlist[index].selected == true
                              ? Color(0xFFFF0000)
                              : Color(0xFFEFEFEF),
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(5),
                            topLeft: Radius.circular(5),
                          )),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: Center(
                          child: Container(
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                    width:
                                        MediaQuery.of(context).size.width / 4,
                                    height:
                                        MediaQuery.of(context).size.height / 30,
                                    child: Text(
                                      valcarlist[index].time,
                                      maxLines: 2,
                                      softWrap: true,
                                      style: Styles().openBold(
                                          size: 14.0,
                                          color:
                                              valcarlist[index].selected == true
                                                  ? Colors.white
                                                  : Colors.black),
                                    )),
                                Spacer(),
                                Text(
                                  valcarlist[index].money,
                                  style: Styles().openBold(
                                      size: 14.0,
                                      color: valcarlist[index].selected == true
                                          ? Colors.white
                                          : Colors.black),
                                ),
                               ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 3,
                    ),
                    // ListView.builder(
                    //   itemCount: valsubitem.length,
                    //   itemBuilder: (_,index){
                    //    return ;
                    // }),

                    Container(
                        height: 85,
                        child: inner (subitemindex)),

                    //Spacer(),
                    Expanded(
                        child: SingleChildScrollView(
                          child: InkWell(
                            child: Container(
                              width: 50,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    height: 15,
                                  ),
                                   alertD(),
                                ],
                              ),
                            ),
                            onTap: () {
                              if (firstindex.length != null && customizeflag == true) {
                                Model();
                                settingModalBottomSheet(context, Color(0xFFFF0000));
                              } else {
                                Fluttertoast.showToast(
                                    msg:
                                        "Please select your desired service first",
                                    toastLength: Toast.LENGTH_SHORT,
                                    gravity: ToastGravity.CENTER,
                                    timeInSecForIosWeb: 3,
                                    backgroundColor: Color(0xFFFF0000),
                                    textColor: Colors.white,
                                    fontSize: 16.0);
                                //  Model();
                              }
                            },
                          ),
                        ))
                  ],
                ),
              ),
            );
          },
          staggeredTileBuilder: (int index) =>
              //new StaggeredTile.fit(4),
              new StaggeredTile.count(2, valcarlist[index].selected == false ? 1.52 : 2),
          mainAxisSpacing: 10.0,
          crossAxisSpacing: 10.0,
        ),
      );
      //  }

      // return Container();
    });
  }

  @override
  void initState() {
    selctedtabind = 0;
    selectedaddonsList = new List();
    selectedaddonsnameList = new List();
    selectedaddonspriceList = new List();

    modaldata = new List();
    addons_id = null;
    super.initState();

    DataCalling1();

    //checkcontroller();
  }

  // Widget Customise(){
  //
  // }

  @override
  Widget build(BuildContext context) {
    //
    // pr.style(
    //     message: 'Please Waiting...',
    //     borderRadius: 10.0,
    //     backgroundColor: Colors.black,
    //     progressWidget: CircularProgressIndicator(),
    //     elevation: 10.0,
    //     insetAnimCurve: Curves.easeInOut,
    //     progress: 0.0,
    //     maxProgress: 100.0,
    //     progressTextStyle: TextStyle(
    //         color: Colors.white, fontSize: 13.0, fontWeight: FontWeight.w400),
    //     messageTextStyle: TextStyle(
    //         color: Colors.black, fontSize: 19.0, fontWeight: FontWeight.w600)
    // );
    //_selectedIndex;
    var size = MediaQuery.of(context).size;
    // void calc()
    // {
    //   for(int i=0;i<=caringcatlist.length;i++)
    //   {
    //     for(int j=0;j<=caringcatlist[i].addons.length;j++)
    //     {
    //       caringcatlist[i].addons[j].selected=false;
    //     }
    //   }
    // }
    // if(addons.isEmpty){
    //addons.addAll(caringcatlist[selctedtabind].addons);
    // }
    return SafeArea(
        child: Scaffold(
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.only(left: 10, right: 10, bottom: 20),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      //  width: MediaQuery.of(context).size.width/2.3 ,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        color:Globalind == true?Color(0xff1BD741):Color(0xFFBCBDC1),
                        textColor: Colors.grey,
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.black,
                        // padding: EdgeInsets.all(8.0),
                        splashColor: Colors.black12,
                        onPressed: () {
                          a = -1;
                          b = 0;
                          if (firstindex.length != null &&
                              customizeflag == true) {
                            Model();

                            settingModalBottomSheet(context, Color(0xFFFF0000));
                          } else {
                            Fluttertoast.showToast(
                                msg: "Please select your desired service first",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 3,
                                backgroundColor: Color(0xFFFF0000),
                                textColor: Colors.white,
                                fontSize: 16.0);
                            //  Model();
                          }
                          //valsubitem;
                        },
                        child: Text(
                          "CUSTOMIZE",
                          style: TextStyle(
                              fontSize: 10.0,
                              color:  Colors.white,
                              fontFamily: "opsb"),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      child: FlatButton(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),                        color:Globalind == true?Color(0xFFFF0000):Color(0xFFBCBDC1),

                     //   color: Color(0xFFFF0000),
                        textColor: Colors.white,
                        disabledColor: Colors.grey,
                        disabledTextColor: Colors.black,
                        //padding: EdgeInsets.all(8.0),
                        splashColor: Colors.red,
                        onPressed: () {
                          if (firstindex.length != null &&
                              customizeflag == true) {
                            Model();
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => CarDriveAway()));
                            // settingModalBottomSheet(context, Color(0xFFFF0000));
                          } else {
                            Fluttertoast.showToast(
                                msg: "Please select your desired service first",
                                toastLength: Toast.LENGTH_SHORT,
                                gravity: ToastGravity.CENTER,
                                timeInSecForIosWeb: 3,
                                backgroundColor: Color(0xFFFF0000),
                                textColor: Colors.white,
                                fontSize: 16.0);
                            //  Model();
                          }
                          // Navigator.push(context,
                          //     MaterialPageRoute(builder: (context) => cleaningLanding()));
                        },
                        child: Text("BOOK NOW", style: TextStyle(fontSize: 10.0, fontFamily: "opsb"),
                        ),
                      ),
                    )
                  ]),
            ),
            backgroundColor: Colors.white,
            body: SingleChildScrollView(
              child: Container(
                height: MediaQuery.of(context).size.height,
                child: Stack(children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: Container(
                      height: size.height / 5,
                      width: size.width / 2.5,
                      margin: EdgeInsets.only(top: 24, left: 0),
                      child: Opacity(
                        opacity: 1.0,
                        child: Image.asset(
                          'lib/assets/images/logo.png',
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 0, top: 30, right: 0),
                    child: SingleChildScrollView(
                      child: Container(
                        height: MediaQuery.of(context).size.height,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(height: 4),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 25, right: 30),
                              child: Row(
                                children: [
                                  InkWell(
                                      onTap: () => {Navigator.pop(context)},
                                      child: Icon(
                                        Icons.arrow_back_ios,
                                      )),
                                  SizedBox(width: 5),
                                  Padding(
                                    padding: const EdgeInsets.only(left: 2.0),
                                    child: Text("Cleaning",
                                        style: Styles().openBold(size: 18.0)),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 30, right: 30),
                              child: Text("Choose Service",
                                  style: Styles().openBold(size: 20.0)),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 30, right: 30),
                              child: Text("Drag to select your desired service",
                                  style: Styles().openRegular()),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Container(
                              height: MediaQuery.of(context).size.height / 4.2,
                              width: MediaQuery.of(context).size.width,
                              child: ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  itemCount: caringcatlist.length,
                                  itemBuilder: (context, index) {
                                    // pr.show();
                                    return Padding(
                                      padding: index == 0
                                          ? EdgeInsets.only(left: 20.0)
                                          : EdgeInsets.only(left: 0.0),
                                      child: InkWell(
                                        child: Container(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              2.4,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height /
                                              10,
                                          child: Card(
                                            color: selectedIndextab != null &&
                                                    selectedIndextab ==
                                                        caringcatlist[index].id
                                                ? Color(0xFFFF0000)
                                                : Color(0XFFBCBDC1),
                                            elevation: 0,
                                            shape: RoundedRectangleBorder(
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            child: Padding(
                                              padding: const EdgeInsets.only(
                                                  bottom: 8.0, left: 8),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 5.0),
                                                    child: Align(
                                                      alignment:
                                                          Alignment.topCenter,
                                                      child: Image.asset(
                                                        caringcatlist[index]
                                                            .img,
                                                        height: MediaQuery.of(
                                                                    context)
                                                                .size
                                                                .height /
                                                            8,
                                                        width: 140,
                                                      ),
                                                    ),
                                                  ),
                                                  Spacer(),
                                                  Text(
                                                    caringcatlist[index].title,
                                                    textAlign: TextAlign.left,
                                                    style: Styles().openBold(
                                                        size: 18.0,
                                                        color: Colors.white),
                                                  ),
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            top: 0.0),
                                                    child: Text(
                                                      caringcatlist[index]
                                                          .subText,
                                                      style: Styles().openBold(
                                                          size: 10.0,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          //   caring: caring[index],
                                        ),
                                        onTap: () {
                                          setState(() {
                                            selctedtabind = index;

                                            var title = "";
                                            l1.clear();
                                            for (int i = 0;
                                                i <
                                                    caringcatlist[selctedtabind]
                                                        .addons
                                                        .length;
                                                i++) {
                                              if (title !=
                                                  caringcatlist[selctedtabind]
                                                      .addons[i]
                                                      .cattitle) {
                                                l1.add(
                                                    countOccurrencesUsingWhereMethod(
                                                        caringcatlist[
                                                                selctedtabind]
                                                            .addons,
                                                        caringcatlist[
                                                                selctedtabind]
                                                            .addons[i]
                                                            .cattitle));
                                                title =
                                                    caringcatlist[selctedtabind]
                                                        .addons[i]
                                                        .cattitle;
                                              }
                                            }
                                            catname.clear();
                                            for (int i = 0;
                                                i <
                                                    caringcatlist[selctedtabind]
                                                        .addons
                                                        .length;
                                                i++) {
                                              if (catname.contains(
                                                  caringcatlist[selctedtabind]
                                                      .addons[i]
                                                      .cattitle)) {
                                              } else {
                                                catname.add(
                                                    caringcatlist[selctedtabind]
                                                        .addons[i]
                                                        .cattitle);
                                              }
                                            }
                                            // addons =
                                            //     caringcatlist[selctedtabind]
                                            //         .addons;

                                            _onSelected(
                                                caringcatlist[index].id);
                                            subpkgname =
                                                caringcatlist[index].title;

                                            //DataCalling1();
                                            //valid=controller.index;
                                            uppertabindex = 0;
                                            lowertabindex = 0;
                                            if (uppertabindex == 0) {
                                              valcarlist.clear();
                                              valsubitem.clear();
                                              valindex.clear();
                                              //caringitem.clear();
                                              checkcontroller();
                                            }
                                          });
                                        },
                                      ),
                                    );
                                  }),
                            ),
                            SizedBox(
                              height: 3,
                            ),
                            SingleChildScrollView(
                              child: Container(
                                  child: Padding(
                                padding:
                                    const EdgeInsets.only(left: 30, right: 30),
                                child: Container(
                                  child: SafeArea(
                                    child: SingleChildScrollView(
                                      child: Container(
                                        //width: MediaQuery.of(context).size.width,
                                        color: Colors.white,
                                        child: Stack(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                left: 0,
                                              ),
                                              child: Column(
                                                // mainAxisAlignment: MainAxisAlignment.start,
                                                // crossAxisAlignment: CrossAxisAlignment.start,
                                                children: [
                                                  DefaultTabController(
                                                    length: valcarlist.length,
                                                    initialIndex: 0,
                                                    child:
                                                        SingleChildScrollView(
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          SingleChildScrollView(
                                                            scrollDirection:
                                                                Axis.horizontal,
                                                            child: Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .start,
                                                              children: [
                                                                bool
                                                                    ? TabBar(
                                                                        isScrollable:
                                                                            true,
                                                                        controller:
                                                                            controller,
                                                                        unselectedLabelColor:
                                                                            Colors.grey,
                                                                        labelColor:
                                                                            Colors.black,
                                                                        labelPadding:
                                                                            EdgeInsets.only(right: 20),
                                                                        indicatorColor:
                                                                            Colors.transparent,
                                                                        tabs: List<Widget>.generate(
                                                                            valhomecarname.length,
                                                                            (int
                                                                                index) {
                                                                          return new Container(
                                                                            //height:MediaQuery.of(context).size.width/6 ,
                                                                            // width: MediaQuery.of(context).size.width,
                                                                            margin:
                                                                                EdgeInsets.only(left: 12),
                                                                            //alignment: Alignment.center,
                                                                            child:
                                                                                Text(
                                                                              '${valhomecarname[index]}',
                                                                              style: Styles().openBold(size: 22.0),
                                                                            ),
                                                                          );
                                                                        }).toList(),
                                                                      )
                                                                    : Container(),
                                                              ],
                                                            ),
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SingleChildScrollView(
                                                                child: Padding(
                                                                  padding: const EdgeInsets
                                                                          .only(
                                                                      left: 0,
                                                                      top: 0,
                                                                      right: 0),
                                                                  child:
                                                                      Container(
                                                                    //  margin: EdgeInsets.only(bottom: 10),
                                                                    height: MediaQuery.of(context)
                                                                            .size
                                                                            .height /
                                                                        1.9,
                                                                    child: bool
                                                                        ? TabBarView(
                                                                            controller:
                                                                                controller,
                                                                            children:
                                                                                list().toList(),
                                                                          )
                                                                        : Container(),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  height:
                                      MediaQuery.of(context).size.height / 2,
                                ),
                              )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ]),
              ),
            )));
  }
}
