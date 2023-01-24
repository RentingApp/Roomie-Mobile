import 'package:roomie/screens/postAd.dart';

import './screens/postinAdSteps/step1.dart';
import './providers/mapValues.dart';
import './providers/advertContent.dart';
import './screens/messageSection.dart';
import './providers/editingAdInputs.dart';
import 'package:flutter/material.dart';
import './screens/login.dart';
import './screens/home.dart';
import './screens/profile.dart';
import 'package:provider/provider.dart';
import './providers/auth.dart';
import './screens/ads.dart';
import './screens/deneme.dart';
import './screens/deneme2.dart';
import './screens/deneme3.dart';
import './screens/editAd.dart';
import './screens/editProfile.dart';
import './screens/deneme5.dart';
import './screens/myAds.dart';
import './providers/toggle.dart';
import './screens/messageList.dart';
import './widgets/dummyDataInit.dart';
import 'screens/Register/registerSlider.dart';
import './screens/differentPersonProfile.dart';
import './providers/registerInputs.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<Auth>(create: (_) => Auth()),
          ChangeNotifierProvider<Toggle>(create: (_) => Toggle()),
          ChangeNotifierProvider<EditingAdInputs>(
              create: (_) => EditingAdInputs()),
          ChangeNotifierProvider<AdvertContent>(create: (_) => AdvertContent()),
          ChangeNotifierProvider<MapValues>(create: (_) => MapValues()),
          ChangeNotifierProvider<RegisterInputs>(
              create: (_) => RegisterInputs()),
        ],
        child: MaterialApp(
          initialRoute: '/register',
          routes: {
            '/login': (_) => Login(),
            '/register': (_) => Register(),
            '/home': (_) => Home(),
            '/profile': (_) => Profile(),
            '/differentPersonProfile': (_) => DifferentPersonProfile(),
            '/ads': (_) => Ads(),
            '/postAd': (_) => Step1(),
            '/postAd1': (_) => PostAd(),
            '/myAds': (_) => MyAds(),
            '/deneme': (_) => Deneme(),
            '/deneme2': (_) => Deneme2(),
            '/deneme3': (_) => SnackBarDemo(),
            '/editAd': (_) => EditAd(),
            '/editProfile': (_) => EditProfile(),
            '/deneme5': (_) => Deneme5(),
            '/dataInit': (_) => DummyDataInit(),
          },
        ));
  }
}
