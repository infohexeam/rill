import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:local_auth/local_auth.dart';
import 'package:rill_repository/ui/authentication/auth_binding.dart';
import 'package:rill_repository/ui/splash_screen/view/splash_view.dart';

import '../../Utils/app_routes.dart';
import '../../Utils/colors_list.dart';
import '../../Utils/com_binding.dart';
import '../../Utils/session_keys.dart';
import '../../constants/constant.dart';

class Authentication extends StatefulWidget {
  const Authentication({super.key});

  @override
  State<Authentication> createState() => _AuthenticationState();
}

class _AuthenticationState extends State<Authentication> {
  String msg = "You are not authorized.";
  bool loading = false;
  final LocalAuthentication auth = LocalAuthentication();
  String? verificationCode;
  String? verificationOTP;
  final LocalAuthentication localAuthentication = LocalAuthentication();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    authenticate();
  }

  authenticate()async{
    try {
      bool pass = await auth.authenticate(
        options: const AuthenticationOptions(
            stickyAuth: true,
            useErrorDialogs: true,
            sensitiveTransaction: true,
            biometricOnly: false
        ), localizedReason: 'Authenticate with pattern/pin/passcode',
      );
      if(pass){
        msg = "You are Authenticated.";
        // setState(() {
        Get.offNamed(Routes.splash);
        // Navigator.pushAndRemoveUntil(context,
        //     MaterialPageRoute(builder: (BuildContext context) => const SplashView()),
        //         (Route<dynamic> route) => route is SplashView
        // );
        // Navigator.pushReplacement(context, PageTransition(type: PageTransitionType.fade, child: MyHome()));
        // });
      }
      else{
        print('fs');
        authenticate();
        // Navigator.pop(context);
      }

    } on PlatformException catch (e) {
      msg = "Error while opening fingerprint/face scanner";
    }

  }
  Future<void> checkBiometrics() async {
    bool canCheckBiometrics = await localAuthentication.canCheckBiometrics;
    print('Can check biometrics: $canCheckBiometrics');
  }

  Future<void> authenticateFunction() async {
    bool authenticated = false;
    try {
      authenticated = await localAuthentication.authenticate(
        localizedReason: 'Please authenticate to access sensitive data',
        options: const AuthenticationOptions(
            stickyAuth: true,
            useErrorDialogs: true,
            sensitiveTransaction: true,
            biometricOnly: false
        )
      );
    } catch (e) {
      print(e);
    }
    if(authenticated == true){
      Get.offAllNamed(Routes.splash);
    }
    else{
      print('rered');
    }
    print('Authenticated: $authenticated');
  }


  @override
  Widget build(BuildContext context) {
    var size=MediaQuery.of(context).size;
    print("#### Authentication Screen");
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: bgcolor,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: size.height * 0.3,
              child: Image.asset("assets/images/logo.png")),
          SizedBox(
              height: size.height * 0.4,
              child: Image.asset("assets/images/splash.png")),
          SizedBox(
            height: size.height * 0.3,
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                AppSession.to.session.read(SessionKeys.bearer_token) == null
                    ? InkWell(
                    onTap: () {
                      Get.toNamed(Routes.onboarding);
                    },
                    child: Container(
                      decoration: BoxDecoration(
                          color: bgcolor,
                          borderRadius: BorderRadius.circular(6)),
                      margin: const EdgeInsets.only(left: 15, right: 15),
                      width: size.width,
                      height: 45,
                      child: Center(
                          child: Text(
                            'GET STARTED',
                            style: Constants.customStyle(
                                20.0, bgcolor, FontWeight.bold),
                          )),
                    ))
                    : Container(
                  decoration: BoxDecoration(
                      color: bgcolor,
                      borderRadius: BorderRadius.circular(6)),
                  margin: const EdgeInsets.only(left: 15, right: 15),
                  width: size.width,
                  height: 45,
                  child: Center(
                      child: Text(
                        '',
                        style: Constants.customStyle(
                            20.0, Colors.white, FontWeight.bold),
                      )),
                ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Othukkungal, Malappuram Dt, 676528\nrillhospitalothukkungal@gmail.com\nRillhospital.com',
                  textAlign: TextAlign.center,
                ),
                // Text(
                //   'BODY: ${_notificationInfo?.body??''}',
                //   style: const TextStyle(
                //     fontWeight: FontWeight.bold,
                //     fontSize: 16.0,
                //   ),
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

// Widget appPin() {
  //   return Container(
  //       // color: const Color(0xff151515),
  //     color: Colors.white,
  //       margin: const EdgeInsets.only(left: 20,right: 20),
  //       // color: Colors.white,
  //       width: MediaQuery.of(context).size.width,
  //       height: MediaQuery.of(context).size.height*0.2,
  //       child:Center(
  //         child: SingleChildScrollView(
  //           child: Column(
  //             mainAxisAlignment: MainAxisAlignment.center,
  //             crossAxisAlignment: CrossAxisAlignment.center,
  //             children: [
  //               const SizedBox(height: 20,),
  //               InkWell(
  //                 onTap: (){
  //                   print("Fingerprint tapped");
  //                   authenticateFunction();
  //
  //                 },
  //                 child: Row(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   crossAxisAlignment: CrossAxisAlignment.center,
  //                   children: [
  //                     Image.asset("assets/images/scan.png",width: 45,height: 45,color: Colors.black,),
  //                     const Padding(
  //                       padding: EdgeInsets.only(left: 10),
  //                       child: Text("Unlock with Fingerprints",
  //                           style:TextStyle(color: Colors.black,fontFamily: "poppins",fontSize: 15,fontWeight: FontWeight.normal,decoration: TextDecoration.underline)),
  //                     ),
  //                   ],
  //                 ),
  //               ),
  //
  //             ],
  //           ),
  //         ),
  //       )
  //       );
  // }