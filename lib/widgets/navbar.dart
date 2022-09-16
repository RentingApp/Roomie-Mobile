import 'package:flutter/material.dart';
import '../globals/colors.dart';
import '../screens/home.dart';

class Navbar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    void changeRoute() {
      Navigator.pushNamed(context, '/home');
    }

    return Container(
      margin: EdgeInsets.all(12),
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(40)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(40),
        child: BottomNavigationBar(
          showSelectedLabels: false, // <-- HERE
          showUnselectedLabels: false,

          backgroundColor: darkPinkColor,

          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
                icon: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  child: Image.asset(
                    'assets/images/home.png',
                    width: 40,
                  ),
                ),
                label: 'home'),
            BottomNavigationBarItem(
                icon: Image.asset(
                  'assets/images/postAds.png',
                  width: 40,
                ),
                label: 'postAds'),
            BottomNavigationBarItem(
                icon: GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, '/ads');
                  },
                  child: Image.asset(
                    'assets/images/ads.png',
                    width: 40,
                  ),
                ),
                label: 'ads'),
          ],
        ),
      ),
    );
  }
}
