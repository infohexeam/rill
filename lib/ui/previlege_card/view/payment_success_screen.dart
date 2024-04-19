import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:rill_repository/Utils/colors_list.dart';

import '../../../constants/constant.dart';

class PaymentSuccessScreen extends StatefulWidget {
  const PaymentSuccessScreen({super.key});

  @override
  State<PaymentSuccessScreen> createState() => _PaymentSuccessScreenState();
}

class _PaymentSuccessScreenState extends State<PaymentSuccessScreen> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: bgcolor,
      appBar:AppBar(backgroundColor: primaryColor, toolbarHeight: 130,
        centerTitle: false, shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(20),
                bottomRight: Radius.circular(20))),
        automaticallyImplyLeading: false,
        title:   Center(
          child: Image.asset(
            "assets/images/logo_white.png",
            height: 50,
            width: 250,
          ),
        ),
      )
      // Constants.commonAppBar(
      //     title: '', icon: const Icon(Icons.arrow_back, size: 0))
      ,
      body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 120),
          child: Card(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            elevation: 5,
            child: SizedBox(
              width: size.width,
              height: 200,

              // color: Colors.amber,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Ticket Raised',
                    style: Constants.customStyle(
                        28.0, primaryColor, FontWeight.bold),
                  ),
                  Text(
                    'Rill admin will contact you soon..',
                    style: Constants.customStyle(
                        14.0, subheader, FontWeight.normal),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Image.asset(
                    "assets/icons/check.png",
                    height: 65,
                    width: 65,
                  )
                ],
              ),
            ),
          ),
        ),

      ]),
      bottomNavigationBar: Container(
        // color: bgcolor,
        child:InkWell(
          onTap: () {
Get.back();
          },
          child: Container(
            decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(6)),
            margin: const EdgeInsets.only(left: 15, right: 15,top: 15,bottom: 15),
            width: size.width,
            height: 45,
            child: Center(
                child: Text(
                  'Done',
                  style: Constants.customStyle(
                      20.0, Colors.white, FontWeight.bold),
                )),
          ),
        ),
      ),
    );
  }
}
