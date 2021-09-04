import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'RoundedIconButton.dart';

class CustomStepper extends StatefulWidget {
  CustomStepper({
    @required this.lowerLimit,
    @required this.upperLimit,
    @required this.stepValue,
    @required this.iconSize,
    @required this.value,
  });
  final int lowerLimit;
  final int upperLimit;
  final int stepValue;
  final double iconSize;
  int value;

  @override
  _CustomStepperState createState() => _CustomStepperState();
}

class _CustomStepperState extends State<CustomStepper> {

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          width: 20,
          child: RoundedIconButton(
            icon: Icons.remove,
            iconSize: widget.iconSize,
            onPress: () {
              setState(() {
                widget.value =
                widget.value == widget.lowerLimit ? widget.lowerLimit : widget.value -= widget.stepValue;
              });
            },
          ),
        ),
        Card(
          elevation: 1,
          child: Container(
            width: 20,
            child: Text(
              '${widget.value}',
              style: TextStyle(
                fontSize: widget.iconSize * 0.8,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ),
        Container(
          width: 20,
          child: RoundedIconButton(
            icon: Icons.add,
            iconSize: widget.iconSize,
            onPress: () {
              setState(() {
                widget.value =
                widget.value == widget.upperLimit ? widget.upperLimit : widget.value += widget.stepValue;
              });
            },
          ),
        ),
      ],
    );
  }
}
