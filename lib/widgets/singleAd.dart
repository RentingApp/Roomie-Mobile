import '../services/http.dart';
import '../models/successMessage.dart';
import '../providers/editingAdInputs.dart';
import 'package:flutter/material.dart';
import '../globals/colors.dart';
import 'package:responsive_grid/responsive_grid.dart';
import 'package:intl/intl.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import './infoCard.dart';
import 'dart:convert';
import 'package:flutter/gestures.dart';

class Ad extends StatefulWidget {
  final int advertId;
  final int applicationUserId;
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

  const Ad(
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
      this.applicationUserId,
      this.private);

  @override
  State<Ad> createState() => _AdState();
}

class _AdState extends State<Ad> {
  bool showRightScrollStatus = true;
  final _controller = ScrollController();
  bool saved = false;
  bool content = false;

  getDate(String date) {
    DateTime datetime = DateTime.parse(date);
    String datetime3 = DateFormat.MMMMEEEEd().format(datetime);
    return datetime3;
  }

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    editAd(Map<String, String> singleAd, BuildContext ctx) async {
      Provider.of<EditingAdInputs>(context, listen: false)
          .fillListToAdvertValues(singleAd);
      Provider.of<EditingAdInputs>(context, listen: false).init();
      Navigator.of(ctx).pushNamed('/editAd', arguments: singleAd);
    }

    deleteAd(advertId) async {
      try {
        /*var values = {
        "City": "",
        "District": "",
        "Neighbourhood": "",
        "Rooms": "",
        "MinPrice": null,
        "MaxPrice": null,
        "MinFloorArea": null,
        "MaxFloorArea": null,
        "Page": page,
        "PageSize": 5
      };*/

        //print(userId);
        final url =
            'https://bbab-94-121-173-56.eu.ngrok.io/api/Advert/$advertId';
        final uri = Uri.parse(url);
        var token = null;
        await Provider.of<Auth>(context, listen: false)
            .getToken()
            .then((value) {
          token = value;
        });
        var response = await http.delete(uri, headers: {
          "content-type": "application/json",
          "accept": "application/json",
          'Authorization': 'Bearer $token',
        });
        //print(response.statusCode);
        if (response.statusCode == 200) {
          SuccessMessage('The post succcessfuly deleted', context);
          Navigator.pushNamed(context, '/ads');
        }
      } catch (err) {
        print("Uncaught error: $err");
      }
    }

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

