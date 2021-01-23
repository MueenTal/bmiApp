import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'Result.dart';

class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  double _height = 100.0;
  double _weight = 40.0;
  double _bmi = 0;
  String note = "";
  String image = "";

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                gradient:
                    LinearGradient(colors: [Colors.purple, Colors.deepPurple])),
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    height: 200,
                    width: 200,
                    child: SvgPicture.asset("assets/images/heart.svg"),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "BMI Calculator ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 34,
                    fontWeight: FontWeight.w700),
              )
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            margin:
                EdgeInsets.only(top: MediaQuery.of(context).size.height / 2.8),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(38),
                    topRight: Radius.circular(38))),
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Height",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 24,
                        fontWeight: FontWeight.w400),
                  ),
                  Container(
                    padding: EdgeInsets.all(13),
                    child: Slider(
                      min: 80,
                      max: 250,
                      onChanged: (height) {
                        setState(() {
                          _height = height;
                        });
                      },
                      value: _height,
                      divisions: 340,
                      activeColor: Colors.purpleAccent,
                      label: "$_height",
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "$_height CM ",
                    style: TextStyle(
                        color: Colors.purpleAccent,
                        fontSize: 24,
                        fontWeight: FontWeight.w900),
                  ),
                  SizedBox(
                    height: 25,
                  ),
                  Text(
                    "Weight",
                    style: TextStyle(
                        color: Colors.grey,
                        fontSize: 24,
                        fontWeight: FontWeight.w400),
                  ),
                  Container(
                    padding: EdgeInsets.all(13),
                    child: Slider(
                      min: 30,
                      max: 150,
                      onChanged: (weight) {
                        setState(() {
                          _weight = weight;
                        });
                      },
                      value: _weight,
                      divisions: 240,
                      activeColor: Colors.purpleAccent,
                      label: "$_weight",
                    ),
                  ),
                  SizedBox(
                    height: 5,
                  ),
                  Text(
                    "$_weight Kgm ",
                    style: TextStyle(
                        color: Colors.purpleAccent,
                        fontSize: 24,
                        fontWeight: FontWeight.w900),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Container(
                      height: 60,
                      width: MediaQuery.of(context).size.width / 1.3,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(
                            Radius.circular(30),
                          ),
                          gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.white,
                                Colors.purpleAccent,
                                Colors.purpleAccent,
                                Colors.purpleAccent,
                                Colors.white,
                              ])),
                      child: FlatButton.icon(
                        icon: Icon(
                          Icons.favorite,
                          color: Colors.white,
                        ),
                        label: Text(
                          "Calculate",
                          style: TextStyle(color: Colors.white, fontSize: 25),
                        ),
                        onPressed: () {
                          setState(() {
                            _bmi =
                                _weight / ((_height / 100) * (_height / 100));
                            if (_bmi < 18.5) {
                              note = "You are Underweighted";
                              image = "assets/images/sad.svg";
                            } else if (_bmi > 18.5 && _bmi < 24.9) {
                              note = "You are Totaly Fit";
                              image = "assets/images/happy.svg";
                            } else if (_bmi > 25 && _bmi < 29.9) {
                              note = "You are Overweighted";
                              image = "assets/images/sad.svg";
                            } else if (_bmi > 30) {
                              note = "You are Obesed";
                              image = "assets/images/sad.svg";
                            }
                          });
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Result(
                                        note: note,
                                        image: image,
                                        bmi: _bmi.toInt(),
                                      )));
                        },
                      ),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    ));
  }
}
