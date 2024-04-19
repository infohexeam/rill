import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:rill_repository/ui/otp_screen/bind/otp_verification_controller.dart';

import '../../../Utils/app_routes.dart';
import '../../../Utils/network_handler.dart';
import '../../login_screen/model/otp_model.dart';
import '../../login_screen/model/otp_receive_model.dart';

class SignupBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(SignupController());
  }
}

class SignupController extends GetxController {
  static SignupController get to => Get.find();
  var otpverifyController = Get.put(OtpVerificationController());

  TextEditingController nameTextEditingController = TextEditingController();
  TextEditingController emailTextEditingController = TextEditingController();
  TextEditingController phoneTextEditingController = TextEditingController();
  void sendOtp() async {
    OtpModel otpModel = OtpModel(phone: phoneTextEditingController.text, fullname: nameTextEditingController.text);
    EasyLoading.show(status: 'Sending OTP...');
    var response = await NetWorkHandler.post(
        otpModelToJson(otpModel), "auth/user/mobile-otp/request");
    EasyLoading.dismiss();
    var data = json.decode(response);
    var actualresponse = OtpReceiveModel.fromJson(data);
    // var errorResponse = ErrorResponse.fromJson(data);
    if (actualresponse.isError == false) {
      otpverifyController.verificationId.text = data['data']['id'];
      // Get.snackbar('OTP Received', 'Your otp is ${data['data']['otp']}',
      //     duration: Duration(seconds: 6));
      Get.toNamed(Routes.otpverify);
    } else {
      Get.defaultDialog(middleText: actualresponse.message.toString());
    
    }
  }

  // void emailOtp() async {
  //   RequestEmailOtp otpverifyModel = RequestEmailOtp(
  //       id: otpVerificationController.verificationId.text,
  //       fullname: nameTextEditingController.text,
  //       email: emailTextEditingController.text);
  //   var response = await NetWorkHandler.post(
  //       requestEmailOtpToJson(otpverifyModel), "auth/user/email-otp/request");
  //   var data = json.decode(response);
  //   var actualresponse = EmailOtpReceiveModel.fromJson(data);
  //   // print(data);
  //   if (actualresponse.isError == false) {
  //     otpVerificationController.verificationId.text = data['data']['id'];
  //     Get.snackbar('OTP Received', 'Your otp is  ${data['data']['otp']}',
  //         duration: Duration(seconds: 6));
  //     Get.toNamed(Routes.emailverify);
  //   }
  
  //   else {
  //     Get.defaultDialog(middleText: actualresponse.message.toString());
  //     print("Api Call Error");
  //   }
  // }
}
