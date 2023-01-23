import './Register/registerA.dart';
import './Register/registerB.dart';
import './Register/registerC.dart';

import '../globals/colors.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';

class MyApp10 extends StatelessWidget {
  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: Scaffold(
        body: MyWidget(),
      ),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  PageController controller = PageController(initialPage: 0);
  ImageProvider logo = AssetImage("assets/images/registerC.png");
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: greyColor,
        bottomNavigationBar: Container(
          height: MediaQuery.of(context).size.height * 3 / 20,
          child: ResponsiveGridRow(
            children: [
              pageIndex == 0
                  ? ResponsiveGridCol(
                      xs: 4,
                      child: Container(
                        //height: 40,
                        margin: EdgeInsets.only(left: 25),

                        alignment: Alignment.centerLeft,
                      ),
                    )
                  : ResponsiveGridCol(
                      xs: 4,
                      child: Container(
                        //height: 40,
                        margin: EdgeInsets.only(left: 25),

                        alignment: Alignment.centerLeft,
                        child: GestureDetector(
                            onTap: () {
                              controller.previousPage(
                                  duration: Duration(milliseconds: 500),
                                  curve: Curves.easeIn);
                            },
                            child: Text('BACK',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.bold))),
                      ),
                    ),
              ResponsiveGridCol(
                xs: 4,
                child: Container(
                  alignment: Alignment.center,
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        pageIndex == 0
                            ? Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    color: darkPinkColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100))),
                              )
                            : Container(
                                width: 10,
                                height: 10,
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                    color: orangeColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100))),
                              ),
                        pageIndex == 1
                            ? Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    color: darkPinkColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100))),
                              )
                            : Container(
                                width: 10,
                                height: 10,
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                    color: orangeColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100))),
                              ),
                        pageIndex == 2
                            ? Container(
                                width: 20,
                                height: 20,
                                decoration: BoxDecoration(
                                    color: darkPinkColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100))),
                              )
                            : Container(
                                width: 10,
                                height: 10,
                                margin: EdgeInsets.symmetric(horizontal: 5),
                                decoration: BoxDecoration(
                                    color: orangeColor,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(100))),
                              ),
                      ]),
                ),
              ),
              ResponsiveGridCol(
                xs: 4,
                child: Container(
                  //height: 40,
                  margin: EdgeInsets.only(right: 25),

                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                      onTap: () {
                        controller.nextPage(
                            duration: Duration(milliseconds: 500),
                            curve: Curves.easeIn);
                      },
                      child: Text(pageIndex == 2 ? 'COMPLETE' : 'NEXT',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold))),
                ),
              ),
            ],
          ),
        ),
        body: PageView.builder(
          physics: NeverScrollableScrollPhysics(),

          /// [PageView.scrollDirection] defaults to [Axis.horizontal].
          /// Use [Axis.vertical] to scroll vertically.
          controller: controller,

          onPageChanged: (index) {
            setState(() {
              pageIndex = index;
            });
          },
          itemCount: 3,
          itemBuilder: (context, index) {
            if (index == 0) {
              return RegisterA();
            }
            if (index == 1) {
              return RegisterB();
            }

            return RegisterC();
          }, /*const <Widget>[
            RegisterA(),
            RegisterB(),
            RegisterC(),
          ],*/
        ));
  }
}
