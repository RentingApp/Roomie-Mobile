import '../services/baseUrl.dart';
import 'package:flutter/material.dart';
import '../globals/colors.dart';
import '../widgets/bottomNavigationBar.dart';
import '../widgets/appbar.dart';
import '../widgets/showDialog.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../models/registerResponse.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import './deneme3.dart';
import '../models/successMessage.dart';
import '../widgets/loadingSpinner.dart';

class EditingAd extends StatefulWidget {
  final int advertId;
  final String username;
  final String publishDate;
  final String title;
  final String content;
  final String city;
  final String district;
  final String neighbourhood;
  final String rooms;
  final String price;
  final String floorArea;
  final bool private;

  const EditingAd(
      this.advertId,
      this.username,
      this.publishDate,
      this.title,
      this.content,
      this.city,
      this.district,
      this.neighbourhood,
      this.rooms,
      this.price,
      this.floorArea,
      this.private);

  @override
  State<EditingAd> createState() => _EditingAdState();
}

class _EditingAdState extends State<EditingAd> {
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final cityController = TextEditingController();
  final districtController = TextEditingController();
  final neighbourhoodController = TextEditingController();
  final numberOfRoomsAgainController = TextEditingController();
  final floorAreaController = TextEditingController();
  final priceController = TextEditingController();
  bool postStatus = false;

  Future<void> inputHandler(context) async {
    //SuccessMessage('Yay! A SnackBar!', context);
    if (titleController.text.length == 0 ||
        contentController.text.length == 0 ||
        cityController.text.length == 0 ||
        districtController.text.length == 0 ||
        neighbourhoodController.text.length == 0 ||
        numberOfRoomsAgainController.text.length == 0 ||
        floorAreaController.text.length == 0 ||
        priceController.text.length == 0) {
      return ShowDialog(
          context, 'Unfilled Blank Error', 'You must fill the all areas!');
    }

    try {
      var values = {
        "AdvertId": -1,
        "Title": titleController.text,
        "Content": contentController.text,
        "City": cityController.text,
        "District": districtController.text,
        "Neighbourhood": neighbourhoodController.text,
        "Rooms": numberOfRoomsAgainController.text,
        "Price": int.parse(priceController.text),
        "FloorArea": floorAreaController.text
      };
      var url = Uri.parse(baseUrl + 'api/Advert');
      var token = null;
      await Provider.of<Auth>(context, listen: false).getToken().then((value) {
        token = value;
      });

      var response = await http.post(url,
          headers: {
            "content-type": "application/json",
            "accept": "application/json",
            'Authorization': 'Bearer $token',
          },
          body: convert.jsonEncode(values));
      print(response.statusCode);
      print(response.body);
      if (response.statusCode == 200) {
        FocusManager.instance.primaryFocus?.unfocus();
        setState(() {
          postStatus = true;
        });

        Future.delayed(const Duration(milliseconds: 5000), () {
          setState(() {
            postStatus = false;
          });
          SuccessMessage('post uploaded', context);
          Navigator.pushNamed(context, '/ads');
        });
      } else if (response.statusCode == 400) {
        print(response.body);
      }
    } catch (err) {
      print("Uncaught error: $err");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Container(
          child: Scaffold(
        backgroundColor: greyColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(70),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [CustomAppbar()]),
        ),
        bottomNavigationBar: bottomNavigationBar(),
        body: SingleChildScrollView(
          child: Column(children: [
            Container(
              height: 205,
              alignment: Alignment.center,
              color: Colors.purple[400],
              child: Text(
                'Image Section',
                style: TextStyle(color: blackColor),
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15, left: 45, right: 45),
              child: TextField(
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(8, 0, 8, -10.0),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: darkPinkColor, width: 2.5),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: darkPinkColor, width: 2.5),
                  ),
                  hintText: 'Title',
                  hintStyle: TextStyle(fontSize: 14.0, color: darkPinkColor),
                ),
                controller: titleController,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15, left: 45, right: 45),
              child: TextField(
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(8, 0, 8, -10.0),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: darkPinkColor, width: 2.5),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: darkPinkColor, width: 2.5),
                  ),
                  hintText: 'Content',
                  hintStyle: TextStyle(fontSize: 14.0, color: darkPinkColor),
                ),
                controller: contentController,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15, left: 45, right: 45),
              child: TextField(
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(8, 0, 8, -10.0),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: darkPinkColor, width: 2.5),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: darkPinkColor, width: 2.5),
                  ),
                  hintText: 'City',
                  hintStyle: TextStyle(fontSize: 14.0, color: darkPinkColor),
                ),
                controller: cityController,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15, left: 45, right: 45),
              child: TextField(
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(8, 0, 8, -10.0),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: darkPinkColor, width: 2.5),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: darkPinkColor, width: 2.5),
                  ),
                  hintText: 'District',
                  hintStyle: TextStyle(fontSize: 14.0, color: darkPinkColor),
                ),
                controller: districtController,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15, left: 45, right: 45),
              child: TextField(
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(8, 0, 8, -10.0),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: darkPinkColor, width: 2.5),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: darkPinkColor, width: 2.5),
                  ),
                  hintText: 'NeighbourHood',
                  hintStyle: TextStyle(fontSize: 14.0, color: darkPinkColor),
                ),
                controller: neighbourhoodController,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15, left: 45, right: 45),
              child: TextField(
                textAlign: TextAlign.start,
                decoration: InputDecoration(
                  contentPadding: EdgeInsets.fromLTRB(8, 0, 8, -10.0),
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: darkPinkColor, width: 2.5),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: darkPinkColor, width: 2.5),
                  ),
                  hintText: 'Number of Room',
                  hintStyle: TextStyle(fontSize: 14.0, color: darkPinkColor),
                ),
                controller: numberOfRoomsAgainController,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 15, left: 45, right: 45),
              child: TextField(
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(8, 0, 8, -10.0),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: darkPinkColor, width: 2.5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: darkPinkColor, width: 2.5),
                    ),
                    hintText: 'Floor Area',
                    hintStyle: TextStyle(fontSize: 14.0, color: darkPinkColor),
                  ),
                  controller: floorAreaController,
                  keyboardType: TextInputType.number),
            ),
            Container(
              margin: EdgeInsets.only(top: 15, left: 45, right: 45),
              child: TextField(
                  textAlign: TextAlign.start,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.fromLTRB(8, 0, 8, -10.0),
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: darkPinkColor, width: 2.5),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: darkPinkColor, width: 2.5),
                    ),
                    hintText: 'Price',
                    hintStyle: TextStyle(fontSize: 14.0, color: darkPinkColor),
                  ),
                  controller: priceController,
                  keyboardType: TextInputType.number),
            ),
            Container(
              margin: const EdgeInsets.only(top: 40.0, bottom: 80),
              child: FractionallySizedBox(
                widthFactor: 0.7,
                child: SizedBox(
                  height: 50,
                  child: ElevatedButton(
                    onPressed: () {
                      inputHandler(context);
                    } /* _showMyDialog*/,
                    style: ElevatedButton.styleFrom(
                      primary: darkPinkColor,
                      shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(30.0),
                      ),
                    ),
                    child: Text(
                      'Post this ad',
                      style: TextStyle(
                        fontSize: 20,
                        letterSpacing: 0.1,
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ]),
        ),
      )),
      if (postStatus) LoadingSpinner('')
    ]);
  }
}
