import '../../globals/colors.dart';
import '../../widgets/loadingSpinner.dart';
import 'package:flutter/material.dart';

class RegisterB extends StatefulWidget {
  const RegisterB({Key? key}) : super(key: key);

  @override
  State<RegisterB> createState() => _RegisterBState();
}

class _RegisterBState extends State<RegisterB> {
  bool isLoading = true;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
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
                                top: MediaQuery.of(context).size.height *
                                    5 /
                                    20),
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
                            margin: EdgeInsets.only(top: 10, bottom: 15),
                            width: MediaQuery.of(context).size.width * 8 / 10,
                            child: TextField(
                              onChanged: (text) {},
                              //focusNode: _focusTitle,
                              textAlign: TextAlign.start,
                              decoration: InputDecoration(
                                contentPadding:
                                    EdgeInsets.fromLTRB(8, 0, 8, -10.0),
                                enabledBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: blackColor, width: 2.5),
                                ),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: blackColor, width: 2.5),
                                ),
                                hintText: 'Gender',
                                hintStyle: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500),
                              ),
                              //controller: titleController,
                            ),
                          ),
                        ],
                      )))));
  }
}
