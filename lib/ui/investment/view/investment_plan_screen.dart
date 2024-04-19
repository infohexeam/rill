import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:rill_repository/Utils/colors_list.dart';
import 'package:rill_repository/ui/investment/bind/investment_form_binding.dart';

import '../../../Utils/app_routes.dart';
import '../../../constants/constant.dart';

class InvestmentPlanScreen extends StatefulWidget {
  const InvestmentPlanScreen({super.key});

  @override
  State<InvestmentPlanScreen> createState() => _InvestmentPlanScreenState();
}

class _InvestmentPlanScreenState extends State<InvestmentPlanScreen> {
  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }
  bool partnerclub = false;
  bool founderclub = false;
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<InvestmentFormController>(builder: (logic) {
      return Scaffold(
        appBar: Constants.investmentAppBar(
            title: 'Investment Plan',
            icon: const Icon(Icons.arrow_back, size: 30)),
        body: SingleChildScrollView(
          physics:  BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.only(top: 60,right: 15,left: 15),
            child: Container(
              height: size.height,
              width: size.width,
              // color: Colors.white,
              child: Column(
                children: [
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      setState(() {
                        if (partnerclub == false && founderclub == false) {
                          partnerclub = true;
                        }
                        else if(founderclub==true){
                          partnerclub=true;
                          founderclub=false;
                        }
                        else {
                          partnerclub = false;
                        }
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.only(left: 1, top: 35),
                      height: 200,
                      width: size.width,
                      decoration: const BoxDecoration(

                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/investment.png'),fit: BoxFit.fill)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
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
                  partnerclub == true
                      ? SizedBox(
                          height: size.height * .31,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset('assets/icons/star.png'),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      SizedBox(
                                        width: 300,
                                        child: Text(
                                          'Contribution amount - multiples of Rs 10000',
                                          style: Constants.customStyle(14.0,
                                              blueheader, FontWeight.w500),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text('Benefits',
                                      style: Constants.customStyle(
                                          14.0, blueheader, FontWeight.bold)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset('assets/icons/star.png'),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      SizedBox(
                                        width: 300,
                                        child: Text(
                                            'Treatment benefits worth the contribution amount',
                                            style: Constants.customStyle(14.0,
                                                blueheader, FontWeight.w500)),
                                      )
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset('assets/icons/star.png'),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      Text('Insurance coverage',
                                          style: Constants.customStyle(14.0,
                                              blueheader, FontWeight.w500))
                                    ],
                                  ),
                                ),

                              ],
                            ),
                          ),
                        )
                      : const Center(),
                  SizedBox(height: 30,),
                  InkWell(
                    onTap: () {
                      setState(() {
                        setState(() {
                          if (founderclub == false && partnerclub == false) {
                            founderclub = true;
                          }
                          else if(partnerclub==true){
                            founderclub=true;
                            partnerclub=false;
                          }
                          else {
                            founderclub = false;
                          }
                        });
                      });
                    },
                    child: Container(
                      padding: const EdgeInsets.only(left: 1, top: 35),
                      height: 200,
                      width: size.width,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image:
                                  AssetImage('assets/images/investment.png'),fit: BoxFit.fill)),
                      child: Padding(
                        padding: const EdgeInsets.only(left: 10),
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
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10)),
                              height: 30,
                              width: 100,
                              child: Center(
                                  child: Text(
                                '',
                                style: Constants.customStyle(
                                    16.0, primaryColor, FontWeight.bold),
                              )),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  founderclub == true
                      ? SizedBox(
                          height: size.height * .31,
                          child: Card(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            elevation: 5,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Image.asset('assets/icons/star.png'),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                        'Membership fee Rs 12500',
                                        style: Constants.customStyle(
                                            14.0, blueheader, FontWeight.w500),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Text('Benefits',
                                      style: Constants.customStyle(
                                          14.0, blueheader, FontWeight.bold)),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Row(
                                    children: [
                                      Image.asset('assets/icons/star.png'),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                          'Treatment benefits worth Rs 10,000 ',
                                          style: Constants.customStyle(14.0,
                                              blueheader, FontWeight.w500))
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Row(
                                    children: [
                                      Image.asset('assets/icons/star.png'),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      Text(
                                          'Insurance coverage worth Rs 100,000',
                                          style: Constants.customStyle(14.0,
                                              blueheader, FontWeight.w500))
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 10),
                                  child: Row(
                                    children: [
                                      Image.asset('assets/icons/star.png'),
                                      const SizedBox(
                                        width: 6,
                                      ),
                                      Text('1 Privilege card',
                                          style: Constants.customStyle(14.0,
                                              blueheader, FontWeight.w500))
                                    ],
                                  ),
                                ),


                              ],
                            ),
                          ),
                        )
                      : const Center(),
                  const SizedBox(
                    height: 30,
                  ),
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: Container(
          // color: bgcolor,
         child:InkWell(
           onTap: () {
             if (logic.investmentStatusModel?.data.rfc == true) {
               Get.toNamed(Routes.viewinvestment);
             } else {
               partnerclub == true
                   ? Get.toNamed(
                 Routes.paymentmodeRpc,
               )
                   : Get.toNamed(Routes.paymentmodeRfc);
             }
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
                   'Continue',
                   style: Constants.customStyle(
                       20.0, Colors.white, FontWeight.bold),
                 )),
           ),
         ),
        ),

        // floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      );
    });
  }
}
class CustomScroll extends ScrollBehavior {
  @override
  Widget buildViewportChrome(
      BuildContext context, Widget child, AxisDirection axisDirection) {
    return child;
  }
}