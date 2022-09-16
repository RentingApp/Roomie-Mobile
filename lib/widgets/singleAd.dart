import 'package:flutter/material.dart';
import '../globals/colors.dart';
import 'package:responsive_grid/responsive_grid.dart';

class SingleAd extends StatelessWidget {
  const SingleAd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: greyColor,
      child: Column(
        children: [
          ResponsiveGridRow(
            children: [
              ResponsiveGridCol(
                xs: 2,
                child: Container(
                  height: 40,

                  //margin: EdgeInsets.only(right: 15),

                  alignment: Alignment.center,
                  child: Image.asset(
                    'assets/images/samplePP3.png',
                    width: 35,
                  ),
                ),
              ),
              ResponsiveGridCol(
                xs: 9,
                child: Container(
                  alignment: Alignment.centerLeft,

                  height: 40,
                  //margin: EdgeInsets.only(left: 15),
                  child: const Text(
                    "username",
                    style:
                        TextStyle(fontSize: 20, fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              ResponsiveGridCol(
                xs: 1,
                child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    //margin: EdgeInsets.only(left: 15),
                    child: Icon(Icons.more_vert)),
              ),
            ],
          ),
          Container(
              height: 300,
              color: greyColor,
              width: double.infinity,
              child: Image.asset(
                'assets/images/sampleAdPhoto.png',
                fit: BoxFit.cover,
              )),
          ResponsiveGridRow(
            children: [
              ResponsiveGridCol(
                xs: 9,
                child: Container(
                  height: 40,

                  margin: EdgeInsets.only(left: 15),
                  //margin: EdgeInsets.only(right: 15),

                  alignment: Alignment.bottomLeft,
                  child: const Text(
                    "Header",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              ResponsiveGridCol(
                xs: 3,
                child: Container(
                  alignment: Alignment.center,

                  decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(30)),
                      color: darkPinkColor),
                  height: 40,
                  //margin: EdgeInsets.only(left: 15),
                  child: const Text(
                    "1250₺",
                    style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: whiteColor),
                  ),
                ),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            padding: EdgeInsets.only(top: 15, bottom: 4),
            margin: EdgeInsets.symmetric(horizontal: 25),
            //margin: EdgeInsets.only(right: 15),

            child: const Text(
              "lorem ipsum dolor sit amet, consetetur sadipscing elitr, sed diam nonumy eirmod tempor lorem ipsum dolor sit amet, cons...",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),
          ),
          Container(
              margin: EdgeInsets.symmetric(horizontal: 30),
              child: Divider(
                color: Colors.black,
              )),
          ResponsiveGridRow(
            children: [
              ResponsiveGridCol(
                xs: 3,
                child: Container(
                  height: 40,

                  //margin: EdgeInsets.only(right: 15),

                  alignment: Alignment.center,
                  child: const Text(
                    "il:Ankara",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              ResponsiveGridCol(
                xs: 3,
                child: Container(
                  alignment: Alignment.center,

                  height: 40,
                  //margin: EdgeInsets.only(left: 15),
                  child: const Text(
                    "Ilce:Caykara",
                    style:
                        TextStyle(fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                ),
              ),
              ResponsiveGridCol(
                xs: 3,
                child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    //margin: EdgeInsets.only(left: 15),
                    child: const Text(
                      "Mahalle:?",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    )),
              ),
              ResponsiveGridCol(
                xs: 3,
                child: Container(
                    alignment: Alignment.center,
                    height: 40,
                    //margin: EdgeInsets.only(left: 15),
                    child: const Text(
                      "Oda Sayisi:4",
                      style: TextStyle(
                          fontSize: 14, fontWeight: FontWeight.normal),
                    )),
              ),
            ],
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(right: 15),
            padding: EdgeInsets.only(bottom: 4),
            /*margin: EdgeInsets.symmetric(horizontal: 25),*/
            //margin: EdgeInsets.only(right: 15),
            alignment: Alignment.centerRight,
            child: const Text(
              "15 Jun 2022",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ),
          Divider(
            color: Colors.black,
          ),
        ],
      ),
    );
  }
}
