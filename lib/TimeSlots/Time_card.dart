
import 'package:charles_app/BaseUrl/variableGloable.dart';
import 'package:charles_app/TimeSlots/TimeSlotModel.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class TimeSlotsCard extends StatefulWidget {
  TimeSlots timeSlotss;
  Function set;


  TimeSlotsCard({Key key, this.timeSlotss,this.set }) : super(key: key);
  @override
  TimeSlotsState createState() =>TimeSlotsState(this.timeSlotss,this.set);

}
class TimeSlotsState extends State<TimeSlotsCard> {

   TimeSlots timeSlots;
   Function set;

  @override
  void initState() {
    // TODO: implement initState

    // img(image);


    super.initState();
    //img(image);

  }
   TimeSlotsState(this.timeSlots,this.set);


  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(right: 50,left: 50),
      child: Column(
        children: [
          InkWell(
            onTap: (){
              setState(() {
                prefertime=timeSlots.time;
              });

              Navigator.pop(context);
            },

            child: Container(
              height: 70,
                width: 260,
                child: Center(child: Text(timeSlots.time , style:  TextStyle(fontSize: 22,fontWeight: FontWeight.bold),))
            ),
          ),
          Divider( thickness: 1.5,)
        ],
      ),
    );
  }
}