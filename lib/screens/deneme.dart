import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'dart:async';
import '../globals/colors.dart';

class Deneme extends StatefulWidget {
  const Deneme({Key? key}) : super(key: key);

  @override
  State<Deneme> createState() => _DenemeState();
}

const Color _kAppColor = Color(0xFFFDDE6F);
const double _kSize = 100;

class _DenemeState extends State<Deneme> {
  int myVariable = -1;

  @override
  Widget build(BuildContext context) {
    Future<void> asd() async {
      myVariable == 0
          ? showDialog<void>(
              context: context,
              barrierDismissible: false, // user must tap button!
              builder: (BuildContext context) {
                return AlertDialog(
                  content: SingleChildScrollView(
                    child: Column(
                      children: [
                        Container(
                          padding: EdgeInsets.only(top: 25),
                          alignment: Alignment.center,
                          child: LoadingAnimationWidget.discreteCircle(
                              color: darkPinkColor,
                              size: _kSize,
                              secondRingColor: blackColor,
                              thirdRingColor: lightPinkColor),
                        ),
                        Container(
                            padding: EdgeInsets.only(bottom: 25),
                            margin: EdgeInsets.only(top: 25),
                            alignment: Alignment.center,
                            child: Text(
                              'Logged In...',
                              style: TextStyle(
                                  color: blackColor,
                                  fontSize: 22,
                                  fontWeight: FontWeight.w400),
                              textAlign: TextAlign.center,
                            )),
                      ],
                    ),
                  ),
                );
              },
            )
          : Container();
    }

    return Center(
        child: Column(
      children: [
        ElevatedButton(
            onPressed: () {
              Future.delayed(Duration(milliseconds: 5000), () {
                setState(() {
                  myVariable = 1;
                  asd();
                });

                asd();
              });

              setState(() {
                myVariable = 0;
                asd();
              });

              if (myVariable == 1) {
                print('asdsadassdsdasdasasadsdasad');
              }
            },
            child: Text('Call Function')),
      ],
    ));
  }
}
