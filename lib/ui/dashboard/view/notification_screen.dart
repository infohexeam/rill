
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rill_repository/Utils/app_routes.dart';
import 'package:rill_repository/constants/constant.dart';
import 'package:rill_repository/ui/investment/bind/investment_form_binding.dart';

import '../../../Utils/colors_list.dart';

class NotificationScreen extends StatelessWidget {
   NotificationScreen({super.key});
  var investmentController = Get.put(InvestmentFormController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GetBuilder<InvestmentFormController>(builder: (logic) {
      print(logic.getnotificationcount());
      return Scaffold(
          backgroundColor: bgcolor,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: primaryColor,
            toolbarHeight: 130,
            centerTitle: false,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            title: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: () {
                        Get.back();
                      },
                      child: const Icon(Icons.arrow_back)),
                  const SizedBox(
                    height: 15,
                  ),
                  investmentController.getnotificationcount()!=0?
                  Text(
                    'Notifications(${logic.getnotificationcount()})',
                    style: Constants.customStyle(
                        20.0, Colors.white, FontWeight.bold),
                  ): Text(
                    'Notifications',
                    style: Constants.customStyle(
                        20.0, Colors.white, FontWeight.bold),
                  )
                ],
              ),
            ),
          ),
          body: SingleChildScrollView(physics:  const BouncingScrollPhysics(),
            child: Column(
              children: [
                logic.rfcnotificationCount.value > 0
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("RFC",
                                style: Constants.customStyle(
                                    16.0, Colors.black, FontWeight.bold)),
                          ),
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: logic.rfcInstallmentModel?.data.data[0]
                                  .payments.length,
                              itemBuilder: (BuildContext context, index) {
                                return logic.rfcInstallmentModel?.data.data[0]
                                            .payments[index].isDue ==
                                        true
                                    ? Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5, right: 5, bottom: 5),
                                        child: Card(
                                          child: Container(
                                            color: Colors.white,
                                            height: 110,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      logic
                                                              .rfcInstallmentModel
                                                              ?.data
                                                              .data[0]
                                                              .payments[index]
                                                              .DateChange() ??
                                                          '',
                                                      style:
                                                          Constants.customStyle(
                                                              14.0,
                                                              subheader,
                                                              FontWeight
                                                                  .normal)),
                                                  Text('RFC Payment is due ',
                                                      style:
                                                          Constants.customStyle(
                                                              20.0,
                                                              blackheader,
                                                              FontWeight.bold)),
                                                  Text(
                                                      "RFC payment of Rs.${logic.rfcInstallmentModel?.data.data[0].payments[index].amount} is due on ${logic.rfcInstallmentModel?.data.data[0].payments[index].DateChange() ?? ''}",
                                                      style:
                                                          Constants.customStyle(
                                                              14.0,
                                                              subheader,
                                                              FontWeight
                                                                  .normal)),
                                                  Align(
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color: primaryColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(6)),
                                                      width: size.width * .3,
                                                      height: 30,
                                                      child: Center(
                                                          child: InkWell(
                                                        onTap: () {
                                                          Get.toNamed(Routes
                                                              .clubdetails);
                                                        },
                                                        child: Text(
                                                          'View Details',
                                                          style: Constants
                                                              .customStyle(
                                                                  16.0,
                                                                  Colors.white,
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      )),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : const Card();
                              }),
                        ],
                      )
                    : const SizedBox(),
                logic.rpcnotificationCount.value > 0
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("RPC",
                                style: Constants.customStyle(
                                    16.0, Colors.black, FontWeight.bold)),
                          ),
                          ListView.builder(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemCount: logic.rpcInstallmentModel?.data.data[0]
                                  .payments.length,
                              itemBuilder: (BuildContext context, index) {
                                return logic.rpcInstallmentModel?.data.data[0]
                                            .payments[index].isDue ==
                                        true
                                    ? Padding(
                                        padding: const EdgeInsets.only(
                                            left: 5, right: 5, bottom: 5),
                                        child: Card(
                                          child: Container(
                                            color: Colors.white,
                                            height: 110,
                                            child: Padding(
                                              padding:
                                                  const EdgeInsets.all(8.0),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text(
                                                      logic
                                                              .rpcInstallmentModel
                                                              ?.data
                                                              .data[0]
                                                              .payments[index]
                                                              .DateChange() ??
                                                          '',
                                                      style:
                                                          Constants.customStyle(
                                                              14.0,
                                                              subheader,
                                                              FontWeight
                                                                  .normal)),
                                                  Text('RPC Payment is due ',
                                                      style:
                                                          Constants.customStyle(
                                                              20.0,
                                                              blackheader,
                                                              FontWeight.bold)),
                                                  Text(
                                                      "Your RPC payment is due on ${logic.rpcInstallmentModel?.data.data[0].payments[index].DateChange() ?? ''}",
                                                      style:
                                                          Constants.customStyle(
                                                              14.0,
                                                              subheader,
                                                              FontWeight
                                                                  .normal)),
                                                  Align(
                                                    alignment:
                                                        Alignment.bottomRight,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color: primaryColor,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(6)),
                                                      width: size.width * .3,
                                                      height: 30,
                                                      child: Center(
                                                          child: InkWell(
                                                        onTap: () {
                                                          Get.toNamed(Routes
                                                              .clubdetailsRpc);
                                                        },
                                                        child: Text(
                                                          'View Details',
                                                          style: Constants
                                                              .customStyle(
                                                                  16.0,
                                                                  Colors.white,
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      )),
                                                    ),
                                                  )
                                                ],
                                              ),
                                            ),
                                          ),
                                        ),
                                      )
                                    : const Card();
                              })
                        ],
                      )
                    :  SizedBox(
                  height: size.height-130,
                  child: Center(
child:                       Text('No notifications',style: Constants.customStyle(16.0, Colors.black54, FontWeight.normal),)
                    ,                  ),
                )
              ],
            ),
          ));
    });
  }
}
