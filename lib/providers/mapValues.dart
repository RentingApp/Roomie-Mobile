import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';

class MapValues extends ChangeNotifier {
  List data = [];
  var cities = [];
  var districts = [];
  var neighbourhoods = [];

  int selectedCityIndex = 0;
  int selectedDistrictIndex = 0;
  String selectedCity = 'City';
  String selectedDistrict = 'District';
  String selectedNeighbourhood = 'Neighbourhood';

  int get selectedCityOfIndex => selectedCityIndex;
  int get selectedDistrictOfIndex => selectedDistrictIndex;
  String get getSelectedCity => selectedCity;
  String get getSelectedDistrict => selectedDistrict;
  String get getSelectedNeighbourhood => selectedNeighbourhood;

  List get getData => data;
  List get getCities => cities;
  List get getDistricts => districts;
  List get getNeighbourhoods => neighbourhoods;

  readJson() async {
    final String response = await rootBundle.loadString('assets/data.json');
    final data1 = await json.decode(response) as List;
    data = data1;

    notifyListeners();
  }

  Future<void> setAllCities() async {
    await readJson();
    cities = [];
    int count = 0;
    for (var element in getData) {
      if (count == 0) {
        cities.add('City');
      }
      cities.add(element['name']);
      count++;
    }
    notifyListeners();
  }

  Future<void> setAllDistricts() async {
    //var data = await readJson();
    //print(selectedCityOfIndex);
    await readJson();
    districts = [];

    int count = 0;
    data.insert(0, '');
    //if (selectedCityOfIndex != 0) {
    for (var element in getData[selectedCityOfIndex]['towns']) {
      if (count == 0) {
        districts.add('District');
      }
      districts.add(element['name']);

      count++;
    }
    /* districts.removeAt(0);
      districts.sort();
      districts.insert(0, 'District');*/
    //}

    //data.removeAt(0);
    //data.removeWhere((element) => element == '');

    //print(getDistricts);
    notifyListeners();
  }

  Future<void> setAllNeighbourhoods() async {
    //var data = await readJson();
    //print(selectedCityOfIndex);
    await readJson();
    neighbourhoods = [];

    int count = 0;
    data.insert(0, '');
    //if (selectedDistrictOfIndex != 0) {
    for (var element1 in data[selectedCityOfIndex]['towns']
        [selectedDistrictOfIndex - 1]['districts']) {
      //print(element1);
      for (var element in element1['quarters']) {
        if (count == 0) {
          neighbourhoods.add('Neighbourhood');
        }
        print(element['name']);
        neighbourhoods.add(element['name']);
        count++;
      }
    }
    //}
    /* neighbourhoods.removeAt(0);
    neighbourhoods.sort();
    neighbourhoods.insert(0, 'Neighbourhood');*/
    //data.removeAt(0);
    //data.removeWhere((element) => element == '');

    //print(getDistricts);
    notifyListeners();
  }

  selectCity(index) {
    //print(index);

    //print(index);
    selectedCityIndex = index;
    selectedCity = cities[selectedCityIndex];

    setAllDistricts();
    //print(districts);
    notifyListeners();
  }

  selectDistrict(index) {
    selectedDistrictIndex = index;
    print(index);
    if (districts.length != 0) {
      selectedDistrict = districts[index];
    }
    setAllNeighbourhoods();
    notifyListeners();
  }

  selectNeighbourhood(index) {
    if (neighbourhoods.length != 0) {
      selectedNeighbourhood = neighbourhoods[index];
    }

    notifyListeners();
  }
}
