import 'package:flutter/material.dart';
import "../globals/colors.dart";
import 'package:responsive_grid/responsive_grid.dart';

class CustomAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 70,
      actions: <Widget>[
        Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: GestureDetector(
              onTap: () {
                showModalBottomSheet<void>(
                  context: context,
                  backgroundColor: Colors.transparent,
                  builder: (BuildContext context) {
                    return Container(
                      height: 400,
                      //color: Colors.white,
                      margin: EdgeInsets.all(20),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(40)),
                          color: whiteColor),
                      //color: whiteColor,
                      child: Center(
                        child: Column(
                          //mainAxisAlignment: MainAxisAlignment.center,
                          //mainAxisSize: MainAxisSize.min,

                          children: <Widget>[
                            //const Text('Modal BottomSheet'),
                            Container(
                              margin: EdgeInsets.only(top: 15),
                              width: 40,
                              height: 6,
                              decoration: BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(40)),
                                color: darkPinkColor,
                              ),
                            ),
                            SizedBox(height: 30),
                            Material(
                              color: whiteColor.withOpacity(0.0),
                              child: InkWell(
                                onTap: () {
                                  print("Wow! Ripple");
                                },
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                                child: Container(
                                  //margin: EdgeInsets.only(top: 100),
                                  child: ResponsiveGridRow(
                                    children: [
                                      ResponsiveGridCol(
                                        xs: 6,
                                        child: Container(
                                          height: 60,
                                          //margin: EdgeInsets.only(right: 15),
                                          alignment: Alignment.center,
                                          child: Image.asset(
                                            'assets/images/saved.png',
                                            width: 35,
                                          ),
                                        ),
                                      ),
                                      ResponsiveGridCol(
                                        xs: 6,
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          height: 60,
                                          //margin: EdgeInsets.only(left: 15),
                                          child: const Text(
                                            "Saved Ads",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),

                            Material(
                              color: whiteColor.withOpacity(0.0),
                              child: InkWell(
                                onTap: () {
                                  print("Wow! Ripple");
                                },
                                child: Container(
                                  //margin: EdgeInsets.only(top: 100),
                                  child: ResponsiveGridRow(
                                    children: [
                                      ResponsiveGridCol(
                                        xs: 6,
                                        child: Container(
                                          height: 60,
                                          //margin: EdgeInsets.only(right: 15),
                                          alignment: Alignment.center,
                                          child: Image.asset(
                                            'assets/images/myAds.png',
                                            width: 35,
                                          ),
                                        ),
                                      ),
                                      ResponsiveGridCol(
                                        xs: 6,
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          height: 60,
                                          //margin: EdgeInsets.only(left: 15),
                                          child: const Text(
                                            "My Ads",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Material(
                              color: whiteColor.withOpacity(0.0),
                              child: InkWell(
                                onTap: () {
                                  Navigator.pushNamed(context, '/profile');
                                },
                                child: Container(
                                  //margin: EdgeInsets.only(top: 100),
                                  child: ResponsiveGridRow(
                                    children: [
                                      ResponsiveGridCol(
                                        xs: 6,
                                        child: Container(
                                          height: 60,
                                          //margin: EdgeInsets.only(right: 15),
                                          alignment: Alignment.center,
                                          child: Image.asset(
                                            'assets/images/settings.png',
                                            width: 35,
                                          ),
                                        ),
                                      ),
                                      ResponsiveGridCol(
                                        xs: 6,
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          height: 60,
                                          //margin: EdgeInsets.only(left: 15),
                                          child: const Text(
                                            "Settings",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Material(
                              color: whiteColor.withOpacity(0.0),
                              child: InkWell(
                                onTap: () {
                                  print("Wow! Ripple");
                                },
                                child: Container(
                                  //margin: EdgeInsets.only(top: 100),
                                  child: ResponsiveGridRow(
                                    children: [
                                      ResponsiveGridCol(
                                        xs: 6,
                                        child: Container(
                                          height: 60,
                                          //margin: EdgeInsets.only(right: 15),
                                          alignment: Alignment.center,
                                          child: Image.asset(
                                            'assets/images/logOut.png',
                                            width: 35,
                                          ),
                                        ),
                                      ),
                                      ResponsiveGridCol(
                                        xs: 6,
                                        child: Container(
                                          alignment: Alignment.centerLeft,
                                          height: 60,
                                          //margin: EdgeInsets.only(left: 15),
                                          child: const Text(
                                            "Log Out",
                                            style: TextStyle(
                                                fontSize: 20,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                );
              },
              child: Container(
                  child: Image.asset(
                'assets/images/samplePP.png',
                width: 55,
              )),
            )),
      ],
      backgroundColor: darkPinkColor,
      title: Image.asset(
        'assets/images/logoWhite.png',
        width: 70,
      ),
    );
  }
}
