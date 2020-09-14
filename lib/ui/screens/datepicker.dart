import 'package:flutter/material.dart';

class DatePicker extends StatelessWidget {
  const DatePicker({
    Key key,
    @required this.onTap,
    @required this.date,
  }) : super(key: key);

  final Function onTap;
  final String date;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.all(8.0),
        margin: EdgeInsets.all(8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          color: Colors.grey[200],
        ),
        child: Text(
          date,
          style: TextStyle(
            fontSize: 16.0,
          ),
        ),
      ),
    );
  }
}