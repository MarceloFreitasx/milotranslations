import 'package:get/instance_manager.dart';
import 'package:milotranslations/core/services/api.service.dart';
import 'package:milotranslations/src/splash/controllers/splash.controller.dart';
import 'package:milotranslations/src/splash/stores/splash.store.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ApiService());

    Get.lazyPut<SplashController>(() {
      Get.put(SplashStore());
      return SplashController(Get.find());
    });

    /*Get.lazyPut<MainController>(() {
      Get.put(MainRepository(Get.find<ApiService>()));
      Get.put(MainStore(Get.find<MainRepository>()));
      return MainController(Get.find<MainStore>());
    }); */
  }
}