                  child: GestureDetector(
                      onTap: () async {
                        //print(widget.advertId);
                        var userId = widget.applicationUserId;
                        var response = await createHttpRequest(
                            'api/Account/${userId}', 'GET', {}, context);

                        if (response.statusCode == 200) {
                          print(response.body);
                          Navigator.of(context).pushNamed(
                              '/differentPersonProfile',
                              arguments: jsonDecode(response.body));
                        }
                      },
                      child: Image.asset(
                        'assets/images/samplePP3.png',
                        width: 30,
                      )),
                ),
              ),
              ResponsiveGridCol(
                xs: 8,
                child: Container(
                  alignment: Alignment.centerLeft,

                  height: 40,
                  //margin: EdgeInsets.only(left: 15),
                  child: GestureDetector(
                      onTap: () async {
                        var userId = widget.applicationUserId;
                        var response = await createHttpRequest(
                            'api/Account/${userId}', 'GET', {}, context);

                        if (response.statusCode == 200) {
                          print(response.body);
                          Navigator.of(context).pushNamed(
                              '/differentPersonProfile',
                              arguments: jsonDecode(response.body));
                        }
                      },
                      child: Text(
                        widget.username,
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold),
                      )),
                ),
              ),
              ResponsiveGridCol(
                xs: 2,
                child: GestureDetector(
                  child: Container(
                      alignment: Alignment.center,
                      height: 40,
                      //margin: EdgeInsets.only(left: 15),
                      child: !widget.private
                          ? GestureDetector(
                              onTap: () {
                                setState(() {
                                  saved = !saved;
                                });
                              },
                              child: Container(
                                  child: !saved
                                      ? Icon(
                                          Icons.bookmark_border,
                                          color: darkPinkColor,
                                          size: 30,
                                        )
                                      : Icon(
                                          Icons.bookmark,
                                          color: darkPinkColor,
                                          size: 30,
                                        )))
                          : /* updated
                              ? Container()
                              : */
                          Icon(
                              Icons.more_vert,
                              color: darkPinkColor,
                            )),
                  onTap: () {
                    showModalBottomSheet<void>(
                      context: context,
                      backgroundColor: Colors.transparent,
                      builder: (BuildContext context) {
                        return Container(
                          height: 400,
                          //color: Colors.white,
                          margin: EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(40)),
                              color: whiteColor),
                          //color: whiteColor,
                          child: Center(
                            child: Column(
                              //mainAxisAlignment: MainAxisAlignment.center,
                              //mainAxisSize: MainAxisSize.min,

                              children: <Widget>[
                                //const Text('Modal BottomSheet'),
                                Container(
                                  margin: EdgeInsets.only(top: 15),
                                  width: 40,
                                  height: 6,
                                  decoration: BoxDecoration(
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(40)),
                                    color: darkPinkColor,
                                  ),
                                ),
                                SizedBox(height: 30),
                                Material(
                                  color: whiteColor.withOpacity(0.0),
                                  child: InkWell(
                                    onTap: () {
                                      print("Wow! Ripple");
                                    },
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(20),
                                      topRight: Radius.circular(20),
                                    ),
                                    child: Container(
                                      //margin: EdgeInsets.only(top: 100),
                                      child: ResponsiveGridRow(
                                        children: [
                                          ResponsiveGridCol(
                                            xs: 6,
                                            child: Container(
                                              height: 60,
                                              //margin: EdgeInsets.only(right: 15),
                                              alignment: Alignment.center,
                                              child: Image.asset(
                                                'assets/images/saved.png',
                                                width: 35,
                                              ),
                                            ),
                                          ),
                                          ResponsiveGridCol(
                                            xs: 6,
                                            child: Container(
                                              alignment: Alignment.centerLeft,
                                              height: 60,
                                              //margin: EdgeInsets.only(left: 15),
                                              child: const Text(
                                                "Save",
                                                style: TextStyle(
                                                    fontSize: 20,
                                                    fontWeight:
                                                        FontWeight.normal),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),

                                if (widget.private)
                                  Material(
                                    color: whiteColor.withOpacity(0.0),
                                    child: InkWell(
                                      onTap: () {
                                        editAd({
                                          'advertId':
                                              widget.advertId.toString(),
                                          'publishDate': widget.publishDate,
                                          'title': widget.title,
                                          'content': widget.content,
                                          'city': widget.city,
                                          'district': widget.district,
                                          'neighbourhood': widget.neighbourhood,
                                          'rooms': widget.rooms,
                                          'price': widget.price,
                                          'floorArea': widget.floorArea,
                                          'private': widget.private.toString(),
                                        }, context);
                                      },
                                      child: Container(
                                        //margin: EdgeInsets.only(top: 100),
                                        child: ResponsiveGridRow(
                                          children: [
                                            ResponsiveGridCol(
                                              xs: 6,
                                              child: Container(
                                                height: 60,
                                                //margin: EdgeInsets.only(right: 15),
                                                alignment: Alignment.center,
                                                child:
                                                    Icon(Icons.edit, size: 30),
                                              ),
                                            ),
                                            ResponsiveGridCol(
                                              xs: 6,
                                              child: Container(
                                                alignment: Alignment.centerLeft,
                                                height: 60,
                                                //margin: EdgeInsets.only(left: 15),
                                                child: const Text(
                                                  "Edit",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                if (widget.private)
                                  Material(
                                    color: whiteColor.withOpacity(0.0),
                                    child: InkWell(
                                      onTap: () {
                                        deleteAd(widget.advertId);
                                      },
                                      child: Container(
                                        //margin: EdgeInsets.only(top: 100),
                                        child: ResponsiveGridRow(
                                          children: [
                                            ResponsiveGridCol(
                                              xs: 6,
                                              child: Container(
                                                height: 60,
                                                //margin: EdgeInsets.only(right: 15),
                                                alignment: Alignment.center,
                                                child: Icon(
                                                  Icons.delete,
                                                  size: 30,
                                                ),
                                              ),
                                            ),
                                            ResponsiveGridCol(
                                              xs: 6,
                                              child: Container(
                                                alignment: Alignment.centerLeft,
                                                height: 60,
                                                //margin: EdgeInsets.only(left: 15),
                                                child: const Text(
                                                  "Delete",
                                                  style: TextStyle(
                                                      fontSize: 20,
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          Container(
              height: 250,
              //margin: EdgeInsets.all(15),
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
                  margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                  alignment: Alignment.bottomLeft,
                  child: Text(
                    widget.title,
                    style: TextStyle(fontSize: 19, fontWeight: FontWeight.bold),
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
                  //height: 40,
                  padding: EdgeInsets.symmetric(vertical: 10),
                  //margin: EdgeInsets.only(left: 15),
                  child: Text(
                    '\$${widget.price}',
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
            margin: EdgeInsets.symmetric(horizontal: 35, vertical: 15),
            //margin: EdgeInsets.only(right: 15),

            child: GestureDetector(
                onTap: content
                    ? () {
                        setState(() {
                          content = !content;
                        });
                      }
                    : null,
                child: RichText(
                  text: TextSpan(
                    children: <TextSpan>[
                      TextSpan(
                          text: widget.content.length > 70
                              ? !content
                                  ? widget.content.substring(0, 50)
                                  : widget.content
                              : widget.content,
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.normal,
                            color: blackColor,
                          )),
                      if (widget.content.length > 70 && !content)
                        TextSpan(
                            text: ' more...',
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: blackColor),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                setState(() {
                                  content = !content;
                                });
                              }),
                    ],
                  ),
                ) /*Text(
                originalContent.length > 50 ? originalContent.substring(0,50):originalContent,
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
              )*/
                ),
            /*Text(
              widget.content,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
            ),*/
          ),
          Stack(
            children: [
              Container(
                //color: Colors.blueAccent,
                alignment: Alignment.center,
                child: Column(
                  //mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      //margin: EdgeInsets.symmetric(horizontal: 30),
                      height: 1 / 2,
                      color: blackColor,
                    ),
                    Container(
                        alignment: Alignment.center,
                        height: MediaQuery.of(context).size.height * 1.3 / 10,
                        child: NotificationListener<ScrollUpdateNotification>(
                          child: Center(
                              child: ListView(
                            shrinkWrap: true,
                            controller: _controller,
                            scrollDirection: Axis.horizontal,
                            padding: EdgeInsets.only(
                                right: 25 /*, top: 13, bottom: 5*/),
                            children: <Widget>[
                              Container(
                                margin: EdgeInsets.only(left: 10),
                                child: InfoCard('city', widget.city),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: InfoCard('District', widget.district),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: InfoCard(
                                    'Neighbourhood', widget.neighbourhood),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: InfoCard(
                                    'Floor Area(M2)', widget.floorArea),
                              ),
                              Container(
                                alignment: Alignment.centerLeft,
                                child: InfoCard('Rooms', widget.rooms),
                              ),
                            ],
                          )),
                          onNotification: (notification) {
                            if (_controller.position.pixels ==
                                _controller.position.maxScrollExtent) {
                              setState(() {
                                showRightScrollStatus = !showRightScrollStatus;
                              });
                            } else {
                              setState(() {
                                showRightScrollStatus = true;
                              });
                            }
                            // Return true to cancel the notification bubbling. Return false (or null) to
                            // allow the notification to continue to be dispatched to further ancestors.
                            return true;
                          },
                        )),
                    Container(
                      //margin: EdgeInsets.symmetric(horizontal: 30),
                      height: 1 / 2,
                      color: blackColor,
                    ),
                  ],
                ),
              ),
              if (showRightScrollStatus)
                Positioned.fill(
                  child: Align(
                      alignment: Alignment.centerRight,
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: LinearGradient(
                          stops: [
                            0.0,
                            1,
                          ],
                          begin: Alignment.centerLeft,
                          end: Alignment.centerRight,
                          colors: [Colors.transparent, greyColor],
                        )),
                        //alignment: Alignment.centerRight,
                        width: 70,
                        //height: MediaQuery.of(context).size.height * 1 / 10,
                      )),
                ),
            ],
          ),
          Container(
            width: double.infinity,
            margin: EdgeInsets.only(right: 15),
            padding: EdgeInsets.only(bottom: 5, top: 5),
            alignment: Alignment.centerRight,
            child: Text(
              getDate(widget.publishDate),
              style: TextStyle(
                  fontSize: 13, fontWeight: FontWeight.bold, color: blackColor),
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            height: 5 / 2,
            color: darkPinkColor,
          ),
        ],
      ),
    );
  }
}
