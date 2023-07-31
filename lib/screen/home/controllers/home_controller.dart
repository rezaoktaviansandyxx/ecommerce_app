import 'package:get/get.dart';

import '../../../services/api_services/api_services.dart';

class HomeController extends GetxController {
  var listProductProvider = Get.put(ListProductProvider());

  @override
  void onInit() {
    super.onInit();
    listProductProvider.getProducts();
  }
}
