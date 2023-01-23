import '../globals/colors.dart';
import 'package:flutter/material.dart';

ShowDialog(BuildContext context, dynamic errorTitle, dynamic descript) {
  return showDialog<void>(
    barrierColor: Colors.black38,
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(18.0))),
        backgroundColor: greyColor,
        title: Text(
          errorTitle,
          style: TextStyle(
              color: blackColor, fontWeight: FontWeight.bold, fontSize: 18),
        ),
        content: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: descript.map<Widget>((e) {
              return Text(
                e,
                style: TextStyle(
                    color: blackColor,
                    fontWeight: FontWeight.normal,
                    fontSize: 16),
              );
            }).toList(),
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text(
              'OK',
              style: TextStyle(
                  color: darkPinkColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16),
            ),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}

List<Widget> _getIngredients(descript) {
  // type 'List<Widget>' is not a subtype of type 'Widget'
  return descript.map<List<Widget>>((e) => Text(e.description.toString()));
}
