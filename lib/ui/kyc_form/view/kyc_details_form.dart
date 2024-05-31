import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:mime/mime.dart';
import 'package:rill_repository/constants/constant.dart';
import 'package:rill_repository/ui/kyc_form/view/upload_class.dart';

import '../../../Utils/app_routes.dart';
import '../../../Utils/colors_list.dart';
import '../bind/kyc_form_binding.dart';

import 'dart:io';

class KycDetailsForm extends StatefulWidget {
  const KycDetailsForm({super.key});

  @override
  State<KycDetailsForm> createState() => _KycDetailsFormState();
}

class _KycDetailsFormState extends State<KycDetailsForm> {
  var kyccontroller = Get.put(KycFormController());
  File? tmpaadhar;
  File? tmppan;
  File? tmpbank;
  File? tmppassport;
  String? extension1 = 'png';
  String? extension2 = 'png';
  String? extension3 = 'png';
  String? extension4 = 'png';

  String? tmp_size1 = '1024';
  String? tmp_size2 = '1024';
  String? tmp_size3 = '1024';
  String? tmp_size4 = '1024';
  String? tmp_aadhar;
  String? tmp_pan;
  String? tmp_bank;
  String? tmp_passport;
  String? aadharstaus_icon;
  String? panstaus_icon;
  String? bankstaus_icon;
  String? passportstaus_icon;
  Color? aadharColor;
  Color? panColor;
  Color? BankColor;
  Color? passPortColor;
  final _aadharKey = GlobalKey<FormState>();

  TextEditingController aadharControler = TextEditingController();
  TextEditingController panControler = TextEditingController();
  TextEditingController bankNameControler = TextEditingController();
  TextEditingController bankNumberControler = TextEditingController();
  TextEditingController bankIFSCControler = TextEditingController();
  TextEditingController passportControler = TextEditingController();
  final _aadharformKey = GlobalKey<FormState>();
  final _panformKey = GlobalKey<FormState>();

  final _bankformKey = GlobalKey<FormState>();

