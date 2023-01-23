import './screens/postinAdSteps/step1.dart';
import './providers/mapValues.dart';
import './providers/advertContent.dart';
import './screens/messageSection.dart';
import './providers/editingAdInputs.dart';
import 'package:flutter/material.dart';
import './screens/login.dart';
import './screens/register.dart';
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
import './screens/pView.dart';
import './screens/differentPersonProfile.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  void onPressed() {
    print('working');
  }

  Widget build(BuildContext context) {
    return /*MultiProvider(providers:[
      ChangeNotifierProvider(
        create: (context) => Auth()]) ,*/
        MultiProvider(
            providers: [
          ChangeNotifierProvider<Auth>(create: (_) => Auth()),
          ChangeNotifierProvider<Toggle>(create: (_) => Toggle()),
          ChangeNotifierProvider<EditingAdInputs>(
              create: (_) => EditingAdInputs()),
          ChangeNotifierProvider<AdvertContent>(create: (_) => AdvertContent()),
          ChangeNotifierProvider<MapValues>(create: (_) => MapValues()),
        ],
            child: MaterialApp(
              initialRoute: '/login',
              routes: {
                '/login': (_) => Login(),
                '/register': (_) => Register(),
                '/home': (_) => Home(),
                '/profile': (_) => Profile(),
                '/differentPersonProfile': (_) => DifferentPersonProfile(),
                '/ads': (_) => Ads(),
                '/postAd': (_) => Step1(),
                '/myAds': (_) => MyAds(),
                '/deneme': (_) => Deneme(),
                '/deneme2': (_) => Deneme2(),
                '/deneme3': (_) => SnackBarDemo(),
                '/editAd': (_) => EditAd(),
                '/editProfile': (_) => EditProfile(),
                '/deneme5': (_) => Deneme5(),
                '/messageList': (_) => MessageList(),
                '/messageSection': (_) => MessageSection(),
                '/dataInit': (_) => DummyDataInit(),
                '/pview': (_) => MyApp10(),
              },
            ));
  }
}
