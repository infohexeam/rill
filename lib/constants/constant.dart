import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rill_repository/Utils/colors_list.dart';
import 'package:rill_repository/ui/investment/bind/investment_form_binding.dart';
import 'package:rill_repository/ui/kyc_form/bind/kyc_form_binding.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:whatsapp_unilink/whatsapp_unilink.dart';

import '../Utils/app_routes.dart';
import '../ui/home_screen/bind/homescreen_binding.dart';
import '../ui/otp_screen/bind/otp_verification_controller.dart';
import '../ui/previlege_card/bind/privilege_card_binding.dart';

class Constants {
  static customStyle(var fontSize, var color, var fontWeight) {
    return TextStyle(
      fontSize: fontSize,
      color: color,
      fontWeight: fontWeight,
      fontFamily: "Inter",
    );
  }

  // static const baseUrl = 'https://api.rillhospital.co.in/';
  static Widget getCommonButton(double width, double height, String name) {
    return Container(
      decoration: BoxDecoration(
          color: primaryColor, borderRadius: BorderRadius.circular(6)),
      // margin: const EdgeInsets.only(left: 15, right: 15),
      width: width,
      height: height,
      child: Center(
          child: Text(
        name,
        style: customStyle(20.0, Colors.white, FontWeight.w700),
      )),
    );
  }

  static Widget getImageText(
      double height, double width, String image, String name) {
    return SizedBox(
      width: width,
      height: height,
      child: Row(
        children: [
          Image.asset(image),
          const SizedBox(
            width: 10,
          ),
          Text(
            name,
            style: customStyle(12.0, Colors.black, FontWeight.bold),
          )
        ],
      ),
    );
  }

