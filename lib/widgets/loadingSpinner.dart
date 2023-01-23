import 'package:flutter/material.dart';
import '../globals/colors.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

class LoadingSpinner extends StatelessWidget {
  final String descp;
  LoadingSpinner(this.descp);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: /*Colors.black38*/ greyColor,
      child: AlertDialog(
        backgroundColor: descp == '' ? Colors.transparent : whiteColor,
        elevation: descp == '' ? 0 : 12,
        content: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: descp != ''
                    ? EdgeInsets.only(top: 25)
                    : EdgeInsets.only(top: 25, bottom: 25),
                alignment: Alignment.center,
                child: LoadingAnimationWidget.discreteCircle(
                    color: darkPinkColor,
                    size: 100,
                    secondRingColor: blackColor,
                    thirdRingColor: orangeColor),
              ),
              if (descp != '')
                Container(
                    padding: EdgeInsets.only(bottom: 25),
                    margin: EdgeInsets.only(top: 25),
                    alignment: Alignment.center,
                    child: Text(
                      descp,
                      style: TextStyle(
                          color: blackColor,
                          fontSize: 22,
                          fontWeight: FontWeight.w400),
                      textAlign: TextAlign.center,
                    )),
            ],
          ),
        ),
      ),
    );
  }
}
