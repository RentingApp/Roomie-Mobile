import 'package:first_app/globals/colors.dart';
import 'package:flutter/material.dart';
import "../widgets/navbar.dart";
import '../widgets/appbar.dart';
import '../widgets/singleAd.dart';

void main() {
  runApp(Ads());
}

class Ads extends StatelessWidget {
  const Ads({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: greyColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [CustomAppbar()]),
      ),
      bottomNavigationBar: Navbar(),
      body: SingleChildScrollView(
        child: Column(
          children: [SingleAd(), SingleAd(), SingleAd(), SingleAd()],
        ),
      ),
    );
  }
}
