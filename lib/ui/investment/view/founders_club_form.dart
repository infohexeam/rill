import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rill_repository/Utils/colors_list.dart';
import 'package:rill_repository/constants/constant.dart';
import 'package:rill_repository/ui/home_screen/bind/homescreen_binding.dart';
import 'package:rill_repository/ui/kyc_form/bind/kyc_form_binding.dart';
import 'package:rill_repository/ui/previlege_card/bind/privilege_card_binding.dart';

class FoundersClubScreen extends StatefulWidget {
  const FoundersClubScreen({super.key});

  @override
  State<FoundersClubScreen> createState() => _FoundersClubScreenState();
}

class _FoundersClubScreenState extends State<FoundersClubScreen> {
  var kycController = Get.put(KycFormController());
  var privilegecardController = Get.put(PrivilegeCardController());

  var homeController = Get.put(HomeScreenController());

  late String countryValue;
  late String stateValue;
  late String cityValue;
  DateTime date = DateTime(2022, 12, 34);
  final _formKey = GlobalKey<FormState>();
  final _formKey2 = GlobalKey<FormState>();
  String? selectedSalutation;
  String? name;
  bool stateItem = false;
  bool relationItem = false;
  @override
  Widget build(BuildContext context) {
    privilegecardController.userPersonalDetails();
    var size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        backgroundColor: bgcolor,
        resizeToAvoidBottomInset: true,
        appBar: Constants.commonAppBar(
            title: 'Personal Details',
            icon: const Icon(Icons.arrow_back, size: 30)),
        body: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: GetBuilder<PrivilegeCardController>(
              builder: (logic) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 45, bottom: 20),
                      child: Text(
                        'Personal Details',
                        style: Constants.customStyle(
                            16.0, Colors.black, FontWeight.bold),
                      ),
                    ),
                    privilegecardController.privilegecardstatusModel?.data
                                    ?.detailsFilled ==
                                true ||
                            privilegecardController.privilegecardexistModel
                                    ?.data.privileCardExists ==
                                true
                        ? GetBuilder<PrivilegeCardController>(builder: (logic) {
                            return Form(
                              key: _formKey2,
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 65,
                                    child: TextFormField(
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        fillColor: const Color(0xffCCCCCC),
                                        filled: true,
                                        helperText: '',
                                        contentPadding:
                                            const EdgeInsets.only(left: 15),
                                        hintText: privilegecardController
                                                .personalDetailsModel
                                                ?.data!
                                                .data!
                                                .personalDetails
                                                ?.fullname
                                                .toString()
                                                .toUpperCase() ??
                                            'Full name',
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
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  SizedBox(
                                    height: 45,
                                    child: TextFormField(
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        fillColor: const Color(0xffCCCCCC),
                                        filled: true,
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
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  SizedBox(
                                    height: 45,
                                    child: TextFormField(
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        fillColor: const Color(0xffCCCCCC),
                                        filled: true,
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
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  SizedBox(
                                    height: 45,
                                    child: TextFormField(
                                      readOnly: true,
                                      decoration: InputDecoration(
                                        fillColor: const Color(0xffCCCCCC),
                                        filled: true,
                                        counterStyle: const TextStyle(
                                          height: double.minPositive,
                                        ),
                                        counterText: "",
                                        contentPadding:
                                            const EdgeInsets.only(left: 15),
                                        hintText: privilegecardController
                                                .personalDetailsModel
                                                ?.data!
                                                .data!
                                                .personalDetails
                                                ?.address
                                                ?.pinCode ??
                                            'Pin number',
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
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  SizedBox(
                                      height: 40,
                                      width: MediaQuery.of(context).size.width,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                              height: 45,
                                              width: size.width * 0.5,
                                              decoration: BoxDecoration(
                                                  color:
                                                      const Color(0xffCCCCCC),
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  border: Border.all(
                                                      color:
                                                          const Color(0xffBBBBBB))),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 15),
                                                child: Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  children: [
                                                    Text(
                                                      privilegecardController
                                                              .personalDetailsModel
                                                              ?.data!
                                                              .data!
                                                              .personalDetails
                                                              ?.address
                                                              ?.state
                                                              ?.toUpperCase() ??
                                                          'State',
                                                      style:
                                                          Constants.customStyle(
                                                              16.0,
                                                              const Color(0xff888888),
                                                              FontWeight
                                                                  .normal),
                                                    ),
                                                    const Icon(
                                                      Icons.arrow_drop_down,
                                                      color: Colors.black54,
                                                    )
                                                  ],
                                                ),
                                              )),
                                          SizedBox(
                                            height: 45,
                                            width: size.width * 0.4,
                                            child: TextFormField(
                                              style: Constants.customStyle(
                                                  16.0,
                                                  const Color(0xff888888),
                                                  FontWeight.normal),
                                              // controller:
                                              //     logic.countryController,
                                              readOnly: true,
                                              decoration: InputDecoration(
                                                fillColor:
                                                    const Color(0xffCCCCCC),
                                                filled: true,
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        left: 15),
                                                hintText: 'INDIA',
                                                hintStyle:
                                                    Constants.customStyle(
                                                        16.0,
                                                        const Color(0xff888888),
                                                        FontWeight.normal),
                                                enabledBorder: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
                                                    borderSide:
                                                        const BorderSide(
                                                            color: Color(
                                                                0xffBBBBBB))),
                                                focusedBorder:
                                                    const OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Color(
                                                                0xffBBBBBB))),
                                              ),
                                            ),
                                          ),
                                        ],
                                      )),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  Container(
                                      width: size.width,
                                      height: 65,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                      ),
                                      child: TextFormField(
                                        decoration: InputDecoration(
                                          fillColor: const Color(0xffCCCCCC),
                                          filled: true,
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
                                          helperText: '',
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: const BorderSide(
                                                  color: Color(0xffBBBBBB))),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Color(0xffBBBBBB))),
                                        ),
                                        readOnly: true,
                                      )),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Nominee Details',
                                      style: Constants.customStyle(
                                          16.0, Colors.black, FontWeight.bold),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 65,
                                        child: TextFormField(
                                          textCapitalization:
                                              TextCapitalization.characters,
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          style: Constants.customStyle(16.0,
                                              subheader, FontWeight.normal),
                                          validator: (value) {
                                            if (value == null ||
                                                value.isEmpty) {
                                              return 'Nominee name is required';
                                            }
                                            return null;
                                          },
                                          keyboardType: TextInputType.name,
                                          textInputAction: TextInputAction.next,
                                          controller: kycController
                                              .nomineeFnameController,
                                          inputFormatters: [
                                            FilteringTextInputFormatter.allow(
                                                RegExp("[ a-zA-Z]")),
                                          ],
                                          decoration: InputDecoration(
                                            helperText: '',
                                            focusedErrorBorder:
                                                const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.red)),
                                            errorBorder:
                                                const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.red)),
                                            contentPadding:
                                                const EdgeInsets.only(left: 15),
                                            hintText: 'Nominee name',
                                            hintStyle: Constants.customStyle(
                                                16.0,
                                                subheader,
                                                FontWeight.normal),
                                            enabledBorder:
                                                const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black54)),
                                            focusedBorder:
                                                const OutlineInputBorder(
                                                    borderSide: BorderSide(
                                                        color: Colors.black54)),
                                          ),
                                        ),
                                      ),
                                      const SizedBox(
                                        height: 20,
                                      ),
                                      GetBuilder<KycFormController>(
                                          builder: (logic) {
                                        return Container(
                                          height: 45,
                                          width: size.width,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              border: Border.all(
                                                  color: relationItem == true
                                                      ? Colors.red
                                                      : Colors.black54)),
                                          child: DropdownButtonHideUnderline(
                                            child: DropdownButton(
                                                menuMaxHeight:
                                                    size.height * 0.5,
                                                underline: Container(
                                                    color: Colors.transparent),
                                                hint: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 10.0),
                                                  child: Text(
                                                    logic.nomineeRelationValue
                                                        .toString(),
                                                    style:
                                                        Constants.customStyle(
                                                            16.0,
                                                            subheader,
                                                            FontWeight.normal),
                                                  ),
                                                ),
                                                isDense: true,
                                                isExpanded: true,
                                                icon: const Icon(
                                                    Icons.arrow_drop_down),
                                                items: logic.relation
                                                    .map(
                                                        (e) => DropdownMenuItem(
                                                              value:
                                                                  e.toString(),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            5),
                                                                child: Text(
                                                                  e.toString(),
                                                                  style: Constants.customStyle(
                                                                      16.0,
                                                                      subheader,
                                                                      FontWeight
                                                                          .normal),
                                                                ),
                                                              ),
                                                            ))
                                                    .toList(),
                                                onChanged: (value) {
                                                  setState(() {
                                                    relationItem = false;
                                                    logic
                                                        .nomineeRelationController
                                                        .text = value.toString();
                                                    logic.nomineeRelationValue =
                                                        value.toString();
                                                  });
                                                }),
                                          ),
                                        );
                                      }),
                                      relationItem == true
                                          ? const Padding(
                                              padding: EdgeInsets.only(
                                                  left: 15, top: 5),
                                              child: Text(
                                                'Relation with nominee is required',
                                                style: TextStyle(
                                                    color: Color(0xffCA2A32),
                                                    fontSize: 12),
                                              ),
                                            )
                                          : const SizedBox(),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(bottom: 15),
                                    child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            print(
                                                "State:::${logic.theChangedValue.value}");
                                            print(
                                                "Nominee::::${logic.nomineeRelationValue.value}");
                                            // logic.theChangedValue.value ==
                                            //         "State"
                                            //     ? stateItem = true
                                            //     : stateItem = false;
                                            // logic.nomineeRelationValue.value ==
                                            //         "Relation with nominee"
                                            //     ? relationItem = true
                                            //     : relationItem = false;
                                            print(relationItem);
                                            if (_formKey2.currentState!
                                                    .validate() &&
                                                relationItem == false) {
                                              kycController
                                                  .personalDetailswithNomineeInvest();
                                              relationItem = false;
                                            } else {
                                              relationItem = true;
                                            }
                                          });
                                        },
                                        child: Constants.getCommonButton(
                                            size.width, 45, 'Continue')),
                                  ),
                                ],
                              ),
                            );
                          })
                        : Form(
                            key: _formKey,
                            child: GetX<KycFormController>(
                              builder: (logic) {
                                return Column(
                                  children: [
                                    SizedBox(
                                      height: 65,
                                      child: TextFormField(
                                        readOnly: true,
                                        style: Constants.customStyle(
                                            16.0, subheader, FontWeight.normal),
                                        decoration: InputDecoration(
                                          fillColor: const Color(0xffCCCCCC),
                                          filled: true,
                                          helperText: '',
                                          contentPadding:
                                              const EdgeInsets.only(left: 15),
                                          hintText: privilegecardController
                                                  .personalDetailsModel
                                                  ?.data!
                                                  .data!
                                                  .personalDetails
                                                  ?.fullname
                                                  .toString()
                                                  .toUpperCase() ??
                                              'Full name',
                                          hintStyle: Constants.customStyle(
                                              16.0,
                                              const Color(0xff888888),
                                              FontWeight.normal),
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              borderSide: const BorderSide(
                                                  color: Color(0xffBBBBBB))),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color:
                                                          Color(0xffBBBBBB))),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    // SizedBox(
                                    //   height: 65,
                                    //   child: TextFormField(
                                    //     readOnly: true,
                                    //     style: Constants.customStyle(
                                    //         16.0, subheader, FontWeight.normal),
                                    //     keyboardType: TextInputType.emailAddress,
                                    //     textInputAction: TextInputAction.next,
                                    //     controller: kycController.emailController,
                                    //     decoration: InputDecoration(
                                    //       helperText: '',
                                    //       focusedErrorBorder:
                                    //           const OutlineInputBorder(
                                    //               borderSide: BorderSide(
                                    //                   color: Colors.red)),
                                    //       errorBorder: const OutlineInputBorder(
                                    //           borderSide:
                                    //               BorderSide(color: Colors.red)),
                                    //       contentPadding:
                                    //           const EdgeInsets.only(left: 15),
                                    //       hintText: privilegecardController
                                    //               .personalDetailsModel
                                    //               ?.data!
                                    //               .data!
                                    //               .personalDetails
                                    //               ?.email ??
                                    //           'Email',
                                    //       hintStyle: Constants.customStyle(
                                    //           16.0, subheader, FontWeight.normal),
                                    //       enabledBorder: const OutlineInputBorder(
                                    //           borderSide: BorderSide(
                                    //               color: Colors.black54)),
                                    //       focusedBorder: const OutlineInputBorder(
                                    //           borderSide: BorderSide(
                                    //               color: Colors.black54)),
                                    //     ),
                                    //   ),
                                    // ),
                                    // const SizedBox(
                                    //   height: 20,

                                    SizedBox(
                                      height: 65,
                                      child: TextFormField(
                                        textCapitalization:
                                            TextCapitalization.characters,
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        style: Constants.customStyle(
                                            16.0, subheader, FontWeight.normal),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Father\'s name is required';
                                          }
                                          return null;
                                        },
                                        keyboardType: TextInputType.name,
                                        textInputAction: TextInputAction.next,
                                        controller:
                                            kycController.fatherNameController,
                                        inputFormatters: [
                                          FilteringTextInputFormatter.allow(
                                              RegExp("[ a-zA-Z]")),
                                        ],
                                        decoration: InputDecoration(
                                          helperText: '',
                                          focusedErrorBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.red)),
                                          errorBorder: const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.red)),
                                          contentPadding:
                                              const EdgeInsets.only(left: 15),
                                          hintText: 'Father\'s name',
                                          hintStyle: Constants.customStyle(16.0,
                                              subheader, FontWeight.normal),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black54)),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black54)),
                                        ),
                                      ),
                                    ),

                                    const SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      height: 65,
                                      child: TextFormField(
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        style: Constants.customStyle(
                                            16.0, subheader, FontWeight.normal),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Address field is required';
                                          }
                                          return null;
                                        },
                                        keyboardType: TextInputType.name,
                                        textInputAction: TextInputAction.next,
                                        controller:
                                            kycController.addressController,
                                        decoration: InputDecoration(
                                          helperText: '',
                                          focusedErrorBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.red)),
                                          errorBorder: const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.red)),
                                          contentPadding:
                                              const EdgeInsets.only(left: 15),
                                          hintText: 'Address',
                                          hintStyle: Constants.customStyle(16.0,
                                              subheader, FontWeight.normal),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black54)),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black54)),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    SizedBox(
                                      height: 65,
                                      child: TextFormField(
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        style: Constants.customStyle(
                                            16.0, subheader, FontWeight.normal),
                                        validator: (value) {
                                          if (value == null || value.isEmpty) {
                                            return 'Pin number is required';
                                          }
                                          return null;
                                        },
                                        inputFormatters: [
                                          LengthLimitingTextInputFormatter(6),
                                          FilteringTextInputFormatter.allow(
                                              RegExp("[0-9]"))
                                        ],
                                        maxLength: 6,
                                        keyboardType: TextInputType.number,
                                        textInputAction: TextInputAction.next,
                                        controller: kycController.pinControler,
                                        decoration: InputDecoration(
                                          helperText: '',
                                          focusedErrorBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.red)),
                                          errorBorder: const OutlineInputBorder(
                                              borderSide: BorderSide(
                                                  color: Colors.red)),
                                          counterStyle: const TextStyle(
                                            height: double.minPositive,
                                          ),
                                          counterText: "",
                                          contentPadding:
                                              const EdgeInsets.only(left: 15),
                                          hintText: 'Pin number',
                                          hintStyle: Constants.customStyle(16.0,
                                              subheader, FontWeight.normal),
                                          enabledBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black54)),
                                          focusedBorder:
                                              const OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.black54)),
                                        ),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 25,
                                    ),
                                    SizedBox(
                                        height: 40,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Container(
                                              height: 45,
                                              width: size.width * 0.44,
                                              margin: const EdgeInsets.only(
                                                  right: 10),
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(5),
                                                  border: Border.all(
                                                      color: stateItem == true
                                                          ? Colors.red
                                                          : Colors.black54)),
                                              child:
                                                  DropdownButtonHideUnderline(
                                                child: DropdownButton(
                                                    menuMaxHeight:
                                                        size.height * 0.5,
                                                    underline: Container(
                                                        color:
                                                            Colors.transparent),
                                                    hint: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 10.0),
                                                      child: Text(
                                                        logic.theChangedValue
                                                            .value,
                                                        style: Constants
                                                            .customStyle(
                                                                16.0,
                                                                subheader,
                                                                FontWeight
                                                                    .normal),
                                                      ),
                                                    ),
                                                    isDense: true,
                                                    isExpanded: true,
                                                    icon: const Icon(
                                                        Icons.arrow_drop_down),
                                                    items: logic.states
                                                        .map((e) =>
                                                            DropdownMenuItem(
                                                              value:
                                                                  e.toString(),
                                                              child: Padding(
                                                                padding:
                                                                    const EdgeInsets
                                                                        .only(
                                                                        left:
                                                                            5),
                                                                child: Text(
                                                                  e.toString(),
                                                                  style: Constants.customStyle(
                                                                      16.0,
                                                                      subheader,
                                                                      FontWeight
                                                                          .normal),
                                                                ),
                                                              ),
                                                            ))
                                                        .toList(),
                                                    onChanged: (value) {
                                                      setState(() {
                                                        stateItem = false;
                                                        logic.stateController
                                                                .text =
                                                            value.toString();
                                                        logic.theChangedValue
                                                                .value =
                                                            value.toString();
                                                      });
                                                    }),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 45,
                                              width: size.width * 0.45,
                                              child: TextFormField(
                                                readOnly: true,
                                                decoration: InputDecoration(
                                                  contentPadding:
                                                      const EdgeInsets.only(
                                                          left: 15),
                                                  hintText: 'INDIA',
                                                  hintStyle:
                                                      Constants.customStyle(
                                                          16.0,
                                                          subheader,
                                                          FontWeight.normal),
                                                  enabledBorder:
                                                      const OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors
                                                                  .black54)),
                                                  focusedBorder:
                                                      const OutlineInputBorder(
                                                          borderSide: BorderSide(
                                                              color: Colors
                                                                  .black54)),
                                                ),
                                              ),
                                            ),
                                          ],
                                        )),
                                    stateItem == true
                                        ? const Padding(
                                            padding: EdgeInsets.only(
                                                left: 15, top: 5),
                                            child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Text(
                                                'State field is required',
                                                style: TextStyle(
                                                    color: Color(0xffCA2A32),
                                                    fontSize: 12),
                                              ),
                                            ),
                                          )
                                        : const SizedBox(),
                                    const SizedBox(
                                      height: 45,
                                    ),
                                    Container(
                                        width: size.width,
                                        height: 65,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          // border: Border.all(color: Colors.black54),
                                        ),
                                        child: InkWell(
                                            onTap: () async {
                                              DateTime? newDate =
                                                  await showDatePicker(
                                                      context: context,
                                                      initialDate:
                                                          DateTime(1960),
                                                      firstDate: DateTime(1960),
                                                      lastDate: DateTime(2010));
                                              if (newDate == null) return;
                                              setState(() {
                                                date = newDate;
                                              });
                                            },
                                            child: TextFormField(
                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              validator: (value) {
                                                if (value == null ||
                                                    value.isEmpty) {
                                                  return 'DOB is required';
                                                }
                                                return null;
                                              },
                                              controller:
                                                  kycController.dobController,
                                              style: Constants.customStyle(16.0,
                                                  subheader, FontWeight.normal),
                                              decoration: InputDecoration(
                                                contentPadding:
                                                    const EdgeInsets.only(
                                                        left: 15),
                                                hintText: 'DOB (DD/MM/YY)',
                                                hintStyle:
                                                    Constants.customStyle(
                                                        16.0,
                                                        subheader,
                                                        FontWeight.normal),
                                                helperText: '',
                                                focusedErrorBorder:
                                                    const OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors.red)),
                                                errorBorder:
                                                    const OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors.red)),
                                                enabledBorder:
                                                    const OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .black54)),
                                                focusedBorder:
                                                    const OutlineInputBorder(
                                                        borderSide: BorderSide(
                                                            color: Colors
                                                                .black54)),
                                              ),
                                              readOnly: true,
                                              onTap: () async {
                                                DateTime? newDate =
                                                    await showDatePicker(
                                                  context: context,
                                                  initialDate: DateTime(1960),
                                                  firstDate: DateTime(1960),
                                                  lastDate: DateTime(2010),
                                                  builder: (context, child) {
                                                    return Theme(
                                                      data: Theme.of(context)
                                                          .copyWith(
                                                        colorScheme:
                                                            const ColorScheme
                                                                .light(
                                                          primary:
                                                              primaryColor, // <-- SEE HERE
                                                          onPrimary: Colors
                                                              .white, // <-- SEE HERE
                                                          onSurface: Colors
                                                              .black, // <-- SEE HERE
                                                        ),
                                                        textButtonTheme:
                                                            TextButtonThemeData(
                                                          style: TextButton
                                                              .styleFrom(
                                                            foregroundColor:
                                                                primaryColor, // button text color
                                                          ),
                                                        ),
                                                      ),
                                                      child: child!,
                                                    );
                                                  },
                                                );

                                                setState(() {
                                                  date = newDate!;
                                                  print(
                                                      '${date.day}/${date.month}/${date.year}');
                                                  logic.dobController.text =
                                                      '${date.day}-${date.month}-${date.year}';
                                                  logic.dobCtrl.text =
                                                      '${date.year}-${date.month}-${date.day}';
                                                });
                                              },
                                            ))),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    Align(
                                      alignment: Alignment.centerLeft,
                                      child: Text(
                                        'Nominee Details',
                                        style: Constants.customStyle(16.0,
                                            Colors.black, FontWeight.bold),
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 20,
                                    ),
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: 65,
                                          child: TextFormField(
                                            textCapitalization:
                                                TextCapitalization.characters,
                                            autovalidateMode: AutovalidateMode
                                                .onUserInteraction,
                                            style: Constants.customStyle(16.0,
                                                subheader, FontWeight.normal),
                                            validator: (value) {
                                              if (value == null ||
                                                  value.isEmpty) {
                                                return 'Nominee name is required';
                                              }
                                              return null;
                                            },
                                            keyboardType: TextInputType.name,
                                            textInputAction:
                                                TextInputAction.next,
                                            controller: kycController
                                                .nomineeFnameController,
                                            inputFormatters: [
                                              FilteringTextInputFormatter.allow(
                                                  RegExp("[ a-zA-Z]")),
                                            ],
                                            decoration: InputDecoration(
                                              helperText: '',
                                              focusedErrorBorder:
                                                  const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.red)),
                                              errorBorder:
                                                  const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color: Colors.red)),
                                              contentPadding:
                                                  const EdgeInsets.only(
                                                      left: 15),
                                              hintText: 'Nominee name',
                                              hintStyle: Constants.customStyle(
                                                  16.0,
                                                  subheader,
                                                  FontWeight.normal),
                                              enabledBorder:
                                                  const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              Colors.black54)),
                                              focusedBorder:
                                                  const OutlineInputBorder(
                                                      borderSide: BorderSide(
                                                          color:
                                                              Colors.black54)),
                                            ),
                                          ),
                                        ),
                                        const SizedBox(
                                          height: 20,
                                        ),
                                        GetBuilder<KycFormController>(
                                            builder: (logic) {
                                          return Container(
                                            height: 45,
                                            width: size.width,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(5),
                                                border: Border.all(
                                                    color: relationItem == true
                                                        ? Colors.red
                                                        : Colors.black54)),
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton(
                                                  menuMaxHeight:
                                                      size.height * 0.5,
                                                  underline: Container(
                                                      color:
                                                          Colors.transparent),
                                                  hint: Padding(
                                                    padding:
                                                        const EdgeInsets.only(
                                                            left: 10.0),
                                                    child: Text(
                                                      logic
                                                          .nomineeRelationValue,
                                                      style:
                                                          Constants.customStyle(
                                                              16.0,
                                                              subheader,
                                                              FontWeight
                                                                  .normal),
                                                    ),
                                                  ),
                                                  isDense: true,
                                                  isExpanded: true,
                                                  icon: const Icon(
                                                      Icons.arrow_drop_down),
                                                  items: logic.relation
                                                      .map((e) =>
                                                          DropdownMenuItem(
                                                            value: e.toString(),
                                                            child: Padding(
                                                              padding:
                                                                  const EdgeInsets
                                                                      .only(
                                                                      left: 5),
                                                              child: Text(
                                                                e.toString(),
                                                                style: Constants
                                                                    .customStyle(
                                                                        16.0,
                                                                        subheader,
                                                                        FontWeight
                                                                            .normal),
                                                              ),
                                                            ),
                                                          ))
                                                      .toList(),
                                                  onChanged: (value) {
                                                    setState(() {
                                                      relationItem = false;
                                                      logic.nomineeRelationController
                                                              .text =
                                                          value.toString();
                                                      logic.nomineeRelationValue =
                                                          value.toString();
                                                    });
                                                  }),
                                            ),
                                          );
                                        }),
                                        relationItem == true
                                            ? const Padding(
                                                padding: EdgeInsets.only(
                                                    left: 15, top: 5),
                                                child: Text(
                                                  'Relation with nominee is required',
                                                  style: TextStyle(
                                                      color: Color(0xffCA2A32),
                                                      fontSize: 12),
                                                ),
                                              )
                                            : const SizedBox(),
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 40,
                                    ),
                                    Padding(
                                      padding:
                                          const EdgeInsets.only(bottom: 15),
                                      child: InkWell(
                                          onTap: () {
                                            setState(() {
                                              print(
                                                  "State:::${logic.theChangedValue.value}");
                                              print(
                                                  "Nominee::::${logic.nomineeRelationValue}");
                                              logic.theChangedValue.value ==
                                                      "State"
                                                  ? stateItem = true
                                                  : stateItem = false;
                                              logic.nomineeRelationValue ==
                                                      "Relation with nominee"
                                                  ? relationItem = true
                                                  : relationItem = false;
                                              if (_formKey.currentState!
                                                      .validate() &&
                                                  stateItem == false &&
                                                  relationItem == false) {
                                                kycController
                                                    .personalDetailswithNomineeInvest();
                                                stateItem = false;
                                                relationItem = false;
                                              } else {
                                                stateItem == false
                                                    ? stateItem = false
                                                    : true;
                                                relationItem == false
                                                    ? relationItem = false
                                                    : true;
                                              }
                                            });
                                          },
                                          child: Constants.getCommonButton(
                                              size.width, 45, 'Continue')),
                                    ),
                                  ],
                                );
                              },
                            ),
                          ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
