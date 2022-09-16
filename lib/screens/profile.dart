import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import '../globals/colors.dart';
import '../widgets/navbar.dart';
import 'package:responsive_grid/responsive_grid.dart';
import '../widgets/appbar.dart';

void main() {
  runApp(Profile());
}

class Profile extends StatefulWidget {
  const Profile({Key? key}) : super(key: key);

  @override
  State<Profile> createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  @override
  void initState() {
    super.initState();
    /*Provider.of<Auth>(context, listen: false).getToken().then((value) {
      if (value == null) {
        Navigator.pushNamed(context, '/');
      }
    });*/
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Navbar(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [CustomAppbar()]),
      ),
      body: Column(
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
              ),
              ResponsiveGridCol(
                xs: 6,
                child: Container(
                  alignment: Alignment.center,

                  height: 40,
                  //margin: EdgeInsets.only(left: 15),
                  child: const Text(
                    "mCelik156",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
              ),
              ResponsiveGridCol(
                xs: 6,
                child: Container(
                  alignment: Alignment.center,

                  height: 40,
                  //margin: EdgeInsets.only(left: 15),
                  child: const Text(
                    "Mehmet",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
              ),
              ResponsiveGridCol(
                xs: 6,
                child: Container(
                  alignment: Alignment.center,

                  height: 40,
                  //margin: EdgeInsets.only(left: 15),
                  child: const Text(
                    "Celik",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
              ),
              ResponsiveGridCol(
                xs: 6,
                child: Container(
                  alignment: Alignment.center,

                  height: 40,
                  //margin: EdgeInsets.only(left: 15),
                  child: const Text(
                    "Male",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
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
                  child: Text('Date Of Birth',
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
              ),
              ResponsiveGridCol(
                xs: 6,
                child: Container(
                  alignment: Alignment.center,

                  height: 40,
                  //margin: EdgeInsets.only(left: 15),
                  child: const Text(
                    "14/07/1995",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
                ),
              ),
              ResponsiveGridCol(
                xs: 6,
                child: Container(
                  alignment: Alignment.center,

                  height: 40,
                  //margin: EdgeInsets.only(left: 15),
                  child: const Text(
                    "mCelik@gmail.com",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
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
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
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
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                ),
              ),
            ],
          ),
          SizedBox(height: 5),
          Container(
            margin: const EdgeInsets.only(top: 40.0),
            //decoration: BoxDecoration(border: Border.all(color: darkPinkColor),borderRadius: new BorderRadius.circular(30.0)),
            child: FractionallySizedBox(
              widthFactor: 0.7,
              child: SizedBox(
                height: 40,
                child: ElevatedButton(
                  onPressed: () {} /* _showMyDialog*/,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: whiteColor,
                    shadowColor: null,
                    foregroundColor: null,
                    shape: new RoundedRectangleBorder(
                      borderRadius: new BorderRadius.circular(30.0),
                    ),
                  ),
                  child: Text(
                    'Update',
                    style: TextStyle(
                      color: darkPinkColor,
                      fontSize: 20,
                      letterSpacing: 0.1,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
