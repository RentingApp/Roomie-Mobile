import '../services/http.dart';
import './popupMenu.dart';
import '../providers/editingAdInputs.dart';
import 'package:flutter/material.dart';
import "../globals/colors.dart";
import 'package:responsive_grid/responsive_grid.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import 'dart:convert';

class CustomAppbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //int item = Provider.of<EditingAdInputs>(context, listen: false).totalPrice;
    //print(item);
    return AppBar(
      automaticallyImplyLeading: false,
      toolbarHeight: 60,
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
                        color: greyColor,
                      ),
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
                                          child: Icon(
                                            Icons.bookmark,
                                            size: 35,
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
                                onTap: () async {
                                  var token = await Provider.of<Auth>(context,
                                          listen: false)
                                      .getToken();

                                  var id = await Provider.of<Auth>(context,
                                          listen: false)
                                      .workingWithToken(token);

                                  var response = await createHttpRequest(
                                      'api/Account/$id', 'GET', {}, context);
                                  Navigator.of(context).pushNamed('/profile',
                                      arguments: jsonDecode(response.body));
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
                                          child: Icon(
                                            Icons.settings,
                                            size: 35,
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
                                          child: Icon(Icons.logout, size: 35),
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
              child: ModalRoute.of(context)?.settings.name == '/editAd' ||
                      ModalRoute.of(context)?.settings.name == '/editProfile'
                  ? Container(
                      child: Row(
                        children: [
                          Consumer<EditingAdInputs>(
                              builder: ((context, value, child) {
                            return GestureDetector(
                                onTap: () async {
                                  if (value.changableStatus) {
                                    await createHttpRequest('api/Advert',
                                        'POST', value.current_value, context);

                                    Navigator.pushNamed(context, '/myAds');
                                  } else {}
                                },
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 18),
                                  child: Text(
                                    'Confirm',
                                    style: TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.w500,
                                        color: value.changableStatus
                                            ? darkPinkColor
                                            : blackColor),
                                  ),
                                ));
                          })),
                          GestureDetector(
                              onTap: () {},
                              child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 6, horizontal: 18),
                                  child: Text('Cancel',
                                      style: TextStyle(
                                          fontSize: 14,
                                          fontWeight: FontWeight.w500,
                                          color: darkPinkColor))))
                        ],
                      ),
                    )
                  : ModalRoute.of(context)?.settings.name == '/ads'
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            PopupMenu(),
                            /*Container(
                                child: Icon(
                              Icons.filter_list,
                              size: 35,
                              color: blackColor,
                            )),*/
                            SizedBox(
                              width: 25,
                            ),
                            Container(
                                child: Image.asset(
                              'assets/images/samplePP.png',
                              width: 45,
                            ))
                          ],
                        )
                      : ModalRoute.of(context)?.settings.name == '/postAd'
                          ? Row(children: [
                              Container(
                                  child: Icon(
                                Icons.arrow_back,
                                color: darkPinkColor,
                                size: 30,
                              )),
                              SizedBox(
                                width: 20,
                              ),
                              Container(
                                  child: Icon(
                                Icons.arrow_forward,
                                color: darkPinkColor,
                                size: 30,
                              ))
                            ])
                          : Container(
                              child: Image.asset(
                              'assets/images/samplePP.png',
                              width: 45,
                            )),
            )),
      ],
      backgroundColor: greyColor,
      title: ModalRoute.of(context)?.settings.name == '/postAd'
          ? Text(
              '1/4',
              style:
                  TextStyle(color: darkPinkColor, fontWeight: FontWeight.bold),
            )
          : Image.asset(
              'assets/images/logoOriginal.png',
              width: 60,
            ),
    );
  }
}
