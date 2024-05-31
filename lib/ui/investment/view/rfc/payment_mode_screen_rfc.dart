import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rill_repository/Utils/app_routes.dart';
import 'package:rill_repository/ui/previlege_card/bind/privilege_card_binding.dart';

import '../../../../Utils/colors_list.dart';
import '../../../../constants/constant.dart';

class PaymentModeScreenRfc extends StatefulWidget {
  const PaymentModeScreenRfc({super.key});

  @override
  State<PaymentModeScreenRfc> createState() => _PaymentModeScreenRfcState();
}

class _PaymentModeScreenRfcState extends State<PaymentModeScreenRfc> {
  String type = "1";
  var data = Get.arguments;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: Constants.commonAppBar(
          title: "Rill Founders Club",
          icon: const Icon(Icons.arrow_back, size: 30)),
      body: Container(
        height: size.height,
        width: size.width,
        padding: const EdgeInsets.only(bottom: 30),
        child: Stack(
          children: [
            Container(
              height: 200,
              width: size.width,
              padding: EdgeInsets.zero,
              margin: const EdgeInsets.only(top: 20,left: 20,right: 20),
              child: Image.asset("assets/images/member.png",fit: BoxFit.fill),),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: GetBuilder<PrivilegeCardController>(builder: (logic) {
                    return Container(
                      padding: const EdgeInsets.all(15),
                      height: 200,
                      width: size.width,
                      decoration: const BoxDecoration(
                          // image: DecorationImage(
                          //     image: AssetImage('assets/images/member.png'))
                      ),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SizedBox(
                              height: 20,
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Membership Fee',
                                  style: Constants.customStyle(
                                      20.0, Colors.white, FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 15,
                                ),
                                Text(
                                  logic.privilegecardexistModel?.data
                                              .privileCardExists ==
                                          true
                                      ? 'Rs. 10500'
                                      : 'Rs. 12500',
                                  style: Constants.customStyle(
                                      32.0, Colors.white, FontWeight.bold),
                                ),
                              ],
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              height: 30,
                              width: 100,
                              child: Center(
                                  child: Text(
                                '',
                                style: Constants.customStyle(
                                    16.0, primaryColor, FontWeight.bold),
                              )),
                            ),
                          ],
                        ),
                      ),
                    );
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 15,top: 30),
                  child: Text(
                    'Payment mode',
                    style: Constants.customStyle(
                        16.0, const Color(0xff04ADBE), FontWeight.bold),
                  ),
                ),
                const SizedBox(height: 10),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: size.width/2-30,
                        height: 60,
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: RadioListTile(
                            title: Text("One time",
                                style: Constants.customStyle(
                                    15.0, blueheader, FontWeight.bold)),
                            value: "1",
                            groupValue: type,
                            onChanged: (value) {
                              setState(() {
                                type = value.toString();
                              });
                            },
                          ),
                        ),
                      ),
                      SizedBox(
                        width: size.width/2,
                        height: 60,
                        child: Card(
                          elevation: 5,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: RadioListTile(
                            title: Text("Installments",
                                style: Constants.customStyle(
                                    15.0, blueheader, FontWeight.bold)),
                            value: "2",
                            groupValue: type,
                            onChanged: (value) {
                              setState(() {
                                type = value.toString();
                              });
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 30,)

              ],
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: GetBuilder<PrivilegeCardController>(builder: (logic) {
                return InkWell(
                    onTap: () {
                      if (type == "1") {
                        Get.toNamed(Routes.torfcOneTime, arguments: [type]);
                      } else {
                        Get.toNamed(Routes.torfcInstallments, arguments: [type]);
                      }
                      // if (data[0] == 'Rill Partners Club') {
                      //   Get.toNamed(Routes.installmentpayment, arguments: [type]);
                      // } else if (data[0] == 'Rill Founders Club') {
                      //   Get.toNamed(Routes.installmentpayment2, arguments: [type,
                      //   logic.privilegecardexistModel?.data.privileCardExists==true?10500:12500
                      //   ]);
                      // }
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15),
                      child: Constants.getCommonButton(size.width, 45, 'Continue'),
                    ));
              }),
            )

          ],
        ),
      ),
    );
  }
}
