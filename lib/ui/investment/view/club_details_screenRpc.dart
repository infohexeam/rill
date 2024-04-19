import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rill_repository/Utils/colors_list.dart';
import 'package:rill_repository/ui/investment/bind/investment_form_binding.dart';

import '../../../constants/constant.dart';

class ClubDetailsScreenRpc extends StatefulWidget {
  const ClubDetailsScreenRpc({super.key});

  @override
  State<ClubDetailsScreenRpc> createState() => _ClubDetailsScreenRpcState();
}

class _ClubDetailsScreenRpcState extends State<ClubDetailsScreenRpc> {
  var investmentController = Get.put(InvestmentFormController());

  @override
  Widget build(BuildContext context) {
    investmentController.rpcClubDetails();
    var size = MediaQuery.of(context).size;
    return Scaffold(

      appBar: Constants.investmentAppBar(
          title: 'Rill Partners Club',
          icon: const Icon(Icons.arrow_back, size: 30)),
      body: RefreshIndicator(
        displacement: 250,
        backgroundColor: primaryColor,
        color: Colors.white,
        strokeWidth: 3,
        triggerMode: RefreshIndicatorTriggerMode.onEdge,
        onRefresh: () async {
          await Future.delayed(const Duration(milliseconds: 1500));
          setState(() {
            // homeScreenController;
            investmentController.rfcInstallmentsDetails();
          });
        },
        child: SizedBox(
          height: size.height,
          child: Padding(
            padding: const EdgeInsets.only(left: 15, right: 15),
            child: GetBuilder<InvestmentFormController>(builder: (logic) {
              return SingleChildScrollView(
                physics:  BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 10, bottom: 10),
                      child: Container(
                        padding: const EdgeInsets.all(15),
                        height: size.height * .20,
                        width: size.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            image: const DecorationImage(
                                fit: BoxFit.fill,
                                image: AssetImage(
                                  'assets/images/club.jpeg',
                                ))),
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  SizedBox(
                                    width: size.width * .45,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset('assets/icons/rupa.png'),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Contribution Amount",
                                              style: Constants.customStyle(
                                                  14.0,
                                                  Colors.white,
                                                  FontWeight.normal),
                                            ),
                                            Text(
                                                'Rs.${logic.rpcInstallmentModel?.data.data[0].contributionAmount ?? ''}',
                                                style: Constants.customStyle(
                                                    16.0,
                                                    Colors.white,
                                                    FontWeight.bold))
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    width: size.width * .35,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset('assets/icons/id_card.png'),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("RPC ID",
                                                style: Constants.customStyle(
                                                    14.0,
                                                    Colors.white,
                                                    FontWeight.normal)),
                                            Text(
                                                logic.rpcInstallmentModel?.data
                                                        .data[0].clubId ??
                                                    '',
                                                style: Constants.customStyle(
                                                    16.0,
                                                    Colors.white,
                                                    FontWeight.bold))
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // SizedBox(
                                  //   width: size.width * .45,
                                  //   child: Row(
                                  //     mainAxisAlignment:
                                  //         MainAxisAlignment.start,
                                  //     crossAxisAlignment:
                                  //         CrossAxisAlignment.start,
                                  //     children: [
                                  //       Image.asset('assets/icons/cube.png'),
                                  //       const SizedBox(
                                  //         width: 10,
                                  //       ),
                                  //       Column(
                                  //         mainAxisAlignment:
                                  //             MainAxisAlignment.start,
                                  //         crossAxisAlignment:
                                  //             CrossAxisAlignment.start,
                                  //         children: [
                                  //           Text("Payment Method",
                                  //               style: Constants.customStyle(
                                  //                   14.0,
                                  //                   Colors.white,
                                  //                   FontWeight.normal)),
                                  //           Text(
                                  //               '${logic.rpcInstallmentModel?.data.data[0].paymentMethod.toString().substring(0, 1).toUpperCase()}${logic.rpcInstallmentModel?.data.data[0].paymentMethod.toString().substring(1).toLowerCase() ?? ''}',
                                  //               style: Constants.customStyle(
                                  //                   16.0,
                                  //                   Colors.white,
                                  //                   FontWeight.bold))
                                  //         ],
                                  //       )
                                  //     ],
                                  //   ),
                                  // ),
                                  SizedBox(
                                    width: size.width * .35,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Image.asset('assets/icons/mode.png'),
                                        const SizedBox(
                                          width: 10,
                                        ),
                                        Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text("Payment Mode",
                                                style: Constants.customStyle(
                                                    14.0,
                                                    Colors.white,
                                                    FontWeight.normal)),
                                            Text(
                                                '${logic.rpcInstallmentModel?.data.data[0].paymentMode.toString().substring(0, 1).toUpperCase().replaceAll('_', '-')}${logic.rpcInstallmentModel?.data.data[0].paymentMode.toString().substring(1).toLowerCase().replaceAll('_', '-') ?? ''}',
                                                style: Constants.customStyle(
                                                    16.0,
                                                    Colors.white,
                                                    FontWeight.bold))
                                          ],
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: primaryColor),
                          borderRadius: BorderRadius.circular(5)),
                      height: size.height * .1,
                      width: size.width,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                    width: size.width * 0.5,
                                    child: Text(
                                      'Contribution Amount',
                                      style: Constants.customStyle(
                                          16.0, primaryColor, FontWeight.w500),
                                    )),
                                SizedBox(
                                    width: size.width * 0.1,
                                    child: Text(":",
                                        style: Constants.customStyle(16.0,
                                            primaryColor, FontWeight.w500))),
                                SizedBox(
                                    width: size.width * 0.3,
                                    child: Text(
                                        'RS.${logic.rpcInstallmentModel?.data.data[0].contributionAmount ?? ''}',
                                        style: Constants.customStyle(16.0,
                                            primaryColor, FontWeight.w500)))
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Padding(
                            padding: const EdgeInsets.only(left: 5),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                    width: size.width * .5,
                                    child: Text('Balance Investment',
                                        style: Constants.customStyle(16.0,
                                            primaryColor, FontWeight.w500))),
                                SizedBox(
                                    width: size.width * .1,
                                    child: Text(":",
                                        style: Constants.customStyle(16.0,
                                            primaryColor, FontWeight.w500))),
                                SizedBox(
                                    width: size.width * .3,
                                    child: Text(
                                        'RS.${logic.rpcInstallmentModel?.data.data[0].pendingAmount ?? ''}',
                                        style: Constants.customStyle(16.0,
                                            primaryColor, FontWeight.w500)))
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    SizedBox(
                      // height: size.height * 1.9,
                      child: ListView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: logic.rpcInstallmentModel?.data.data[0]
                                  .payments.length ??
                              0,
                          itemBuilder: (BuildContext context, index) {
                            return InvoiceCard(
                                id: logic.rpcInstallmentModel?.data.data[0].payments[index]
                                        .id ??
                                    '',
                                ticket: 'RPC',
                                type:
                                    'RPC Payment[${logic.rpcInstallmentModel?.data.data[0].clubId ?? ''}] : \n',
                                width: size.width,
                                width2: size.width * .4,
                                invoiceNo: logic
                                        .rpcInstallmentModel
                                        ?.data
                                        .data[0]
                                        .payments[index]
                                        .invoiceNumber ??
                                    '',
                                date:
                                    '${logic.rpcInstallmentModel?.data.data[0].payments[index].DateChange()}',
                                paymentDate:
                                    '${logic.rpcInstallmentModel?.data.data[0].payments[index].paymentDateChange()}',
                                amount:
                                    '${logic.rpcInstallmentModel?.data.data[0].payments[index].amount.toString()}',
                                status:
                                    '${logic.rpcInstallmentModel?.data.data[0].payments[index].status}',
                                userId:
                                    '${logic.rpcInstallmentModel?.data.data[0].userId}');
                          }),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                  ],
                ),
              );
            }),
          ),
        ),
      ),
    );
  }
}
