import 'package:charles_app/Model/RecommendationHp/recomCard.dart';
import 'package:charles_app/Model/RecommendationHp/recomList.dart';
import 'package:flutter/material.dart';

class Recommendationbuilder extends StatefulWidget {
  @override
  _RecommendationbuilderState createState() => _RecommendationbuilderState();
}

class _RecommendationbuilderState extends State<Recommendationbuilder> {
  List<Recommended> recommendedvar;
  TextEditingController searchController = TextEditingController();
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    recommendedvar = recommended;
  }

  @override
  Widget build(BuildContext context) {
    if (recommended == null) recommended = [];
    return Container(
      padding: EdgeInsets.only(left: 10),
      alignment: Alignment.center,
      height: MediaQuery.of(context).size.height / 5,
      width: MediaQuery.of(context).size.width,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: recommended.length,
          itemBuilder: (_, index) {
            return RecommendedCard(
              recommended: recommended[index],
            );
          }),
    );
  }
}