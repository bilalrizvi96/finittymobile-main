import 'package:charles_app/BaseUrl/variableGloable.dart';
import 'package:charles_app/Model/Newbookingmodal.dart';
import 'package:charles_app/View/bottom.dart';
import 'package:charles_app/bookingids.dart';
import 'package:charles_app/muben/messeges.dart';
import 'package:charles_app/widgets/NewRequestsBooking.dart';
import 'package:charles_app/widgets/OnGoingBooking.dart';
import 'package:charles_app/widgets/PastBooking.dart';
import 'package:flutter/material.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:table_calendar/table_calendar.dart';
import 'API/API.dart';
import 'View/Homepage/Home.dart';

// Example holidays
final Map<DateTime, List> _holidays = {
  DateTime(2020, 1, 1): ['New Year\'s Day'],
  DateTime(2020, 1, 6): ['Epiphany'],
  DateTime(2020, 2, 14): ['Valentine\'s Day'],
  DateTime(2020, 4, 21): ['Easter Sunday'],
  DateTime(2020, 4, 22): ['Easter Monday'],
};

// void main() {
//   initializeDateFormatting().then((_) => runApp(Booking()));
// }

class Booking extends StatefulWidget {

  @override
  _BookingState createState() => _BookingState();
}

class _BookingState extends State<Booking> with TickerProviderStateMixin {
  Map<DateTime, List> _events;
  List _selectedEvents;
  AnimationController _animationController;
  CalendarController _calendarController;
  TabController _tabController;

  @override
  void initState() {

    super.initState();
    _tabController = new TabController(length: 4, vsync: this);
    _calendarController = CalendarController();
     API.newbookings(newbookingAPI+userid);
     API.OnGoingbookings(OngoingbookingAPI+userid);
     API.Completebookings(CompletebookingAPI+userid);
  }

  @override
  void dispose(){
    _animationController.dispose();
    _calendarController.dispose();
    _tabController.dispose();
    super.dispose();
  }

  void _onDaySelected(DateTime day, List events, List holidays) {
    print('CALLBACK: _onDaySelected');
    setState(() {
      _selectedEvents = events;
    });
  }

  void _onVisibleDaysChanged(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onVisibleDaysChanged');
  }