  static Widget otpVerificationContainer(
      double height, double width, String type, String type2, String type3) {
    var otpVerificationController = Get.put(OtpVerificationController());
    return SizedBox(
      height: height,
      width: width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            type,
            style: Constants.customStyle(28.0, Colors.black, FontWeight.w600),
          ),
          const SizedBox(
            height: 15,
          ),
          RichText(
              text: TextSpan(
                  text: type2,
                  style:
                      Constants.customStyle(16.0, subheader, FontWeight.w500),
                  children: [
                TextSpan(
                    text: type3,
                    style: Constants.customStyle(
                        14.0, Colors.black, FontWeight.w500))
              ])),
          const SizedBox(
            height: 25,
          ),
          OtpTextField(
            onSubmit: (value) {
              otpVerificationController.otpTextEditingController.text = value;
            },
            fieldWidth: 40,
            numberOfFields: 6,
            borderWidth: 1,
            textStyle:
                Constants.customStyle(20.0, Colors.black, FontWeight.w700),
          ),
          const SizedBox(
            height: 75,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Didn't receive the OTP?",
                style:
                    Constants.customStyle(16.0, Colors.black, FontWeight.w500),
              ),
              InkWell(
                onTap: () {
                  otpVerificationController.resendOtp();
                },
                child: InkWell(
                  onTap: () {
                    otpVerificationController.otpTextEditingController.clear();
                    // otpVerificationController.resendemailOtp();
                    otpVerificationController.resendOtp();
                  },
                  child: Text(
                    "  Resend OTP",
                    style: Constants.customStyle(
                        14.0, const Color(0xff2D72F6), FontWeight.w500),
                  ),
                ),
              )
            ],
          ),
        ],
      ),
    );
  }

  static AppBar investmentAppBar({required String title, Icon? icon}) {
    // var privilegecardController = Get.put(PrivilegeCardController());

    return AppBar(
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
                  KycFormController();
                  KycFormController.to.kycDocsStatus();

                  HomeScreenController();
                  Get.offAllNamed(Routes.homescreen);
                },
                child: icon),
            const SizedBox(
              height: 15,
            ),
            Text(
              title,
              style: Constants.customStyle(20.0, Colors.white, FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  static AppBar commonAppBar({required String title, Icon? icon}) {
    var privilegecardController = Get.put(PrivilegeCardController());
    var investmentController = Get.put(InvestmentFormController());

    var kycController = Get.put(KycFormController());

    return
      AppBar(
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
                  // investmentController.refresh();
                  // investmentController.
                  investmentController.listCountRpc = 2;
                  investmentController.listCount = 2;
                  investmentController.paymentStatus.clear();
                  // print(investmentController.listCount);
                  // investmentController.controllers.clear();
                 //   if(investmentController.listCount==2){
                 //    investmentController.controllers.removeAt(0);
                 //    investmentController.controllers.removeAt(1);
                 //  }
                 //   if(investmentController.listCount==3){
                 //   investmentController.controllers.removeAt(0);
                 //   investmentController.controllers.removeAt(1);
                 //   investmentController.controllers.removeAt(2);
                 // }
                 //   if(investmentController.listCount==4){
                 //   investmentController.controllers.removeAt(0);
                 //   investmentController.controllers.removeAt(1);
                 //   investmentController.controllers.removeAt(2);
                 //   investmentController.controllers.removeAt(3);
                 // }
                 //   if(investmentController.listCount==5){
                 //   investmentController.controllers.removeAt(0);
                 //   investmentController.controllers.removeAt(1);
                 //   investmentController.controllers.removeAt(2);
                 //   investmentController.controllers.removeAt(3);
                 //   investmentController.controllers.removeAt(4);
                 // }
                 //   if(investmentController.listCount==6){
                 //   investmentController.controllers.clear();
                 //   investmentController.controllers.removeAt(0);
                 //   investmentController.controllers.removeAt(1);
                 //   investmentController.controllers.removeAt(2);
                 //   investmentController.controllers.removeAt(3);
                 //   investmentController.controllers.removeAt(4);
                 //   investmentController.controllers.removeAt(5);
                 // }
                 //   if(investmentController.listCount==7){
                 //   investmentController.controllers.removeAt(0);
                 //   investmentController.controllers.removeAt(1);
                 //   investmentController.controllers.removeAt(2);
                 //   investmentController.controllers.removeAt(3);
                 //   investmentController.controllers.removeAt(4);
                 //   investmentController.controllers.removeAt(5);
                 //   investmentController.controllers.removeAt(6);
                 // }
                 //   if(investmentController.listCount>=8){
                 //   investmentController.controllers.removeAt(0);
                 //   investmentController.controllers.removeAt(1);
                 //   investmentController.controllers.removeAt(2);
                 //   investmentController.controllers.removeAt(3);
                 //   investmentController.controllers.removeAt(4);
                 //   investmentController.controllers.removeAt(5);
                 //   investmentController.controllers.removeAt(6);
                 //   investmentController.controllers.removeAt(7);
                 // }
                 //   if(investmentController.listCount>=9){
                 //   investmentController.controllers.removeAt(0);
                 //   investmentController.controllers.removeAt(1);
                 //   investmentController.controllers.removeAt(2);
                 //   investmentController.controllers.removeAt(3);
                 //   investmentController.controllers.removeAt(4);
                 //   investmentController.controllers.removeAt(5);
                 //   investmentController.controllers.removeAt(6);
                 //   investmentController.controllers.removeAt(7);
                 //   investmentController.controllers.removeAt(8);
                 // }
                 //   if(investmentController.listCount>=10){
                 //   investmentController.controllers.removeAt(0);
                 //   investmentController.controllers.removeAt(1);
                 //   investmentController.controllers.removeAt(2);
                 //   investmentController.controllers.removeAt(3);
                 //   investmentController.controllers.removeAt(4);
                 //   investmentController.controllers.removeAt(5);
                 //   investmentController.controllers.removeAt(6);
                 //   investmentController.controllers.removeAt(7);
                 //   investmentController.controllers.removeAt(8);
                 //   investmentController.controllers.removeAt(9);
                 // }
                 //   if(investmentController.listCount>=11){
                 //   investmentController.controllers.removeAt(0);
                 //   investmentController.controllers.removeAt(1);
                 //   investmentController.controllers.removeAt(2);
                 //   investmentController.controllers.removeAt(3);
                 //   investmentController.controllers.removeAt(4);
                 //   investmentController.controllers.removeAt(5);
                 //   investmentController.controllers.removeAt(6);
                 //   investmentController.controllers.removeAt(7);
                 //   investmentController.controllers.removeAt(8);
                 //   investmentController.controllers.removeAt(9);
                 //   investmentController.controllers.removeAt(10);
                 // }
                 //   if(investmentController.listCount>=12){
                 //   investmentController.controllers.removeAt(0);
                 //   investmentController.controllers.removeAt(1);
                 //   investmentController.controllers.removeAt(2);
                 //   investmentController.controllers.removeAt(3);
                 //   investmentController.controllers.removeAt(4);
                 //   investmentController.controllers.removeAt(5);
                 //   investmentController.controllers.removeAt(6);
                 //   investmentController.controllers.removeAt(7);
                 //   investmentController.controllers.removeAt(8);
                 //   investmentController.controllers.removeAt(9);
                 //   investmentController.controllers.removeAt(10);
                 //   investmentController.controllers.removeAt(11);
                 // }
                  privilegecardController.contributionFeeController.clear();
                  KycFormController();
                  HomeScreenController();
                  void clearPreviegeFields() {
                    privilegecardController.fatherNameController.clear();
                    privilegecardController.addressController.clear();
                    privilegecardController.pinControler.clear();
                    privilegecardController.stateController.clear();
                    privilegecardController.dobController.clear();
                    privilegecardController.theChangedValue.value = 'State';
                    privilegecardController.nomineeRelationValue.value =
                        'State';

                  }

                  void clearkycFormFields() {
                    kycController.dobController.clear();
                    kycController.fatherNameController.clear();
                    kycController.addressController.clear();
                    kycController.pinControler.clear();
                    kycController.stateController.clear();
                    kycController.nomineeRelationController.clear();
                    kycController.nomineeFnameController.clear();
                    kycController.theChangedValue.value = 'State';
                    kycController.nomineeRelationValue =
                        'Relation with nominee';
                  }

                  Get.back();
                  clearPreviegeFields();
                  clearkycFormFields();
                  investmentController.paymentStatusRpc.clear();
                  investmentController.paymentStatus.clear();
                },
                child: icon),
            const SizedBox(
              height: 15,
            ),
            Text(
              title,
              style: Constants.customStyle(20.0, Colors.white, FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }

  static Widget InvoiceData(
      double width1, double width2, double width3, String text1, String text2) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
            width: width1,
            child: Text(
              text1,
              style:
                  Constants.customStyle(14.0, Colors.black, FontWeight.normal),
            )),
        SizedBox(
            width: width2,
            child: Text(":",
                style: Constants.customStyle(
                    14.0, Colors.black, FontWeight.normal))),
        SizedBox(
            width: width3,
            child: Text(text2,
                style: Constants.customStyle(
                    14.0, Colors.black, FontWeight.normal)))
      ],
    );
  }

  static AppBar InvoiceAppBar({required String title, Icon? icon}) {
    return AppBar(
      centerTitle: false,
      automaticallyImplyLeading: false,
      backgroundColor: primaryColor,
      toolbarHeight: 220,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20))),
      title: Padding(
        padding: const EdgeInsets.only(left: 10.0),
        child: GetBuilder<InvestmentFormController>(builder: (logic) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: InkWell(
                    onTap: () {
                      Get.back();
                    },
                    child: icon),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    "assets/images/logo_white.png",
                    height: 50,
                    width: 250,
                  ),
                  Text(
                    title,
                    style: Constants.customStyle(
                        15.0, Colors.white, FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(
                height: 15,
              ),
              Align(
                  alignment: Alignment.topLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                          width: 125,
                          child: Text(
                            'Date',
                            style: Constants.customStyle(
                                14.0, Colors.white, FontWeight.normal),
                          )),
                      SizedBox(
                          width: 20,
                          child: Text(":",
                              style: Constants.customStyle(
                                  14.0, Colors.white, FontWeight.normal))),
                      SizedBox(
                          width: 150,
                          child: Text(
                              logic.invoiceModel?.data.payment
                                      .transactionDateChange() ??
                                  '',
                              style: Constants.customStyle(
                                  14.0, Colors.white, FontWeight.normal)))
                    ],
                  )),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 125,
                      child: Text(
                        'Receipt Number',
                        style: Constants.customStyle(
                            14.0, Colors.white, FontWeight.bold),
                      )),
                  SizedBox(
                      width: 20,
                      child: Text(":",
                          style: Constants.customStyle(
                              14.0, Colors.white, FontWeight.bold))),
                  SizedBox(
                      width: 200,
                      child: Text(
                          logic.invoiceModel?.data.payment.invoiceNumber ?? '',
                          style: Constants.customStyle(
                              14.0, Colors.white, FontWeight.bold)))
                ],
              ),
              const SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                      width: 125,
                      child: Text(
                        'Txn Reference',
                        style: Constants.customStyle(
                            14.0, Colors.white, FontWeight.normal),
                      )),
                  SizedBox(
                      width: 20,
                      child: Text(":",
                          style: Constants.customStyle(
                              14.0, Colors.white, FontWeight.normal))),
                  SizedBox(
                      width: 150,
                      child: Text(
                          logic.invoiceModel?.data.payment
                                  .transactionReference ??
                              '',
                          style: Constants.customStyle(
                              14.0, Colors.white, FontWeight.normal)))
                ],
              ),
            ],
          );
        }),
      ),
    );
  }

  static Widget KyfDetail(double height, double width, String name,
      Function filepick, Color color) {
    return Card(
      elevation: 5,
      child: Container(
        height: height,
        width: width,
        color: const Color(0xffEFEFEF),
        child: Padding(
          padding: const EdgeInsets.only(left: 25, right: 25, top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                height: 45,
                child: TextFormField(
                  decoration: InputDecoration(
                      hintText: name,
                      contentPadding: const EdgeInsets.only(left: 15),
                      hintStyle: Constants.customStyle(
                          16.0, subheader, FontWeight.normal),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: color)),
                      focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: color))),
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              InkWell(
                onTap: () {
                  filepick();
                },
                child: Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: color)),
                  height: 45,
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border:
                                  Border.all(color: primaryColor, width: 2)),
                          width: 100,
                          height: 42,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset("assets/icons/upload.png"),
                              filepick.toString().isEmpty
                                  ? Text(
                                      'Upload file',
                                      style: Constants.customStyle(
                                          10.0,
                                          const Color(0xff133C8C),
                                          FontWeight.bold),
                                    )
                                  : Container(
                                      color: Colors.white,
                                      width: 60,
                                      height: 20,
                                      child: Text(
                                        'No file select',
                                        style: Constants.customStyle(
                                            16.0, subheader, FontWeight.normal),
                                      ),
                                    )
                            ],
                          ),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        Text(
                          'No file select',
                          style: Constants.customStyle(
                              16.0, subheader, FontWeight.normal),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 45,
              ),
            ],
          ),
        ),
      ),
    );
  }
  launchWhatsApp() async {
    const link = WhatsAppUnilink(
      phoneNumber: '+918111869981',
      text: "Hey! I'm inquiring about the Privilege card buying procedure",
    );
    await launch('$link');
  }
  static Widget ContinueButton(Function fileUpload) {
    return InkWell(
        onTap: () {
          fileUpload;
        },
        child: Container(
          height: 45,
          width: 140,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5), color: primaryColor),
          child: Center(
            child: Text(
              "Continue",
              style: Constants.customStyle(20.0, Colors.white, FontWeight.bold),
            ),
          ),
        ));
  }

  static Widget NewsTile(String image, String name) {
    return Container(
      width: 210,
      color: const Color(0xffEDF1F7),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SvgPicture.asset(
              image,
              height: 40,
              width: 91,
            ),
            Text(name,
                style:
                    Constants.customStyle(16.0, blueheader, FontWeight.bold)),
            const Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Lacus, mauris in pharetra, odio viverra feugiat habitant dui aliquam.')
          ],
        ),
      ),
    );
  }
}
class InvoiceCard extends StatelessWidget {
  final String ticket;
  final String id;
  final String type;
  final double width;
  final double width2;
  final String invoiceNo;
  final String date;
  final String paymentDate;
  final String amount;
  final String status;
  final String
  userId;
  const InvoiceCard({Key? key, required this.type, required this.width, required this.width2, required this.invoiceNo, required this.date, required this.paymentDate, required this.amount, required this.status, required this.userId, required this. ticket, required this.id,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    return Container(
      width: width,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(5)),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                height: 25,
                color: Colors.white,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Invoice: $invoiceNo',
                        style: Constants.customStyle(
                            14.0, primaryColor, FontWeight.bold),
                      ),
                      status == "COMPLETED"
                          ? Image.asset('assets/icons/verified_icon.png')
                          : Image.asset(
                        'assets/icons/pending_icon.png',
                        color: Colors.red,
                      )
                    ],
                  ),
                ),
              ),
              Container(
                color: const Color(0xffDEFCFF),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15, right: 15),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Date:',
                                  style: Constants.customStyle(
                                      14.0, blackheader, FontWeight.bold)),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(date.toString(),
                                  style: Constants.customStyle(
                                      16.0, primaryColor, FontWeight.bold))
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('Payment Date:',
                                  style: Constants.customStyle(
                                      14.0, blackheader, FontWeight.bold)),
                              const SizedBox(
                                height: 5,
                              ),
                              Text(paymentDate.toString(),
                                  style: Constants.customStyle(
                                      16.0, primaryColor, FontWeight.bold))
                            ],
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Amount:',
                              style: Constants.customStyle(
                                  14.0, blackheader, FontWeight.bold)),
                          const SizedBox(
                            height: 5,
                          ),
                          Text('RS: $amount.00',
                              style: Constants.customStyle(
                                  20.0, primaryColor, FontWeight.bold))
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    GetBuilder<InvestmentFormController>(builder: (logic) {
                      return Padding(
                        padding: const EdgeInsets.only(left: 10,right: 10),
                        child:
                        status == "COMPLETED"?
                        InkWell(
                          onTap: (){

                            if (status == "COMPLETED") {
                              logic.viewInvoice(invoiceNo, userId.toString());
                              Get.toNamed(Routes.invoicescreen,
                                  arguments: [invoiceNo, userId]);
                            }
                          },
                          child: Container(
                            height: 35,
                            width: width2,
                            decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(5)),
                            child: Center(
                                child: Text(
                                  'View Receipt'
                                  ,
                                  style: Constants.customStyle(
                                      16.0, Colors.white, FontWeight.bold),
                                )),
                          ),
                        ):
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [

                            // SizedBox(width: 10,),
                            InkWell(
                              onTap: (){

                                launchWhatsApp() async {
                                  var link = WhatsAppUnilink(
                                    phoneNumber: '+919072610217',
                                    text: type,
                                  );
                                  await launch('$link');
                                }
                                launchWhatsApp();
                              },
                              child: Container(
                                height: 40,
                                width:size.width * 0.4 ,
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
                                          15.0, Colors.green, FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            InkWell(
                              onTap: (){
                                print(id);
                                HomeScreenController.to. raiseTicket(ticket,id);

                              },
                              child: Container(
                                height: 40,
                                width:size.width * 0.4 ,
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
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      'Raise a Ticket',
                                      style: Constants.customStyle(
                                          15.0, blueheader, FontWeight.bold),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )
                        ,
                      );
                    }),
                    const SizedBox(
                      height: 20,
                    ),


                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

