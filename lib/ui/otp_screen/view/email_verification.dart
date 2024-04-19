// import 'package:flutter/material.dart';
// import 'package:flutter/src/widgets/container.dart';
// import 'package:flutter/src/widgets/framework.dart';
// import 'package:get/get.dart';
// import 'package:rill_repository/Utils/app_routes.dart';

// import '../../../constants/constant.dart';
// import '../bind/otp_verification_controller.dart';

// class EmailVerificationScreen extends StatefulWidget {
//    EmailVerificationScreen({super.key});

//   @override
//   State<EmailVerificationScreen> createState() => _EmailVerificationScreenState();
// }

// class _EmailVerificationScreenState extends State<EmailVerificationScreen> {
//   var otpVerificationController = Get.put(OtpVerificationController());

//   @override
//   Widget build(BuildContext context) {
//     var size=MediaQuery.of(context).size;
//     return SafeArea(
//       child: Scaffold(
//         resizeToAvoidBottomInset: false,
//         backgroundColor: Colors.white,
//         body: Column(
//           mainAxisAlignment: MainAxisAlignment.start,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             SizedBox(
//                 height: size.height * 0.25,
//                 width: size.width,
//                 child: Image.asset("assets/images/logo.png")),
//             SizedBox(
//               height:size.height*0.5,
//               width: size.width,
//               child: Constants.otpVerificationContainer(40, 30,
//                   "Email verification", "Enter the OTP sent to ",'*******@gmail.com'),
//             ),
          
//               InkWell(
//                 onTap: (){
                 
//                   otpVerificationController.verifyEmailOtp();
//                 },
//                 child: SizedBox(
//                   height: size.height * 0.06,
//                   child: Constants.getCommonButton(size.width, 45, 'Verify & Proceed')),
//               )
//           ],
//         ),
//       ),
//     );
//   }
// }