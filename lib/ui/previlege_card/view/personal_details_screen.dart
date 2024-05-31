import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../Utils/colors_list.dart';
import '../../../constants/constant.dart';
import '../bind/privilege_card_binding.dart';

class DetailsScreen extends StatefulWidget {
  const DetailsScreen({super.key});

  @override
  State<DetailsScreen> createState() => DetailsScreenState();
}

class DetailsScreenState extends State<DetailsScreen> {
  late String countryValue;
  late String stateValue;
  late String cityValue;
  DateTime date = DateTime(2022, 12, 34);
  final _formKey = GlobalKey<FormState>();

  String? selectedSalutation;
  String? name;
  bool stateItem = false;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<PrivilegeCardController>(builder: (logic) {
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
              child: Form(
                key: _formKey,
                child: Column(
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
                          contentPadding: const EdgeInsets.only(left: 15),
                          hintText: logic.personalDetailsModel?.data!.data!
                                  .personalDetails?.fullname
                                  .toString()
                                  .toUpperCase() ??
                              "Full Name",
                          hintStyle: Constants.customStyle(
                              16.0, const Color(0xff888888), FontWeight.normal),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  const BorderSide(color: Color(0xffBBBBBB))),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffBBBBBB))),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    // SizedBox(
                    //   height: 65,
                    //   child: TextFormField(
                    //     readOnly: true,
                    //     style: Constants.customStyle(
                    //         16.0, subheader, FontWeight.normal),
                    //     keyboardType: TextInputType.emailAddress,
                    //     textInputAction: TextInputAction.next,
                    //     autovalidateMode: AutovalidateMode.onUserInteraction,
                    //     decoration: InputDecoration(
                    //       helperText: '',
                    //       contentPadding: const EdgeInsets.only(left: 15),
                    //       hintText: logic.personalDetailsModel?.data!.data!
                    //               .personalDetails?.email ??
                    //           "Email",
                    //       hintStyle: Constants.customStyle(
                    //           16.0, subheader, FontWeight.normal),
                    //       enabledBorder: const OutlineInputBorder(
                    //           borderSide: BorderSide(color: Colors.black54)),
                    //       focusedBorder: const OutlineInputBorder(
                    //           borderSide: BorderSide(color: Colors.black54)),
                    //     ),
                    //   ),
                    // ),
                    // const SizedBox(
                    //   height: 25,
                    // ),
                    SizedBox(
                      height: 65,
                      child: TextFormField(
                        readOnly: true,
                        style: Constants.customStyle(
                            16.0, subheader, FontWeight.normal),
                        decoration: InputDecoration(
                          fillColor: const Color((0xffCCCCCC)),
                          filled: true,
                          helperText: '',
                          contentPadding: const EdgeInsets.only(left: 15),
                          hintText: logic.personalDetailsModel?.data!.data!
                                  .personalDetails?.phone ??
                              'Phone number',
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(top: 12, left: 15),
                            child: Text(
                              '+91 | ',
                              style: Constants.customStyle(
                                  16.0, const Color(0xff888888), FontWeight.normal),
                            ),
                          ),
                          hintStyle: Constants.customStyle(
                              16.0, const Color(0xff888888), FontWeight.normal),
                          enabledBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  const BorderSide(color: Color(0xffBBBBBB))),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Color(0xffBBBBBB))),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      height: 65,
                      child: TextFormField(
                        textCapitalization: TextCapitalization.characters,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                        controller: logic.fatherNameController,
                        inputFormatters: [
                          FilteringTextInputFormatter.allow(
                              RegExp("[ a-zA-Z]")),
                        ],
                        decoration: InputDecoration(
                          helperText: '',
                          focusedErrorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          contentPadding: const EdgeInsets.only(left: 15),
                          hintText: logic.personalDetailsModel?.data!.data!
                                  .personalDetails?.fatherName ??
                              'Father\'s name',
                          hintStyle: Constants.customStyle(
                              16.0, subheader, FontWeight.normal),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54)),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                        width: size.width,
                        height: 65,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          // border: Border.all(color: Colors.black54),
                        ),
                        child: InkWell(
                            onTap: () async {
                              DateTime? newDate = await showDatePicker(
                                context: context,
                                initialDate: DateTime(1960),
                                firstDate: DateTime(1960),
                                lastDate: DateTime(2010),
                              );
                              if (newDate == null) return;
                              setState(() {
                                date = newDate;
                              });
                            },
                            child: SizedBox(
                              height: 65,
                              child: TextFormField(
                                autovalidateMode:
                                    AutovalidateMode.onUserInteraction,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'DOB is required';
                                  }
                                  return null;
                                },
                                controller: logic.dobController,
                                style: Constants.customStyle(
                                    16.0, Colors.black54, FontWeight.normal),
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(left: 15),
                                  hintText: 'DOB (DD/MM/YY)',
                                  hintStyle: Constants.customStyle(
                                      16.0, subheader, FontWeight.normal),
                                  helperText: '',
                                  focusedErrorBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.red)),
                                  errorBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.red)),
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black54)),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black54)),
                                  // border: InputBorder.none,
                                ),
                                readOnly: true,
                                onTap: () async {
                                  DateTime? newDate = await showDatePicker(
                                    context: context,
                                    initialDate: DateTime(1920),
                                    firstDate: DateTime(1920),
                                    lastDate: DateTime(2010),
                                    builder: (context, child) {
                                      return Theme(
                                        data: Theme.of(context).copyWith(
                                          colorScheme: const ColorScheme.light(
                                            primary:
                                                primaryColor, // <-- SEE HERE
                                            onPrimary:
                                                Colors.white, // <-- SEE HERE
                                            onSurface:
                                                Colors.black, // <-- SEE HERE
                                          ),
                                          textButtonTheme: TextButtonThemeData(
                                            style: TextButton.styleFrom(
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
                                    logic.dobController.text =
                                        '${date.day}-${date.month}-${date.year}';
                                    logic.dobCtrl.text =
                                        '${date.year}-${date.month}-${date.day}';
                                  });
                                },
                              ),
                            ))),
                    const SizedBox(
                      height: 30,
                    ),
                    SizedBox(
                      height: 65,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
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
                        controller: logic.addressController,
                        decoration: InputDecoration(
                          helperText: '',
                          focusedErrorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          contentPadding: const EdgeInsets.only(left: 15),
                          hintText: 'Address',
                          hintStyle: Constants.customStyle(
                              16.0, subheader, FontWeight.normal),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54)),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                      height: 65,
                      child: TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        style: Constants.customStyle(
                            16.0, subheader, FontWeight.normal),
                        validator: (value) {
                          String pattern = r'^[1-9][0-9]{5}$';
                          RegExp regExp = RegExp(pattern);
                          if (value!.isEmpty) {
                            return 'Pin number is required';
                          } else if (!regExp.hasMatch(value)) {
                            return 'Please enter a valid Pin number';
                          }
                          return null;
                        },
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(6),
                          FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                        ],
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
                        controller: logic.pinControler,
                        decoration: InputDecoration(
                          helperText: '',
                          focusedErrorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          errorBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.red)),
                          contentPadding: const EdgeInsets.only(left: 15),
                          hintText: 'Pin number',
                          hintStyle: Constants.customStyle(
                              16.0, subheader, FontWeight.normal),
                          enabledBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54)),
                          focusedBorder: const OutlineInputBorder(
                              borderSide: BorderSide(color: Colors.black54)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    SizedBox(
                        height: 40,
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: 45,
                              width: size.width * 0.5,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(
                                      color: stateItem == true
                                          ? Colors.red
                                          : Colors.black54)),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton(
                                    menuMaxHeight: size.height * 0.5,
                                    underline:
                                        Container(color: Colors.transparent),
                                    hint: Padding(
                                      padding:
                                          const EdgeInsets.only(left: 10.0),
                                      child: Text(
                                        logic.theChangedValue.value,
                                        style: Constants.customStyle(
                                            16.0, subheader, FontWeight.normal),
                                      ),
                                    ),
                                    isDense: true,
                                    isExpanded: true,
                                    icon: const Icon(Icons.arrow_drop_down),
                                    items: logic.states
                                        .map((e) => DropdownMenuItem(
                                              value: e.toString(),
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    left: 5),
                                                child: Text(
                                                  e.toString(),
                                                  style: Constants.customStyle(
                                                      16.0,
                                                      subheader,
                                                      FontWeight.normal),
                                                ),
                                              ),
                                            ))
                                        .toList(),
                                    onChanged: (value) {
                                      setState(() {
                                        stateItem = false;
                                        logic.stateController.text =
                                            value.toString();
                                        logic.theChangedValue.value =
                                            value.toString();
                                      });
                                    }),
                              ),
                            ),
                            SizedBox(
                              height: 45,
                              width: size.width * 0.4,
                              child: TextFormField(
                                style: Constants.customStyle(
                                    16.0, subheader, FontWeight.normal),
                                controller: logic.countryController,
                                readOnly: true,
                                decoration: InputDecoration(
                                  contentPadding:
                                      const EdgeInsets.only(left: 15),
                                  hintText: 'India',
                                  hintStyle: Constants.customStyle(
                                      16.0, subheader, FontWeight.normal),
                                  enabledBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black54)),
                                  focusedBorder: const OutlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.black54)),
                                ),
                              ),
                            ),
                          ],
                        )),
                    stateItem == true
                        ? const Padding(
                            padding: EdgeInsets.only(left: 15, top: 5),
                            child: Text(
                              'State field is required',
                              style: TextStyle(
                                  color: Color(0xffCA2A32), fontSize: 12),
                            ),
                          )
                        : const SizedBox(),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 15, top: 45),
                      child: InkWell(
                          onTap: () {
                            setState(() {
                              logic.theChangedValue.value == "State"
                                  ? stateItem = true
                                  : stateItem = false;
                              if (_formKey.currentState!.validate() &&
                                  stateItem == false) {
                                logic.privilegeCardDetails();
                                stateItem = false;
                              } else {
                                stateItem = true;
                              }
                            });
                          },
                          child: Constants.getCommonButton(
                              size.width, 45, 'Continue')),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
