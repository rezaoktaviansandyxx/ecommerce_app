import 'dart:async';

import 'package:get/get.dart';

import 'api_services_models.dart';

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

class ListProductProvider extends ApiService {
  var products = <ListProductResponse>[].obs;

  Future<void> getProducts() async {
    var response = await get('/products');
    if (response.status.hasError) {
      return Future.error('400');
    }
    // Assuming the API response is a List of products (List<Map<String, dynamic>>).
    // You can convert the List<Map> to List<ListProductResponse> using the `map` method.
    var productList = (response.body as List).map((productMap) => ListProductResponse.fromJson(productMap)).toList();
    
    // Now, assign the converted list to the `products` variable.
    products.value = productList;
  }
}

