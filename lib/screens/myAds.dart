import '../services/http.dart';
import '../widgets/loadingSpinner.dart';
import 'package:flutter/material.dart';
import '../globals/colors.dart';
import '../widgets/bottomNavigationBar.dart';
import '../widgets/appbar.dart';
import '../widgets/singleAd.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';
import 'dart:convert';

class MyAds extends StatefulWidget {
  const MyAds({Key? key}) : super(key: key);

  @override
  State<MyAds> createState() => _MyAdsState();
}

class _MyAdsState extends State<MyAds> {
  final scrollController = ScrollController();
  List posts = [];
  int page = 1;
  bool isLoadingMore = false;
  bool firstLoading = true;
  var userId;

  @override
  void initState() {
    super.initState();
    firstInitFunc();
  }

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 5000), () {
      setState(() {
        firstLoading = false;
      });
    });
    return Scaffold(
      backgroundColor: greyColor,
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [CustomAppbar()]),
      ),
      bottomNavigationBar: bottomNavigationBar(),
      body: firstLoading
          ? LoadingSpinner('')
          : ListView.builder(
              controller: scrollController,
              itemCount: isLoadingMore ? posts.length + 1 : posts.length,
              itemBuilder: (context, index) {
                if (index < posts.length) {
                  final post = posts[index];
                  final advertId = post['advertId'];
                  final username = post['username'];
                  final applicationUserId = post['applicationUserId'];
                  final publishDate = post['publishDate'];
                  final title = post['title'];
                  final content = post['content'];
                  final city = post['city'];
                  final district = post['district'];
                  final neighbourhood = post['neighbourhood'];
                  final rooms = post['rooms'];
                  final price = post['price'];
                  final floorArea = post['floorArea'];

                  return Column(children: [
                    Ad(
                        advertId,
                        username,
                        publishDate,
                        title,
                        content,
                        city,
                        district,
                        neighbourhood,
                        rooms,
                        price.toString(),
                        floorArea,
                        applicationUserId,
                        userId == applicationUserId.toString() ? true : false)
                  ]);
                } else {
                  return isLoadingMore
                      ? Center(child: CircularProgressIndicator())
                      : Container();
                }
              }),
    );
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
    print("Asdsad");
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

      var response = await createHttpRequest(
          'api/Advert/user/$userId', 'GET', {}, context);
      print(response.statusCode);
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
    print('asd');
    await getUserId();
    scrollController.addListener(_scrollListener);
    fetchPosts();
  }
}
