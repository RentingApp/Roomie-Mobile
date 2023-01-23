import 'package:flutter/material.dart';

class EditingAdInputs extends ChangeNotifier {
  bool changable = false;
  bool changable_profile = false;
  Map<String, dynamic> init_advertValues = {};
  Map<String, dynamic> current_advertValues = {};
  Map<String, dynamic> init_profileValues = {};
  Map<String, dynamic> current_profileValues = {};

  bool get changableStatus => changable;
  Map<String, dynamic> get init_value => init_advertValues;
  Map<String, dynamic> get current_value => current_advertValues;
  bool get changableStatus_profile => changable_profile;
  Map<String, dynamic> get init_value_profile => init_profileValues;
  Map<String, dynamic> get current_value_profile => current_profileValues;

  void fillListToAdvertValues(Map<String, dynamic> singleAd) {
    init_advertValues = singleAd;
  }

  void init() {
    changable = false;
    notifyListeners();
  }

  void init_profile() {
    changable_profile = false;
    notifyListeners();
  }

  void controlInputValues(Map<String, dynamic> currentInputValues) {
    changable = true;
    print(currentInputValues['title'].toString());
    if (currentInputValues['title'].toString().length == 0 ||
        currentInputValues['content'].toString().length == 0 ||
        currentInputValues['city'].toString().length == 0 ||
        currentInputValues['district'].toString().length == 0 ||
        currentInputValues['neighbourhood'].toString().length == 0 ||
        currentInputValues['floorArea'].toString().length == 0 ||
        currentInputValues['rooms'].toString().length == 0 ||
        currentInputValues['price'].toString().length == 0) {
      changable = false;
    }

    if (changable) {
      if (currentInputValues['title'].toString() ==
              init_advertValues['title'].toString() &&
          currentInputValues['content'].toString() ==
              init_advertValues['content'].toString() &&
          currentInputValues['city'].toString() ==
              init_advertValues['city'].toString() &&
          currentInputValues['district'].toString() ==
              init_advertValues['district'].toString() &&
          currentInputValues['neighbourhood'].toString() ==
              init_advertValues['neighbourhood'].toString() &&
          currentInputValues['floorArea'].toString() ==
              init_advertValues['floorArea'].toString() &&
          currentInputValues['rooms'].toString() ==
              init_advertValues['rooms'].toString() &&
          currentInputValues['price'].toString() ==
              init_advertValues['price'].toString()) {
        changable = false;
      } else {
        currentInputValues['advertId'] = init_advertValues['advertId'];
        current_advertValues = currentInputValues;
        changable = true;
      }
    }

    notifyListeners();
  }

  void controlInputValues_profile(Map<String, dynamic> currentInputValues) {
    changable_profile = true;
    print(currentInputValues['title'].toString());
    if (currentInputValues['title'].toString().length == 0 ||
        currentInputValues['content'].toString().length == 0 ||
        currentInputValues['city'].toString().length == 0 ||
        currentInputValues['district'].toString().length == 0 ||
        currentInputValues['neighbourhood'].toString().length == 0 ||
        currentInputValues['floorArea'].toString().length == 0 ||
        currentInputValues['rooms'].toString().length == 0 ||
        currentInputValues['price'].toString().length == 0) {
      changable_profile = false;
    }

    if (changable_profile) {
      if (currentInputValues['title'].toString() ==
              init_advertValues['title'].toString() &&
          currentInputValues['content'].toString() ==
              init_advertValues['content'].toString() &&
          currentInputValues['city'].toString() ==
              init_advertValues['city'].toString() &&
          currentInputValues['district'].toString() ==
              init_advertValues['district'].toString() &&
          currentInputValues['neighbourhood'].toString() ==
              init_advertValues['neighbourhood'].toString() &&
          currentInputValues['floorArea'].toString() ==
              init_advertValues['floorArea'].toString() &&
          currentInputValues['rooms'].toString() ==
              init_advertValues['rooms'].toString() &&
          currentInputValues['price'].toString() ==
              init_advertValues['price'].toString()) {
        changable = false;
      } else {
        currentInputValues['advertId'] = init_advertValues['advertId'];
        current_advertValues = currentInputValues;
        changable = true;
      }
    }

    notifyListeners();
  }
}
