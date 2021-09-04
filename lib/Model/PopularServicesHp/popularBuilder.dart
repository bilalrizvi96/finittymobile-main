import 'package:charles_app/Model/PopularServicesHp/popularCard.dart';
import 'package:charles_app/Model/PopularServicesHp/popularList.dart';
import 'package:flutter/material.dart';


class PServicebuilder extends StatefulWidget {
  @override
  _PServicebuilderState createState() => _PServicebuilderState();
}

class _PServicebuilderState extends State<PServicebuilder> {
  List<PopularServices> pservicesvar;
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    pservicesvar = pservices;
  }

  @override
  Widget build(BuildContext context) {
    if (pservices == null) pservices = [];
    return Container(
      padding: EdgeInsets.only(left: 10),
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height / 4.7,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: pservices.length,
          itemBuilder: (_, index) {
            return PserviceCard(
              pservices: pservices[index],
            );
          }

          ),
    );
  }
}