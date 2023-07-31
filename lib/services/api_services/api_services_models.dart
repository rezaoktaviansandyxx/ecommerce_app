// ignore: depend_on_referenced_packages
import 'package:json_annotation/json_annotation.dart';
part 'api_services_models.g.dart';

@JsonSerializable()
class LoginRequest {
  String? username;
  String? password;

  LoginRequest();

  factory LoginRequest.fromJson(Map<String, dynamic> json) =>
      _$LoginRequestFromJson(json);
  Map<String, dynamic> toJson() => _$LoginRequestToJson(this);
}

@JsonSerializable()
class LoginResponse {
  String? token;

  LoginResponse();

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);
}

@JsonSerializable()
class ListProductResponse {
  int? id;
  String? title;
  double? price;
  String? description;
  String? category;
  String? image;
  RateResponse? rating;

  ListProductResponse();

  factory ListProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ListProductResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ListProductResponseToJson(this);
}

@JsonSerializable()
class RateResponse {
  double? rate;
  int? count;

  RateResponse();

  factory RateResponse.fromJson(Map<String, dynamic> json) =>
      _$RateResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RateResponseToJson(this);
}
