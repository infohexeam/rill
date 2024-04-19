import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:flutter_custom_utils/flutter_custom_utils.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:rill_repository/Utils/app_routes.dart';
import 'package:rill_repository/ui/splash_screen/view/splash_view.dart';
import '../../../Utils/com_binding.dart';
import '../../../Utils/network_handler.dart';
import '../../../Utils/session_keys.dart';

class AuthBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(AuthController());
  }
}

class AuthController extends GetxController {
  String msg = "You are not authorized.";
  bool loading = false;
  final LocalAuthentication auth = LocalAuthentication();
  String? verificationCode;
  String? verificationOTP;
  static AuthController get to => Get.find();
  authenticate()async{
    try {
      bool pass = await auth.authenticate(
        options: const AuthenticationOptions(
            stickyAuth: true,
            useErrorDialogs: true,
            sensitiveTransaction: true,
            biometricOnly: false
        ), localizedReason: 'Authenticate with pattern/pin/passcode',
      );
      if(pass){
        msg = "You are Authenticated.";
        // setState(() {
        Get.offNamed(Routes.splash);
          // Navigator.pushAndRemoveUntil(context,
          //     MaterialPageRoute(builder: (BuildContext context) => const SplashView()),
          //         (Route<dynamic> route) => route is SplashView
          // );
          // Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: MyHome()));
        // });
      }
      else{
        print('object');
        // Navigator.pop(context);
      }

    } on PlatformException catch (e) {
      msg = "Error while opening fingerprint/face scanner";
    }

  }
  // void onInit() {
  //   super.onInit();
  //
  //   1.cSeconds.cDelay(() {
  //     if (AppSession.to.session.read(SessionKeys.bearer_token) == null) {
  //       Get.toNamed(Routes.onboarding);
  //     } else {
  //       Get.toNamed(Routes.homescreen);
  //     }
  //   });
  // }



}
