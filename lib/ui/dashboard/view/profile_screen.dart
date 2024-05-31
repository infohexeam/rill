import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:rill_repository/Utils/colors_list.dart';
import 'package:rill_repository/constants/constant.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../home_screen/bind/homescreen_binding.dart';
import '../../previlege_card/bind/privilege_card_binding.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  var privilegecardController = Get.put(PrivilegeCardController());
  var homeScreenController = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
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
                Text(
                  'My Profile',
                  style: Constants.customStyle(
                      20.0, Colors.white, FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        body: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Full name",
                          style: Constants.customStyle(
                              14.0, subheader, FontWeight.normal),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 40,
                          width: size.width,
                          child: TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xffCCCCCC),
                              contentPadding: const EdgeInsets.only(left: 15),
                              hintText: privilegecardController
                                      .personalDetailsModel
                                      ?.data!
                                      .data!
                                      .personalDetails
                                      ?.fullname
                                      .toString()
                                      .toUpperCase() ??
                                  '',
                              hintStyle: Constants.customStyle(16.0,
                                  const Color(0xff888888), FontWeight.normal),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                      color: Color(0xffBBBBBB))),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xffBBBBBB))),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Phone",
                          style: Constants.customStyle(
                              14.0, subheader, FontWeight.normal),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        SizedBox(
                          height: 40,
                          width: size.width,
                          child: TextFormField(
                            readOnly: true,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color(0xffCCCCCC),
                              contentPadding: const EdgeInsets.only(left: 15),
                              hintText: privilegecardController
                                      .personalDetailsModel
                                      ?.data!
                                      .data!
                                      .personalDetails
                                      ?.phone ??
                                  '',
                              hintStyle: Constants.customStyle(16.0,
                                  const Color(0xff888888), FontWeight.normal),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(5),
                                  borderSide: const BorderSide(
                                      color: Color(0xffBBBBBB))),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Color(0xffBBBBBB))),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    privilegecardController.personalDetailsModel?.data!.data!
                                .personalDetails?.fatherName !=
                            null
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Father's name",
                                style: Constants.customStyle(
                                    14.0, subheader, FontWeight.normal),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 25),
                                child: SizedBox(
                                  height: 40,
                                  width: size.width,
                                  child: TextFormField(
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color(0xffCCCCCC),
                                      contentPadding:
                                          const EdgeInsets.only(left: 15),
                                      hintText: privilegecardController
                                              .personalDetailsModel
                                              ?.data!
                                              .data!
                                              .personalDetails
                                              ?.fatherName
                                              ?.toUpperCase() ??
                                          'Father\'s name',
                                      hintStyle: Constants.customStyle(
                                          16.0,
                                          const Color(0xff888888),
                                          FontWeight.normal),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: const BorderSide(
                                              color: Color(0xffBBBBBB))),
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffBBBBBB))),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : const SizedBox(),
                    privilegecardController.personalDetailsModel?.data!.data!
                                .personalDetails
                                ?.DateChange() !=
                            ''
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "DOB",
                                style: Constants.customStyle(
                                    14.0, subheader, FontWeight.normal),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 25),
                                child: SizedBox(
                                  height: 40,
                                  width: size.width,
                                  child: TextFormField(
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color(0xffCCCCCC),
                                      contentPadding:
                                          const EdgeInsets.only(left: 15),
                                      hintText: privilegecardController
                                              .personalDetailsModel
                                              ?.data!
                                              .data!
                                              .personalDetails
                                              ?.DateChange() ??
                                          'DOB (DD/MM/YY)',
                                      hintStyle: Constants.customStyle(
                                          16.0,
                                          const Color(0xff888888),
                                          FontWeight.normal),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: const BorderSide(
                                              color: Color(0xffBBBBBB))),
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffBBBBBB))),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : const SizedBox(),
                    privilegecardController.personalDetailsModel?.data!.data!
                                .personalDetails
                                ?.DateChange() !=
                            ''
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Address",
                                style: Constants.customStyle(
                                    14.0, subheader, FontWeight.normal),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 25),
                                child: SizedBox(
                                  height: 40,
                                  width: size.width,
                                  child: TextFormField(
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color(0xffCCCCCC),
                                      contentPadding:
                                          const EdgeInsets.only(left: 15),
                                      hintText: privilegecardController
                                              .personalDetailsModel
                                              ?.data!
                                              .data!
                                              .personalDetails
                                              ?.address
                                              ?.streetAddress
                                              ?.toUpperCase() ??
                                          'Address',
                                      hintStyle: Constants.customStyle(
                                          16.0,
                                          const Color(0xff888888),
                                          FontWeight.normal),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: const BorderSide(
                                              color: Color(0xffBBBBBB))),
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffBBBBBB))),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : const SizedBox(),
                    privilegecardController.personalDetailsModel?.data!.data!
                                .personalDetails?.address?.pinCode !=
                            ''
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Pincode",
                                style: Constants.customStyle(
                                    14.0, subheader, FontWeight.normal),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 25),
                                child: SizedBox(
                                  height: 40,
                                  width: size.width,
                                  child: TextFormField(
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color(0xffCCCCCC),
                                      contentPadding:
                                          const EdgeInsets.only(left: 15),
                                      hintText: privilegecardController
                                              .personalDetailsModel
                                              ?.data!
                                              .data!
                                              .personalDetails
                                              ?.address
                                              ?.pinCode ??
                                          'Pincode',
                                      hintStyle: Constants.customStyle(
                                          16.0,
                                          const Color(0xff888888),
                                          FontWeight.normal),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: const BorderSide(
                                              color: Color(0xffBBBBBB))),
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffBBBBBB))),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : const SizedBox(),
                    privilegecardController.personalDetailsModel?.data!.data!
                                .personalDetails?.address?.state !=
                            ''
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "State",
                                style: Constants.customStyle(
                                    14.0, subheader, FontWeight.normal),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 25),
                                child: SizedBox(
                                  height: 40,
                                  width: size.width,
                                  child: TextFormField(
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color(0xffCCCCCC),
                                      contentPadding:
                                          const EdgeInsets.only(left: 15),
                                      hintText: privilegecardController
                                              .personalDetailsModel
                                              ?.data!
                                              .data!
                                              .personalDetails
                                              ?.address
                                              ?.state
                                              ?.toUpperCase() ??
                                          'State',
                                      hintStyle: Constants.customStyle(
                                          16.0,
                                          const Color(0xff888888),
                                          FontWeight.normal),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: const BorderSide(
                                              color: Color(0xffBBBBBB))),
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffBBBBBB))),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : const SizedBox(),
                    privilegecardController.personalDetailsModel?.data!.data!
                                .personalDetails?.address?.country !=
                            ''
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Country",
                                style: Constants.customStyle(
                                    14.0, subheader, FontWeight.normal),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 25),
                                child: SizedBox(
                                  height: 40,
                                  width: size.width,
                                  child: TextFormField(
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color(0xffCCCCCC),
                                      contentPadding:
                                          const EdgeInsets.only(left: 15),
                                      hintText: privilegecardController
                                              .personalDetailsModel
                                              ?.data!
                                              .data!
                                              .personalDetails
                                              ?.address
                                              ?.country
                                              ?.toUpperCase() ??
                                          'Country',
                                      hintStyle: Constants.customStyle(
                                          16.0,
                                          const Color(0xff888888),
                                          FontWeight.normal),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: const BorderSide(
                                              color: Color(0xffBBBBBB))),
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffBBBBBB))),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : const SizedBox(),
                    privilegecardController.personalDetailsModel?.data!.data!
                                .personalDetails?.nomineeDetails?.nomineeName !=
                            ''
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Nominee name",
                                style: Constants.customStyle(
                                    14.0, subheader, FontWeight.normal),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 25),
                                child: SizedBox(
                                  height: 40,
                                  width: size.width,
                                  child: TextFormField(
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color(0xffCCCCCC),
                                      contentPadding:
                                          const EdgeInsets.only(left: 15),
                                      hintText: privilegecardController
                                              .personalDetailsModel
                                              ?.data!
                                              .data!
                                              .personalDetails
                                              ?.nomineeDetails
                                              ?.nomineeName
                                              ?.toUpperCase() ??
                                          'Nominee name',
                                      hintStyle: Constants.customStyle(
                                          16.0,
                                          const Color(0xff888888),
                                          FontWeight.normal),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: const BorderSide(
                                              color: Color(0xffBBBBBB))),
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffBBBBBB))),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : const SizedBox(),
                    privilegecardController.personalDetailsModel?.data!.data!
                                .personalDetails?.nomineeDetails?.relation !=
                            ''
                        ? Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Relation with Nominee",
                                style: Constants.customStyle(
                                    14.0, subheader, FontWeight.normal),
                              ),
                              const SizedBox(
                                height: 15,
                              ),
                              Padding(
                                padding: const EdgeInsets.only(bottom: 25),
                                child: SizedBox(
                                  height: 40,
                                  width: size.width,
                                  child: TextFormField(
                                    readOnly: true,
                                    decoration: InputDecoration(
                                      filled: true,
                                      fillColor: const Color(0xffCCCCCC),
                                      contentPadding:
                                          const EdgeInsets.only(left: 15),
                                      hintText: privilegecardController
                                              .personalDetailsModel
                                              ?.data!
                                              .data!
                                              .personalDetails
                                              ?.nomineeDetails
                                              ?.relation ??
                                          'Relation',
                                      hintStyle: Constants.customStyle(
                                          16.0,
                                          const Color(0xff888888),
                                          FontWeight.normal),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          borderSide: const BorderSide(
                                              color: Color(0xffBBBBBB))),
                                      focusedBorder: const OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: Color(0xffBBBBBB))),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                        : const SizedBox(),
                    // Text(
                    //   "Terms & Conditions",
                    //   style: Constants.customStyle(
                    //       14.0, subheader, FontWeight.normal),
                    // ),
                    // const SizedBox(
                    //   height: 15,
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(bottom: 25),
                    //   child: SizedBox(
                    //     height: 40,
                    //     width: size.width,
                    //     child: TextFormField(
                    //       readOnly: true,
                    //       decoration: InputDecoration(
                    //         filled: true,
                    //         fillColor: const Color(0xffCCCCCC),
                    //         contentPadding: const EdgeInsets.only(left: 15),
                    //         hintText: "Terms & Conditions",
                    //         hintStyle: Constants.customStyle(16.0,
                    //             const Color(0xff888888), FontWeight.normal),
                    //         enabledBorder: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(5),
                    //             borderSide:
                    //                 const BorderSide(color: Color(0xffBBBBBB))),
                    //         focusedBorder: const OutlineInputBorder(
                    //             borderSide:
                    //                 BorderSide(color: Color(0xffBBBBBB))),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    // Text(
                    //   "Contact us",
                    //   style: Constants.customStyle(
                    //       14.0, subheader, FontWeight.normal),
                    // ),
                    // const SizedBox(
                    //   height: 15,
                    // ),
                    // Padding(
                    //   padding: const EdgeInsets.only(bottom: 25),
                    //   child: SizedBox(
                    //     height: 40,
                    //     width: size.width,
                    //     child: TextFormField(
                    //       readOnly: true,
                    //       decoration: InputDecoration(
                    //         filled: true,
                    //         fillColor: const Color(0xffCCCCCC),
                    //         contentPadding: const EdgeInsets.only(left: 15),
                    //         hintText: "Contact us",
                    //         hintStyle: Constants.customStyle(16.0,
                    //             const Color(0xff888888), FontWeight.normal),
                    //         enabledBorder: OutlineInputBorder(
                    //             borderRadius: BorderRadius.circular(5),
                    //             borderSide:
                    //                 const BorderSide(color: Color(0xffBBBBBB))),
                    //         focusedBorder: const OutlineInputBorder(
                    //             borderSide:
                    //                 BorderSide(color: Color(0xffBBBBBB))),
                    //       ),
                    //     ),
                    //   ),
                    // ),
                    const SizedBox(
                      height: 60,
                    ),
                    InkWell(
                      onTap: () {
                        Get.defaultDialog(
                            middleText: 'Are you sure you want to logout?',
                            onConfirm: () {
                              homeScreenController.logoutUser();
                            },
                            buttonColor: primaryColor,
                            textConfirm: 'Yes',
                            confirmTextColor: Colors.white,
                            textCancel: 'No');
                      },
                      child: Container(
                          width: size.width,
                          height: 45,
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(10)),
                          child: Center(
                              child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              const Icon(
                                Icons.logout,
                                color: Colors.white,
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Text("Logout",
                                  style: Constants.customStyle(
                                      16.0, Colors.white, FontWeight.bold)),
                            ],
                          ))),
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    InkWell(
                      onTap: () {
                        Get.defaultDialog(
                            middleText:
                                ' Are you sure you want to delete your account?',
                            onConfirm: () {
                              homeScreenController.deleteAccount();
                            },
                            buttonColor: primaryColor,
                            textConfirm: 'Yes',
                            confirmTextColor: Colors.white,
                            textCancel: 'No');
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 50),
                        child: Container(
                            width: size.width,
                            height: 45,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10)),
                            child: Center(
                                child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const Icon(
                                  Icons.delete,
                                  color: Colors.red,
                                ),
                                const SizedBox(
                                  width: 10,
                                ),
                                Text("Delete Account",
                                    style: Constants.customStyle(
                                        16.0, Colors.red, FontWeight.bold)),
                              ],
                            ))),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 25),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          TextButton(
                              onPressed: () async {
                                _launchInBrowser('https://rillhospital.d5n.in/privacy-policy.html');


                              },
                              child: Text(
                                'Privacy and Policy',
                                style: Constants.customStyle(
                                    14.0, Colors.black54, FontWeight.bold),
                              )),
                          TextButton(
                              onPressed: () { _launchInBrowser('https://rillhospital.d5n.in/terms-condition.html');},
                              child: Text('Terms & Conditions',
                                  style: Constants.customStyle(
                                      14.0, Colors.black54, FontWeight.bold))),
                        ],
                      ),
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

Future<void> _launchInBrowser(String url) async {
  if (!await launch(
    url,
    forceSafariVC: false,
    forceWebView: false,
    headers: <String, String>{'my_header_key': 'my_header_value'},
  )) {
    throw 'Could not launch $url';
  }
}
