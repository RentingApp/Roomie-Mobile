import 'package:flutter/material.dart';
import '../globals/colors.dart';
import '../widgets/bottomNavigationBar.dart';
import '../widgets/appbar.dart';
import 'package:responsive_grid/responsive_grid.dart';

class MessageSection extends StatefulWidget {
  const MessageSection({Key? key}) : super(key: key);

  @override
  State<MessageSection> createState() => _MessageSectionState();
}

class _MessageSectionState extends State<MessageSection> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Container(
            decoration: const BoxDecoration(
                gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [orangeColor, darkPinkColor])),
            child: Scaffold(
              backgroundColor: Colors.transparent,
              //bottomNavigationBar: ,
              resizeToAvoidBottomInset: true,
              appBar: PreferredSize(
                preferredSize: const Size.fromHeight(60),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [CustomAppbar()]),
              ),
              body: SingleChildScrollView(
                  child: Container(
                //margin: EdgeInsets.all(15),
                width: double.infinity,
                child: Column(
                  children: [
                    ResponsiveGridRow(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        ResponsiveGridCol(
                            xs: 10,
                            child: Container(
                              margin: EdgeInsets.symmetric(horizontal: 15),
                              child: TextField(
                                decoration: InputDecoration(
                                  disabledBorder: InputBorder.none,
                                  //focusedBorder: InputBorder.none,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(30.0),
                                  ),
                                  fillColor: greyColor,
                                  hintText: "Send Message",
                                  filled: true,
                                ),
                              ),
                            )),
                        ResponsiveGridCol(
                          xs: 2,
                          child: GestureDetector(
                            child: Container(
                              alignment: Alignment.center,
                              width: 60,
                              height: 50,
                              decoration: BoxDecoration(
                                  color: orangeColor,
                                  borderRadius: BorderRadius.all(
                                      Radius.circular(100))), //height: 40,
                              //margin: EdgeInsets.only(left: 15),
                              child: Icon(Icons.send),
                            ),
                          ),
                        )
                      ],
                    ),
                    /*Row(
                      children: [
                        TextField(
                          decoration: InputDecoration(
                            disabledBorder: InputBorder.none,
                            //focusedBorder: InputBorder.none,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(30.0),
                            ),
                            fillColor: greyColor,
                            hintText: "Send Message",
                            filled: true,
                          ),
                        ),
                        ElevatedButton(onPressed: () {}, child: Text('A'))
                      ],
                    )*/
                  ],
                ),
              )),
            )));
  }
}
