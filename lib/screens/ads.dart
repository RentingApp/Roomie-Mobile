import '../providers/advertContent.dart';
import '../widgets/loadingSpinner.dart';
import 'package:flutter/material.dart';
import '../globals/colors.dart';
import '../widgets/bottomNavigationBar.dart';
import '../widgets/appbar.dart';
import '../widgets/singleAd.dart';
import 'package:provider/provider.dart';
import '../providers/auth.dart';

class Ads extends StatefulWidget {
  const Ads({Key? key}) : super(key: key);

  @override
  State<Ads> createState() => _AdsState();
}

class _AdsState extends State<Ads> {
  final scrollController = ScrollController();
  List posts = [];
  int page = 1;
  bool isLoadingMore = false;
  bool firstLoading = true;
  var userId;

  @override
  void initState() {
    super.initState();
    getUserId();
    scrollController.addListener(_scrollListener);
    fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    //print(posts);
    //print(Provider.of<AdvertContent>(context).getAdvertValue);
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
    try {
      await Provider.of<AdvertContent>(context, listen: false)
          .getAdvert(context, page);

      if (Provider.of<AdvertContent>(context, listen: false).getStatusCode ==
          200) {
        //final json = jsonDecode(response.body) as List;
        //print(response.body);
        if (Provider.of<AdvertContent>(context, listen: false)
                .getAdvertList
                .length ==
            0) {
          setState(() {
            isLoadingMore = false;
          });
        } else {
          /*print(
              Provider.of<AdvertContent>(context, listen: false).getAdvertList);*/
          setState(() {
            posts += Provider.of<AdvertContent>(context, listen: false)
                .getAdvertList;
            //print(posts);
            // print('upppppp');
            isLoadingMore = true;
          });
        }
      }
    } catch (err) {
      print("Uncaught error: $err");
    }
  }

  void getUserId() async {
    var token = await Provider.of<Auth>(context, listen: false).getToken();

    var id =
        await Provider.of<Auth>(context, listen: false).workingWithToken(token);

    setState(() {
      userId = id;
    });
  }
}
