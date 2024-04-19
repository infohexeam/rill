import 'dart:io';

import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rill_repository/Utils/app_routes.dart';
import 'package:rill_repository/constants/constant.dart';

import '../../../Utils/colors_list.dart';

class OnboardingView extends StatelessWidget {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async{
       exit(0);
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              color: Colors.white,
              height: size.height * 0.22,
              width: size.width,
              child: Image.asset("assets/images/logo.png"),
            ),
            SizedBox(
              height: size.height * 0.52,
              width: size.width,
              child: Image.asset(
                "assets/images/onboard.png",
                fit: BoxFit.fitWidth,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 15, right: 15),
              child: SizedBox(
                height: size.height * 0.11,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Constants.getImageText(40, size.width * 0.4,
                            "assets/icons/bed.png", "100 Bedded"),
                        Constants.getImageText(40, size.width * 0.4,
                            "assets/icons/book.png", "LLP Registered"),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Constants.getImageText(40, size.width * 0.4,
                            "assets/icons/globe.png", "Global Standard"),
                        Constants.getImageText(
                            40,
                            size.width * 0.5,
                            "assets/icons/money.png",
                            "Best return on Investment"),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: size.height * 0.12,
              child: Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    // InkWell(
                    //   onTap: () {
                    //     // Get.toNamed(Routes.login);
                    //     Get.toNamed(Routes.homescreen);
                    //   },
                    //   child: Container(
                    //     decoration: BoxDecoration(
                    //         color: Color.fromARGB(255, 247, 245, 245),
                    //         borderRadius: BorderRadius.circular(10)),
                    //     height: 45,
                    //     width: 90,
                    //     child: Center(
                    //         child:
                    //         Text(
                    //       'Skip',
                    //       style: Constants.customStyle(
                    //           16.0, Color(0XFF133C8C), FontWeight.bold),
                    //     )
                    //     ),
                    //   ),
                    // ),
                    InkWell(
                      onTap: () {
                        Get.toNamed(Routes.login);
                      },
                      child: Container(
                        height: 45,
                        width: 140,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: primaryColor),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Continue",
                              style: Constants.customStyle(
                                  16.0, Colors.white, FontWeight.bold),
                            ),
                            const Icon(
                              Icons.arrow_forward,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
