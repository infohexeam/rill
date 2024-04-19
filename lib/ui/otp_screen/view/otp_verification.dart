import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rill_repository/constants/constant.dart';
import 'package:rill_repository/ui/otp_screen/bind/otp_verification_controller.dart';

class OtpVerificationScreen extends StatefulWidget {
  const OtpVerificationScreen({super.key});

  @override
  State<OtpVerificationScreen> createState() => _OtpVerificationScreenState();
}

class _OtpVerificationScreenState extends State<OtpVerificationScreen> {
  var otpVerificationController = Get.put(OtpVerificationController());
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back,
              color: Color(0XFF133C8C),
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: size.height * 0.1,
                width: size.width,
                child: Image.asset("assets/images/logo.png")),
            SizedBox(
              height: size.height * 0.55,
              width: size.width,
              child: Constants.otpVerificationContainer(
                  40,
                  30,
                  "OTP verification",
                  "Enter the OTP sent to  ",
                  '91 **********'),
            ),
            InkWell(
              onTap: () {
                otpVerificationController.verifyOtp();
              },
              child: Padding(
                padding: const EdgeInsets.only(left: 15,right: 15),
                child: SizedBox(
                    height: size.height * 0.06,
                    child: Constants.getCommonButton(
                        size.width, 45, 'Verify & Proceed')),
              ),
            )
          ],
        ),
      ),
    );
  }
}
