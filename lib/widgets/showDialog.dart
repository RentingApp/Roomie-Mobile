import 'package:flutter/material.dart';
import '../models/registerResponse.dart';

ShowDialog(BuildContext context, dynamic errorTitle, dynamic descript) {
  var getInfo = null;
  if (descript is String) {
    getInfo = Text(descript);
  }
  /*for (var element in descript) {
    print(element.description);
  }*/
  /* descript.map((e) {
    return Text(e.description);
  }).toList();*/

  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(errorTitle),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              (getInfo == null
                  ? descript.map((e) {
                      return Text(e.description);
                    }).toList()
                  : getInfo)
            ],
          ),
        ),
        actions: <Widget>[
          TextButton(
            child: const Text('OK'),
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
