import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app_routes.dart';

class comBinding implements Bindings {
  @override
  void dependencies() {
    // Get.lazyPut(() => Api(), fenix: true);
    Get.put(AppSession());
  }
}

class AppSession extends GetxController {
  static AppSession get to => Get.find();
  var session = GetStorage('rill_repo');

  void logout() {
    AppSession.to.session.erase();
    Get.offAllNamed(Routes.login);
  }
}
