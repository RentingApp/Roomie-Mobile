import 'package:flutter/material.dart';
import '../globals/colors.dart';
import './deneme7.dart';
import 'package:flutter_switch/flutter_switch.dart';

class PopupMenu extends StatefulWidget {
  @override
  State<PopupMenu> createState() => _PopupMenuState();
}

class _PopupMenuState extends State<PopupMenu> {
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        color: greyColor,
        position: PopupMenuPosition.under,
        offset: Offset(60, 0),
        // add icon, by default "3 dot" icon
        // padding: EdgeInsets.all(1),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
        ),
        icon: Icon(
          Icons.filter_list,
          size: 35,
          color: darkPinkColor,
        ),
        itemBuilder: (context) {
          return [
            PopupMenuItem<int>(
                value: 0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.sort_by_alpha,
                      color: blackColor,
                    ),
                    SizedBox(
                      width: 35,
                    ),
                    Text("Sort"),
                  ],
                )),
            PopupMenuItem<int>(
              value: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.filter_list_alt,
                    color: blackColor,
                  ),
                  SizedBox(
                    width: 35,
                  ),
                  Text('Filter'),
                ],
              ),
            ),
          ];
        },
        onSelected: (value) {
          if (value == 0) {
            ShowDialog(context, 'Sort');
          } else if (value == 1) {
            ShowDialog(context, 'Filter');
          }
        });
  }
}
