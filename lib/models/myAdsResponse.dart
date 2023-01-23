import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class MyAdsResponse {
  final String username;
  final int applicationUserId;
  final String publishDate;
  final String updateDate;
  final int advertId;
  final String title;
  final String content;
  final String city;
  final String district;
  final String neighbourhood;
  final String rooms;
  final String floorArea;
  final double price;

  const MyAdsResponse({
    required this.username,
    required this.applicationUserId,
    required this.publishDate,
    required this.updateDate,
    required this.advertId,
    required this.title,
    required this.content,
    required this.city,
    required this.district,
    required this.neighbourhood,
    required this.rooms,
    required this.floorArea,
    required this.price,
  });

  factory MyAdsResponse.fromJson(Map<String, dynamic> json) {
    return MyAdsResponse(
      username: json["username"],
      applicationUserId: json["applicationUserId"],
      publishDate: json["publishDate"],
      updateDate: json["updateDate"],
      advertId: json["advertId"],
      title: json["title"],
      content: json["content"],
      city: json["city"],
      district: json["district"],
      neighbourhood: json["neighbourhood"],
      rooms: json["rooms"],
      floorArea: json["floorArea"],
      price: json["price"],
    );
  }
}
