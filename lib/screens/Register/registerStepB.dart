import '../../globals/colors.dart';
import '../../widgets/loadingSpinner.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/registerInputs.dart';

class RegisterStepB extends StatefulWidget {
  const RegisterStepB({Key? key}) : super(key: key);

  @override
  State<RegisterStepB> createState() => _RegisterStepBState();
}

class _RegisterStepBState extends State<RegisterStepB> {
  String selectedItem = 'Gender';
  bool isLoading = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(AssetImage("assets/images/registerB.png"), context)
        .then((value) {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyColor,
      /*appBar: AppBar(
          elevation: 0,
          backgroundColor: greyColor,
        ),*/
      body: SingleChildScrollView(
        child: Center(
          child: isLoading
              ? Container(
                  height: MediaQuery.of(context).size.height * 17 / 20,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [LoadingSpinner('')]))
              : Container(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 5 / 20),
                        width: MediaQuery.of(context).size.width * 7 / 10,
                        child: Image.asset(
                          'assets/images/registerB.png',
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 8 / 10,
                        margin: EdgeInsets.only(top: 40),
                        child: Text(
                          "lorem ipsum dolor sit amet, consetetur tempor invidunt ut labore et dolore magnyam erat, se sit et dolore magna.",
                          style: TextStyle(fontWeight: FontWeight.bold),
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.only(top: 35, bottom: 15),
                        width: MediaQuery.of(context).size.width * 8 / 10,
                        child: PopupMenuButton(
                            child: Column(
                              children: [
                                Container(
                                  margin: EdgeInsets.only(top: 0),
                                  width: MediaQuery.of(context).size.width *
                                      8 /
                                      10,
                                  padding: EdgeInsets.symmetric(vertical: 8),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        margin: EdgeInsets.only(left: 8),
                                        child: Text(
                                          selectedItem,
                                          style: TextStyle(
                                              fontSize: 14.0,
                                              color: blackColor),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 8),
                                        child: Icon(Icons.list),
                                      )
                                    ],
                                  ),
                                ),
                                Container(
                                  alignment: Alignment.center,
                                  width: MediaQuery.of(context).size.width *
                                      8 /
                                      10,
                                  height: 2,
                                  color: blackColor,
                                ),
                              ],
                            ),
                            itemBuilder: (context) {
                              int count = -1;
                              return [
                                PopupMenuItem(
                                  value: ++count,
                                  child: Text('Gender'),
                                ),
                                PopupMenuItem(
                                  value: ++count,
                                  child: Text('Male'),
                                ),
                                PopupMenuItem(
                                  value: ++count,
                                  child: Text('Female'),
                                ),
                                PopupMenuItem(
                                  value: ++count,
                                  child: Text('Other'),
                                )
                              ];
                            },
                            onSelected: (value) {
                              switch (value) {
                                case 0:
                                  setState(() {
                                    selectedItem = 'Gender';
                                  });
                                  break;
                                case 1:
                                  setState(() {
                                    selectedItem = 'Male';
                                  });
                                  break;
                                case 2:
                                  setState(() {
                                    selectedItem = 'Female';
                                  });

                                  break;
                                case 3:
                                  setState(() {
                                    selectedItem = 'Other';
                                  });
                                  break;
                              }
                              Provider.of<RegisterInputs>(context,
                                      listen: false)
                                  .setGender(selectedItem.toString());
                            }),
                      ),
                      if (Provider.of<RegisterInputs>(context, listen: true)
                              .getStepBStatus ==
                          'error')
                        Container(
                          margin: EdgeInsets.only(top: 15),
                          child: Text(
                            'You must choose an option!',
                            style: TextStyle(
                                color: warningColor,
                                fontSize: 15,
                                fontWeight: FontWeight.normal),
                          ),
                        )
                    ],
                  ),
                ),
        ),
      ),
    );
  }
}
