import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rill_repository/Utils/app_routes.dart';

import '../../../Utils/colors_list.dart';
import '../../../constants/constant.dart';

class OnlinePaymentScreen extends StatefulWidget {
  const OnlinePaymentScreen({super.key});

  @override
  State<OnlinePaymentScreen> createState() => _OnlinePaymentScreenState();
}

class _OnlinePaymentScreenState extends State<OnlinePaymentScreen> {
  String type = "male";
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: Constants.commonAppBar(
          title: 'Online Payment', icon: Icon(Icons.arrow_back, size: 30)),
      body:
          Column(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 75),
          child: Card(
            elevation: 5,
            child: SizedBox(
              width: size.width,
              height: 180,
              // color: Colors.amber,
              child: Column(
                children: [
                  RadioListTile(
                    title: Text(
                      "UPI",
                      style: Constants.customStyle(
                          16.0, blueheader, FontWeight.bold),
                    ),
                    value: "1",
                    groupValue: type,
                    onChanged: (value) {
                      setState(() {
                        type = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Net Banking",
                        style: Constants.customStyle(
                            16.0, blueheader, FontWeight.bold)),
                    value: "2",
                    groupValue: type,
                    onChanged: (value) {
                      setState(() {
                        type = value.toString();
                      });
                    },
                  ),
                  RadioListTile(
                    title: Text("Credit/ Debit/ ATM Card",
                        style: Constants.customStyle(
                            16.0, blueheader, FontWeight.bold)),
                    value: "3",
                    groupValue: type,
                    onChanged: (value) {
                      setState(() {
                        type = value.toString();
                      });
                    },
                  )
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(bottom: 75),
          child: InkWell(
              onTap: () {
                Get.toNamed(Routes.paymentsuccess);
              },
              child:
                  Constants.getCommonButton(size.width, 45, 'Proceed to pay')),
        ),
      ]),
    );
  }
}
