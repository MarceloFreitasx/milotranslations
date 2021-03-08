import 'package:get/instance_manager.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    /* Get.put(ApiService());

    Get.lazyPut<SplashController>(() {
      Get.put(SplashStore());
      return SplashController(Get.find());
    });

    Get.lazyPut<MainController>(() {
      Get.put(MainRepository(Get.find<ApiService>()));
      Get.put(MainStore(Get.find<MainRepository>()));
      return MainController(Get.find<MainStore>());
    }); */
  }
}
