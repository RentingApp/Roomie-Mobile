import '../providers/editingAdInputs.dart';
import 'package:flutter/material.dart';
import '../globals/colors.dart';
import '../widgets/bottomNavigationBar.dart';
import '../widgets/appbar.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:responsive_grid/responsive_grid.dart';

class EditAd extends StatefulWidget {
  @override
  State<EditAd> createState() => _EditAdState();
}

class _EditAdState extends State<EditAd> {
  Map<String, String> args = {};
  bool _initState = true;
  String titleInputValue = '';
  final titleController = TextEditingController();
  final contentController = TextEditingController();
  final cityController = TextEditingController();
  final districtController = TextEditingController();
  final neighbourhoodController = TextEditingController();
  final roomsController = TextEditingController();
  final floorAreaController = TextEditingController();
  final priceController = TextEditingController();
  final scrollController = ScrollController();

  List posts = [];
  int page = 1;
  bool isLoadingMore = false;
  bool firstLoading = true;
  var userId;

  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    if (_initState) {
      final args =
          ModalRoute.of(context)!.settings.arguments as Map<String, String>;

      titleController.text = args['title'].toString();
      contentController.text = args['content'].toString();
      cityController.text = args['city'].toString();
      districtController.text = args['district'].toString();
      neighbourhoodController.text = args['neighbourhood'].toString();
      roomsController.text = args['rooms'].toString();
      floorAreaController.text = args['floorArea'].toString();
      priceController.text = args['price'].toString();
    }

    _initState = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    void inputHandler() {
      Provider.of<EditingAdInputs>(context, listen: false).controlInputValues({
        'title': titleController.text,
        'content': contentController.text,
        'city': cityController.text,
        'district': districtController.text,
        'neighbourhood': neighbourhoodController.text,
        'floorArea': floorAreaController.text,
        'rooms': roomsController.text,
        'price': priceController.text,
      });
    }

