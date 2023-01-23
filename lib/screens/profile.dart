import 'package:flutter/material.dart';
import '../globals/colors.dart';
import '../widgets/bottomNavigationBar.dart';
import 'package:responsive_grid/responsive_grid.dart';
import '../widgets/appbar.dart';

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final args =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    return Scaffold(
        backgroundColor: greyColor,
        bottomNavigationBar: bottomNavigationBar(),
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [CustomAppbar()]),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                  margin: EdgeInsets.only(top: 40),
                  child: Image.asset(
                    'assets/images/samplePP2.png',
                    fit: BoxFit.cover,
                    width: 120,
                  )),
              Padding(
                  padding: EdgeInsets.only(right: 50.0, left: 50.0),
                  child: Divider(
                    color: Colors.black,
                  )),
              ResponsiveGridRow(
                children: [
                  ResponsiveGridCol(
                    xs: 6,
                    child: Container(
                      height: 40,
                      //margin: EdgeInsets.only(right: 15),

                      alignment: Alignment.center,
                      child: Text('Username',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  ResponsiveGridCol(
                    xs: 6,
                    child: Container(
                      alignment: Alignment.center,

                      height: 40,
                      //margin: EdgeInsets.only(left: 15),
                      child: Text(
                        args['username'],
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              ResponsiveGridRow(
                children: [
                  ResponsiveGridCol(
                    xs: 6,
                    child: Container(
                      height: 40,
                      //margin: EdgeInsets.only(right: 15),

                      alignment: Alignment.center,
                      child: Text('First Name',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  ResponsiveGridCol(
                    xs: 6,
                    child: Container(
                      alignment: Alignment.center,

                      height: 40,
                      //margin: EdgeInsets.only(left: 15),
                      child: Text(
                        args['firstName'],
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              ResponsiveGridRow(
                children: [
                  ResponsiveGridCol(
                    xs: 6,
                    child: Container(
                      height: 40,
                      //margin: EdgeInsets.only(right: 15),

                      alignment: Alignment.center,
                      child: Text('Last Name',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  ResponsiveGridCol(
                    xs: 6,
                    child: Container(
                      alignment: Alignment.center,

                      height: 40,
                      //margin: EdgeInsets.only(left: 15),
                      child: Text(
                        args['lastName'],
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              ResponsiveGridRow(
                children: [
                  ResponsiveGridCol(
                    xs: 6,
                    child: Container(
                      height: 40,
                      //margin: EdgeInsets.only(right: 15),

                      alignment: Alignment.center,
                      child: Text('Gender',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  ResponsiveGridCol(
                    xs: 6,
                    child: Container(
                      alignment: Alignment.center,

                      height: 40,
                      //margin: EdgeInsets.only(left: 15),
                      child: Text(
                        args['gender'],
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              ResponsiveGridRow(
                children: [
                  ResponsiveGridCol(
                    xs: 6,
                    child: Container(
                      height: 40,
                      //margin: EdgeInsets.only(right: 15),

                      alignment: Alignment.center,
                      child: Text('Email Address',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  ResponsiveGridCol(
                    xs: 6,
                    child: Container(
                      alignment: Alignment.center,

                      height: 40,
                      //margin: EdgeInsets.only(left: 15),
                      child: Text(
                        args['email'],
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              ResponsiveGridRow(
                children: [
                  ResponsiveGridCol(
                    xs: 6,
                    child: Container(
                      height: 40,
                      //margin: EdgeInsets.only(right: 15),

                      alignment: Alignment.center,
                      child: Text('Password',
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold)),
                    ),
                  ),
                  ResponsiveGridCol(
                    xs: 6,
                    child: Container(
                      alignment: Alignment.center,

                      height: 40,
                      //margin: EdgeInsets.only(left: 15),
                      child: const Text(
                        "******",
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.normal),
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 5),
              Container(
                  margin: const EdgeInsets.only(top: 25.0),
                  //decoration: BoxDecoration(border: Border.all(color: darkPinkColor),borderRadius: new BorderRadius.circular(30.0)),
                  child: FractionallySizedBox(
                    widthFactor: 0.9,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            foregroundColor: blackColor,
                            side: BorderSide(width: 1.0, color: blackColor),
                            padding: EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0))),
                        onPressed: () {
                          //updateHandler()
                        },
                        child: Text('Edit your info')),
                  )),
              Container(
                  margin: const EdgeInsets.only(top: 12),
                  child: FractionallySizedBox(
                    widthFactor: 0.9,
                    child: OutlinedButton(
                        style: OutlinedButton.styleFrom(
                            foregroundColor: blackColor,
                            side: BorderSide(width: 1.0, color: blackColor),
                            padding: EdgeInsets.symmetric(vertical: 15),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(0))),
                        onPressed: () {
                          Navigator.pushNamed(context, '/myAds');
                        },
                        child: Text('Show my adverts')),
                  ))
            ],
          ),
        ));
  }
}