  void _onCalendarCreated(
      DateTime first, DateTime last, CalendarFormat format) {
    print('CALLBACK: _onCalendarCreated');
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: new Scaffold(
        appBar: new AppBar(
          leading: InkWell(
              onTap: (){
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => home_sc(inde: 2,)));
               // Navigator.of(context).pop();
                // Navigator.push(
                //     context,
                //     MaterialPageRoute(
                //       builder: (_) =>Mainpage(),
                //     ));
              },
              child: Icon(Icons.arrow_back_ios,color: Colors.black,)

          ),
          backgroundColor: Colors.white,
          toolbarHeight: 130,

          title: new Text("My Bookings" , style: TextStyle(color: Colors.black,fontWeight:FontWeight.bold,fontSize: 18),),
          bottom: TabBar(
            indicator: UnderlineTabIndicator(
              borderSide: BorderSide(width:2,color: Color(0xFFFF0000),style: BorderStyle.solid),
              insets: EdgeInsets.symmetric(horizontal:16.0),
            ),
            unselectedLabelColor: Color(0xFF52545D),
            labelColor:Color(0xFF52545D),
            isScrollable: true,
            tabs: [
              new Tab( text: "Calender",),
              new Tab(text: "New Requests"),
              new Tab(text: "Ongoing"),
              new Tab(text: "Past Booking")
            ],
            controller: _tabController,
            indicatorSize: TabBarIndicatorSize.tab,),
          bottomOpacity: 1,
        ),
        body: TabBarView(
          children: [
            CalenderTabView(),
            NewRequest(),
            OngoingBooking(),
            PastBooking(),
          ],
          controller: _tabController,),
      ),
    );
  }


  Widget CalenderTabView(){

    return Container(
      color: Colors.white,
      child: SingleChildScrollView(
        child: Stack(
          children: [
            // Padding(
            //   padding: const EdgeInsets.only(left:180.0),
            //   child: Container(
            //     alignment: Alignment.topRight,
            //     height: 210,
            //     width: 250,
            //     child: Opacity(
            //         opacity: 0.3,
            //         child: Image.asset("lib/assets/images/logo.png")),
            //   ),
            // ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              // mainAxisSize: MainAxisSize.max,
              children: <Widget>[
                // Switch out 2 lines below to play with TableCalendar's settings
                //-----------------------
                // SizedBox(height: 20,),
                // Row(
                //   children: [
                //     InkWell(
                //         onTap: ()=>{
                //           Navigator.pop(context)
                //         },
                //         child: Icon(Icons.arrow_back_ios,)
                //     ),
                //     Padding(
                //       padding: const EdgeInsets.only(left:12.0),
                //       child: Text("My Bookings", style: TextStyle(fontWeight:FontWeight.bold,fontSize: 18),),
                //     ),
                //     // searchAnimate(),
                //   ],
                // ),
                SizedBox(height: 10,),
                _buildTableCalendar(),
                // _buildTableCalendarWithBuilders(),
                const SizedBox(height: 8.0),
                _buildButtons(),
                const SizedBox(height: 8.0),
              ],
            ),
          ],
        ),
      ),

    );
  }

  // Simple TableCalendar configuration (using Styles)
  Widget _buildTableCalendar() {
    return TableCalendar(
      calendarController: _calendarController,
      events: _events,
      holidays: _holidays,
      startingDayOfWeek: StartingDayOfWeek.monday,
      calendarStyle: CalendarStyle(
        selectedColor:Color(0xFFFF0000),
        todayColor: Color(0xFFFF0000),
        markersColor: Colors.brown[700],
        outsideDaysVisible: false,
      ),
      headerStyle: HeaderStyle(
        formatButtonTextStyle:
        TextStyle().copyWith(color: Colors.white, fontSize: 15.0),
        formatButtonDecoration: BoxDecoration(
          color:Color(0xFFFF0000),
          borderRadius: BorderRadius.circular(16.0),
        ),
      ),
      onDaySelected: _onDaySelected,
      startDay:  DateTime.now().subtract(Duration(days: 0)),
      onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: _onCalendarCreated,
    );
  }

  // More advanced TableCalendar configuration (using Builders & Styles)
  Widget _buildTableCalendarWithBuilders() {
    return TableCalendar(
      locale: 'pl_PL',
      calendarController: _calendarController,
      events: _events,
      holidays: _holidays,
      initialCalendarFormat: CalendarFormat.month,
      formatAnimation: FormatAnimation.slide,
      startingDayOfWeek: StartingDayOfWeek.sunday,
      availableGestures: AvailableGestures.all,
      availableCalendarFormats: const {
        CalendarFormat.month: '',
        CalendarFormat.week: '',
      },
      calendarStyle: CalendarStyle(
        outsideDaysVisible: false,
        weekendStyle: TextStyle().copyWith(color: Colors.blue[800]),
        holidayStyle: TextStyle().copyWith(color: Colors.blue[800]),
      ),
      daysOfWeekStyle: DaysOfWeekStyle(
        weekendStyle: TextStyle().copyWith(color: Colors.blue[600]),
      ),
      headerStyle: HeaderStyle(
        centerHeaderTitle: true,
        formatButtonVisible: false,
      ),
      builders: CalendarBuilders(
        selectedDayBuilder: (context, date, _) {
          return FadeTransition(
            opacity: Tween(begin: 0.0, end: 1.0).animate(_animationController),
            child: Container(
              margin: const EdgeInsets.all(4.0),
              padding: const EdgeInsets.only(top: 5.0, left: 6.0),
              color: Colors.deepOrange[300],
              width: 100,
              height: 100,
              child: Text(
                '${date.day}',
                style: TextStyle().copyWith(fontSize: 16.0),
              ),
            ),
          );
        },
        todayDayBuilder: (context, date, _) {
          return Container(
            margin: const EdgeInsets.all(4.0),
            padding: const EdgeInsets.only(top: 5.0, left: 6.0),
            color: Colors.amber[400],
            width: 100,
            height: 100,
            child: Text(
              '${date.day}',
              style: TextStyle().copyWith(fontSize: 16.0),
            ),
          );
        },
        markersBuilder: (context, date, events, holidays) {
          final children = <Widget>[];

          if (events.isNotEmpty) {
            children.add(
              Positioned(
                right: 1,
                bottom: 1,
                child: _buildEventsMarker(date, events),
              ),
            );
          }

          if (holidays.isNotEmpty) {
            children.add(
              Positioned(
                right: -2,
                top: -2,
                child: _buildHolidaysMarker(),
              ),
            );
          }

          return children;
        },
      ),
      onDaySelected: (date, events, holidays) {
        _onDaySelected(date, events, holidays);
        _animationController.forward(from: 0.0);
      },
      onVisibleDaysChanged: _onVisibleDaysChanged,
      onCalendarCreated: _onCalendarCreated,
    );
  }

  Widget _buildEventsMarker(DateTime date, List events) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      decoration: BoxDecoration(
        shape: BoxShape.rectangle,
        color: _calendarController.isSelected(date)
            ? Colors.brown[500]
            : _calendarController.isToday(date)
            ? Colors.brown[300]
            : Colors.blue[400],
      ),
      width: 16.0,
      height: 16.0,
      child: Center(
        child: Text(
          '${events.length}',
          style: TextStyle().copyWith(
            color: Colors.white,
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }

  Widget _buildHolidaysMarker() {
    return Icon(
      Icons.add_box,
      size: 20.0,
      color: Colors.blueGrey[800],
    );
  }

  // Widget OnGoingTabViewButtons(){
  //   return Center(
  //     child: Card(
  //       elevation: 2,
  //       child: Container(
  //         height: 50,
  //         width: MediaQuery.of(context).size.width/1.1,
  //         decoration: BoxDecoration(
  //           color: Colors.white,
  //           borderRadius: BorderRadius.all(Radius.circular(5)),
  //         ),
  //         child: Row(
  //           // mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             SizedBox(width: 5,),
  //
  //             Container(
  //               height: 10,
  //               width: 10,
  //               decoration: BoxDecoration(
  //                 color: color,
  //                 borderRadius: BorderRadius.all(Radius.circular(25)),
  //               ),
  //             ),
  //             SizedBox(width: 10,),
  //             Column(
  //               crossAxisAlignment: CrossAxisAlignment.start,
  //               mainAxisAlignment: MainAxisAlignment.center,
  //               children: [
  //                 Text(series,style: TextStyle(fontSize: 9,fontFamily: 'opsr',color: Colors.black),),
  //                 Text(date,style: TextStyle(fontSize: 9,fontFamily: 'opsr',color: Colors.grey),),
  //               ],
  //             ),
  //             Spacer(),
  //             Container(
  //               width: 70,
  //               height: 30,
  //               decoration: BoxDecoration(
  //                 color: Colors.red,
  //                 borderRadius: BorderRadius.all(Radius.circular(25)),
  //               ),
  //               child: Center(child: Text(message,style: TextStyle(color: Colors.white,fontSize: 10),)),
  //             ),
  //             SizedBox(width: 10,),
  //             Container(
  //               width: 50,
  //               height: 30,
  //               decoration: BoxDecoration(
  //                 color: color,
  //                 borderRadius: BorderRadius.all(Radius.circular(25)),
  //               ),
  //               child: Center(child: Text(jobs,style: TextStyle(color: Colors.white,fontSize: 10),)),
  //             ),
  //             SizedBox(width: 10,),
  //             Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 14,),
  //             SizedBox(width: 10,),
  //           ],
  //         ),
  //       ),
  //     ),
  //   );
  // }

  Widget container(Color color,String series,String date,String message,String jobs){
    return Center(
      child: Card(
        elevation: 2,
        child: Container(
          height: 50,
          width: MediaQuery.of(context).size.width/1.1,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(5)),
          ),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(width: 5,),

              Container(
                height: 10,
                width: 10,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
              ),
              SizedBox(width: 10,),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(series,style: TextStyle(fontSize: 9,fontFamily: 'opsr',color: Colors.black),),
                  Text(date,style: TextStyle(fontSize: 9,fontFamily: 'opsr',color: Colors.grey),),
                ],
              ),
              Spacer(),
              Container(
                width: 70,
                height: 30,
                decoration: BoxDecoration(
                  color:Color(0xFFFF0000),
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                child: Center(child: Text(message,style: TextStyle(color: Colors.white,fontSize: 10),)),
              ),
              SizedBox(width: 10,),
              Container(
                width: 50,
                height: 30,
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                ),
                child: Center(child: Text(jobs,style: TextStyle(color: Colors.white,fontSize: 10),)),
              ),
              SizedBox(width: 10,),
              Icon(Icons.arrow_forward_ios,color: Colors.grey,size: 14,),
              SizedBox(width: 10,),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildButtons() {

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Padding(
          padding: EdgeInsets.only(left: 20,top: 20),
          child:
          Text("Upcoming Jobs",style: TextStyle(fontSize: 11,fontFamily: 'opsr'),),
        ),
        SizedBox(height: 10,),
        InkWell(
            onTap: (){
              Navigator.push(context,
                  MaterialPageRoute(builder: (context) => Messeges()));
            },
            child: container(Colors.green, 'Complete Services', 'October, 28 2020', 'Message', '1 Jobs')),
        SizedBox(height: 10,),

        container(Color.fromRGBO(255, 177, 51, 1), 'Ongoing Services', 'October, 7 2020', 'Message', '1 Jobs'),
        SizedBox(height: 10,),

        container(Color.fromRGBO(243, 76, 67, 1), 'Cancel Services', 'October, 28 2020', 'Message', '1 Jobs'),


      ],
    );
  }

}