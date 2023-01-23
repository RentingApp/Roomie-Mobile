import '../providers/advertContent.dart';
import 'package:flutter/material.dart';
import '../globals/colors.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:provider/provider.dart';
import '../providers/toggle.dart';

ShowDialog(BuildContext context, String title) {
  final cityController = TextEditingController();
  final districtController = TextEditingController();
  final neighbourhoodController = TextEditingController();
  final roomsController = TextEditingController();
  final floorAreaController = TextEditingController();
  final priceController = TextEditingController();

  void searchHandler() async {
    if (Provider.of<Toggle>(context, listen: false).getStatusDate) {
      if (Provider.of<Toggle>(context, listen: false).getToggleDate) {
        Provider.of<AdvertContent>(context, listen: false)
            .sortAdvert('Date DESC');
        Navigator.pushNamed(context, '/ads');
      } else {
        Provider.of<AdvertContent>(context, listen: false)
            .sortAdvert('Date ASC');
        Navigator.pushNamed(context, '/ads');
      }
    }

    if (Provider.of<Toggle>(context, listen: false).getStatusPrice) {
      if (Provider.of<Toggle>(context, listen: false).getTogglePrice) {
        Provider.of<AdvertContent>(context, listen: false)
            .sortAdvert('Price DESC');
        /* var advert = {
          "City": "",
          "District": "",
          "Neighbourhood": "",
          "Rooms": "",
          "MinPrice": null,
          "MaxPrice": null,
          "MinFloorArea": null,
          "MaxFloorArea": null,
          "Page": 1,
          "PageSize": 5,
          "OrderByWith": "Date DESC"
        };
        var response = await createHttpRequest(
            'api/Advert/filter',
            'POST',
            {
              "City": "",
              "District": "",
              "Neighbourhood": "",
              "Rooms": "",
              "MinPrice": null,
              "MaxPrice": null,
              "MinFloorArea": null,
              "MaxFloorArea": null,
              "Page": 1,
              "PageSize": 5,
              "OrderByWith": "Date DESC"
            },
            context);*/
        //statusCode = response.statusCode;
        /* print(response.statusCode);
        print('asdasdsadsadsdas');*/
        /*print(
            Provider.of<AdvertContent>(context, listen: false).getAdvertValue);*/

        Navigator.pushNamed(context, '/ads');
      } else {
        Provider.of<AdvertContent>(context, listen: false)
            .sortAdvert('Price ASC');
        Navigator.pushNamed(context, '/ads');
      }
    }
  }

  void filterHandler() {
    var values = {
      "City": '',
      "District": districtController.text,
      "Neighbourhood": neighbourhoodController.text,
      "Rooms": roomsController.text,
      "MinPrice": int.parse(priceController.text.toString()),
      "MaxPrice": null,
      "MinFloorArea": null /*floorAreaController.text*/,
      "MaxFloorArea": null,
      "Page": 1,
      "PageSize": 5,
    };
    Provider.of<AdvertContent>(context, listen: false).filterAdvert(values);

    //print(Provider.of<AdvertContent>(context, listen: false).getStatusCode);
    if (Provider.of<AdvertContent>(context, listen: false).getStatusCode ==
        200) {
      //print(Provider.of<AdvertContent>(context, listen: false).getAdvertValue);
      Navigator.pushNamed(context, '/ads');
    } else {
      showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text('Filter Error'),
            content: SingleChildScrollView(
              child: ListBody(
                children: [Text('City cannot be non value')],
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
  }

  return showDialog<void>(
    context: context,
    barrierDismissible: false, // user must tap button!
    builder: (BuildContext context) {
      return AlertDialog(
        actionsPadding: EdgeInsets.only(bottom: 15, top: 15),
        shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(28.0))),
        backgroundColor: greyColor,
        title: Text(
          title,
          style: TextStyle(
              color: blackColor, fontWeight: FontWeight.bold, fontSize: 20),
        ),
        content: SingleChildScrollView(
          child: Consumer<Toggle>(builder: (context, value, child) {
            return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    height: 1,
                    width: double.infinity,
                    color: blackColor,
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  title == 'Sort'
                      ? Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Date'),
                                FlutterSwitch(
                                  width: 120.0,
                                  height: 35.0,
                                  activeColor: !value.getStatusDate
                                      ? blackColor
                                      : orangeColor,
                                  valueFontSize: 18.0,
                                  toggleSize: 30.0,
                                  value: value.getToggleDate,
                                  borderRadius: 30.0,
                                  inactiveColor: !value.getStatusDate
                                      ? blackColor
                                      : darkPinkColor,
                                  toggleColor: greyColor,
                                  disabled: !value.getStatusDate,
                                  padding: 8.0,
                                  showOnOff: true,
                                  activeText: "Nearest",
                                  inactiveText: "Furthest",
                                  onToggle: (val) {
                                    value.changeToggleDate(val);
                                  },
                                ),
                                GestureDetector(
                                  onTap: () {
                                    value.changeStatusDate();
                                  },
                                  child: Container(
                                    width: 15,
                                    height: 15,
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: darkPinkColor),
                                        color: value.getStatusDate
                                            ? darkPinkColor
                                            : greyColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 30,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text('Price'),
                                Container(
                                  // alignment: Alignment.centerRight,
                                  child: FlutterSwitch(
                                    width: 120.0,
                                    height: 35.0,
                                    valueFontSize: 18.0,
                                    activeColor: !value.getStatusPrice
                                        ? blackColor
                                        : orangeColor,
                                    toggleSize: 30.0,
                                    disabled: !value.getStatusPrice,
                                    inactiveColor: !value.getStatusPrice
                                        ? blackColor
                                        : darkPinkColor,
                                    toggleColor: greyColor,
                                    value: value.getTogglePrice,
                                    borderRadius: 30.0,
                                    padding: 8.0,
                                    showOnOff: true,
                                    activeText: "Highest",
                                    inactiveText: "Lowest",
                                    onToggle: (val) {
                                      //print(val);
                                      value.changeTogglePrice(val);
                                    },
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () {
                                    value.changeStatusPrice();
                                  },
                                  child: Container(
                                    width: 15,
                                    height: 15,
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: darkPinkColor),
                                        color: value.getStatusPrice
                                            ? darkPinkColor
                                            : greyColor,
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(15))),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      : Column(
                          children: [
                            Container(
                              //margin: EdgeInsets.only(right: 25),
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
                                    borderSide: BorderSide(
                                        color: blackColor, width: 2.5),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: blackColor, width: 2.5),
                                  ),
                                  hintText: 'City',
                                  hintStyle: TextStyle(
                                      fontSize: 16.0,
                                      color: blackColor,
                                      fontWeight: FontWeight.w500),
                                ),
                                controller: cityController,
                              ),
                            ),
                            Container(
                              //margin: EdgeInsets.only(right: 25),
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
                                    borderSide: BorderSide(
                                        color: blackColor, width: 2.5),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: blackColor, width: 2.5),
                                  ),
                                  hintText: 'District',
                                  hintStyle: TextStyle(
                                      fontSize: 16.0,
                                      color: blackColor,
                                      fontWeight: FontWeight.w500),
                                ),
                                controller: districtController,
                              ),
                            ),
                            Container(
                              //margin: EdgeInsets.only(right: 25),
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
                                    borderSide: BorderSide(
                                        color: blackColor, width: 2.5),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: blackColor, width: 2.5),
                                  ),
                                  hintText: 'Neighbourhood',
                                  hintStyle: TextStyle(
                                      fontSize: 16.0,
                                      color: blackColor,
                                      fontWeight: FontWeight.w500),
                                ),
                                controller: neighbourhoodController,
                              ),
                            ),
                            Container(
                              //margin: EdgeInsets.only(right: 25),
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
                                    borderSide: BorderSide(
                                        color: blackColor, width: 2.5),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: blackColor, width: 2.5),
                                  ),
                                  hintText: 'Floor Area(M2)',
                                  hintStyle: TextStyle(
                                      fontSize: 16.0,
                                      color: blackColor,
                                      fontWeight: FontWeight.w500),
                                ),
                                controller: floorAreaController,
                              ),
                            ),
                            Container(
                              //margin: EdgeInsets.only(right: 25),
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
                                    borderSide: BorderSide(
                                        color: blackColor, width: 2.5),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: blackColor, width: 2.5),
                                  ),
                                  hintText: 'Rooms',
                                  hintStyle: TextStyle(
                                      fontSize: 16.0,
                                      color: blackColor,
                                      fontWeight: FontWeight.w500),
                                ),
                                controller: roomsController,
                              ),
                            ),
                            Container(
                              //margin: EdgeInsets.only(right: 25),
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
                                    borderSide: BorderSide(
                                        color: blackColor, width: 2.5),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide: BorderSide(
                                        color: blackColor, width: 2.5),
                                  ),
                                  hintText: 'Price',
                                  hintStyle: TextStyle(
                                      fontSize: 16.0,
                                      color: blackColor,
                                      fontWeight: FontWeight.w500),
                                ),
                                controller: priceController,
                              ),
                            ),
                          ],
                        )
                ]);
          }),
        ),
        actionsAlignment: MainAxisAlignment.center,
        actions: <Widget>[
          ElevatedButton(
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(0),
                  padding:
                      MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                    (Set<MaterialState> states) {
                      return EdgeInsets.symmetric(horizontal: 25);
                    },
                  ),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(darkPinkColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(18.0),
                  ))),
              onPressed: () {
                if (title == 'Sort') {
                  searchHandler();
                } else {
                  filterHandler();
                }

                //Navigator.pop(context);
              },
              child: Text('Search')),
          ElevatedButton(
              style: ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(0),
                  padding:
                      MaterialStateProperty.resolveWith<EdgeInsetsGeometry>(
                    (Set<MaterialState> states) {
                      return EdgeInsets.symmetric(horizontal: 25);
                    },
                  ),
                  backgroundColor: MaterialStateProperty.all<Color>(greyColor),
                  foregroundColor:
                      MaterialStateProperty.all<Color>(darkPinkColor),
                  shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                      RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: darkPinkColor, width: 1)))),
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'))
        ],
      );
    },
  );
}
