import 'package:flutter/material.dart';
import 'package:flutter_circular_text/circular_text.dart';
import '../globals/colors.dart';

class InfoCard extends StatelessWidget {
  final String name;
  final String descp;

  InfoCard(this.name, this.descp);
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(40),
              ),
              color: darkPinkColor,
            ),
            padding: EdgeInsets.symmetric(vertical: 5, horizontal: 15),
            child: Text(
              name.toUpperCase(),
              style: TextStyle(color: greyColor, fontSize: 10),
            ),
          ),
          Stack(
            alignment: Alignment.center,
            children: [
              Container(
                width: 60,
                height: 55,
                child: Container(
                    width: 50,
                    height: 50,
                    alignment: Alignment.center,
                    child: Container(
                      color: greyColor,
                      height: 20,
                      padding:
                          EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    ),
                    decoration: ShapeDecoration(
                        color: Colors.transparent,
                        shape: CircleBorder(
                            side: BorderSide(width: 1, color: blackColor)))),
              ),
              Container(
                height: 35,
                alignment: Alignment.center,
                child: Container(
                  child: Text(
                    descp,
                    style: name.toUpperCase() == 'FLOOR AREA(M2)' ||
                            name.toUpperCase() == 'ROOMS'
                        ? TextStyle(fontWeight: FontWeight.bold, fontSize: 16)
                        : null,
                  ),
                  padding: EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
