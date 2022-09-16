import 'package:flutter/material.dart';
import './screens/login.dart';
import './screens/register.dart';
import './screens/home.dart';
import './screens/profile.dart';
import 'package:provider/provider.dart';
import './providers/auth.dart';
import './screens/ads.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  void onPressed() {
    print('working');
  }

  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Auth(),
        child: MaterialApp(
          initialRoute: '/ads',
          routes: {
            '/login': (_) => Login(),
            '/register': (_) => Register(),
            '/home': (_) => Home(),
            '/profile': (_) => Profile(),
            '/ads': (_) => Ads(),
          },
        ));
  }
}
