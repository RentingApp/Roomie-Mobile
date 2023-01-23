import '../../globals/colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class EachMessageListItem extends StatelessWidget {
  const EachMessageListItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: double.infinity,
        color: greyColor,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(top: 10, left: 10),
                  child: Row(
                    children: [
                      Image.asset(
                        'assets/images/samplePP.png',
                        width: 45,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Text(
                        'username',
                        style: TextStyle(
                            color: blackColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                    ],
                  ),
                ),
                Container(
                    alignment: Alignment.topRight,
                    padding:
                        EdgeInsets.only(top: 5, bottom: 5, left: 10, right: 20),
                    decoration: BoxDecoration(
                        color: darkPinkColor,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(25),
                            bottomLeft: Radius.circular(25))),
                    child: Text(
                      '12:20 PM',
                      style: TextStyle(color: greyColor),
                    )),
              ],
            ),
            Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 10, bottom: 10, left: 30, right: 30),
              child: Text(
                'sadasdas sad sa d sa d sa d asdasd sa d asd a sd as das d   asd sa d asd as d sad  asd sad ',
              ),
            ),
            Container(
              width: double.infinity,
              height: 5,
              //color: blackColor,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [orangeColor, darkPinkColor],
                  begin: Alignment.centerLeft,
                  end: Alignment.centerRight,
                  stops: [0.0, 0.8],
                  tileMode: TileMode.clamp,
                ),
              ),
            ),
          ],
        ));
  }
}
