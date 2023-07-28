import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class StorageService extends GetxService {
  Future<StorageService> init() async {
    await GetStorage.init();
    return this;
  }

  // static StorageService get instance => Get.find();

  void write(String key, dynamic value) {
    GetStorage().write(key, value);
  }

  dynamic read(String key) => GetStorage().read(key);
}
