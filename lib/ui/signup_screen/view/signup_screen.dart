import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:rill_repository/Utils/colors_list.dart';
import 'package:rill_repository/constants/constant.dart';
import 'package:url_launcher/url_launcher.dart';

import '../bind/signup_controller.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  var signupController = Get.put(SignupController());
  final _formKey = GlobalKey<FormState>();
  bool _checkbox = false;
  @override
  Widget build(BuildContext context) {
    Future<void> launchInBrowser(String url) async {
      if (!await launch(
        url,
        forceSafariVC: false,
        forceWebView: false,
        headers: <String, String>{'my_header_key': 'my_header_value'},
      )) {
        throw 'Could not launch $url';
      }
    }

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
        appBar: AppBar(
          elevation: 0,
          backgroundColor: bgcolor,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back,
              color: Color(0XFF133C8C),
            ),
          ),
        ),
        resizeToAvoidBottomInset: true,
        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: size.height * 0.25,
                  width: size.width,
                  child: Image.asset("assets/images/logo.png"),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, right: 15),
                  child: SizedBox(
                    height: size.height * 0.4,
                    width: size.width,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Text(
                          'Join Us',
                          style: Constants.customStyle(
                              28.0, Colors.black, FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          'Please add your details to register',
                          style: Constants.customStyle(
                              16.0, subheader, FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        SizedBox(
                          height: 65,
                          child: TextFormField(
                            textCapitalization: TextCapitalization.characters,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'Full name is required';
                              }
                              return null;
                            },
                            keyboardType: TextInputType.name,
                            textInputAction: TextInputAction.next,
                            controller:
                                signupController.nameTextEditingController,
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
                              hintText: 'Full name',
                              hintStyle: Constants.customStyle(
                                  16.0, subheader, FontWeight.w500),
                              focusedBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black54)),
                              enabledBorder: const OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.black54)),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        SizedBox(
                          height: 65,
                          child: TextFormField(
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(10),
                              FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                            ],
                            keyboardType: TextInputType.phone,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            validator: (value) {
                              String pattern = r'^[5-9]{1}[0-9]{9}$';
                              RegExp regExp = RegExp(pattern);
                              if (value!.isEmpty) {
                                return 'Mobile number is required';
                              } else if (!regExp.hasMatch(value)) {
                                return 'Please enter a valid Mobile number';
                              }
                              return null;
                            },
                            textInputAction: TextInputAction.done,
                            controller:
                                signupController.phoneTextEditingController,
                            decoration: InputDecoration(
                              helperText: '',
                              focusedErrorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)),
                              errorBorder: const OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.red)),
                              contentPadding: const EdgeInsets.only(left: 5),
                              prefixStyle: Constants.customStyle(
                                  16.0, subheader, FontWeight.normal),
                              prefixIcon: Padding(
                                padding:
                                    const EdgeInsets.only(top: 12, left: 15),
                                child: Text(
                                  '+91 | ',
                                  style: Constants.customStyle(
                                      16.0, subheader, FontWeight.normal),
                                ),
                              ),
                              hintText: ' Enter phone number',
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
                    ),
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        margin: const EdgeInsets.only(right: 15, left: 15),
                        width: 35,
                        height: 35,
                        child: Checkbox(
                          value: _checkbox,
                          activeColor: Colors.white,
                          checkColor: Colors.green,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(2.0),
                          ),
                          side: MaterialStateBorderSide.resolveWith(
                            (states) => const BorderSide(
                                width: 1.0, color: Colors.black54),
                          ),
                          onChanged: (value) {
                            setState(() {
                              _checkbox = !_checkbox;
                            });
                          },
                        ),
                      ),
                      const Text(
                        'I agree to the',
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 12),
                      ),
                      InkWell(
                          onTap: () {
                            launchInBrowser('https://rillhospital.d5n.in/terms-condition.html');
                          },
                          child: const Text(
                            ' Terms & Conditions.',
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontWeight: FontWeight.bold,
                              fontFamily: "poppins",
                              fontSize: 12,
                              decoration: TextDecoration.underline,
                            ),
                          )),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                _checkbox == true
                    ? InkWell(
                        onTap: () {
                          if (_formKey.currentState!.validate()) {
                            signupController.sendOtp();
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: SizedBox(
                              child: Constants.getCommonButton(
                                  size.width, 45, 'Request OTP')),
                        ))
                    : InkWell(
                        onTap: () async {
                          Fluttertoast.showToast(
                            msg:
                                "You must agree to our terms and conditions in order to proceed.",
                            toastLength: Toast.LENGTH_LONG,
                            gravity: ToastGravity.CENTER,
                            timeInSecForIosWeb: 35,
                            backgroundColor: Colors.blue,
                            textColor: Colors.white,
                            fontSize: 16.0,
                          );
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: SizedBox(
                              child: Constants.getCommonButton(
                                  size.width, 45, 'Request OTP')),
                        )),
                const SizedBox(
                  height: 50,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
