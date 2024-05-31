import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:rill_repository/ui/otp_screen/bind/otp_verification_controller.dart';

import '../../../Utils/app_routes.dart';
import '../../../Utils/network_handler.dart';
import '../model/otp_model.dart';
import '../model/otp_receive_model.dart';

class LoginBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(LoginController());
  }
}

class LoginController extends GetxController {
  static LoginController get to => Get.find();
  var otpverifyController = Get.put(OtpVerificationController());
  TextEditingController mobileTextEditingController = TextEditingController();

  //send otp function  using quicktype
  void sendOtp() async {
    OtpModel otpModel = OtpModel(phone: mobileTextEditingController.text);
    EasyLoading.show(status: 'Sending OTP...');
    var response = await NetWorkHandler.post(
        otpModelToJson(otpModel), "auth/user/mobile-otp/request");
    EasyLoading.dismiss();
    var data = json.decode(response);
    var actualresponse = OtpReceiveModel.fromJson(data);
    // var errorResponse = ErrorResponse.fromJson(data);
    if (actualresponse.isError == false) {
      otpverifyController.verificationId.text = data['data']['id'];
      // Get.snackbar('OTP Received', 'Your otp is  ${data['data']['otp']}',
      //     duration: Duration(seconds: 6));
      Get.toNamed(Routes.otpverify);
    } else {
      Get.defaultDialog(middleText: actualresponse.message.toString());
      // Get.snackbar('Login failed due to ',
      //     data['errors'][0]['msg'] + ' ' + data['errors'][0]['param'],
      //     duration: Duration(seconds: 6));
    }
  }
}
