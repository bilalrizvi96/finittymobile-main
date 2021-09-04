import 'package:charles_app/View/Cleaning/cleaningView.dart';
import 'package:charles_app/widgets/bottomModal.dart';
import 'package:flutter/material.dart';
import '../../widgets/widgets.dart';

class alertD extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // cleaningView().settingModalBottomSheet(context,Color(0xFFFF0000));
      // showDialog(
      //     context: context,
      //     builder: (_) {
      //       return MyDialog();
      //     });
    },
      // child: Container(
      //       child: Text('Edit', style: Styles().openBold(size: 14.0)),
      //     ),
    );
  }
}
class MyDialog extends StatefulWidget {
  @override
  _MyDialogState createState() => new _MyDialogState();
}

class _MyDialogState extends State<MyDialog> {
  int number=0;

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Row(
        children: [
          Text("Customized "),
          Spacer(),
         Text("\$ 70")

        ],
      ),

      content: Container(
        height: 100,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Add Addtional Terms"),
            Row(
              children: [
                Text("Hours"),
                Spacer(),
                Container(
                  height: 10,
                  color: Colors.blue,
                  child: FlatButton(
                    child: Text('-'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)
                    ),
                    onPressed: (){
                      setState(() {
                        number != 0
                            ? number = number - 1
                            : number = number;
                      });
                    },),
                ),
                Text('$number'),

                Container(
                  height: 10,
                  color: Colors.blue,
                  child: FlatButton(
                    child: Text('+'),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(100)
                    ),
                    onPressed: (){
                      setState(() {
                        number = number +1;
                      });

                    },),
                ),


              ],
            ),


            SizedBox(height: 10,),
            Container(
              width: MediaQuery.of(context).size.width,
              //color: Colors.green,
              decoration:BoxDecoration(
                  color: Color(0xFFFA4770),
                  borderRadius:BorderRadius.circular(10)
              ),

              child: FlatButton(
                child: new Text('Book Now',style: TextStyle(color: Colors.white),),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ),

          ],
        ),
      ),
    );


  }
}