
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:get/get.dart';
import 'package:rill_repository/Utils/app_routes.dart';

import '../../../Utils/com_binding.dart';
import '../../../Utils/session_keys.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(splashController());
  }
}

class splashController extends GetxController {
  static splashController get to => Get.find();
  @override
  void onInit() {
    super.onInit();

    1.cSeconds.cDelay(() {
      if (AppSession.to.session.read(SessionKeys.bearer_token) == null) {
        Get.toNamed(Routes.onboarding);
      } else {
        Get.toNamed(Routes.homescreen);
      }
    });
  }



}
