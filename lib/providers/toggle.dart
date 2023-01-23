import 'package:flutter/material.dart';
import '../services/http.dart';

class Toggle extends ChangeNotifier {
  bool priceStatus = false;
  bool dateStatus = true;

  bool togglePrice = false;
  bool toggleDate = true;

  bool get getStatusPrice => priceStatus;

  bool get getStatusDate => dateStatus;

  bool get getTogglePrice => togglePrice;

  bool get getToggleDate => toggleDate;

  void changeStatusPrice() {
    if (priceStatus == false) {
      priceStatus = true;
      dateStatus = false;
    }

    notifyListeners();
  }

  void changeStatusDate() {
    if (dateStatus == false) {
      dateStatus = true;
      priceStatus = false;
    }
    notifyListeners();
  }

  void changeTogglePrice(val) {
    togglePrice = val;
    notifyListeners();
  }

  void changeToggleDate(val) {
    toggleDate = val;

    notifyListeners();
  }

  void getAds(BuildContext context, dynamic data) async {
    var response =
        await createHttpRequest('api/Advert/filter', 'POST', data, context);

    notifyListeners();
  }
}
