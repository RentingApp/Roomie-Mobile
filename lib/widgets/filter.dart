import 'package:flutter/material.dart';
import '../globals/colors.dart';
import 'dart:math' as math;

class Filter extends StatefulWidget {
  const Filter({Key? key}) : super(key: key);

  @override
  State<Filter> createState() => _FilterState();
}

class _FilterState extends State<Filter> {
  bool filterStatus = false;
  int selectedIndex = -1;
  String _day = 'fri';
  String _month = 'apr';
  String value = 'flutter';
  final List<String> countries = [
    'United Kingdom',
    'USA',
    'Frances',
    'Australia',
    'Germany',
    'India',
    'Vietnam'
  ];
  @override
  Widget build(BuildContext context) {
    //print(selectedIndex);
    _showSingleChoiceDialog(BuildContext context) => showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              contentPadding: EdgeInsets.zero,
              title: Text('Select a city'),
              titlePadding: EdgeInsets.zero,
              content: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  child: Container(
                    width: MediaQuery.of(context)
                        .size
                        .width, // Change as per your requirement
                    child: ListView.builder(
                      padding: EdgeInsets.zero,
                      shrinkWrap: true,
                      itemCount: 5,
                      itemBuilder: (BuildContext context, int index) {
                        return ListTile(
                            onTap: () {
                              setState(() {
                                selectedIndex = index;
                              });
                              Navigator.of(context).pop();
                            },
                            tileColor:
                                selectedIndex == index ? Colors.blue : null,
                            title: Text('One-line ListTile'));
                      },
                    ),
                  ),
                ),
              ),
            );
          },
        );

    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.centerLeft,

          end: Alignment.centerRight,
          colors: [
            greyColor,
            darkPinkColor,
          ], // Gradient from https://learnui.design/tools/gradient-generator.html
          tileMode: TileMode.mirror,
        ),
      ),
      child: Column(children: [
        GestureDetector(
          onTap: () {
            setState(() {
              filterStatus = !filterStatus;
            });
          },
          child: Container(
              color: Colors.transparent,
              padding: EdgeInsets.only(right: 20, top: 8, bottom: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Transform.rotate(
                    angle: filterStatus ? -math.pi / 2 : 2 * math.pi,
                    child: Container(
                      child: Icon(
                        Icons.arrow_back_ios_new_rounded,
                        color: whiteColor,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 7,
                  ),
                  Text(
                    'Filter',
                    style: TextStyle(
                        color: whiteColor,
                        fontWeight: FontWeight.w500,
                        fontSize: 20),
                  )
                ],
              )),
        ),
        if (filterStatus)
          Container(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width * 3 / 10,
                      margin: EdgeInsets.only(top: 15),
                      child: TextField(
                        obscureText: true,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(8, 0, 8, -10.0),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: whiteColor, width: 2.5),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: whiteColor, width: 2.5),
                          ),
                          hintText: 'Password',
                          hintStyle: TextStyle(
                              fontSize: 16.0,
                              color: whiteColor,
                              fontWeight: FontWeight.w500),
                        ),

                        //controller: passwordController,
                      ),
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 4 / 10,
                      margin: EdgeInsets.only(top: 15),
                      child: TextField(
                        obscureText: true,
                        textAlign: TextAlign.center,
                        decoration: InputDecoration(
                          contentPadding: EdgeInsets.fromLTRB(8, 0, 8, -10.0),
                          enabledBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: whiteColor, width: 2.5),
                          ),
                          focusedBorder: UnderlineInputBorder(
                            borderSide:
                                BorderSide(color: whiteColor, width: 2.5),
                          ),
                          hintText: 'Password',
                          hintStyle: TextStyle(
                              fontSize: 16.0,
                              color: whiteColor,
                              fontWeight: FontWeight.w500),
                        ),

                        //controller: passwordController,
                      ),
                    ),
                  ],
                ),
                ElevatedButton(
                    onPressed: () {
                      _showSingleChoiceDialog(context);
                    },
                    child: Column(
                      children: [
                        Text(selectedIndex.toString()),
                      ],
                    )),
                Text('assadsadsa'),
                Text('assadsadsa'),
                Text('assadsadsa'),
                Text('assadsadsa'),
                Text('assadsadsa'),
                Text('assadsadsa'),
                Text('assadsadsa'),
                Text('assadsadsa'),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {},
                      child: Text('Search'),
                      style: ElevatedButton.styleFrom(
                          backgroundColor: darkPinkColor,
                          padding: EdgeInsets.symmetric(
                              horizontal:
                                  MediaQuery.of(context).size.width * 0.15),
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                    SizedBox(
                      width: 25,
                    ),
                    OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            foregroundColor: whiteColor,
                            side: BorderSide(width: 2.0, color: whiteColor),
                            padding: EdgeInsets.symmetric(
                                horizontal:
                                    MediaQuery.of(context).size.width * 0.15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20))),
                        onPressed: () {},
                        child: Text('Reset')),
                  ],
                )
              ],
            ),
          )
      ]),
    );
  }
}
