import '../services/http.dart';
import 'package:flutter/material.dart';
import 'dart:convert';

class AdvertContent with ChangeNotifier {
  var advert = {
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
  List adverts = [];
  int statusCode = 0;
  String sortingStatus = 'Date ASC';

  get getAdvertValue => advert;
  get getAdvertList => adverts;
  get getStatusCode => statusCode;
  get getSortingStatus => sortingStatus;

  Future<void> getAdvert(BuildContext context, int pageStatus) async {
    advert['Page'] = pageStatus;
    print(getAdvertValue);
    // print(pageStatus);
    try {
      var response = await createHttpRequest(
          'api/Advert/filter', 'POST', getAdvertValue, context);
      statusCode = response.statusCode;
      print(response.statusCode);

      if (response.statusCode == 200) {
        print('working');
        //advert['Page'] = pageStatus;
        adverts = jsonDecode(response.body) as List;
      } else {
        adverts = [];
      }
    } catch (err) {
      print("Uncaught error: $err");
    }

    notifyListeners();
  }

  void sortAdvert(String _sortingStatus) {
    sortingStatus = _sortingStatus;
    advert['OrderByWith'] = getSortingStatus;
    advert['Page'] = 1;
    advert['PageSize'] = 5;
    notifyListeners();
  }

  void filterAdvert(newAdvert) {
    advert = newAdvert;
    advert['OrderByWith'] = getSortingStatus;

    notifyListeners();
  }
}
