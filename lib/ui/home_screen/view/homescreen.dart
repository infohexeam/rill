import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:badges/badges.dart' as badges;
import 'package:get/get.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:rill_repository/Utils/app_routes.dart';
import 'package:rill_repository/constants/constant.dart';
import 'package:rill_repository/ui/kyc_form/bind/kyc_form_binding.dart';
import 'package:rill_repository/ui/previlege_card/bind/privilege_card_binding.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

import '../../../Utils/colors_list.dart';
import '../../../Utils/com_binding.dart';
import '../../../Utils/session_keys.dart';
import '../../investment/bind/investment_form_binding.dart';
import '../bind/homescreen_binding.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const HomeScreen());
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  var homeScreenController = HomeScreenController.to;
  var investmentController = Get.put(InvestmentFormController());
  var privilegecontroller = Get.put(PrivilegeCardController());
  var kyccontroller = Get.put(KycFormController());
  bool shouldPop = true;

  final colorList = const <Color>[
    Color.fromARGB(255, 133, 239, 253),
  ];

  final colorList2 = const <Color>[
    Color.fromARGB(255, 7, 223, 252),
  ];

  String? token;
  @override
  void initState() {
    super.initState();
    // setState(() {
    //   investmentController;
    // });
    Firebase.initializeApp().whenComplete(() async {
      token = await FirebaseMessaging.instance.getToken();
      print('Token Firebase ::: $token');
      HomeScreenController.to.sendToken(token!);
    });
  }

  @override
  Widget build(BuildContext context) {
    print('Token Firebase ::: $token');

    var size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        Get.defaultDialog(
            content: const Text(
              "Are you sure you want to exit?",
              style: TextStyle(fontWeight: FontWeight.normal),
            ),
            onConfirm: () {
              exit(0);
            },
            buttonColor: primaryColor,
            textConfirm: 'Yes',
            confirmTextColor: Colors.white,
            textCancel: 'No');

        return true;
      },
      child: Scaffold(
        backgroundColor: bgcolor,
        body: RefreshIndicator(
          displacement: 120,
          backgroundColor: primaryColor,
          color: Colors.white,
          strokeWidth: 3,
          triggerMode: RefreshIndicatorTriggerMode.onEdge,
          onRefresh: () async {
            await Future.delayed(const Duration(milliseconds: 1500));
            setState(() {
              homeScreenController;
              InvestmentFormController();
              InvestmentFormController.to. rfcInstallmentsDetails();
              InvestmentFormController.to. rpcClubDetails();
              // InvestmentFormController.to. getnotificationcount();
              HomeScreenController.to.getInstallmentSummary();
            });
          },
          child: SizedBox(
            height: size.height,
            child: Stack(
              children: [
                CustomScrollView(
                  shrinkWrap: true,
                  physics:  const ScrollPhysics(),
                  slivers: [
                    SliverAppBar(toolbarHeight: 70,
                      forceElevated: true,
                      elevation: 4,
                      pinned: true,
                      backgroundColor: Colors.white,
                      automaticallyImplyLeading: false,
                      title: Image.asset(
                        "assets/images/logo.png",
                        height: 40,
                        width: 91,
                      ),
                      centerTitle: true,
                    ),
                    SliverList(

                        delegate: SliverChildListDelegate([

                      Padding(
                        padding: const EdgeInsets.only(left: 15, top: 15),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome, ",
                              style: Constants.customStyle(
                                  16.0, primaryColor, FontWeight.normal),
                            ),
                            GetBuilder<PrivilegeCardController>(
                                builder: (logic) {
                              return Text(
                                AppSession.to.session
                                            .read(SessionKeys.bearer_token) ==
                                        null
                                    ? 'Guest'
                                    : logic.personalDetailsModel?.data!.data!
                                            .personalDetails!.fullname
                                            .toString()
                                            .toUpperCase() ??
                                        '',
                                style: Constants.customStyle(
                                    16.0, Colors.black54, FontWeight.bold),
                              );
                            })
                          ],
                        ),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(
                              left: 15, top: 10, right: 15),
                          child: GetBuilder<InvestmentFormController>(
                            builder: (log) {
                              return SizedBox(height: size.height,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [

                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 65,
                                          width: size.width * 0.4,
                                          child: InkWell(
                                            onTap: () {
                                              log.investmentStatus();
                                              if (AppSession.to.session.read(SessionKeys.bearer_token) ==
                                                  null) {
                                                Get.toNamed(Routes.login);
                                              } else if ((privilegecontroller
                                                          .personalDetailsModel
                                                          ?.data
                                                          ?.data
                                                          ?.personalDetails
                                                          ?.nomineeAdded ==
                                                      true) &&
                                                  ((kyccontroller.kycdocsmodel?.data?.data?.aadhaarStatus == "PENDING" || kyccontroller.kycdocsmodel?.data?.data?.aadhaarStatus == "REJECTED") ||
                                                      (kyccontroller.kycdocsmodel?.data?.data?.panStatus == "PENDING" ||
                                                          kyccontroller.kycdocsmodel?.data?.data?.panStatus ==
                                                              "REJECTED")
                                                      ||
                                                      (
                                                          // kyccontroller.kycdocsmodel?.data?.data?.passportStatus == "PENDING" ||
                                                          kyccontroller
                                                                  .kycdocsmodel
                                                                  ?.data
                                                                  ?.data
                                                                  ?.passportStatus ==
                                                              "REJECTED")
                                                      ||
                                                      (kyccontroller.kycdocsmodel?.data?.data?.bankStatus == "PENDING" ||
                                                          kyccontroller
                                                                  .kycdocsmodel
                                                                  ?.data
                                                                  ?.data
                                                                  ?.bankStatus ==
                                                              "REJECTED"))) {
                                                Get.toNamed(Routes.updatekyc);
                                              } else if (kyccontroller
                                                          .kycdocsmodel
                                                          ?.data
                                                          ?.data
                                                          ?.aadhaarStatus !=
                                                      "PENDING" &&
                                                  kyccontroller.kycdocsmodel?.data?.data?.panStatus != "PENDING" &&
                                                  // kyccontroller.kycdocsmodel?.data?.data?.passportStatus != "PENDING" &&
                                                  kyccontroller.kycdocsmodel?.data?.data?.bankStatus != "PENDING") {
                                                if (log.investmentStatusModel
                                                            ?.data.rfc ==
                                                        true ||
                                                    log.investmentStatusModel
                                                            ?.data.rpc ==
                                                        true) {
                                                  Get.toNamed(
                                                      Routes.viewinvestment);
                                                } else {
                                                  Get.toNamed(
                                                      Routes.investmentplan);
                                                }
                                              }
                                              else if(privilegecontroller
                                                  .personalDetailsModel
                                                  ?.data
                                                  ?.data
                                                  ?.personalDetails
                                                  ?.nomineeAdded ==
                                                  true &&
                                              (
                                                  // kyccontroller.kycdocsmodel?.data?.data?.passportStatus == "PENDING" ||
                                              kyccontroller
                                                  .kycdocsmodel
                                                  ?.data
                                                  ?.data
                                                  ?.passportStatus ==
                                              "REJECTED")){
                                                Get.toNamed(
                                                    Routes.investmentplan);
                                              }
                                              else {
                                                Get.toNamed(
                                                    Routes.foundersclub);
                                              }
                                            },
                                            child: Card(
                                              shape:
                                                  const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  10))),
                                              elevation: 5,
                                              child: Center(
                                                child: Text(
                                                  log.investmentStatusModel
                                                                  ?.data.rfc ==
                                                              true ||
                                                          log.investmentStatusModel
                                                                  ?.data.rpc ==
                                                              true
                                                      ? 'View Investment'
                                                      : 'Invest Now',
                                                  style: Constants.customStyle(
                                                      16.0,
                                                      primaryColor,
                                                      FontWeight.bold),
                                                ),
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 65,
                                          width: size.width * 0.4,
                                          child: InkWell(
                                            onTap: () {
                                              log.investmentStatus();
                                              if (AppSession.to.session.read(
                                                      SessionKeys
                                                          .bearer_token) !=
                                                  null) {
                                                if (privilegecontroller
                                                        .personalDetailsModel
                                                        ?.data
                                                        ?.data
                                                        ?.personalDetails
                                                        ?.nomineeAdded ==
                                                    true) {
                                                  Get.toNamed(
                                                      Routes.kycscreen2);
                                                } else {
                                                  Get.toNamed(
                                                      Routes.kycscreen1);
                                                }
                                              } else {
                                                Get.toNamed(Routes.login);
                                              }
                                            },
                                            child: privilegecontroller
                                                            .privilegecardstatusModel
                                                            ?.data
                                                            ?.detailsFilled ==
                                                        true ||
                                                    privilegecontroller
                                                            .personalDetailsModel
                                                            ?.data
                                                            ?.data
                                                            ?.personalDetails
                                                            ?.nomineeAdded ==
                                                        true
                                                ? Card(
                                                    color: primaryColor,
                                                    shape: const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10))),
                                                    elevation: 5,
                                                    child: Center(
                                                      child: Column(
                                                        children: [
                                                          (kyccontroller
                                                                          .kycdocsmodel
                                                                          ?.data
                                                                          ?.data
                                                                          ?.aadhaarStatus ==
                                                                      "IN_PROGRESS" ||
                                                                  kyccontroller
                                                                          .kycdocsmodel
                                                                          ?.data
                                                                          ?.data
                                                                          ?.panStatus ==
                                                                      "IN_PROGRESS" ||
                                                                  kyccontroller
                                                                          .kycdocsmodel
                                                                          ?.data
                                                                          ?.data
                                                                          ?.passportStatus ==
                                                                      "IN_PROGRESS" ||
                                                                  kyccontroller
                                                                          .kycdocsmodel
                                                                          ?.data
                                                                          ?.data
                                                                          ?.bankStatus ==
                                                                      "IN_PROGRESS")
                                                              ? Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .topRight,
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        top:
                                                                            2.0,
                                                                        right:
                                                                            2.0),
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/icons/info.png',
                                                                      color: Colors
                                                                          .red,
                                                                    ),
                                                                  ))
                                                              : Align(
                                                                  alignment:
                                                                      Alignment
                                                                          .topRight,
                                                                  child:
                                                                      Padding(
                                                                    padding: const EdgeInsets
                                                                            .only(
                                                                        top:
                                                                            2.0,
                                                                        right:
                                                                            2.0),
                                                                    child: Image
                                                                        .asset(
                                                                      'assets/icons/info.png',
                                                                      color:
                                                                          primaryColor,
                                                                    ),
                                                                  )),
                                                          Text(
                                                            'KYC',
                                                            style: Constants.customStyle(
                                                                16.0,
                                                                (kyccontroller.kycdocsmodel?.data?.data?.aadhaarStatus == "PENDING" &&
                                                                            kyccontroller.kycdocsmodel?.data?.data?.panStatus ==
                                                                                "PENDING" &&
                                                                            kyccontroller.kycdocsmodel?.data?.data?.passportStatus ==
                                                                                "PENDING" &&
                                                                            kyccontroller.kycdocsmodel?.data?.data?.bankStatus ==
                                                                                "PENDING") ||
                                                                        (kyccontroller.kycdocsmodel?.data?.data?.aadhaarStatus == "REJECTED" ||
                                                                            kyccontroller.kycdocsmodel?.data?.data?.panStatus ==
                                                                                "REJECTED" ||
                                                                            kyccontroller.kycdocsmodel?.data?.data?.passportStatus ==
                                                                                "REJECTED" ||
                                                                            kyccontroller.kycdocsmodel?.data?.data?.bankStatus ==
                                                                                "REJECTED")
                                                                    ? Colors.red
                                                                    : Colors
                                                                        .white,
                                                                FontWeight
                                                                    .bold),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                : Card(
                                                    shape: const RoundedRectangleBorder(
                                                        borderRadius:
                                                            BorderRadius.all(
                                                                Radius.circular(
                                                                    10))),
                                                    elevation: 5,
                                                    child: Center(
                                                      child: Text(
                                                        'Submit Your KYC',
                                                        style: Constants
                                                            .customStyle(
                                                                16.0,
                                                                primaryColor,
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    ),
                                                  ),
                                          ),
                                        ),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Container(
                                      padding: const EdgeInsets.only(left: 15),
                                      height: 200,
                                      width: size.width,
                                      decoration: const BoxDecoration(
                                          color: Colors.transparent,
                                          image: DecorationImage(
                                              image: AssetImage(
                                                  'assets/images/card2.png'),
                                              fit: BoxFit.fill)),
                                      child:
                                          GetBuilder<PrivilegeCardController>(
                                              builder: (logic) {
                                        return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 15),
                                              child: Text(
                                                "PRIVILEGE CARD",
                                                style: Constants.customStyle(
                                                    20.0,
                                                    primaryColor,
                                                    FontWeight.bold),
                                              ),
                                            ),
                                            const SizedBox(
                                              height: 5,
                                            ),
                                            logic.privilegecardexistModel?.data
                                                        .privileCardExists ==
                                                    true
                                                ? Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 15),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          logic.privilegecardexistModel
                                                                  ?.data.fullname
                                                                  .toUpperCase() ??
                                                              '',
                                                          style: Constants
                                                              .customStyle(
                                                                  16.0,
                                                                  Colors.white,
                                                                  FontWeight
                                                                      .normal),
                                                        ),
                                                        Text(
                                                          logic.privilegecardexistModel?.data
                                                                      .privilegeCardNumber !=
                                                                  ''
                                                              ? logic
                                                                      .privilegecardexistModel
                                                                      ?.data
                                                                      .privilegeCardNumber ??
                                                                  ''
                                                              : 'RLPCxxxxx',
                                                          style: Constants
                                                              .customStyle(
                                                                  20.0,
                                                                  Colors.white,
                                                                  FontWeight
                                                                      .normal),
                                                        ),
                                                        Container(
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          height: 30,
                                                          width: 100,
                                                          child: Center(
                                                              child: Text(
                                                            '',
                                                            style: Constants
                                                                .customStyle(
                                                                    16.0,
                                                                    primaryColor,
                                                                    FontWeight
                                                                        .bold),
                                                          )),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                                : Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 15),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceEvenly,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                      children: [
                                                        Text(
                                                          'Buy Privilege card',
                                                          style: Constants
                                                              .customStyle(
                                                                  16.0,
                                                                  Colors.white,
                                                                  FontWeight
                                                                      .normal),
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        Text(
                                                          'Rs.2000',
                                                          style: Constants
                                                              .customStyle(
                                                                  20.0,
                                                                  Colors.white,
                                                                  FontWeight
                                                                      .normal),
                                                        ),
                                                        const SizedBox(
                                                          height: 5,
                                                        ),
                                                        InkWell(
                                                          onTap: () {
                                                            homeScreenController
                                                                .privilegeCardStatus();
                                                            homeScreenController
                                                                .getPersonalDetailsforPrivilegeCard;
                                                            if (AppSession
                                                                    .to.session
                                                                    .read(SessionKeys
                                                                        .bearer_token) ==
                                                                null) {
                                                              Get.toNamed(
                                                                  Routes.login);
                                                            } else if (homeScreenController
                                                                    .UserpersonaldetailsForPrivilegeCardResponseModel
                                                                    ?.data
                                                                    .detailsFilled ==
                                                                true) {
                                                              Get.toNamed(Routes
                                                                  .paymentmethod);
                                                            } else if (privilegecontroller
                                                                    .privilegecardstatusModel
                                                                    ?.data
                                                                    ?.detailsFilled ==
                                                                true) {
                                                              Get.toNamed(Routes
                                                                  .paymentmethod);
                                                            } else {
                                                              Get.toNamed(Routes
                                                                  .personaldetails);
                                                            }
                                                          },
                                                          child: Container(
                                                            decoration: BoxDecoration(
                                                                color: Colors
                                                                    .white,
                                                                borderRadius:
                                                                    BorderRadius
                                                                        .circular(
                                                                            10)),
                                                            height: 30,
                                                            width: 100,
                                                            child: Center(
                                                                child: Text(
                                                              'Buy Now',
                                                              style: Constants
                                                                  .customStyle(
                                                                      16.0,
                                                                      primaryColor,
                                                                      FontWeight
                                                                          .bold),
                                                            )),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  )
                                          ],
                                        );
                                      }),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),

                                    Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          InkWell(
                                            onTap: () {
                                              homeScreenController
                                                  .privilegeCardStatus();
                                              if (log.investmentStatusModel?.data.rpc ==
                                                  true) {
                                                Get.toNamed(
                                                    Routes.clubdetailsRpc);
                                              }
                                               else if (privilegecontroller
                                                      .personalDetailsModel
                                                      ?.data
                                                      ?.data
                                                      ?.personalDetails
                                                      ?.nomineeAdded ==
                                                  false) {
                                                return;
                                              } else if (privilegecontroller
                                                          .personalDetailsModel
                                                          ?.data
                                                          ?.data
                                                          ?.personalDetails
                                                          ?.nomineeAdded ==
                                                      true &&
                                                  (kyccontroller.kycdocsmodel?.data?.data?.aadhaarStatus == "PENDING" ||
                                                      kyccontroller
                                                              .kycdocsmodel
                                                              ?.data
                                                              ?.data
                                                              ?.panStatus ==
                                                          "PENDING" ||
                                                      kyccontroller
                                                              .kycdocsmodel
                                                              ?.data
                                                              ?.data
                                                              ?.passportStatus ==
                                                          "REJECTED" ||
                                                      kyccontroller
                                                              .kycdocsmodel
                                                              ?.data
                                                              ?.data
                                                              ?.bankStatus ==
                                                          "PENDING")) {
                                                Get.toNamed(Routes.updatekyc);
                                              } else if ((kyccontroller
                                                              .kycdocsmodel
                                                              ?.data
                                                              ?.data
                                                              ?.aadhaarStatus !=
                                                          "PENDING" ||
                                                      kyccontroller.kycdocsmodel?.data?.data?.aadhaarStatus != "REJECTED") ||
                                                  (kyccontroller.kycdocsmodel?.data?.data?.panStatus != "PENDING" || kyccontroller.kycdocsmodel?.data?.data?.panStatus != "REJECTED") ||
                                                  (
                                                      // kyccontroller.kycdocsmodel?.data?.data?.passportStatus != "PENDING" ||
                                                          kyccontroller.kycdocsmodel?.data?.data?.passportStatus != "REJECTED") ||
                                                  (kyccontroller.kycdocsmodel?.data?.data?.bankStatus != "PENDING" || kyccontroller.kycdocsmodel?.data?.data?.bankStatus != "REJECTED")) {
                                                if (log.investmentStatusModel
                                                            ?.data.rfc ==
                                                        true ||
                                                    log.investmentStatusModel
                                                            ?.data.rpc ==
                                                        true) {
                                                  if (kyccontroller
                                                              .kycdocsmodel
                                                              ?.data
                                                              ?.data
                                                              ?.panStatus ==
                                                          "REJECTED" ||
                                                      kyccontroller
                                                              .kycdocsmodel
                                                              ?.data
                                                              ?.data
                                                              ?.aadhaarStatus ==
                                                          "REJECTED" ||
                                                      kyccontroller
                                                              .kycdocsmodel
                                                              ?.data
                                                              ?.data
                                                              ?.passportStatus ==
                                                          "REJECTED" ||
                                                      kyccontroller
                                                              .kycdocsmodel
                                                              ?.data
                                                              ?.data
                                                              ?.bankStatus ==
                                                          "REJECTED") {
                                                    Get.toNamed(
                                                        Routes.updatekyc);
                                                  } else {
                                                    Get.toNamed(
                                                        Routes.viewinvestment);
                                                  }
                                                } else {
                                                  Get.toNamed(
                                                      Routes.investmentplan);
                                                }
                                              }
                                               else {
                                                return;
                                              }
                                            },
                                            child: Card(
                                              child: Center(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      height: 190,
                                                      width: size.width * .42,
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 15),
                                                      child: PieChart(
                                                        centerTextStyle:
                                                            Constants
                                                                .customStyle(
                                                                    24.0,
                                                                    primaryColor,
                                                                    FontWeight
                                                                        .bold),
                                                        centerText: homeScreenController
                                                                    .rpcpercent
                                                                    .toDouble() ==
                                                                0
                                                            ?
                                                        '0%'
                                                            : '${homeScreenController.rpcpercent.toInt()}%',
                                                        dataMap: {
                                                          "RPC":
                                                              homeScreenController
                                                                  .rpcpercent
                                                                  .toDouble(),
                                                        },
                                                        chartType:
                                                            ChartType.ring,
                                                        legendOptions:
                                                            const LegendOptions(
                                                          showLegends: false,
                                                          legendShape: BoxShape
                                                              .rectangle,
                                                          showLegendsInRow:
                                                              false,
                                                          legendPosition:
                                                              LegendPosition
                                                                  .bottom,
                                                        ),
                                                        baseChartColor:
                                                            const Color
                                                                    .fromARGB(
                                                                255,
                                                                240,
                                                                239,
                                                                239),
                                                        colorList: colorList,
                                                        chartValuesOptions:
                                                            ChartValuesOptions(
                                                          chartValueBackgroundColor:
                                                              Colors.white,
                                                          decimalPlaces: 0,
                                                          chartValueStyle:
                                                              Constants.customStyle(
                                                                  10.0,
                                                                  primaryColor,
                                                                  FontWeight
                                                                      .bold),
                                                          showChartValueBackground:
                                                              true,
                                                          showChartValues:
                                                              false,
                                                          showChartValuesInPercentage:
                                                              true,
                                                          showChartValuesOutside:
                                                              false,
                                                        ),
                                                        totalValue: 100,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 15),
                                                      child: Text(
                                                        "RPC",
                                                        style: Constants
                                                            .customStyle(
                                                                16.0,
                                                                Colors.black,
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                          const SizedBox(
                                            width: 5,
                                          ),
                                          InkWell(
                                             onTap: () {
                                              homeScreenController
                                                  .privilegeCardStatus();
                                              if (log.investmentStatusModel?.data.rfc ==
                                                  true) {
                                                Get.toNamed(
                                                    Routes.clubdetails);
                                              }
                                               else if (privilegecontroller
                                                      .personalDetailsModel
                                                      ?.data
                                                      ?.data
                                                      ?.personalDetails
                                                      ?.nomineeAdded ==
                                                  false) {
                                                return;
                                              } else if (privilegecontroller
                                                          .personalDetailsModel
                                                          ?.data
                                                          ?.data
                                                          ?.personalDetails
                                                          ?.nomineeAdded ==
                                                      true &&
                                                  (kyccontroller.kycdocsmodel?.data?.data?.aadhaarStatus == "PENDING" ||
                                                      kyccontroller
                                                              .kycdocsmodel
                                                              ?.data
                                                              ?.data
                                                              ?.panStatus ==
                                                          "PENDING" ||
                                                      kyccontroller
                                                              .kycdocsmodel
                                                              ?.data
                                                              ?.data
                                                              ?.passportStatus ==
                                                          "REJECTED" ||
                                                      kyccontroller
                                                              .kycdocsmodel
                                                              ?.data
                                                              ?.data
                                                              ?.bankStatus ==
                                                          "PENDING")) {
                                                Get.toNamed(Routes.updatekyc);
                                              } else if ((kyccontroller
                                                              .kycdocsmodel
                                                              ?.data
                                                              ?.data
                                                              ?.aadhaarStatus !=
                                                          "PENDING" ||
                                                      kyccontroller.kycdocsmodel?.data?.data?.aadhaarStatus != "REJECTED") ||
                                                  (kyccontroller.kycdocsmodel?.data?.data?.panStatus != "PENDING" || kyccontroller.kycdocsmodel?.data?.data?.panStatus != "REJECTED") ||
                                                  (
                                                      kyccontroller.kycdocsmodel?.data?.data?.passportStatus != "REJECTED" ||
                                                          kyccontroller.kycdocsmodel?.data?.data?.passportStatus != "REJECTED") ||
                                                  (kyccontroller.kycdocsmodel?.data?.data?.bankStatus != "PENDING" || kyccontroller.kycdocsmodel?.data?.data?.bankStatus != "REJECTED")) {
                                                if (log.investmentStatusModel
                                                            ?.data.rfc ==
                                                        true ||
                                                    log.investmentStatusModel
                                                            ?.data.rpc ==
                                                        true) {
                                                  if (kyccontroller
                                                              .kycdocsmodel
                                                              ?.data
                                                              ?.data
                                                              ?.panStatus ==
                                                          "REJECTED" ||
                                                      kyccontroller
                                                              .kycdocsmodel
                                                              ?.data
                                                              ?.data
                                                              ?.aadhaarStatus ==
                                                          "REJECTED" ||
                                                      kyccontroller
                                                              .kycdocsmodel
                                                              ?.data
                                                              ?.data
                                                              ?.passportStatus ==
                                                          "REJECTED" ||
                                                      kyccontroller
                                                              .kycdocsmodel
                                                              ?.data
                                                              ?.data
                                                              ?.bankStatus ==
                                                          "REJECTED") {
                                                    Get.toNamed(
                                                        Routes.updatekyc);
                                                  } else {
                                                    Get.toNamed(
                                                        Routes.viewinvestment);
                                                  }
                                                } else {
                                                  Get.toNamed(
                                                      Routes.investmentplan);
                                                }
                                              }
                                               else {
                                                return;
                                              }
                                            },
                                            child: Card(
                                              child: Center(
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      height: 190,
                                                      width: size.width * .42,
                                                      padding: const EdgeInsets
                                                              .symmetric(
                                                          horizontal: 15),
                                                      child: PieChart(
                                                        centerTextStyle:
                                                            Constants
                                                                .customStyle(
                                                                    24.0,
                                                                    primaryColor,
                                                                    FontWeight
                                                                        .bold),
                                                        centerText: homeScreenController
                                                                    .rfcpercent
                                                                    .toDouble() ==
                                                                0.0
                                                            ? '0%'
                                                            : '${homeScreenController.rfcpercent.toInt()}%',
                                                        emptyColor: const Color
                                                                .fromARGB(
                                                            255, 240, 239, 239),
                                                        dataMap: {
                                                          "RFC":
                                                              homeScreenController
                                                                  .rfcpercent
                                                                  .toDouble(),
                                                        },
                                                        chartType:
                                                            ChartType.ring,
                                                        legendOptions:
                                                            const LegendOptions(
                                                          showLegends: false,
                                                          showLegendsInRow:
                                                              false,
                                                          legendPosition:
                                                              LegendPosition
                                                                  .bottom,
                                                        ),
                                                        baseChartColor:
                                                            const Color
                                                                    .fromARGB(
                                                                255,
                                                                240,
                                                                239,
                                                                239),
                                                        colorList: colorList2,
                                                        chartValuesOptions:
                                                            ChartValuesOptions(
                                                          decimalPlaces: 0,
                                                          chartValueBackgroundColor:
                                                              Colors.white,
                                                          showChartValueBackground:
                                                              true,
                                                          chartValueStyle:
                                                              Constants.customStyle(
                                                                  10.0,
                                                                  primaryColor,
                                                                  FontWeight
                                                                      .bold),
                                                          showChartValues:
                                                              false,
                                                          showChartValuesInPercentage:
                                                              true,
                                                          showChartValuesOutside:
                                                              false,
                                                        ),
                                                        totalValue: 100,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              bottom: 15),
                                                      child: Text(
                                                        "RFC",
                                                        style: Constants
                                                            .customStyle(
                                                                16.0,
                                                                Colors.black,
                                                                FontWeight
                                                                    .bold),
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        launchWhatsApp();
                                      },
                                      child: Container(
                                        height: 50,
                                        width: size.width,
                                        decoration: const BoxDecoration(
                                            color: Colors.white,
                                            borderRadius:
                                            BorderRadius.all(Radius.circular(20))),
                                        child: Row(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: [
                                            Image.asset(
                                              "assets/icons/whatsapp.png",
                                              height: 25,
                                              width: 25,
                                            ),
                                            const SizedBox(
                                              width: 5,
                                            ),
                                            Text(
                                              'Chat with us',
                                              style: Constants.customStyle(
                                                  16.0, Colors.green, FontWeight.bold),
                                            )
                                          ],
                                        ),
                                      ),

                                    ),                                   // Padding(

                                  ],
                                ),
                              );
                            },
                          )),

                    ])),
                  ],
                ),
                Positioned(
                  bottom: 10,
                  left: 2,
                  right: 2,
                  child: Container(
                      width: size.width * 0.9,
                      height: 56,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(100)),
                          color: primaryColor),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          SvgPicture.asset(
                              'assets/icons/home_svg.svg'),

                          GetBuilder<InvestmentFormController>(
                              builder: (logic) {
                                return
                                 InkWell(
                                      onTap: () {
                                        homeScreenController.privilegeCardStatus();
                                        Get.toNamed(Routes.notificationscreen);
                                      },
                                      child:
                                      logic.getnotificationcount()==0?
                                      SvgPicture.asset(
                                          'assets/icons/notification_svg.svg')   :
                                      badges.Badge(
                                        badgeContent:
                                            Text(
                                              '${logic.getnotificationcount()}'),

                                        child: SvgPicture.asset(
                                            'assets/icons/notification_svg.svg'),
                                      )


                                    );
                                }
                              ),

                          GestureDetector(
                            onTap: () {
                              homeScreenController.privilegeCardStatus();
                              if (AppSession.to.session
                                      .read(SessionKeys.bearer_token) ==
                                  null) {
                                Get.toNamed(Routes.login);
                              } else {
                                Get.toNamed(Routes.profilescreen);
                              }
                            },
                            child: SvgPicture.asset(
                                'assets/icons/profile_svg.svg'),
                          ),
                        ],
                      )),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
  launchWhatsApp() async {
    const link = WhatsAppUnilink(
      phoneNumber: '+919072610217',
      text: '',
    );
    await launch('$link');
  }}
