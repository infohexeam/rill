import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rill_repository/Utils/app_routes.dart';
import 'package:rill_repository/ui/previlege_card/bind/privilege_card_binding.dart';

import '../../../../Utils/colors_list.dart';
import '../../../../constants/constant.dart';

class PaymentModeScreenRpc extends StatefulWidget {
  const PaymentModeScreenRpc({super.key});

  @override
  State<PaymentModeScreenRpc> createState() => _PaymentModeScreenRpcState();
}

class _PaymentModeScreenRpcState extends State<PaymentModeScreenRpc> {
  String type = "1";
  var data = Get.arguments;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        FocusScopeNode currentFocus = FocusScope.of(context);

        if (!currentFocus.hasPrimaryFocus) {
          currentFocus.unfocus();
        }
      },
      child: Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: Constants.commonAppBar(
            title: "Rill Partners Club",
            icon: const Icon(Icons.arrow_back, size: 30)),
        body: Container(
          height: size.height,
          width: size.width,
          padding: const EdgeInsets.only(bottom: 30),
          child: Stack(
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child:
                        GetBuilder<PrivilegeCardController>(builder: (logic) {
                      return Container(
                        padding: const EdgeInsets.all(0),
                        margin: const EdgeInsets.only(top: 15),
                        height: 200,
                        width: size.width,
                        decoration: const BoxDecoration(
                          color: Colors.transparent,
                            // image: DecorationImage(
                            //     image: AssetImage('assets/images/member.png'))
                        ),
                        child: Stack(
                          // mainAxisAlignment: MainAxisAlignment.end,
                          // crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                height: 200,
                                width: size.width,
                                padding: EdgeInsets.zero,
                                child: Image.asset("assets/images/member.png",fit: BoxFit.fill),),
                            const SizedBox(
                              height: 20,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(15.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Contribution Amount',
                                    style: Constants.customStyle(
                                        20.0, Colors.white, FontWeight.bold),
                                  ),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  SizedBox(
                                    height: 45,
                                    width: size.width,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        // const Padding(
                                        //   padding: EdgeInsets.only(top:3),
                                        //   child: Text("Rs. ",style: TextStyle(color: Colors.white,fontSize: 22,fontWeight: FontWeight.bold)),
                                        // ),
                                        SizedBox(
                                          // height: 45,
                                          width: size.width - 124,
                                          child: Form(
                                            key: _formKey,
                                            child: TextFormField(

                                              autovalidateMode: AutovalidateMode
                                                  .onUserInteraction,
                                              style: const TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 22,
                                                  fontWeight: FontWeight.bold),
                                              keyboardType: const TextInputType
                                                  .numberWithOptions(),
                                              textInputAction:
                                                  TextInputAction.done,
                                              controller: logic
                                                  .contributionFeeController,
                                              readOnly: false,
                                              validator: (value) {
                                                if (value == null ||

                                                    value.isEmpty) {

                                                  return 'Amount is required';
                                                }
                                                else if (int.tryParse(value) == null || int.parse(value) < 10000) {
                                                  return 'Amount must be at least 10,000';
                                                }
                                                int n = int.parse(value);
                                                int multipleOf = 10000;

                                                return n % multipleOf != 0
                                                    ? "Installment should be multiple of Rs.$multipleOf"
                                                    : null;
                                              },
                                              onChanged: (text) {
                                                setState(() {
                                                  // if(int.parse(text)<=10000){
                                                  //   amountValue = false;
                                                  // }
                                                  // if(text.isEmpty){
                                                  //   amountValue = false;
                                                  // }
                                                  // else{
                                                  //   amountValue = true;
                                                  // }
                                                });
                                              },
                                              // validator: (value) {
                                              //   if (value == null || value.isEmpty) {
                                              //     return 'Amount field is required';
                                              //   }
                                              //   return null;
                                              // },
                                              maxLength: 10,
                                              cursorColor: Colors.white,
                                              // controller: investmentController.amountController,
                                              decoration: const InputDecoration(

                                                counter: Offstage(),
                                                // border: OutlineInputBorder(),
                                                // prefixText:'Rs. ',
                                                // border: InputBorder.none,
                                                prefixStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 22,
                                                    fontWeight:
                                                        FontWeight.bold),
                                                contentPadding:
                                                    EdgeInsets.only(top: 10),
                                                hintText: "Enter amount",
                                                prefixIcon: Padding(
                                                  padding: EdgeInsets.all(8.0),
                                                  child: Text("Rs.",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 22,
                                                          fontWeight:
                                                              FontWeight.bold)),
                                                ),
                                                hintStyle: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 22,
                                                    fontWeight:
                                                        FontWeight.normal),
                                                enabledBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.white),
                                                ),
                                                focusedBorder:
                                                    UnderlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.white),
                                                ),

                                                // enabledBorder: OutlineInputBorder(
                                                //     borderSide: BorderSide(
                                                //         color: Colors.white)),
                                                // focusedBorder: const OutlineInputBorder(
                                                //     borderSide: BorderSide(
                                                //         color: Colors.white)),
                                                // enabledBorder: const OutlineInputBorder(
                                                //     borderSide: BorderSide(color: Colors.black54)),
                                                // focusedBorder: const OutlineInputBorder(
                                                //     borderSide: BorderSide(color: Colors.black54)),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  //  Text(
                                  // logic.privilegecardexistModel?.data.privileCardExists==true?'Rs. 10500':   'Rs. 12500',
                                  //    style: Constants.customStyle(
                                  //        32.0, Colors.white, FontWeight.bold),
                                  //  ),
                                ],
                              ),
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
                      );
                    }),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15),
                    child: Text(
                      'Payment mode',
                      style: Constants.customStyle(
                          16.0, const Color(0xff04ADBE), FontWeight.bold),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 15, right: 15,top:15),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: size.width/2-30,
                          height: 60,
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: RadioListTile(
                              title: Text("One time",
                                  style: Constants.customStyle(
                                      15.0, blueheader, FontWeight.bold)),
                              value: "1",
                              groupValue: type,
                              onChanged: (value) {
                                setState(() {
                                  type = value.toString();
                                });
                              },
                            ),
                          ),
                        ),
                        SizedBox(
                          width: size.width/2,
                          height: 60,
                          child: Card(
                            elevation: 5,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            child: RadioListTile(
                              title: Text("Installments",
                                  style: Constants.customStyle(
                                      15.0, blueheader, FontWeight.bold)),
                              value: "2",
                              groupValue: type,
                              onChanged: (value) {
                                setState(() {
                                  type = value.toString();
                                });
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30,)
                ],
              ),
              Align(
                alignment: Alignment.bottomCenter,
                child: GetBuilder<PrivilegeCardController>(builder: (logic) {
                  return InkWell(
                      onTap: () {
                        if (_formKey.currentState!.validate()) {
                          if (type == "1") {
                            Get.toNamed(Routes.torpcOneTime, arguments: [type]);
                          } else {
                            Get.toNamed(Routes.torpcInstallments,
                                arguments: [type]);
                          }
                        }

                        // if (data[0] == 'Rill Partners Club') {
                        //   Get.toNamed(Routes.installmentpayment, arguments: [type]);
                        // } else if (data[0] == 'Rill Founders Club') {
                        //   Get.toNamed(Routes.installmentpayment2, arguments: [type,
                        //   logic.privilegecardexistModel?.data.privileCardExists==true?10500:12500
                        //   ]);
                        // }
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(left: 15,right: 15),
                        child: Constants.getCommonButton(
                            size.width, 45, 'Continue'),
                      ));
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}
