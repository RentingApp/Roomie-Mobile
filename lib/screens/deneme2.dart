import '../services/baseUrl.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Deneme2 extends StatefulWidget {
  const Deneme2({Key? key}) : super(key: key);

  @override
  State<Deneme2> createState() => _Deneme2State();
}

class _Deneme2State extends State<Deneme2> {
  final scrollController = ScrollController();
  List posts = [];
  int page = 1;
  bool isLoadingMore = false;
  @override
  void initState() {
    super.initState();
    scrollController.addListener(_scrollListener);
    fetchPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: ListView.builder(
          controller: scrollController,
          itemCount: isLoadingMore ? posts.length + 1 : posts.length,
          itemBuilder: (context, index) {
            if (index < posts.length) {
              final post = posts[index];
              final username = post['username'];
              final publishDate = post['publishDate'];
              final title = post['title'];
              final content = post['content'];
              final city = post['city'];
              final district = post['district'];
              final neighbourhood = post['neighbourhood'];
              final rooms = post['rooms'];
              final price = post['price'];
              final floorArea = post['floorArea'];

              return Column(
                  /*children: [
                SingleAd(username, publishDate, title, content, city, district,
                    neighbourhood, rooms, price.toString(), floorArea, false)
              ]*/
                  );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  Future<void> fetchPosts() async {
    var values = {
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
    };
    final url = baseUrl + 'api/Advert/filter';
    final uri = Uri.parse(url);
    var response = await http.post(uri,
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
        },
        body: jsonEncode(values));
    print(response.statusCode);
    if (response.statusCode == 200) {
      final json = jsonDecode(response.body) as List;
      print(json);

      setState(() {
        posts += json;
      });
    } else {
      print('Unexpected response');
    }
  }

  Future<void> _scrollListener() async {
    if (isLoadingMore) return;
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      setState(() {
        isLoadingMore = true;
      });
      page = page + 1;
      await fetchPosts();
      setState(() {
        isLoadingMore = false;
      });
      //print('call');
    } else {
      //print('dont call');
    }
    //fetchPosts();
  }
}
