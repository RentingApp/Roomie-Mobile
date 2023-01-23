import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Deneme5 extends StatefulWidget {
  const Deneme5({Key? key}) : super(key: key);

  @override
  State<Deneme5> createState() => _Deneme5State();
}

class _Deneme5State extends State<Deneme5> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(
        child: Text('Click'),
        onPressed: () {
          Navigator.of(context).pushNamed('/deneme4', arguments: {
            'advertId': 'widget.advertId.toString()',
            'publishDate': 'widget.publishDate.toString()',
            'title': 'widget.title.toString()',
            'content': 'widget.content.toString()',
            'city': 'widget.city.toString()',
            'district': 'widget.district.toString()',
            'neighbourhood': 'widget.neighbourhood.toString()',
            'rooms': 'widget.rooms.toString()',
            'price': 'widget.price.toString()',
            'floorArea': 'widget.floorArea.toString()',
            'private': 'widget.private.toString()',
          });
        },
      ),
    );
  }
}
