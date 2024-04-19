import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:rill_repository/Utils/network_handler.dart';

import '../../../Utils/app_routes.dart';
import '../../../Utils/com_binding.dart';
import '../../../Utils/session_keys.dart';

import '../model/otp_verify_model.dart';
import '../model/otp_verify_receiveModel.dart';
import '../model/resend_otp_model.dart';
import '../model/resend_otp_receive_model.dart';

class OtpVerificationBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(OtpVerificationController());
  }
}

class OtpVerificationController extends GetxController {
  static OtpVerificationController get to => Get.find();
  TextEditingController otpTextEditingController = TextEditingController();
  TextEditingController verificationId = TextEditingController();
  void verifyOtp() async {
    OtpVerifyModel otpverifyModel = OtpVerifyModel(
        id: verificationId.text, otp: otpTextEditingController.text);
    var response = await NetWorkHandler.post(
        otpVerifyModelToJson(otpverifyModel), "auth/user/mobile-otp/verify");
    var data = json.decode(response);
    var actualresponse = OtpVerifyReceiveModel.fromJson(data);
    if (actualresponse.isError == false) {
      if (actualresponse.data.isLogined == false) {
        Get.toNamed(Routes.signup);
      } else {
        EasyLoading.show(status: 'uploading...');
        Get.offAllNamed(Routes.homescreen);
        EasyLoading.dismiss();
        AppSession.to.session
            .write(SessionKeys.bearer_token, actualresponse.data.token);
        AppSession.to.session.write(SessionKeys.customer_name,
            actualresponse.data.fullname?.toUpperCase());
        AppSession.to.session
            .write(SessionKeys.customer_email, actualresponse.data.email);
        AppSession.to.session
            .write(SessionKeys.customer_mobile, actualresponse.data.phone);
      }
    } else {
      print("Api Call Error");
      Get.defaultDialog(middleText: '${actualresponse.message}');
    }
  }

  // void verifyEmailOtp() async {
  //   EmailVerifyModel emailVerifyModel = EmailVerifyModel(
  //       id: verificationId.text, otp: otpTextEditingController.text);
  //   var response = await NetWorkHandler.post(
  //       emailVerifyModelToJson(emailVerifyModel), "auth/user/email-otp/verify");
  //   var data = json.decode(response);

  //   var actualresponse = EmailVerifyReceiveModel.fromJson(data);

  //   if (actualresponse.isError == false) {
  //     Get.offAllNamed(Routes.homescreen);
  //     AppSession.to.session
  //         .write(SessionKeys.bearer_token, actualresponse.data.token);
  //     AppSession.to.session
  //         .write(SessionKeys.customer_name, actualresponse.data.fullname);
  //     AppSession.to.session
  //         .write(SessionKeys.customer_email, actualresponse.data.email);
  //     AppSession.to.session
  //         .write(SessionKeys.customer_mobile, actualresponse.data.phone);
  //   } else {
  //     print('${verificationId.text}  ${otpTextEditingController.text}');
  //     print("Api Call Error");
  //     Get.defaultDialog(middleText: actualresponse.message.toString());
  //   }
  // }

  void resendOtp() async {
    ResendOtpRequestModel resendotpmodel =
        ResendOtpRequestModel(id: verificationId.text);
    var response = await NetWorkHandler.post(
        resendOtpRequestModelToJson(resendotpmodel),
        'auth/user/mobile-otp/resend');
    var data = json.decode(response);
    var actualresponse = ResendOtpModel.fromJson(data);
    if (actualresponse.isError == false) {
      // Get.snackbar('OTP Received', 'Your otp is  ${data['data']['otp']}');
    }
  }

  // void resendemailOtp() async {
  //   ResendOtpRequestModel resendotpmodel =
  //       ResendOtpRequestModel(id: verificationId.text);
  //   var response = await NetWorkHandler.post(
  //       resendOtpRequestModelToJson(resendotpmodel),
  //       'auth/user/email-otp/resend');
  //   var data = json.decode(response);
  //   print(data);
  //   var actualresponse = ResendEmailOtpModel.fromJson(data);
  //   if (actualresponse.isError == false) {
  //     Get.snackbar('OTP Received', 'Your otp is  ${data['data']['otp']}');
  //   }
  // }
}
