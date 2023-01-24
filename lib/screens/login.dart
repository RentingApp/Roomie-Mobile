import '../services/http.dart';
import '../widgets/loadingSpinner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import '../globals/colors.dart';
import "./register.dart";
import 'dart:convert' as convert;
import 'dart:async';
import 'package:shared_preferences/shared_preferences.dart';
import '../providers/auth.dart';
import 'package:provider/provider.dart';
import '../widgets/showDialog.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool loggedIn = false;

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();

  Future<void> inputHandler() async {
    FocusManager.instance.primaryFocus?.unfocus();

    if (emailController.text.length == 0 ||
        passwordController.text.length == 0) {
      return ShowDialog(
          context, 'Not Logged In', ['You must fill the all areas!']);
    }

    try {
      var values = {
        "Email": emailController.text,
        "Password": passwordController.text
      };
      var response =
          await createHttpRequest('api/Account/login', 'POST', values, context);
      if (response.statusCode == 200) {
        setState(() {
          loggedIn = true;
        });

        Future.delayed(const Duration(milliseconds: 2000), () {
          Provider.of<Auth>(context, listen: false)
              .setToken(convert.jsonDecode(response.body)['token']);
          Navigator.pushNamed(context, '/profile');
          setState(() {
            loggedIn = false;
          });
        });
      } else if (response.statusCode == 400) {
        return ShowDialog(
            context, 'Not Logged In', ['Wrong email or password!']);
      }
    } catch (err) {
      print("Uncaught error: $err");
    }
  }

  @override
  void initState() {
    super.initState();
    _prefs.then((SharedPreferences prefs) {
      if (prefs.getString('token') != null) {
        prefs.remove('token');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Future<void> _showMyDialog() async {
      inputHandler();
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Login Error'),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  Text('Email or password wrong!'),
                ],
              ),
            ),
            actions: <Widget>[
              TextButton(
                child: const Text('OK'),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }

    return Stack(
      children: [
        GestureDetector(
            onTap: () {
              FocusManager.instance.primaryFocus?.unfocus();
            },
            child: Scaffold(
              resizeToAvoidBottomInset: true,
              //resizeToAvoidBottomPadding:false,
              backgroundColor: whiteColor,
              body: SingleChildScrollView(
                child: Container(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.height,
                  child: Column(
                    //mainAxisSize: MainAxisSize.max,
                    children: [
                      Stack(children: [
                        ClipPath(
                          clipper: WaveClipperTwo(flip: true),
                          child: Container(
                            height: MediaQuery.of(context).size.height * 5 / 10,
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.bottomCenter,
                                end: Alignment.topCenter,
                                colors: [
                                  darkPinkColor,
                                  orangeColor,
                                ],
                                tileMode: TileMode.mirror,
                              ),
                            ),
                            child: Center(
                                child: Image.asset(
                              'assets/images/boys.png',
                              width: MediaQuery.of(context).size.width * 8 / 10,
                            )),
                          ),
                        ),
                        Container(
                            margin: EdgeInsets.only(top: 25, left: 25),
                            child: Image.asset(
                              'assets/images/logoWhite.png',
                              width: 105,
                            ))
                      ]),
                      Container(
                        width: MediaQuery.of(context).size.width * 7 / 10,
                        margin: EdgeInsets.only(top: 35),
                        child: TextField(
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(8, 0, 8, -10.0),

                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: darkPinkColor, width: 2.5),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: darkPinkColor, width: 2.5),
                            ),
                            hintText: 'Email Address',
                            hintStyle: TextStyle(
                                fontSize: 16.0,
                                color: darkPinkColor,
                                fontWeight: FontWeight.w500),
                            //contentPadding: EdgeInsets.all(30.0),
                          ),
                          controller: emailController,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 7 / 10,
                        margin: EdgeInsets.only(top: 15),
                        child: TextField(
                          obscureText: true,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                            contentPadding: EdgeInsets.fromLTRB(8, 0, 8, -10.0),

                            enabledBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: darkPinkColor, width: 2.5),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide:
                                  BorderSide(color: darkPinkColor, width: 2.5),
                            ),
                            hintText: 'Password',
                            hintStyle: TextStyle(
                                fontSize: 16.0,
                                color: darkPinkColor,
                                fontWeight: FontWeight.w500),
                            //contentPadding: EdgeInsets.all(30.0),
                            // Here is key idea
                          ),
                          /*decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(8, 0, 8, -10.0),

                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: darkPinkColor, width: 2.5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: darkPinkColor, width: 2.5),
                    ),
                    hintText: 'Password',
                    hintStyle: TextStyle(fontSize: 14.0, color: darkPinkColor),
                    //contentPadding: EdgeInsets.all(30.0),
                  ),*/
                          controller: passwordController,
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 7 / 10,
                        margin: EdgeInsets.only(top: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Text(
                              'Forgot password?',
                              style: TextStyle(
                                  fontSize: 14.0,
                                  color: darkPinkColor,
                                  fontWeight: FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 40.0),
                        child: FractionallySizedBox(
                          widthFactor: 0.7,
                          child: SizedBox(
                            height: 50,
                            child: ElevatedButton(
                              onPressed: inputHandler /* _showMyDialog*/,
                              style: ElevatedButton.styleFrom(
                                primary: darkPinkColor,
                                shape: new RoundedRectangleBorder(
                                  borderRadius: new BorderRadius.circular(30.0),
                                ),
                              ),
                              child: Text(
                                'LOGIN',
                                style: TextStyle(
                                  fontSize: 20,
                                  letterSpacing: 0.1,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 20.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Register()),
                            );
                          },
                          child: Text(
                            'No account? Create a new one!',
                            style: TextStyle(
                              letterSpacing: 0.1,
                              fontSize: 15,
                              color: darkPinkColor,
                              decoration: TextDecoration.underline,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )),
        if (loggedIn) LoadingSpinner('Logged In...')
      ],
    );
    ;
  }
}
