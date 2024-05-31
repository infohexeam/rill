import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rill_repository/Utils/app_routes.dart';
import 'package:rill_repository/Utils/colors_list.dart';
import 'package:rill_repository/ui/investment/bind/investment_form_binding.dart';

import '../../../constants/constant.dart';
import '../../previlege_card/bind/privilege_card_binding.dart';

class ViewInvestmentScreen extends StatefulWidget {
  const ViewInvestmentScreen({super.key});

  @override
  State<ViewInvestmentScreen> createState() => _ViewInvestmentScreenState();
}

class _ViewInvestmentScreenState extends State<ViewInvestmentScreen> {
  var privilegecontroller = Get.put(PrivilegeCardController());

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GetBuilder<InvestmentFormController>(builder: (logic) {
      return Scaffold(backgroundColor: bgcolor,
        appBar: Constants.commonAppBar(
            title: 'My Investments',
            icon: const Icon(Icons.arrow_back, size: 30)),
        body: Padding(
          padding: const EdgeInsets.only(top: 60,right: 15,left: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [

              InkWell(
                onTap: () {
                  if (logic.investmentStatusModel?.data.rpc == true) {
                    Get.toNamed(Routes.clubdetailsRpc);
                  } else {
                    Get.toNamed(Routes.paymentmodeRpc,
                        arguments: ['Rill Partners Club']);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.only(top: 20),
                  height: 200,
                  width: size.width,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/investment.png'),fit: BoxFit.fill)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              logic.investmentStatusModel?.data.rpc == true
                                  ? '${privilegecontroller.personalDetailsModel?.data!.data!.personalDetails?.fullname.toString().toUpperCase()}'
                                  : '',
                              style: Constants.customStyle(
                                  20.0, Colors.black, FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'RILL PARTNERS CLUB',
                              style: Constants.customStyle(
                                  20.0, Colors.white, FontWeight.bold),
                            ),
                            Text(
                              'Limited Liability Partnership',
                              style: Constants.customStyle(
                                  16.0, Colors.white, FontWeight.normal),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                          width: 100,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 30,),
              InkWell(
                onTap: () {
                  if (logic.investmentStatusModel?.data.rfc == true) {
                    Get.toNamed(Routes.clubdetails);
                  } else {
                    Get.toNamed(Routes.paymentmodeRfc,
                        arguments: ['Rill Founders Club']);
                  }
                },
                child: Container(
                  padding: const EdgeInsets.only(top: 20),
                  height: 200,
                  width: size.width,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/investment.png'),fit: BoxFit.fill)),
                  child: Padding(
                    padding: const EdgeInsets.only(left: 20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              logic.investmentStatusModel?.data.rfc == true
                                  ? '${privilegecontroller.personalDetailsModel?.data!.data!.personalDetails?.fullname.toString().toUpperCase()}'
                                  : '',
                              style: Constants.customStyle(
                                  20.0, Colors.black, FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              'RILL FOUNDERS CLUB',
                              style: Constants.customStyle(
                                  20.0, Colors.white, FontWeight.bold),
                            ),
                            Text(
                              'Social Community Membership',
                              style: Constants.customStyle(
                                  16.0, Colors.white, FontWeight.normal),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 30,
                          width: 100,
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
