import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Result extends StatefulWidget {
  final String note;
  final int bmi;
  final String image;
  Result({this.note, this.bmi, this.image});
  @override
  _ResultState createState() => _ResultState();
}

class _ResultState extends State<Result> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Center(
              child: Container(
                height: 200,
                width: 200,
                child: SvgPicture.asset(widget.image),
              ),
            ),
            SizedBox(
              height: 8,
            ),
            Text(
              "Your BMI is ${widget.bmi}",
              style: TextStyle(
                  color: Colors.red[700],
                  fontSize: 34,
                  fontWeight: FontWeight.w700),
            ),
            Text(
              "${widget.note}",
              style: TextStyle(
                  color: Colors.grey[700],
                  fontSize: 18,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 16,
            ),
            Container(
              child: FlatButton.icon(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: Icon(Icons.arrow_back),
                label: Text("Let CALCULATE AGAIN "),
                textColor: Colors.white,
                color: Colors.pink,
              ),
              width: double.infinity,
              padding: EdgeInsets.only(left: 16, right: 16),
            )
          ],
        ),
      ),
    );
  }
}
