import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher/url_launcher_string.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

import '../../../Utils/colors_list.dart';
import '../../../constants/constant.dart';
import '../../home_screen/bind/homescreen_binding.dart';
import '../bind/privilege_card_binding.dart';

class PaymentMethodScreen extends StatefulWidget {
  const PaymentMethodScreen({super.key});

  @override
  State<PaymentMethodScreen> createState() => _PaymentMethodScreenState();
}

class _PaymentMethodScreenState extends State<PaymentMethodScreen> {
  var privilegecardController = Get.put(PrivilegeCardController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgcolor,
      appBar: Constants.investmentAppBar(
          title: 'Privilege Card',
          icon: const Icon(Icons.arrow_back, size: 30)),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: size.height,
          width: size.width,
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 55,
                  ),
                  Container(
                    padding: const EdgeInsets.all(5),
                    height: 200,
                    width: size.width,
                    decoration: const BoxDecoration(
                        color: Colors.transparent,
                        image: DecorationImage(
                            fit: BoxFit.fill,
                            image: AssetImage(
                              'assets/images/card2.png',
                            ))),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 40),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "PRIVILEGE CARD",
                            style: Constants.customStyle(
                                20.0, primaryColor, FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                privilegecardController
                                        .privilegecardexistModel?.data.fullname
                                        .toUpperCase() ??
                                    '',
                                style: Constants.customStyle(
                                    20.0, Colors.white, FontWeight.normal),
                              ),
                              Text(
                                'RLPCxxxxx',
                                style: Constants.customStyle(
                                    14.0, Colors.white, FontWeight.normal),
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
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Align(
                      alignment: Alignment.topLeft,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10, bottom: 10),
                        child: Text(
                          'Privilege Card Price',
                          style: Constants.customStyle(
                              16.0, primaryColor, FontWeight.normal),
                        ),
                      )),
                  Padding(
                    padding: const EdgeInsets.only(left: 5, right: 5),
                    child: Card(
                      elevation: 10,
                      child: SizedBox(
                        height: 45,
                        width: size.width,
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            'Rs.2000',
                            style: Constants.customStyle(
                                16.0, subheader, FontWeight.bold),
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 100,
                  ),

                  Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: InkWell(
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
                            SizedBox(
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
                      // Constants.getCommonButton(
                      //     size.width, 45, 'Connect Us')
                    ),
                  ),Padding(
                    padding: const EdgeInsets.only(bottom: 30),
                    child: InkWell(
                      onTap: () {
                        HomeScreenController.to.raiseTicket('PC', '');
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
                              "assets/icons/rill_logo.png",
                              height: 20,
                              width: 20,
                            ),
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              'Raise a Ticket',
                              style: Constants.customStyle(
                                  16.0, blueheader, FontWeight.bold),
                            )
                          ],
                        ),
                      ),
                      // Constants.getCommonButton(
                      //     size.width, 45, 'Connect Us')
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  launchWhatsApp() async {
    const link = WhatsAppUnilink(
      phoneNumber: '+919072610217',
      text: "PRIVILEGE CARD : \n",
    );
    await launch('$link');
  }
}
