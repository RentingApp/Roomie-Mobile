import 'dart:convert';
import 'dart:io';

Future<List<Map>> readJsonFile(String filePath) async {
  var input = await File('./data.json').readAsString();
  var map = jsonDecode(input);
  return map['name'];
}

var floorAreas = [45, 60, 80, 90, 50, 120, 75, 95, 110, 130, 140, 55, 70, 85];
var rooms = [1.1, 2.1, 2.0, 3.1, 4.1];
var price = [
  1220,
  950,
  800,
  720,
  650,
  1650,
  450,
  350,
  890,
  920,
  1000,
  1620,
  4200,
  3500,
  8600,
  4500,
  3250,
  2250,
  1950,
  1450,
  6250,
  5500,
  1760,
  880,
  9250,
  650,
  840,
  770,
  860
];
