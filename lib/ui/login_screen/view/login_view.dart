import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:rill_repository/Utils/app_routes.dart';
import 'package:rill_repository/Utils/colors_list.dart';
import 'package:rill_repository/constants/constant.dart';
import 'package:rill_repository/ui/login_screen/bind/login_bind.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  var loginController = Get.put(LoginController());
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: bgcolor,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
                height: size.height * 0.3,
                child: Image.asset("assets/images/logo.png")),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15),
              child: SizedBox(
                height: size.height * 0.25,
                child: Form(
                  key: _formKey,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome Back!',
                        style: Constants.customStyle(
                            28.0, Colors.black, FontWeight.w600),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Hello, Welcome back to your account',
                        style: Constants.customStyle(
                            16.0, subheader, FontWeight.normal),
                        textAlign: TextAlign.start,
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      SizedBox(
                        height: 65,
                        child: TextFormField(
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10),
                            FilteringTextInputFormatter.allow(RegExp("[0-9]"))
                          ],
                          controller:
                              loginController.mobileTextEditingController,
                          keyboardType: TextInputType.phone,
                          autovalidateMode: AutovalidateMode.onUserInteraction,
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
                              padding: const EdgeInsets.only(top: 12, left: 15),
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
                                borderSide: BorderSide(color: Colors.black54)),
                            focusedBorder: const OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.black54)),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 35,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            InkWell(
                onTap: () {
                  if (_formKey.currentState!.validate()) {
                    loginController.sendOtp();
                  }
                },
                child:
                    Padding(
                      padding: const EdgeInsets.only(left: 15,right: 15),
                      child: Constants.getCommonButton(size.width, 45, 'Request OTP'),
                    )),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Don't have an account?",
                    style: Constants.customStyle(
                        16.0, Colors.black, FontWeight.w500),
                  ),
                  InkWell(
                    onTap: () {
                      Get.toNamed(Routes.signup);
                    },
                    child: Text(
                      " Sign up",
                      style: Constants.customStyle(
                          16.0, const Color(0xff2D72F6), FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 80,
            ),
            SizedBox(
                width: size.width,
                height: size.height * 0.2,
                child: Image.asset("assets/images/verification.png")),
          ],
        ),
      ),
    );
  }
}
