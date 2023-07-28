import 'package:get/get.dart';
import '../../../services/keys/get_storage_key.dart';
import '../../../services/storage_service/storage_service.dart';

class SplashScreenController extends GetxController {
  var storageService = Get.put(StorageService());
  // @override
  // void onReady() {
  //   super.onReady();
  //     String? token = GetStorage().read(GetStorageKey.token)['token'];
  //     if (token == null) {
  //       Get.offAllNamed(AppRoutes.loginScreen);
  //     } else {
  //       Get.offAllNamed(AppRoutes.homeScreen);
  //     }
  // }

  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 3), () {
      getToken();
    });
    // getToken();
    // print(getToken());
  }

  String? getToken() {
    return storageService.read(GetStorageKey.token);
  }

  // void getToken() {
  //   print(storageService.read(GetStorageKey.token));
  // }
}
