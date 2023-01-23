import '../globals/colors.dart';
import '../widgets/bottomNavigationBar.dart';
import 'package:flutter/material.dart';
import 'package:responsive_grid/responsive_grid.dart';
import '../widgets/appbar.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:flutter/gestures.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: greyColor,
        appBar: ModalRoute.of(context)?.settings.name != '/home'
            ? PreferredSize(
                preferredSize: const Size.fromHeight(50),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [CustomAppbar()]),
              )
            : null,
        bottomNavigationBar: bottomNavigationBar(),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: double.infinity,
                child: Image.asset('assets/images/homeScreenTop.png'),
              ),
              Stack(
                children: <Widget>[
                  Center(
                    child: ClipRRect(
                      child: Container(
                        color: lightPinkColorO50,
                        width: 180,
                        height: 40,
                      ),
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    height: 40,
                    child: Text(
                      'SIMPLE AND MODERN',
                      style: TextStyle(
                          color: blackColor,
                          fontWeight: FontWeight.w500,
                          fontSize: 20),
                    ),
                  )
                ],
              ),
              Container(
                margin: EdgeInsets.only(top: 25),
                child: Text(
                  'FINDING HOME',
                  style: TextStyle(
                      color: darkPinkColor,
                      fontSize: 30,
                      fontWeight: FontWeight.w500),
                  textAlign: TextAlign.center,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 25, left: 25, right: 25),
                child: Text(
                  'lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magnyam erat, se sit et dolore magna.',
                  style: TextStyle(
                      color: blackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ),
              ),
              Material(
                color: whiteColor.withOpacity(0.0),
                child: InkWell(
                  onTap: () {
                    print("Wow! Ripple");
                  },
                  child: Container(
                    margin: EdgeInsets.only(top: 45),
                    padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    decoration: BoxDecoration(
                      color: darkPinkColor,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.8),
                          spreadRadius: 0,
                          blurRadius: 4,
                          offset: Offset(1, 6), // changes position of shadow
                        ),
                      ],
                    ),
                    //margin: EdgeInsets.only(top: 100),
                    child: Text(
                      'Get Started',
                      style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: whiteColor),
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 75, right: 245),
                padding:
                    EdgeInsets.only(left: 35, right: 20, top: 20, bottom: 20),
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  color: darkPinkColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(1, 6), // changes position of shadow
                    ),
                  ],
                ),
                //margin: EdgeInsets.only(top: 100),
                child: Text(
                  'About Us',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: whiteColor),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 65, left: 80, right: 80),
                width: double.infinity,
                child: Image.asset('assets/images/homeScreenAbout.png'),
              ),
              Container(
                margin: EdgeInsets.only(top: 25, left: 35, right: 35),
                child: Text(
                  'lorem ipsum dolor sit amet, consetetur  sed diam nonumy eirmod tempor invidunt ut labore et dolore magnyam erat, se sit et dolore magna.lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magnyam erat, se sit et dolore magna.lorem ipsum dolor sit amet, consetet',
                  style: TextStyle(
                      color: blackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 45, left: 245),
                padding:
                    EdgeInsets.only(left: 35, right: 20, top: 20, bottom: 20),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30)),
                  color: darkPinkColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(1, 6), // changes position of shadow
                    ),
                  ],
                ),
                //margin: EdgeInsets.only(top: 100),
                child: Text(
                  'Roles',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: whiteColor),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 55, left: 35, right: 35),
                child: Text(
                  'lorem ipsum dolor sit amet, ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magnyam erat, se sit et dolore magna.lorem ipsum dolor sit amet, consetet',
                  style: TextStyle(
                      color: blackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 65),
                  width: 120,
                  child: Image.asset('assets/images/homeScreenMale.png')),
              Container(
                  margin: EdgeInsets.only(top: 25),
                  child: Text(
                    'Ardi Jorganxhi',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  )),
              Center(
                child: ClipRRect(
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        color: darkPinkColor,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    width: 15,
                    height: 15,
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    'Front-End Development',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: darkPinkColor),
                  )),
              Container(
                  margin: EdgeInsets.only(top: 15),
                  width: 100,
                  child: Image.asset('assets/images/homeScreenReact.png')),
              Container(
                  margin: EdgeInsets.only(left: 50, right: 50, top: 15),
                  child: Divider(
                    height: 5,
                    color: Colors.black,
                  )),
              Container(
                  margin: EdgeInsets.only(top: 50),
                  width: 120,
                  child: Image.asset('assets/images/homeScreenFemale.png')),
              Container(
                  margin: EdgeInsets.only(top: 25),
                  child: Text(
                    'Cansu Gürel',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  )),
              Center(
                child: ClipRRect(
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        color: darkPinkColor,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    width: 15,
                    height: 15,
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    'Back-End Development',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: darkPinkColor),
                  )),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 120,
                  child: Image.asset('assets/images/homeScreenDotNet.png')),
              Container(
                  margin: EdgeInsets.only(left: 50, right: 50, top: 15),
                  child: Divider(
                    height: 5,
                    color: Colors.black,
                  )),
              Container(
                  margin: EdgeInsets.only(top: 50),
                  width: 120,
                  child: Image.asset('assets/images/homeScreenFemale.png')),
              Container(
                  margin: EdgeInsets.only(top: 25),
                  child: Text(
                    'Ebru Şara Bağça',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  )),
              Center(
                child: ClipRRect(
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        color: darkPinkColor,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    width: 15,
                    height: 15,
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    'Back-End Development',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: darkPinkColor),
                  )),
              Container(
                  margin: EdgeInsets.only(top: 20),
                  width: 120,
                  child: Image.asset('assets/images/homeScreenDotNet.png')),
              Container(
                  margin: EdgeInsets.only(left: 50, right: 50, top: 15),
                  child: Divider(
                    height: 5,
                    color: Colors.black,
                  )),
              Container(
                  margin: EdgeInsets.only(top: 65),
                  width: 120,
                  child: Image.asset('assets/images/homeScreenMale.png')),
              Container(
                  margin: EdgeInsets.only(top: 25),
                  child: Text(
                    'İshak Çoban',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  )),
              Center(
                child: ClipRRect(
                  child: Container(
                    margin: EdgeInsets.only(top: 10),
                    decoration: BoxDecoration(
                        color: darkPinkColor,
                        borderRadius: BorderRadius.all(Radius.circular(15))),
                    width: 15,
                    height: 15,
                  ),
                ),
              ),
              Container(
                  margin: EdgeInsets.only(top: 10),
                  child: Text(
                    'Mobile Development',
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.normal,
                        color: darkPinkColor),
                  )),
              Container(
                  margin: EdgeInsets.only(top: 15),
                  width: 100,
                  child: Image.asset('assets/images/homeScreenFlutter.png')),
              Container(
                margin: EdgeInsets.only(top: 75, right: 245),
                padding:
                    EdgeInsets.only(left: 35, right: 20, top: 20, bottom: 20),
                alignment: Alignment.centerRight,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topRight: Radius.circular(30),
                      bottomRight: Radius.circular(30)),
                  color: darkPinkColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(1, 6), // changes position of shadow
                    ),
                  ],
                ),
                //margin: EdgeInsets.only(top: 100),
                child: Text(
                  'Vision',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: whiteColor),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 80, right: 80),
                width: double.infinity,
                child: Image.asset('assets/images/homeScreenVision.png'),
              ),
              Container(
                margin: EdgeInsets.only(top: 5, left: 35, right: 35),
                child: Text(
                  'lorem ipsum dolor sit amet, consetetur  sed diam nonumy eirmod tempor invidunt ut labore et dolore magnyam erat, se sit et dolore magna.lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor invidunt ut labore et dolore magnyam erat, se sit et dolore magna.lorem ipsum dolor sit amet, consetet',
                  style: TextStyle(
                      color: blackColor,
                      fontSize: 14,
                      fontWeight: FontWeight.normal),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 65, left: 245),
                padding:
                    EdgeInsets.only(left: 35, right: 20, top: 20, bottom: 20),
                alignment: Alignment.centerLeft,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      bottomLeft: Radius.circular(30)),
                  color: darkPinkColor,
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.8),
                      spreadRadius: 0,
                      blurRadius: 4,
                      offset: Offset(1, 6), // changes position of shadow
                    ),
                  ],
                ),
                //margin: EdgeInsets.only(top: 100),
                child: Text(
                  'Contacts',
                  textAlign: TextAlign.end,
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: whiteColor),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 20, left: 80, right: 80),
                width: double.infinity,
                child: Image.asset('assets/images/homeScreenContact.png'),
              ),
              ResponsiveGridRow(
                children: [
                  ResponsiveGridCol(
                    xs: 3,
                    child: Container(
                      height: 50,
                      //margin: EdgeInsets.only(right: 15),

                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        'assets/images/homeScreenGithub.png',
                        width: 50,
                      ),
                    ),
                  ),
                  ResponsiveGridCol(
                    xs: 9,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 10),
                      height: 50,
                      //margin: EdgeInsets.only(left: 15),
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            style: TextStyle(
                                color: blackColor,
                                decoration: TextDecoration.underline),
                            text: "https://github.com/ArdiJorganxhi",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                var url = "https://github.com/ArdiJorganxhi";
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              }),
                      ])),
                    ),
                  ),
                ],
              ),
              ResponsiveGridRow(
                children: [
                  ResponsiveGridCol(
                    xs: 3,
                    child: Container(
                      height: 50,
                      //margin: EdgeInsets.only(right: 15),

                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        'assets/images/homeScreenGithub.png',
                        width: 50,
                      ),
                    ),
                  ),
                  ResponsiveGridCol(
                    xs: 9,
                    child: Container(
                      alignment: Alignment.centerLeft,
                      margin: EdgeInsets.only(left: 10),
                      height: 50,
                      //margin: EdgeInsets.only(left: 15),
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            style: TextStyle(
                                color: blackColor,
                                decoration: TextDecoration.underline),
                            text: "https://github.com/CansuG",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                var url = "https://github.com/CansuG";
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              }),
                      ])),
                    ),
                  ),
                ],
              ),
              ResponsiveGridRow(
                children: [
                  ResponsiveGridCol(
                    xs: 3,
                    child: Container(
                      height: 50,
                      //margin: EdgeInsets.only(right: 15),

                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        'assets/images/homeScreenGithub.png',
                        width: 50,
                      ),
                    ),
                  ),
                  ResponsiveGridCol(
                    xs: 9,
                    child: Container(
                      margin: EdgeInsets.only(left: 10),
                      alignment: Alignment.centerLeft,

                      height: 50,
                      //margin: EdgeInsets.only(left: 15),
                      child: RichText(
                          text: TextSpan(children: [
                        TextSpan(
                            style: TextStyle(
                                color: blackColor,
                                decoration: TextDecoration.underline),
                            text: "https://github.com/ebrusarabgc",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () async {
                                var url = "https://github.com/ebrusarabgc";
                                if (await canLaunch(url)) {
                                  await launch(url);
                                } else {
                                  throw 'Could not launch $url';
                                }
                              }),
                      ])),
                    ),
                  ),
                ],
              ),
              ResponsiveGridRow(
                children: [
                  ResponsiveGridCol(
                    xs: 3,
                    child: Container(
                      height: 50,
                      //margin: EdgeInsets.only(right: 15),

                      alignment: Alignment.centerRight,
                      child: Image.asset(
                        'assets/images/homeScreenGithub.png',
                        width: 50,
                      ),
                    ),
                  ),
                  ResponsiveGridCol(
                    xs: 9,
                    child: Container(
                        margin: EdgeInsets.only(left: 10),
                        alignment: Alignment.centerLeft,
                        height: 50,
                        //margin: EdgeInsets.only(left: 15),
                        child: RichText(
                            text: TextSpan(children: [
                          TextSpan(
                              style: TextStyle(
                                  color: blackColor,
                                  decoration: TextDecoration.underline),
                              text: "https://github.com/ishakcoban",
                              recognizer: TapGestureRecognizer()
                                ..onTap = () async {
                                  var url = "https://github.com/ishakcoban";
                                  if (await canLaunch(url)) {
                                    await launch(url);
                                  } else {
                                    throw 'Could not launch $url';
                                  }
                                }),
                        ]))),
                  ),
                ],
              ),
            ],
          ),
        ));
  }
}
