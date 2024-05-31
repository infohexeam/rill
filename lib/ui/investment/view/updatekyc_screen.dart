import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rill_repository/ui/investment/bind/investment_form_binding.dart';

import '../../../Utils/app_routes.dart';
import '../../../Utils/colors_list.dart';
import '../../../constants/constant.dart';

class UpdateKycScreen extends StatelessWidget {
  const UpdateKycScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: Constants.commonAppBar(
          title: 'KYC', icon: const Icon(Icons.arrow_back, size: 30)),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: size.height * 0.25,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Align(alignment: Alignment.center,
                    child: Row(   mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Update   ',
                          style: Constants.customStyle(
                              32.0, Colors.black, FontWeight.bold),
                        ),
                        Text(
                          'KYC',
                          style: Constants.customStyle(
                              32.0, const Color(0xff2D72F6), FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),

                  // Text(
                  //   'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Maecenas faucibus nisi habitant duis eget pellentesque facilisis molestie vulputate. Massa laoreet nisl aliquam tellus donec sodales elit tellus ligula.',
                  //   style: Constants.customStyle(
                  //       14.0, Colors.black, FontWeight.normal),
                  // )
                ],
              ),
            ),
          ),
          SizedBox(
            height: size.height * 0.4,
            child: Image.asset("assets/images/kyc.png",),
          ),

          SizedBox(
            height: size.height * 0.10,
            child: Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  GetBuilder<InvestmentFormController>(builder: (log) {
                    return InkWell(
                      onTap: () {
                        if (log.investmentStatusModel?.data.rfc == true ||
                            log.investmentStatusModel?.data.rpc == true) {
                          Get.toNamed(Routes.viewinvestment);
                        } else {
                          Get.toNamed(Routes.investmentplan);
                        }
                      },
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10)),
                        height: 45,
                        width: 90,
                        child: Center(
                            child: Text(
                          'Skip',
                          style: Constants.customStyle(
                              16.0, const Color(0XFF133C8C), FontWeight.bold),
                        )),
                      ),
                    );
                  }),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.kycscreen2);
                    },
                    child: Container(
                      height: 45,
                      width: 140,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: primaryColor),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
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
    );
  }
}
