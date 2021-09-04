
import 'package:charles_app/BaseUrl/variableGloable.dart';
import 'package:flutter/material.dart';
import 'TimeSlotModel.dart';
import 'Time_card.dart';


class TimetList extends StatefulWidget {
  Function set;
  TimetList({this.set});
  @override
  _TimetListPageState createState() => _TimetListPageState();

}
class _TimetListPageState extends State<TimetList> {
  void set()
  {
    setState(() {

    });
  }

  List<TimeSlots> TimeResults;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    TimeResults = timeslotslist;

  }
  @override
  Widget build(BuildContext context) {
    if(timeslotslist==null)
      timeslotslist = [];
    return  Container(
      width: MediaQuery.of(context).size.width*0.65,
      height: MediaQuery.of(context).size.height*0.58,
      child: ListView.builder(
        shrinkWrap: true,
         // physics: NeverScrollableScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: timeslotslist.length,
          itemBuilder: (_, index) {

            return TimeSlotsCard(
              timeSlotss: timeslotslist[index],
              set: set,
            );
          }
      ),
    );
  }
}