    Future.delayed(const Duration(milliseconds: 5000), () {
      setState(() {
        firstLoading = false;
      });
    });
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: greyColor,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [CustomAppbar()]),
        ),
        bottomNavigationBar: bottomNavigationBar(),
        body: SingleChildScrollView(
          child: Container(
              width: double.infinity,
              //height: MediaQuery.of(context).size.height,
              child: Column(
                children: [
                  ResponsiveGridRow(
                    children: [
                      ResponsiveGridCol(
                        xs: 4,
                        child: Container(
                            alignment: Alignment.center,
                            margin: EdgeInsets.only(
                                top: 35, left: 25, right: 25, bottom: 25),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/sampleAdPhoto.png',
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Image.asset(
                                  'assets/images/sampleAdPhoto.png',
                                ),
                                SizedBox(
                                  height: 25,
                                ),
                                Image.asset(
                                  'assets/images/sampleAdPhoto.png',
                                )
                              ],
                            )),
                      ),
                      ResponsiveGridCol(
                        xs: 1,
                        child: Container(
                            margin: EdgeInsets.only(top: 20),
                            alignment: Alignment.centerLeft,
                            child: Container(
                              color: blackColor,
                              width: 1,
                              height:
                                  MediaQuery.of(context).size.height * 4 / 10,
                            )),
                      ),
                      ResponsiveGridCol(
                        xs: 7,
                        child: Container(
                            margin: EdgeInsets.only(top: 35),
                            //color: Colors.blue,
                            alignment: Alignment.centerLeft,

                            //margin: EdgeInsets.only(left: 15),
                            child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Stack(
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        margin: EdgeInsets.only(right: 25),
                                        child: Text(
                                          'Title',
                                          style: TextStyle(color: orangeColor),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 25),
                                        child: TextField(
                                          onChanged: (text) {
                                            inputHandler();
                                          },
                                          //focusNode: _focusTitle,
                                          textAlign: TextAlign.start,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.fromLTRB(
                                                8, 0, 8, -10.0),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: blackColor,
                                                  width: 2.5),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: blackColor,
                                                  width: 2.5),
                                            ),
                                            //hintText: 'Title',
                                            hintStyle: TextStyle(
                                                fontSize: 16.0,
                                                color: blackColor,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          controller: titleController,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        margin: EdgeInsets.only(right: 25),
                                        child: Text(
                                          'Content',
                                          style: TextStyle(color: orangeColor),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 25),
                                        child: TextField(
                                          onChanged: (text) {
                                            inputHandler();
                                          },
                                          /*onChanged: (text) {
                                        FirstValueHandler(text);
                                      },*/
                                          //focusNode: _focusTitle,
                                          textAlign: TextAlign.start,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.fromLTRB(
                                                8, 0, 8, -10.0),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: blackColor,
                                                  width: 2.5),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: blackColor,
                                                  width: 2.5),
                                            ),
                                            //hintText: 'Title',
                                            hintStyle: TextStyle(
                                                fontSize: 16.0,
                                                color: blackColor,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          controller: contentController,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        margin: EdgeInsets.only(right: 25),
                                        child: Text(
                                          'City',
                                          style: TextStyle(color: orangeColor),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 25),
                                        child: TextField(
                                          onChanged: (text) {
                                            inputHandler();
                                          },
                                          /*onChanged: (text) {
                                        FirstValueHandler(text);
                                      },*/
                                          //focusNode: _focusTitle,
                                          textAlign: TextAlign.start,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.fromLTRB(
                                                8, 0, 8, -10.0),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: blackColor,
                                                  width: 2.5),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: blackColor,
                                                  width: 2.5),
                                            ),
                                            //hintText: 'Title',
                                            hintStyle: TextStyle(
                                                fontSize: 16.0,
                                                color: blackColor,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          controller: cityController,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        margin: EdgeInsets.only(right: 25),
                                        child: Text(
                                          'District',
                                          style: TextStyle(color: orangeColor),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 25),
                                        child: TextField(
                                          onChanged: (text) {
                                            inputHandler();
                                          },
                                          /*onChanged: (text) {
                                        FirstValueHandler(text);
                                      },*/
                                          //focusNode: _focusTitle,
                                          textAlign: TextAlign.start,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.fromLTRB(
                                                8, 0, 8, -10.0),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: blackColor,
                                                  width: 2.5),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: blackColor,
                                                  width: 2.5),
                                            ),
                                            //hintText: 'Title',
                                            hintStyle: TextStyle(
                                                fontSize: 16.0,
                                                color: blackColor,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          controller: districtController,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        margin: EdgeInsets.only(right: 25),
                                        child: Text(
                                          'Neighbourhood',
                                          style: TextStyle(color: orangeColor),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 25),
                                        child: TextField(
                                          onChanged: (text) {
                                            inputHandler();
                                          },
                                          /*onChanged: (text) {
                                        FirstValueHandler(text);
                                      },*/
                                          //focusNode: _focusTitle,
                                          textAlign: TextAlign.start,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.fromLTRB(
                                                8, 0, 8, -10.0),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: blackColor,
                                                  width: 2.5),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: blackColor,
                                                  width: 2.5),
                                            ),
                                            //hintText: 'Title',
                                            hintStyle: TextStyle(
                                                fontSize: 16.0,
                                                color: blackColor,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          controller: neighbourhoodController,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        margin: EdgeInsets.only(right: 25),
                                        child: Text(
                                          'Rooms',
                                          style: TextStyle(color: orangeColor),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 25),
                                        child: TextField(
                                          onChanged: (text) {
                                            inputHandler();
                                          },
                                          /*onChanged: (text) {
                                        FirstValueHandler(text);
                                      },*/
                                          //focusNode: _focusTitle,
                                          textAlign: TextAlign.start,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.fromLTRB(
                                                8, 0, 8, -10.0),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: blackColor,
                                                  width: 2.5),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: blackColor,
                                                  width: 2.5),
                                            ),
                                            //hintText: 'Title',
                                            hintStyle: TextStyle(
                                                fontSize: 16.0,
                                                color: blackColor,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          controller: roomsController,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        margin: EdgeInsets.only(right: 25),
                                        child: Text(
                                          'Floor Area',
                                          style: TextStyle(color: orangeColor),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(right: 25),
                                        child: TextField(
                                          onChanged: (text) {
                                            inputHandler();
                                          },
                                          /*onChanged: (text) {
                                        FirstValueHandler(text);
                                      },*/
                                          //focusNode: _focusTitle,
                                          textAlign: TextAlign.start,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.fromLTRB(
                                                8, 0, 8, -10.0),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: blackColor,
                                                  width: 2.5),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: blackColor,
                                                  width: 2.5),
                                            ),
                                            //hintText: 'Title',
                                            hintStyle: TextStyle(
                                                fontSize: 16.0,
                                                color: blackColor,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          controller: floorAreaController,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 20,
                                  ),
                                  Stack(
                                    children: [
                                      Container(
                                        alignment: Alignment.centerLeft,
                                        margin: EdgeInsets.only(right: 25),
                                        child: Text(
                                          'Price',
                                          style: TextStyle(color: orangeColor),
                                        ),
                                      ),
                                      Container(
                                        margin: EdgeInsets.only(
                                            right: 25, bottom: 55),
                                        child: TextField(
                                          onChanged: (text) {
                                            inputHandler();
                                          },
                                          /*onChanged: (text) {
                                        FirstValueHandler(text);
                                      },*/
                                          //focusNode: _focusTitle,
                                          textAlign: TextAlign.start,
                                          decoration: InputDecoration(
                                            contentPadding: EdgeInsets.fromLTRB(
                                                8, 0, 8, -10.0),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: blackColor,
                                                  width: 2.5),
                                            ),
                                            focusedBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: blackColor,
                                                  width: 2.5),
                                            ),
                                            //hintText: 'Title',
                                            hintStyle: TextStyle(
                                                fontSize: 16.0,
                                                color: blackColor,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          controller: priceController,
                                        ),
                                      ),
                                    ],
                                  ),
                                ])),
                      ),
                    ],
                  ),
                ],
              )),
        ));
  }

  Future<void> _scrollListener() async {
    if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent &&
        isLoadingMore) {
      page++;
      await fetchPosts();
    }
  }

  Future<void> fetchPosts() async {
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
          'https://9f63-94-121-173-203.eu.ngrok.io/api/Advert/user/$userId';
      final uri = Uri.parse(url);
      var response = await http.get(uri, headers: {
        "content-type": "application/json",
        "accept": "application/json",
      });
      //print(response.body);
      if (response.statusCode == 200) {
        final json = jsonDecode(response.body) as List;
        //print(json.length);
        if (json.length == 0) {
          setState(() {
            isLoadingMore = false;
          });
        } else {
          setState(() {
            posts += json;
            isLoadingMore = true;
          });
        }
      }
    } catch (err) {
      print("Uncaught error: $err");
    }
  }

  Future<void> getUserId() async {
    var token = await Provider.of<Auth>(context, listen: false).getToken();

    var id =
        await Provider.of<Auth>(context, listen: false).workingWithToken(token);

    setState(() {
      userId = id;
    });
  }

  Future<void> firstInitFunc() async {
    await getUserId();
    scrollController.addListener(_scrollListener);
    fetchPosts();
  }
}