  final _passportformKey = GlobalKey<FormState>();
  bool aadharValue = false;
  bool panValue = false;
  bool bankValue = false;
  bool passportValue = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: GetBuilder<KycFormController>(builder: (logic) {
        Widget getAadhar() {
          return GetBuilder<KycFormController>(
            builder: (logic) {
              if (logic.kycdocsmodel?.data?.data?.aadhaarStatus == "PENDING") {
                aadharstaus_icon = "assets/icons/pending_icon.png";
                aadharColor = Colors.red;
              } else if (logic.kycdocsmodel?.data?.data?.aadhaarStatus ==
                  "IN_PROGRESS") {
                aadharstaus_icon = "assets/icons/progress.png";
                aadharColor = Colors.orange;
              } else if (logic.kycdocsmodel?.data?.data?.aadhaarStatus ==
                  "REJECTED") {
                aadharstaus_icon = "assets/icons/reject.png";
                aadharColor = Colors.red;
              } else if (logic.kycdocsmodel?.data?.data?.aadhaarStatus ==
                  "COMPLETED") {
                aadharstaus_icon = "assets/icons/verified_icon.png";
                // statusColor = Colors.green;
                // aadharColor = Colors.red;
              } else {
                aadharstaus_icon = "assets/icons/pending_icon.png";
                aadharColor = Colors.red;
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 45, left: 25, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Aadhar Details*  ',
                          style: Constants.customStyle(
                              16.0, Colors.black, FontWeight.bold),
                        ),
                        aadharstaus_icon == "assets/icons/verified_icon.png"
                            ? Image.asset(
                                aadharstaus_icon!,
                                height: 20,
                                width: 20,
                                // color: aadharColor,
                              )
                            : Image.asset(
                                aadharstaus_icon!,
                                height: 20,
                                width: 20,
                                color: aadharColor,
                              )
                      ],
                    ),
                  ),
                  logic.kycdocsmodel?.data?.data?.aadhaarStatus == "REJECTED"
                      ? Padding(
                          padding: const EdgeInsets.only(
                              left: 25, right: 25, bottom: 10),
                          child: Text(
                              textAlign: TextAlign.justify,
                              "* ${logic.kycdocsmodel?.data?.data?.aadhaarReasonsToReject.toString().replaceAll('[', '').replaceAll(']', '')}",
                              style: Constants.customStyle(
                                  14.0, Colors.red, FontWeight.normal)),
                        )
                      : const SizedBox(),
                  Card(
                    elevation: 5,
                    child: Container(
                      // height: 280,
                      width: size.width,
                      color: const Color(0xffEFEFEF),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 25, right: 25, top: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Form(
                              key: _aadharformKey,
                              child: SizedBox(
                                height: 65,
                                child: TextFormField(
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp("[0-9]"))
                                  ],
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    String pattern =
                                        r'^[2-9]{1}[0-9]{3}[0-9]{4}[0-9]{4}$';
                                    RegExp regExp = RegExp(pattern);
                                    if (value!.isEmpty) {
                                      return 'Aadhar number is required';
                                    } else if (!regExp.hasMatch(value)) {
                                      return 'Please enter a valid aadhar number';
                                    }
                                    return null;
                                  },
                                  maxLength: 12,
                                  cursorColor: logic.kycdocsmodel?.data?.data
                                                  ?.aadhaarStatus ==
                                              "REJECTED" ||
                                          logic.kycdocsmodel?.data?.data
                                                  ?.aadhaarStatus ==
                                              "PENDING"
                                      ? primaryColor
                                      : const Color(0xffEFEFEF),
                                  readOnly: logic.kycdocsmodel?.data?.data
                                                  ?.aadhaarStatus ==
                                              "REJECTED" ||
                                          logic.kycdocsmodel?.data?.data
                                                  ?.aadhaarStatus ==
                                              "PENDING"
                                      ? false
                                      : true,
                                  keyboardType: TextInputType.number,
                                  controller: aadharControler,
                                  decoration: InputDecoration(
                                      focusedErrorBorder: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.red)),
                                      errorBorder: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.red)),
                                      counter: const Offstage(),
                                      hintText: logic.kycdocsmodel?.data?.data?.aadhaarStatus == "REJECTED" ||
                                              logic.kycdocsmodel?.data?.data?.aadhaarStatus ==
                                                  "PENDING"
                                          ? 'Aadhar number'
                                          : logic
                                                  .kycdocsmodel
                                                  ?.data
                                                  ?.data
                                                  ?.aadhaarDetails
                                                  ?.aadhaarNumber ??
                                              'No document found',
                                      contentPadding:
                                          const EdgeInsets.only(left: 15),
                                      hintStyle: Constants.customStyle(
                                          16.0, subheader, FontWeight.normal),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(color: logic.kycdocsmodel?.data?.data?.aadhaarStatus.toString() == "REJECTED" ? Colors.red : Colors.black54)),
                                      focusedBorder: OutlineInputBorder(borderSide: BorderSide(color: logic.kycdocsmodel?.data?.data?.aadhaarStatus.toString() == "REJECTED" ? Colors.red : Colors.black54))),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            InkWell(
                              onTap: () async {},
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    // color: Colors.amber,
                                    border: Border.all(
                                        color: logic.kycdocsmodel?.data?.data
                                                    ?.aadhaarStatus
                                                    .toString() ==
                                                "REJECTED"
                                            ? Colors.red
                                            : Colors.black54)),
                                height: 45,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: logic.kycdocsmodel?.data?.data
                                                  ?.aadhaarStatus
                                                  .toString() ==
                                              "REJECTED" ||
                                          logic.kycdocsmodel?.data?.data
                                                  ?.aadhaarStatus ==
                                              "PENDING"
                                      ? InkWell(
                                          onTap: () async {
                                            FilePickerResult? results =
                                                await FilePicker.platform
                                                    .pickFiles(
                                                        type: FileType.custom,
                                                        allowedExtensions: [
                                                  'jpg',
                                                  'jpeg',
                                                  'pdf',
                                                  'doc',
                                                  'png'
                                                ]);
                                            if (results != null) {
                                              tmpaadhar = File(results
                                                  .files.single.path
                                                  .toString());

                                              setState(() {
                                                tmp_aadhar =
                                                    results.files.single.name;
                                                tmp_size1 = results
                                                    .files.single.size
                                                    .toString();
                                                extension1 = results
                                                    .files.single.extension;
                                              });
                                            }
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    border: Border.all(
                                                        color: primaryColor,
                                                        width: 2)),
                                                width: 100,
                                                height: 42,
                                                // color: Colors.black,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                        "assets/icons/upload.png"),
                                                    tmp_pan == null
                                                        ?
                                                        //
                                                        // logic.kycdocsmodel!.data!.data!.aadhaarDetails.isEmpty ?
                                                        Text(
                                                            'Upload file',
                                                            style: Constants
                                                                .customStyle(
                                                                    10.0,
                                                                    const Color(
                                                                        0xff133C8C),
                                                                    FontWeight
                                                                        .bold),
                                                          )
                                                        : Text(
                                                            'Replace file',
                                                            style: Constants
                                                                .customStyle(
                                                                    10.0,
                                                                    const Color(
                                                                        0xff133C8C),
                                                                    FontWeight
                                                                        .bold),
                                                          )
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 30,
                                              ),
                                              // tmp.toString().isEmpty?
                                              tmp_aadhar == null
                                                  ? Text('No file selected',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color: aadharValue ==
                                                                  false
                                                              ? Colors.grey
                                                              : Colors.red))
                                                  : SizedBox(
                                                      width: 150,
                                                      height: 35,
                                                      child: Center(
                                                        child: Text(
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          tmp_aadhar ?? '',
                                                          style: Constants
                                                              .customStyle(
                                                                  9.0,
                                                                  const Color(
                                                                      0xff133C8C),
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    )
                                            ],
                                          ),
                                        )
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  border: Border.all(
                                                      color: primaryColor,
                                                      width: 2)),
                                              width: 100,
                                              height: 42,
                                              // color: Colors.black,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                      "assets/icons/upload.png"),
                                                  // tmp.toString() == null
                                                  //
                                                  // logic.kycdocsmodel!.data!.data!.aadhaarDetails.isEmpty ?
                                                  Text(
                                                    'Document',
                                                    style:
                                                        Constants.customStyle(
                                                            10.0,
                                                            const Color(
                                                                0xff133C8C),
                                                            FontWeight.bold),
                                                  )
                                                  //     :
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 30,
                                            ),
                                            // tmp.toString().isEmpty?
                                            SizedBox(
                                              width: 150,
                                              height: 35,
                                              child: Text(
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                logic
                                                            .kycdocsmodel
                                                            ?.data
                                                            ?.data
                                                            ?.aadhaarDetails
                                                            ?.file
                                                            ?.originalName ==
                                                        null
                                                    ? 'No document found'
                                                    : logic
                                                            .kycdocsmodel!
                                                            .data!
                                                            .data!
                                                            .aadhaarDetails!
                                                            .file
                                                            ?.originalName
                                                            .toString() ??
                                                        '',
                                                style: Constants.customStyle(
                                                    9.0,
                                                    const Color(0xff133C8C),
                                                    FontWeight.bold),
                                              ),
                                            )
                                          ],
                                        ),
                                ),
                              ),
                            ),
                            (extension1 == 'jpeg') ||
                                    (extension1 == 'jpg') ||
                                    (extension1 == 'pdf') ||
                                    (extension1 == 'doc') ||
                                    (extension1 == 'png')
                                ? const SizedBox()
                                : Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("File format not supported",
                                        style: Constants.customStyle(14.0,
                                            Colors.red, FontWeight.normal)),
                                  ),
                            (extension1 == 'jpeg') ||
                                    (extension1 == 'jpg') ||
                                    (extension1 == 'pdf') ||
                                    (extension1 == 'doc') ||
                                    (extension1 == 'png')
                                ? int.parse(tmp_size1.toString()) > 1048576
                                    ? Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Maximum file size is 1MB",
                                            style: Constants.customStyle(14.0,
                                                Colors.red, FontWeight.normal)),
                                      )
                                    : const SizedBox()
                                : const SizedBox(),
                            const SizedBox(
                              height: 45,
                            ),
                            logic.kycdocsmodel?.data?.data?.aadhaarStatus
                                            .toString() ==
                                        "REJECTED" ||
                                    logic.kycdocsmodel?.data?.data
                                            ?.aadhaarStatus ==
                                        "PENDING"
                                ? InkWell(
                                    onTap: () {
                                      setState(() {
                                        print('fjf $tmpaadhar');

                                        var mimeType = tmp_aadhar != null
                                            ? lookupMimeType(tmpaadhar!.path)
                                            : '';
                                        print(
                                            "MimeType Aadhar is::: $mimeType");
                                        if (_aadharformKey.currentState!
                                                .validate() &&
                                            tmp_aadhar != null) {
                                          UploadFileService service =
                                              UploadFileService();
                                          service.uploadFiles(
                                              aadharNo: aadharControler.text,
                                              file: tmpaadhar,
                                              mimeType: mimeType);
                                          // tmp=null;
                                          // tmp_aadhar=null;
                                        } else {
                                          aadharValue = true;
                                        }
                                      });
                                    },
                                    child: Container(
                                      height: 45,
                                      width: 140,
                                      margin: const EdgeInsets.only(bottom: 20),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: primaryColor),
                                      child: Center(
                                        child: Text(
                                          "Submit",
                                          style: Constants.customStyle(20.0,
                                              Colors.white, FontWeight.bold),
                                        ),
                                      ),
                                    ))
                                : const SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
          );
        }

        Widget getPan() {
          return GetBuilder<KycFormController>(
            builder: (logic) {
              if (logic.kycdocsmodel?.data?.data?.panStatus == "PENDING") {
                panstaus_icon = "assets/icons/pending_icon.png";
                panColor = Colors.red;
              } else if (logic.kycdocsmodel?.data?.data?.panStatus ==
                  "IN_PROGRESS") {
                panstaus_icon = "assets/icons/progress.png";
                panColor = Colors.orange;
              } else if (logic.kycdocsmodel?.data?.data?.panStatus ==
                  "REJECTED") {
                panstaus_icon = "assets/icons/reject.png";
                panColor = Colors.red;
              } else if (logic.kycdocsmodel?.data?.data?.panStatus ==
                  "COMPLETED") {
                panstaus_icon = "assets/icons/verified_icon.png";
              } else {
                panstaus_icon = "assets/icons/pending_icon.png";
                panColor = Colors.red;
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 45, left: 25, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Pan Details*  ',
                          style: Constants.customStyle(
                              16.0, Colors.black, FontWeight.bold),
                        ),
                        panstaus_icon == "assets/icons/verified_icon.png"
                            ? Image.asset(
                                panstaus_icon!,
                                height: 20,
                                width: 20,
                              )
                            : Image.asset(
                                panstaus_icon!,
                                height: 20,
                                width: 20,
                                color: panColor,
                              )
                      ],
                    ),
                  ),
                  logic.kycdocsmodel?.data?.data?.panStatus == "REJECTED"
                      ? Padding(
                          padding: const EdgeInsets.only(
                              left: 25, right: 25, bottom: 10),
                          child: Text(
                              textAlign: TextAlign.justify,
                              "* ${logic.kycdocsmodel?.data?.data?.panReasonsToReject.toString().replaceAll('[', '').replaceAll(']', '')}",
                              style: Constants.customStyle(
                                  14.0, Colors.red, FontWeight.normal)),
                        )
                      : const SizedBox(),
                  Card(
                    elevation: 5,
                    child: Container(
                      // height: 270,
                      width: size.width,
                      color: const Color(0xffEFEFEF),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 25, right: 25, top: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Form(
                              key: _panformKey,
                              child: SizedBox(
                                height: 65,
                                child: TextFormField(
                                  textCapitalization:
                                      TextCapitalization.characters,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.allow(
                                        RegExp("[A-Za-z0-9]"))
                                  ],
                                  maxLength: 10,
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    String pattern =
                                        r'^[A-Z]{5}[0-9]{4}[A-Z]{1}$';
                                    RegExp regExp = RegExp(pattern);
                                    if (value!.isEmpty) {
                                      return 'Pan number is required';
                                    } else if (!regExp.hasMatch(value)) {
                                      return 'Please enter a valid Pan number';
                                    }
                                    return null;
                                  },
                                  readOnly: logic.kycdocsmodel?.data?.data
                                                  ?.panStatus ==
                                              "REJECTED" ||
                                          logic.kycdocsmodel?.data?.data
                                                  ?.panStatus ==
                                              "PENDING"
                                      ? false
                                      : true,
                                  controller: panControler,
                                  cursorColor: logic.kycdocsmodel?.data?.data
                                                  ?.panStatus ==
                                              "REJECTED" ||
                                          logic.kycdocsmodel?.data?.data
                                                  ?.panStatus ==
                                              "PENDING"
                                      ? primaryColor
                                      : const Color(0xffEFEFEF),
                                  decoration: InputDecoration(
                                    counter: const Offstage(),
                                    helperText: '',
                                    focusedErrorBorder:
                                        const OutlineInputBorder(
                                            borderSide:
                                                BorderSide(color: Colors.red)),
                                    errorBorder: const OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.red)),
                                    hintText: logic.kycdocsmodel?.data?.data
                                                    ?.panStatus ==
                                                "REJECTED" ||
                                            logic.kycdocsmodel?.data?.data
                                                    ?.panStatus ==
                                                "PENDING"
                                        ? 'Pan Number'
                                        : logic.kycdocsmodel?.data?.data
                                                ?.panDetails?.panNumber ??
                                            'No document found',
                                    contentPadding:
                                        const EdgeInsets.only(left: 15),
                                    hintStyle: Constants.customStyle(
                                        16.0, subheader, FontWeight.normal),
                                    enabledBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: logic.kycdocsmodel?.data
                                                        ?.data?.panStatus
                                                        .toString() ==
                                                    "REJECTED"
                                                ? Colors.red
                                                : Colors.black54)),
                                    focusedBorder: OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: logic.kycdocsmodel?.data
                                                        ?.data?.panStatus
                                                        .toString() ==
                                                    "REJECTED"
                                                ? Colors.red
                                                : Colors.black54)),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 15,
                            ),
                            InkWell(
                              onTap: () async {},
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: logic.kycdocsmodel?.data?.data
                                                    ?.panStatus
                                                    .toString() ==
                                                "REJECTED"
                                            ? Colors.red
                                            : Colors.black54)),
                                height: 45,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: logic.kycdocsmodel?.data?.data
                                                  ?.panStatus
                                                  .toString() ==
                                              "REJECTED" ||
                                          logic.kycdocsmodel?.data?.data
                                                  ?.panStatus ==
                                              "PENDING"
                                      ? InkWell(
                                          onTap: () async {
                                            FilePickerResult? results =
                                                await FilePicker.platform
                                                    .pickFiles(
                                                        type: FileType.custom,
                                                        allowedExtensions: [
                                                  'jpg',
                                                  'jpeg',
                                                  'pdf',
                                                  'doc',
                                                  'png'
                                                ]);
                                            if (results != null) {
                                              tmppan = File(results
                                                  .files.single.path
                                                  .toString());
                                              setState(() {
                                                tmp_pan =
                                                    results.files.single.name;
                                                tmp_size2 = results
                                                    .files.single.size
                                                    .toString();
                                                extension2 = results
                                                    .files.single.extension;
                                              });
                                            }
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    border: Border.all(
                                                        color: primaryColor,
                                                        width: 2)),
                                                width: 100,
                                                height: 42,
                                                // color: Colors.black,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                        "assets/icons/upload.png"),
                                                    tmp_pan == null
                                                        ? Text(
                                                            'Upload file',
                                                            style: Constants
                                                                .customStyle(
                                                                    10.0,
                                                                    const Color(
                                                                        0xff133C8C),
                                                                    FontWeight
                                                                        .bold),
                                                          )
                                                        : Text(
                                                            'Replace file',
                                                            style: Constants
                                                                .customStyle(
                                                                    10.0,
                                                                    const Color(
                                                                        0xff133C8C),
                                                                    FontWeight
                                                                        .bold),
                                                          )
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 30,
                                              ),
                                              // tmp.toString().isEmpty?
                                              tmp_pan == null
                                                  ? Text('No file selected',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color:
                                                              panValue == false
                                                                  ? Colors.grey
                                                                  : Colors.red))
                                                  : SizedBox(
                                                      width: 150,
                                                      height: 35,
                                                      child: Center(
                                                        child: Text(
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          tmp_pan ?? '',
                                                          style: Constants
                                                              .customStyle(
                                                                  9.0,
                                                                  const Color(
                                                                      0xff133C8C),
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    )
                                            ],
                                          ),
                                        )
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  border: Border.all(
                                                      color: primaryColor,
                                                      width: 2)),
                                              width: 100,
                                              height: 42,
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceEvenly,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                children: [
                                                  Image.asset(
                                                      "assets/icons/upload.png"),
                                                  // tmp.toString() == null
                                                  //     ?
                                                  Text(
                                                    'Document',
                                                    style:
                                                        Constants.customStyle(
                                                            10.0,
                                                            const Color(
                                                                0xff133C8C),
                                                            FontWeight.bold),
                                                  )
                                                ],
                                              ),
                                            ),
                                            const SizedBox(
                                              width: 30,
                                            ),
                                            SizedBox(
                                              width: 150,
                                              height: 35,
                                              child: Text(
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                logic
                                                            .kycdocsmodel
                                                            ?.data
                                                            ?.data
                                                            ?.panDetails
                                                            ?.file
                                                            ?.originalName ==
                                                        null
                                                    ? 'No document found'
                                                    : logic
                                                            .kycdocsmodel
                                                            ?.data
                                                            ?.data
                                                            ?.panDetails
                                                            ?.file
                                                            ?.originalName
                                                            .toString() ??
                                                        '',
                                                style: Constants.customStyle(
                                                    9.0,
                                                    const Color(0xff133C8C),
                                                    FontWeight.bold),
                                              ),
                                            )
                                          ],
                                        ),
                                ),
                              ),
                            ),
                            (extension2 == 'jpeg') ||
                                    (extension2 == 'jpg') ||
                                    (extension2 == 'pdf') ||
                                    (extension2 == 'doc') ||
                                    (extension2 == 'png')
                                ? const SizedBox()
                                : Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("File format not supported",
                                        style: Constants.customStyle(14.0,
                                            Colors.red, FontWeight.normal)),
                                  ),
                            (extension2 == 'jpeg') ||
                                    (extension2 == 'jpg') ||
                                    (extension2 == 'pdf') ||
                                    (extension2 == 'doc') ||
                                    (extension2 == 'png')
                                ? int.parse(tmp_size2.toString()) > 1048576
                                    ? Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Maximum file size is 1MB",
                                            style: Constants.customStyle(14.0,
                                                Colors.red, FontWeight.normal)),
                                      )
                                    : const SizedBox()
                                : const SizedBox(),
                            const SizedBox(
                              height: 45,
                            ),
                            logic.kycdocsmodel?.data?.data?.panStatus
                                            .toString() ==
                                        "REJECTED" ||
                                    logic.kycdocsmodel?.data?.data?.panStatus ==
                                        "PENDING"
                                ? InkWell(
                                    onTap: () {
                                      setState(() {
                                        var mimeType = tmp_pan != null
                                            ? lookupMimeType(tmppan!.path)
                                            : '';
                                        print(mimeType);
                                        if (_panformKey.currentState!
                                                .validate() &&
                                            tmp_pan != null) {
                                          UploadFileService service =
                                              UploadFileService();
                                          service.uploadFilesPan(
                                              panNo: panControler.text,
                                              file: tmppan,
                                              mimeType: mimeType);
                                        } else {
                                          panValue = true;
                                        }
                                      });
                                    },
                                    child: Container(
                                      height: 45,
                                      width: 140,
                                      margin: const EdgeInsets.only(bottom: 20),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: primaryColor),
                                      child: Center(
                                        child: Text(
                                          "Submit",
                                          style: Constants.customStyle(20.0,
                                              Colors.white, FontWeight.bold),
                                        ),
                                      ),
                                    ))
                                : const SizedBox(),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
          );
        }

        Widget getBank() {
          return GetBuilder<KycFormController>(
            builder: (logic) {
              if (logic.kycdocsmodel?.data?.data?.bankStatus == "PENDING") {
                bankstaus_icon = "assets/icons/pending_icon.png";
                BankColor = Colors.red;
              } else if (logic.kycdocsmodel?.data?.data?.bankStatus ==
                  "IN_PROGRESS") {
                bankstaus_icon = "assets/icons/progress.png";
                BankColor = Colors.orange;
              } else if (logic.kycdocsmodel?.data?.data?.bankStatus ==
                  "REJECTED") {
                bankstaus_icon = "assets/icons/reject.png";
                BankColor = Colors.red;
              } else if (logic.kycdocsmodel?.data?.data?.bankStatus ==
                  "COMPLETED") {
                bankstaus_icon = "assets/icons/verified_icon.png";
              } else {
                bankstaus_icon = "assets/icons/pending_icon.png";
                BankColor = Colors.red;
              }
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 45, left: 25, bottom: 5),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Bank Details*  ',
                          style: Constants.customStyle(
                              16.0, Colors.black, FontWeight.bold),
                        ),
                        bankstaus_icon == "assets/icons/verified_icon.png"
                            ? Image.asset(
                                bankstaus_icon!,
                                height: 20,
                                width: 20,
                              )
                            : Image.asset(
                                bankstaus_icon!,
                                height: 20,
                                width: 20,
                                color: BankColor,
                              )
                      ],
                    ),
                  ),
                  logic.kycdocsmodel?.data?.data?.bankStatus == "PENDING" ||  logic.kycdocsmodel?.data?.data?.bankStatus == "REJECTED"
                      ? Padding(
                          padding: const EdgeInsets.only(
                              left: 25, right: 15, bottom: 20),
                          child: Text(
                            'Bank details are required to make the dividend payout',
                            style: Constants.customStyle(
                                12.0, blueheader, FontWeight.normal),
                          ),
                        )
                      : const SizedBox(),
                  logic.kycdocsmodel?.data?.data?.bankStatus == "REJECTED"
                      ? Padding(
                          padding: const EdgeInsets.only(
                              left: 25, right: 25, bottom: 10),
                          child: Text(
                              textAlign: TextAlign.justify,
                              "* ${logic.kycdocsmodel?.data?.data?.bankReasonsToReject.toString().replaceAll('[', '').replaceAll(']', '')}",
                              style: Constants.customStyle(
                                  14.0, Colors.red, FontWeight.normal)),
                        )
                      : const SizedBox(),
                  Form(
                    key: _bankformKey,
                    child: Card(
                      elevation: 5,
                      child: Container(
                        // height: size.height * 0.58,
                        width: size.width,
                        color: const Color(0xffEFEFEF),
                        child: Padding(
                            padding: const EdgeInsets.only(
                                left: 25, right: 25, top: 20),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 10,
                                ),
                                SizedBox(
                                  height: 65,
                                  child: TextFormField(
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(18),
                                      FilteringTextInputFormatter.allow(
                                          RegExp("[0-9]"))
                                    ],
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) {
                                      String pattern = r'^[0-9]{9,18}$';
                                      RegExp regExp = RegExp(pattern);
                                      if (value!.isEmpty) {
                                        return 'Account number is required';
                                      } else if (!regExp.hasMatch(value)) {
                                        return 'Please enter a valid Account number';
                                      }
                                      return null;
                                    },
                                    readOnly: logic.kycdocsmodel?.data?.data
                                                    ?.bankStatus ==
                                                "REJECTED" ||
                                            logic.kycdocsmodel?.data?.data
                                                    ?.bankStatus ==
                                                "PENDING"
                                        ? false
                                        : true,
                                    cursorColor: logic.kycdocsmodel?.data?.data
                                                    ?.bankStatus ==
                                                "REJECTED" ||
                                            logic.kycdocsmodel?.data?.data
                                                    ?.bankStatus ==
                                                "PENDING"
                                        ? primaryColor
                                        : const Color(0xffEFEFEF),
                                    controller: bankNumberControler,
                                    keyboardType: TextInputType.number,
                                    textInputAction: TextInputAction.next,
                                    decoration: InputDecoration(
                                      helperText: '',
                                      focusedErrorBorder:
                                          const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.red)),
                                      errorBorder: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.red)),
                                      contentPadding:
                                          const EdgeInsets.only(left: 15),
                                      hintText: logic.kycdocsmodel?.data?.data
                                                      ?.bankStatus ==
                                                  "REJECTED" ||
                                              logic.kycdocsmodel?.data?.data
                                                      ?.bankStatus ==
                                                  "PENDING"
                                          ? 'Account Number'
                                          : logic
                                                  .kycdocsmodel
                                                  ?.data
                                                  ?.data
                                                  ?.bankDetails
                                                  ?.accountNumber ??
                                              'No document found',
                                      hintStyle: Constants.customStyle(
                                          16.0, subheader, FontWeight.normal),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: logic.kycdocsmodel?.data
                                                          ?.data?.bankStatus
                                                          .toString() ==
                                                      "REJECTED"
                                                  ? Colors.red
                                                  : Colors.black54)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: logic.kycdocsmodel?.data
                                                          ?.data?.bankStatus
                                                          .toString() ==
                                                      "REJECTED"
                                                  ? Colors.red
                                                  : Colors.black54)),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                SizedBox(
                                  height: 65,
                                  child: TextFormField(
                                    // onChanged: (value) {
                                    //   bankNameControler.value =
                                    //       TextEditingValue(
                                    //         text: value.toUpperCase(),
                                    //         selection:
                                    //         bankNameControler.selection
                                    //       );
                                    // },
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return 'Account holder name is required';
                                      }
                                      return null;
                                    },
                                    readOnly: logic.kycdocsmodel?.data?.data
                                                    ?.bankStatus ==
                                                "REJECTED" ||
                                            logic.kycdocsmodel?.data?.data
                                                    ?.bankStatus ==
                                                "PENDING"
                                        ? false
                                        : true,
                                    cursorColor: logic.kycdocsmodel?.data?.data
                                                    ?.bankStatus ==
                                                "REJECTED" ||
                                            logic.kycdocsmodel?.data?.data
                                                    ?.bankStatus ==
                                                "PENDING"
                                        ? primaryColor
                                        : const Color(0xffEFEFEF),
                                    controller: bankNameControler,
                                    // keyboardType: TextInputType.name,
                                    textInputAction: TextInputAction.next,
                                    inputFormatters: [
                                      FilteringTextInputFormatter.allow(
                                          RegExp("[ a-zA-Z]")),
                                    ],
                                    decoration: InputDecoration(
                                      focusedErrorBorder:
                                          const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.red)),
                                      errorBorder: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.red)),
                                      contentPadding:
                                          const EdgeInsets.only(left: 15),
                                      hintText: logic.kycdocsmodel?.data?.data
                                                      ?.bankStatus ==
                                                  "REJECTED" ||
                                              logic.kycdocsmodel?.data?.data
                                                      ?.bankStatus ==
                                                  "PENDING"
                                          ? 'Account Holder Name'
                                          : logic.kycdocsmodel?.data?.data
                                                  ?.bankDetails?.name ??
                                              'No document found',
                                      hintStyle: Constants.customStyle(
                                          16.0, subheader, FontWeight.normal),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: logic.kycdocsmodel?.data
                                                          ?.data?.bankStatus ==
                                                      "REJECTED"
                                                  ? Colors.red
                                                  : Colors.black54)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: logic.kycdocsmodel?.data
                                                          ?.data?.bankStatus ==
                                                      "REJECTED"
                                                  ? Colors.red
                                                  : Colors.black54)),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                SizedBox(
                                  height: 65,
                                  child: TextFormField(
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(11),
                                      FilteringTextInputFormatter.allow(
                                          RegExp("[0-9a-zA-Z]"))
                                    ],

                                    validator: (value) {
                                      String pattern =
                                          r'^[A-Z|a-z]{4}[0][0-9]{6}$';
                                      RegExp regExp = RegExp(pattern);
                                      if (value!.isEmpty) {
                                        return 'IFSC code is required';
                                      } else if (!regExp.hasMatch(value)) {
                                        return 'Please enter a valid IFSC code';
                                      }
                                      return null;
                                    },
                                    readOnly: logic.kycdocsmodel?.data?.data
                                                    ?.bankStatus ==
                                                "REJECTED" ||
                                            logic.kycdocsmodel?.data?.data
                                                    ?.bankStatus ==
                                                "PENDING"
                                        ? false
                                        : true,
                                    cursorColor: logic.kycdocsmodel?.data?.data
                                                    ?.bankStatus ==
                                                "REJECTED" ||
                                            logic.kycdocsmodel?.data?.data
                                                    ?.bankStatus ==
                                                "PENDING"
                                        ? primaryColor
                                        : const Color(0xffEFEFEF),
                                    controller: bankIFSCControler,
                                    //  keyboardType: TextInputType.name,
                                    textInputAction: TextInputAction.done,
                                    decoration: InputDecoration(
                                      focusedErrorBorder:
                                          const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.red)),
                                      errorBorder: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.red)),
                                      contentPadding:
                                          const EdgeInsets.only(left: 15),
                                      hintText: logic.kycdocsmodel?.data?.data
                                                      ?.bankStatus ==
                                                  "REJECTED" ||
                                              logic.kycdocsmodel?.data?.data
                                                      ?.bankStatus ==
                                                  "PENDING"
                                          ? 'IFSC Code'
                                          : logic.kycdocsmodel?.data?.data
                                                  ?.bankDetails?.ifscCode ??
                                              'No document found',
                                      hintStyle: Constants.customStyle(
                                          16.0, subheader, FontWeight.normal),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: logic.kycdocsmodel?.data
                                                          ?.data?.bankStatus ==
                                                      "REJECTED"
                                                  ? Colors.red
                                                  : Colors.black54)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: logic.kycdocsmodel?.data
                                                          ?.data?.bankStatus ==
                                                      "REJECTED"
                                                  ? Colors.red
                                                  : Colors.black54)),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  height: 30,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          color: kyccontroller
                                                      .kycdocsmodel
                                                      ?.data
                                                      ?.data
                                                      ?.bankStatus ==
                                                  "REJECTED"
                                              ? Colors.red
                                              : Colors.black54)),
                                  height: 45,
                                  child: Padding(
                                    padding: const EdgeInsets.all(10.0),
                                    child: logic.kycdocsmodel?.data?.data
                                                    ?.bankStatus
                                                    .toString() ==
                                                "REJECTED" ||
                                            logic.kycdocsmodel?.data?.data
                                                    ?.bankStatus ==
                                                "PENDING" ||
                                            logic
                                                    .kycdocsmodel
                                                    ?.data
                                                    ?.data
                                                    ?.bankDetails
                                                    ?.file
                                                    ?.fileUrl ==
                                                null
                                        ? InkWell(
                                            onTap: () async {
                                              if (logic.kycdocsmodel?.data?.data
                                                      ?.bankStatus
                                                      .toString() ==
                                                  "IN_PROGRESS") {
                                              } else {
                                                FilePickerResult? results =
                                                    await FilePicker.platform
                                                        .pickFiles(
                                                            type:
                                                                FileType.custom,
                                                            allowedExtensions: [
                                                      'jpg',
                                                      'jpeg',
                                                      'pdf',
                                                      'doc',
                                                      'png'
                                                    ]);
                                                if (results != null) {
                                                  tmpbank = File(results
                                                      .files.single.path
                                                      .toString());
                                                  setState(() {
                                                    tmp_bank = results
                                                        .files.single.name;
                                                    tmp_size3 = results
                                                        .files.single.size
                                                        .toString();
                                                    extension3 = results
                                                        .files.single.extension;
                                                  });
                                                }
                                              }
                                            },
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              5),
                                                      border: Border.all(
                                                          color: primaryColor,
                                                          width: 2)),
                                                  width: 100,
                                                  height: 42,
                                                  // color: Colors.black,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceEvenly,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Image.asset(
                                                          "assets/icons/upload.png"),
                                                      if (tmp_bank == null)
                                                        Text(
                                                          logic
                                                                      .kycdocsmodel
                                                                      ?.data
                                                                      ?.data
                                                                      ?.bankStatus
                                                                      .toString() ==
                                                                  "IN_PROGRESS"
                                                              ? "No file Selected"
                                                              : 'Upload file',
                                                          style: Constants
                                                              .customStyle(
                                                                  10.0,
                                                                  const Color(
                                                                      0xff133C8C),
                                                                  FontWeight
                                                                      .bold),
                                                        )
                                                      else
                                                        Text(
                                                          'Replace file',
                                                          style: Constants
                                                              .customStyle(
                                                                  10.0,
                                                                  const Color(
                                                                      0xff133C8C),
                                                                  FontWeight
                                                                      .bold),
                                                        )
                                                    ],
                                                  ),
                                                ),
                                                const SizedBox(
                                                  width: 30,
                                                ),
                                                // tmp.toString().isEmpty?
                                                tmp_bank == null
                                                    ? Text(
                                                        'No file selected',
                                                        style: Constants
                                                            .customStyle(
                                                                16.0,
                                                                subheader,
                                                                FontWeight
                                                                    .normal),
                                                      )
                                                    : SizedBox(
                                                        width: 150,
                                                        height: 35,
                                                        child: Center(
                                                          child: Text(
                                                            maxLines: 2,
                                                            overflow:
                                                                TextOverflow
                                                                    .ellipsis,
                                                            tmp_bank ?? '',
                                                            style: Constants
                                                                .customStyle(
                                                                    9.0,
                                                                    const Color(
                                                                        0xff133C8C),
                                                                    FontWeight
                                                                        .bold),
                                                          ),
                                                        ),
                                                      )
                                              ],
                                            ),
                                          )
                                        : Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    border: Border.all(
                                                        color: primaryColor,
                                                        width: 2)),
                                                width: 100,
                                                height: 42,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                        "assets/icons/upload.png"),
                                                    Text(
                                                      'Document',
                                                      style:
                                                          Constants.customStyle(
                                                              10.0,
                                                              const Color(
                                                                  0xff133C8C),
                                                              FontWeight.bold),
                                                    )
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 30,
                                              ),
                                              SizedBox(
                                                width: 150,
                                                height: 35,
                                                child: Text(
                                                  maxLines: 2,
                                                  overflow:
                                                      TextOverflow.ellipsis,
                                                  logic
                                                              .kycdocsmodel
                                                              ?.data
                                                              ?.data
                                                              ?.bankDetails
                                                              ?.file
                                                              ?.originalName ==
                                                          null
                                                      ? 'No document found'
                                                      : logic
                                                              .kycdocsmodel
                                                              ?.data
                                                              ?.data
                                                              ?.bankDetails
                                                              ?.file
                                                              ?.originalName
                                                              .toString() ??
                                                          '',
                                                  style: Constants.customStyle(
                                                      9.0,
                                                      const Color(0xff133C8C),
                                                      FontWeight.bold),
                                                ),
                                              )
                                            ],
                                          ),
                                  ),
                                ),
                                (extension3 == 'jpeg') ||
                                        (extension3 == 'jpg') ||
                                        (extension3 == 'pdf') ||
                                        (extension3 == 'doc') ||
                                        (extension3 == 'png')
                                    ? const SizedBox()
                                    : Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("File format not supported",
                                            style: Constants.customStyle(14.0,
                                                Colors.red, FontWeight.normal)),
                                      ),
                                (extension3 == 'jpeg') ||
                                        (extension3 == 'jpg') ||
                                        (extension3 == 'pdf') ||
                                        (extension3 == 'doc') ||
                                        (extension3 == 'png')
                                    ? int.parse(tmp_size3.toString()) > 1048576
                                        ? Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Text(
                                                "Maximum file size is 1MB",
                                                style: Constants.customStyle(
                                                    14.0,
                                                    Colors.red,
                                                    FontWeight.normal)),
                                          )
                                        : const SizedBox()
                                    : const SizedBox(),
                                const SizedBox(
                                  height: 40,
                                ),
                                logic.kycdocsmodel?.data?.data?.bankStatus ==
                                            "REJECTED" ||
                                        logic.kycdocsmodel?.data?.data
                                                ?.bankStatus ==
                                            "PENDING"
                                    ? InkWell(
                                        onTap: () {
                                          if (_bankformKey.currentState!
                                                  .validate() &&
                                              tmpbank != null) {
                                            var mimeType =
                                                lookupMimeType(tmpbank!.path);
                                            UploadFileService service =
                                                UploadFileService();
                                            service.uploadFilesBank(
                                              bankno: bankNumberControler.text,
                                              name: bankNameControler.text,
                                              ifscCode: bankIFSCControler.text,
                                              file: tmpbank,
                                              mimetype: mimeType,
                                            );
                                          }
                                          else if (_bankformKey.currentState!
                                              .validate()) {
                                            UploadFileService service =
                                                UploadFileService();
                                            service.uploadFilesBankWihoutDoc(
                                              bankno: bankNumberControler.text,
                                              name: bankNameControler.text,
                                              ifscCode: bankIFSCControler.text,
                                              // file: tmpbank,
                                              // mimetype: mimeType,
                                            );
                                          }
                                        },
                                        child: Container(
                                          height: 45,
                                          width: 140,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              color: primaryColor),
                                          child: Center(
                                            child: Text(
                                              "Submit",
                                              style: Constants.customStyle(
                                                  20.0,
                                                  Colors.white,
                                                  FontWeight.bold),
                                            ),
                                          ),
                                        ))
                                    : const SizedBox(
                                        height: 0,
                                      ),
                                logic.kycdocsmodel?.data?.data?.bankStatus ==
                                            "REJECTED" ||
                                        logic.kycdocsmodel?.data?.data
                                                ?.bankStatus ==
                                            "PENDING" ||
                                        logic.kycdocsmodel?.data?.data
                                                ?.bankDetails?.file?.fileUrl ==
                                            null
                                    ? const SizedBox(
                                        height: 20,
                                      )
                                    : const SizedBox()
                                // Constants.ContinueButton('')
                              ],
                            )),
                      ),
                    ),
                  )
                ],
              );
            },
          );
        }

        Widget getPassPort() {
          return GetBuilder<KycFormController>(
            builder: (logic) {
              if (logic.kycdocsmodel?.data?.data?.passportStatus == "PENDING") {
                passportstaus_icon = "assets/icons/pending_icon.png";
                passPortColor = Colors.red;
              } else if (logic.kycdocsmodel?.data?.data?.passportStatus ==
                  "IN_PROGRESS") {
                passportstaus_icon = "assets/icons/progress.png";
                passPortColor = Colors.orange;
              } else if (logic.kycdocsmodel?.data?.data?.passportStatus ==
                  "REJECTED") {
                passportstaus_icon = "assets/icons/reject.png";
                passPortColor = Colors.red;
              } else if (logic.kycdocsmodel?.data?.data?.passportStatus ==
                  "COMPLETED") {
                passportstaus_icon = "assets/icons/verified_icon.png";
              } else {
                passportstaus_icon = "assets/icons/pending_icon.png";
                passPortColor = Colors.red;
              }
              return Column(
                children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 45, left: 25, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Passport Details  ',
                          style: Constants.customStyle(
                              16.0, Colors.black, FontWeight.bold),
                        ),
                        passportstaus_icon == "assets/icons/verified_icon.png"
                            ? Image.asset(
                                passportstaus_icon!,
                                height: 20,
                                width: 20,
                              )
                            : Image.asset(
                                passportstaus_icon!,
                                height: 20,
                                width: 20,
                                color: passPortColor,
                              )
                      ],
                    ),
                  ),
                  logic.kycdocsmodel?.data?.data?.passportStatus == "REJECTED"
                      ? Padding(
                          padding: const EdgeInsets.only(
                              left: 25, right: 25, bottom: 10),
                          child: Align(alignment: Alignment.topLeft,
                            child: Text(
                                textAlign: TextAlign.justify,
                                "* ${logic.kycdocsmodel?.data?.data?.passportReasonsToReject.toString().replaceAll('[', '').replaceAll(']', '')}",
                                style: Constants.customStyle(
                                    14.0, Colors.red, FontWeight.normal)),
                          ),
                        )
                      : const SizedBox(),
                  Card(
                    elevation: 5,
                    child: Container(
                      // height: size.height * 0.29,
                      width: size.width,
                      color: const Color(0xffEFEFEF),
                      child: Padding(
                        padding:
                            const EdgeInsets.only(left: 25, right: 25, top: 20),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Form(
                              key: _passportformKey,
                              child: SizedBox(
                                  height: 65,
                                  child: TextFormField(
                                    textCapitalization:
                                        TextCapitalization.characters,
                                    autovalidateMode:
                                        AutovalidateMode.onUserInteraction,
                                    inputFormatters: [
                                      LengthLimitingTextInputFormatter(8),
                                      FilteringTextInputFormatter.allow(
                                          RegExp("[0-9a-zA-Z]"))
                                    ],
                                    validator: (value) {
                                      String pattern =
                                          r'^[A-PR-WY][1-9]\d\s?\d{4}[1-9]$';
                                      RegExp regExp = RegExp(pattern);
                                      if (value!.isEmpty) {
                                        return 'Passport number is required';
                                      } else if (!regExp.hasMatch(value)) {
                                        return 'Please enter a valid Passport number';
                                      }
                                      return null;
                                    },
                                    controller: passportControler,
                                    readOnly: logic.kycdocsmodel?.data?.data
                                                    ?.passportStatus ==
                                                "REJECTED" ||
                                            logic.kycdocsmodel?.data?.data
                                                    ?.passportStatus ==
                                                "PENDING"
                                        ? false
                                        : true,
                                    cursorColor: logic.kycdocsmodel?.data?.data
                                                    ?.passportStatus ==
                                                "REJECTED" ||
                                            logic.kycdocsmodel?.data?.data
                                                    ?.passportStatus ==
                                                "PENDING"
                                        ? primaryColor
                                        : const Color(0xffEFEFEF),
                                    decoration: InputDecoration(
                                      helperText: '',
                                      focusedErrorBorder:
                                          const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.red)),
                                      errorBorder: const OutlineInputBorder(
                                          borderSide:
                                              BorderSide(color: Colors.red)),
                                      hintText: logic.kycdocsmodel?.data?.data
                                                      ?.passportStatus ==
                                                  "REJECTED" ||
                                              logic.kycdocsmodel?.data?.data
                                                      ?.passportStatus ==
                                                  "PENDING"
                                          ? 'Passport Number'
                                          : logic
                                                  .kycdocsmodel
                                                  ?.data
                                                  ?.data
                                                  ?.passportDetails
                                                  ?.passportNumber ??
                                              'No document found',
                                      contentPadding:
                                          const EdgeInsets.only(left: 15),
                                      hintStyle: Constants.customStyle(
                                          16.0, subheader, FontWeight.normal),
                                      enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: logic.kycdocsmodel?.data
                                                          ?.data?.passportStatus
                                                          .toString() ==
                                                      "REJECTED"
                                                  ? Colors.red
                                                  : Colors.black54)),
                                      focusedBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                              color: logic.kycdocsmodel?.data
                                                          ?.data?.passportStatus
                                                          .toString() ==
                                                      "REJECTED"
                                                  ? Colors.red
                                                  : Colors.black54)),
                                    ),
                                  )),
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            InkWell(
                              onTap: () {
                                // pickFile();
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(5),
                                    border: Border.all(
                                        color: logic.kycdocsmodel?.data?.data
                                                    ?.passportStatus
                                                    .toString() ==
                                                "REJECTED"
                                            ? Colors.red
                                            : Colors.black54)),
                                height: 45,
                                child: Padding(
                                  padding: const EdgeInsets.all(10.0),
                                  child: logic.kycdocsmodel?.data?.data
                                                  ?.passportStatus
                                                  .toString() ==
                                              "REJECTED" ||
                                          logic.kycdocsmodel?.data?.data
                                                  ?.passportStatus ==
                                              "PENDING"
                                      ? InkWell(
                                          onTap: () async {
                                            FilePickerResult? results =
                                                await FilePicker.platform
                                                    .pickFiles(
                                                        type: FileType.custom,
                                                        allowedExtensions: [
                                                  'jpg',
                                                  'jpeg',
                                                  'pdf',
                                                  'doc',
                                                  'png'
                                                ]);
                                            if (results != null) {
                                              tmppassport = File(results
                                                  .files.single.path
                                                  .toString());
                                              setState(() {
                                                tmp_passport =
                                                    results.files.single.name;
                                                tmp_size4 = results
                                                    .files.single.size
                                                    .toString();
                                                extension4 = results
                                                    .files.single.extension;
                                              });
                                            }
                                          },
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    border: Border.all(
                                                        color: primaryColor,
                                                        width: 2)),
                                                width: 100,
                                                height: 42,
                                                // color: Colors.black,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                        "assets/icons/upload.png"),
                                                    tmp_passport == null
                                                        ?
                                                        //
                                                        // logic.kycdocsmodel!.data!.data!.aadhaarDetails.isEmpty ?
                                                        Text(
                                                            'Upload file',
                                                            style: Constants
                                                                .customStyle(
                                                                    10.0,
                                                                    const Color(
                                                                        0xff133C8C),
                                                                    FontWeight
                                                                        .bold),
                                                          )
                                                        : Text(
                                                            'Replace file',
                                                            style: Constants
                                                                .customStyle(
                                                                    10.0,
                                                                    const Color(
                                                                        0xff133C8C),
                                                                    FontWeight
                                                                        .bold),
                                                          )
                                                  ],
                                                ),
                                              ),
                                              const SizedBox(
                                                width: 30,
                                              ),
                                              // tmp.toString().isEmpty?
                                              tmp_passport == null
                                                  ? Text('No file selected',
                                                      style: TextStyle(
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          color:
                                                              passportValue ==
                                                                      false
                                                                  ? Colors.grey
                                                                  : Colors.red))
                                                  : SizedBox(
                                                      width: 150,
                                                      height: 35,
                                                      child: Center(
                                                        child: Text(
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          tmp_passport ?? '',
                                                          style: Constants
                                                              .customStyle(
                                                                  9.0,
                                                                  const Color(
                                                                      0xff133C8C),
                                                                  FontWeight
                                                                      .bold),
                                                        ),
                                                      ),
                                                    )
                                            ],
                                          ),
                                        )
                                      : Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    border: Border.all(
                                                        color: primaryColor,
                                                        width: 2)),
                                                width: 100,
                                                height: 42,
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Image.asset(
                                                        "assets/icons/upload.png"),
                                                    // tmp.toString() == null
                                                    //     ?
                                                    Text(
                                                      'Document',
                                                      style:
                                                          Constants.customStyle(
                                                              10.0,
                                                              const Color(
                                                                  0xff133C8C),
                                                              FontWeight.bold),
                                                    )
                                                    // : Text(
                                                    //     'Replace',
                                                    //     style: Constants.customStyle(
                                                    //         10.0,
                                                    //         const Color(0xff133C8C),
                                                    //         FontWeight.bold),
                                                    //   )
                                                  ],
                                                )),
                                            const SizedBox(
                                              width: 30,
                                            ),
                                            SizedBox(
                                              width: 150,
                                              height: 35,
                                              child: Text(
                                                maxLines: 2,
                                                overflow: TextOverflow.ellipsis,
                                                logic
                                                            .kycdocsmodel
                                                            ?.data
                                                            ?.data
                                                            ?.passportDetails
                                                            ?.file
                                                            ?.originalName ==
                                                        null
                                                    ? 'No document found'
                                                    : logic
                                                            .kycdocsmodel!
                                                            .data!
                                                            .data!
                                                            .passportDetails
                                                            ?.file
                                                            ?.originalName
                                                            .toString() ??
                                                        '',
                                                style: Constants.customStyle(
                                                    9.0,
                                                    const Color(0xff133C8C),
                                                    FontWeight.bold),
                                              ),
                                            )
                                          ],
                                        ),
                                ),
                              ),
                            ),
                            (extension4 == 'jpeg') ||
                                    (extension4 == 'jpg') ||
                                    (extension4 == 'pdf') ||
                                    (extension4 == 'doc') ||
                                    (extension4 == 'png')
                                ? const SizedBox()
                                : Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("File format not supported",
                                        style: Constants.customStyle(14.0,
                                            Colors.red, FontWeight.normal)),
                                  ),
                            (extension4 == 'jpeg') ||
                                    (extension4 == 'jpg') ||
                                    (extension4 == 'pdf') ||
                                    (extension4 == 'doc') ||
                                    (extension4 == 'png')
                                ? int.parse(tmp_size4.toString()) > 1048576
                                    ? Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text("Maximum file size is 1MB",
                                            style: Constants.customStyle(14.0,
                                                Colors.red, FontWeight.normal)),
                                      )
                                    : const SizedBox()
                                : const SizedBox(),
                            const SizedBox(
                              height: 40,
                            ),
                            logic.kycdocsmodel?.data?.data?.passportStatus
                                            .toString() ==
                                        "REJECTED" ||
                                    logic.kycdocsmodel?.data?.data
                                            ?.passportStatus ==
                                        "PENDING"
                                ? InkWell(
                                    onTap: () {
                                      // setState(() {
                                      setState(() {
                                        var mimeType = tmp_passport != null
                                            ? lookupMimeType(tmppassport!.path)
                                            : '';

                                        if (_passportformKey.currentState!
                                                .validate() &&
                                            tmp_passport != null) {
                                          UploadFileService service =
                                              UploadFileService();
                                          service.uploadFilesPassport(
                                              passportNo:
                                                  passportControler.text,
                                              file: tmppassport,
                                              mimetype: mimeType);
                                        } else {
                                          passportValue = true;
                                        }
                                        // });
                                      });
                                    },
                                    child: Container(
                                      height: 45,
                                      width: 140,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          color: primaryColor),
                                      child: Center(
                                        child: Text(
                                          "Submit",
                                          style: Constants.customStyle(20.0,
                                              Colors.white, FontWeight.bold),
                                        ),
                                      ),
                                    ))
                                : const SizedBox(),
                            logic.kycdocsmodel?.data?.data?.passportStatus
                                            .toString() ==
                                        "REJECTED" ||
                                    logic.kycdocsmodel?.data?.data
                                            ?.passportStatus ==
                                        "PENDING"
                                ? const SizedBox(
                                    height: 20,
                                  )
                                : const SizedBox(
                                    height: 00,
                                  ),
                            // ContinueButton();
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              );
            },
          );
        }

        return Scaffold(
          backgroundColor: bgcolor,
          resizeToAvoidBottomInset: true,
          appBar: AppBar(
            automaticallyImplyLeading: false,
            backgroundColor: primaryColor,
            toolbarHeight: 130,
            centerTitle: false,
            shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20))),
            title:

            Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  InkWell(
                      onTap: () {
                        KycFormController();
                        KycFormController.to.kycDocsStatus();
                        //
                        // HomeScreenController();
                        Get.offAllNamed(Routes.homescreen);
                        // Get.back();
                      },
                      child: const Icon(Icons.arrow_back,size: 30,)),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    'KYC',
                    style: Constants.customStyle(20.0, Colors.white, FontWeight.bold),
                  ),
                ],
              ),
            ),
            actions: [
             ( logic.kycdocsmodel?.data?.data?.passportStatus
                  .toString() ==
                  "REJECTED" ||
                  logic.kycdocsmodel?.data?.data
                      ?.passportStatus ==
                      "PENDING") ||  ( logic.kycdocsmodel?.data?.data?.bankDetails
                 .toString() ==
                 "REJECTED" ||
                 logic.kycdocsmodel?.data?.data
                     ?.bankStatus ==
                     "PENDING") || ( logic.kycdocsmodel?.data?.data?.panDetails
                 .toString() ==
                 "REJECTED" ||
                 logic.kycdocsmodel?.data?.data
                     ?.panDetails ==
                     "PENDING") || ( logic.kycdocsmodel?.data?.data?.aadhaarDetails
                 .toString() ==
                 "REJECTED" ||
                 logic.kycdocsmodel?.data?.data
                     ?.aadhaarDetails ==
                     "PENDING")?
              Padding(
                padding: const EdgeInsets.only(right: 10.0),
                child: InkWell(
                  onTap: (){
                    Get.back();
                  },
                  child: SizedBox(
                    height: 14,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text('Update later',style: Constants.customStyle(18.0, Colors.white, FontWeight.normal),),
                        const SizedBox(width: 5,),
                        const Icon(Icons.double_arrow,size: 35,),

                      ],
                    ),
                  ),
                ),
              ):const SizedBox()
            ],
          ),
          body: RefreshIndicator(
            displacement: 250,
            backgroundColor: primaryColor,
            color: Colors.white,
            strokeWidth: 3,
            triggerMode: RefreshIndicatorTriggerMode.onEdge,
            onRefresh: () async {
              await Future.delayed(const Duration(milliseconds: 1500));
              setState(() {
                KycFormController();
                KycFormController.to.kycDocsStatus();
              });
            },
            child: SizedBox(
              height: size.height,
              child: SingleChildScrollView(
                physics:  const BouncingScrollPhysics(),
                child: GetBuilder<KycFormController>(
                  builder: (logic) {
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        getAadhar(),
                        getPan(),
                        getBank(),
                        getPassPort(),
                        const SizedBox(
                          height: 30,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
