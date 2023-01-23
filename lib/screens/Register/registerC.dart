import '../../globals/colors.dart';
import 'package:flutter/material.dart';
import '../../widgets/loadingSpinner.dart';

class RegisterC extends StatefulWidget {
  const RegisterC({Key? key}) : super(key: key);

  @override
  State<RegisterC> createState() => _RegisterCState();
}

class _RegisterCState extends State<RegisterC> {
  bool isLoading = true;

  @override
  void didChangeDependencies() {
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
    precacheImage(AssetImage("assets/images/registerC.png"), context)
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
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            margin: EdgeInsets.only(
                                top: MediaQuery.of(context).size.height *
                                    1 /
                                    10),
                            width: MediaQuery.of(context).size.width * 8 / 10,
                            child: Image.asset('assets/images/registerC.png'),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 8 / 10,
                            child: Text(
                              "lorem ipsum dolor sit amet, consetetur tempor invidunt ut labore et dolore magnyam erat, se sit et dolore magna.",
                              style: TextStyle(fontWeight: FontWeight.bold),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            width: MediaQuery.of(context).size.width * 8 / 10,
                            child: TextField(
                              onChanged: (text) {
                                //inputHandler();
                              },
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
                                hintText: 'Email Address',
                                hintStyle: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500),
                              ),
                              //controller: titleController,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10),
                            width: MediaQuery.of(context).size.width * 8 / 10,
                            child: TextField(
                              onChanged: (text) {
                                //inputHandler();
                              },
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
                                hintText: 'Password',
                                hintStyle: TextStyle(
                                    fontSize: 16.0,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.w500),
                              ),
                              //controller: titleController,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 10, bottom: 15),
                            width: MediaQuery.of(context).size.width * 8 / 10,
                            child: TextField(
                              onChanged: (text) {
                                //inputHandler();
                              },
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
                                hintText: 'Password(Again)',
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
