import 'dart:async';

import 'package:get/get.dart';

class ApiService extends GetConnect {
  @override
  void onInit() {
    super.onInit();
    httpClient.baseUrl = "https://fakestoreapi.com";
  }
}

class LoginProvider extends ApiService {
  Future<String?> auth({
    required String username,
    required String password,
  }) async {
    var body = {
      'username': username,
      'password': password,
    };

    var response = await post('/auth/login', body);
    if (response.status.hasError) {
      return Future.error('400');
    }

    var data = response.body;
    if (data != null && data['token'] != null) {
      return data['token'];
    } else {
      return null;
    }
  }
}
