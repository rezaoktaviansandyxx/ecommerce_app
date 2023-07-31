// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_services_models.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginRequest _$LoginRequestFromJson(Map<String, dynamic> json) => LoginRequest()
  ..username = json['username'] as String?
  ..password = json['password'] as String?;

Map<String, dynamic> _$LoginRequestToJson(LoginRequest instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
    };

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse()..token = json['token'] as String?;

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
    };

ListProductResponse _$ListProductResponseFromJson(Map<String, dynamic> json) =>
    ListProductResponse()
      ..id = json['id'] as int?
      ..title = json['title'] as String?
      ..price = (json['price'] as num?)?.toDouble()
      ..description = json['description'] as String?
      ..category = json['category'] as String?
      ..image = json['image'] as String?
      ..rating = json['rating'] == null
          ? null
          : RateResponse.fromJson(json['rating'] as Map<String, dynamic>);

Map<String, dynamic> _$ListProductResponseToJson(
        ListProductResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'description': instance.description,
      'category': instance.category,
      'image': instance.image,
      'rating': instance.rating,
    };

RateResponse _$RateResponseFromJson(Map<String, dynamic> json) => RateResponse()
  ..rate = (json['rate'] as num?)?.toDouble()
  ..count = json['count'] as int?;

Map<String, dynamic> _$RateResponseToJson(RateResponse instance) =>
    <String, dynamic>{
      'rate': instance.rate,
      'count': instance.count,
    };
