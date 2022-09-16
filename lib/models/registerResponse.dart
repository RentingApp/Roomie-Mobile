import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class RegisterResponse {
  final String code;
  final String description;

  const RegisterResponse({
    required this.code,
    required this.description,
  });

  factory RegisterResponse.fromJson(Map<String, dynamic> json) {
    return RegisterResponse(
      code: json["code"],
      description: json["description"],
    );
  }
}
