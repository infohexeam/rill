import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import '../../../../Utils/colors_list.dart';
import '../../../../constants/constant.dart';
import '../../../previlege_card/bind/privilege_card_binding.dart';
import '../../bind/investment_form_binding.dart';
import '../../model/paymentStatusRpc.dart';

class RpcInstalments extends StatefulWidget {
  const RpcInstalments({super.key});

  @override
  State<RpcInstalments> createState() => _RpcInstalmentsState();
}

class _RpcInstalmentsState extends State<RpcInstalments> {
  var investmentController = Get.put(InvestmentFormController());
  var privilegecontroller = Get.put(PrivilegeCardController());
  final FocusNode _focusNode = FocusNode();
  var data = Get.arguments;
  final _formKey = GlobalKey<FormState>();
  // List<Form> _formKey = [
  //   GlobalKey<FormState>(),
  // ]
  DateTime date = DateTime.now();
  List<TextEditingController> controllersRpc = [
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
    TextEditingController(),
  ];
  List<String> dateFo = [
    "DD-MM-YY",
    "DD-MM-YY",
    "DD-MM-YY",
    "DD-MM-YY",
    "DD-MM-YY",
    "DD-MM-YY",
  ];
  List<String> apiDate = [
    "DD-MM-YY",
    "DD-MM-YY",
    "DD-MM-YY",
    "DD-MM-YY",
    "DD-MM-YY",
    "DD-MM-YY",
  ];
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;

    return GetBuilder<InvestmentFormController>(builder: (logic) {
      double calculateSum() {
        double sum = 0.0;

        for (TextEditingController controller in controllersRpc) {
          double value = double.tryParse(controller.text) ?? 0.0;
          sum += value;
        }

        return sum;
      }

      return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: Constants.commonAppBar(
            title: 'Rill Partners Club',
            icon: const Icon(Icons.arrow_back, size: 30)),
        body: SingleChildScrollView(
          physics: const ScrollPhysics(),
          child: SizedBox(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 25,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15, bottom: 15),
                  child: Text(
                    'Installments',
                    style: Constants.customStyle(
                        16.0, blueheader, FontWeight.bold),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/icons/star.png'),
                      const SizedBox(
                        width: 15,
                      ),
                      GetBuilder<PrivilegeCardController>(
                        builder: (logicP) {
                          return Text(
                            'Amount : Rs. ${logicP.contributionFeeController.text}',
                            style: Constants.customStyle(
                                14.0, blueheader, FontWeight.w500),
                          );
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/icons/star.png'),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Maximum Duration : 6 Months',
                        style: Constants.customStyle(
                            14.0, blueheader, FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset('assets/icons/star.png'),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        'Installments Should be Multiple of Rs. 500',
                        style: Constants.customStyle(
                            14.0, blueheader, FontWeight.w500),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 5,
                ),
                Card(
                  elevation: 5,
                  child: SizedBox(
                    // height: size.height * .4,
                    width: size.width,
                    child: Padding(
                      padding: const EdgeInsets.only(
                          left: 15, right: 15, top: 15, bottom: 15),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: Text(
                              'Select the number of installments',
                              style: Constants.customStyle(
                                  14.0, Colors.black, FontWeight.w500),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Card(
                                child: SizedBox(
                                  // color: Colors.amber,
                                  height: 45,
                                  width: size.width * .55,
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        top: 10, left: 15),
                                    child: Text(
                                        logic.installments2.value.toString(),
                                        style: Constants.customStyle(
                                            16.0, blueheader, FontWeight.bold)),
                                  ),
                                ),
                              ),
                              Card(
                                child: InkWell(
                                  onTap: () {
                                    setState(() {
                                      if (logic.installments2.value != 2 &&
                                          logic.installments2.value != 1) {
                                        // logic.controllers
                                        //     .removeAt(logic.listCountRpc - 1);
                                      }

                                      if (logic.installments2.value == 2) {
                                        logic.listCountRpc = 2;
                                        return;
                                      } else {
                                        setState(() {
                                          print(
                                              "Listcount::::${logic.listCountRpc}");
                                          logic.installments2.value =
                                              logic.listCountRpc - 1;
                                          logic.listCountRpc =
                                              logic.installments2.value;
                                          // controllersRpc.removeAt(logic.listCountRpc);
                                          controllersRpc[logic.listCountRpc]
                                              .clear();
                                          // logic.paymentStatus.removeLast();
                                        });
                                      }
                                    });
                                    // if (logic.installments2.value == 2) {
                                    //   return;
                                    // } if(logic.installments2.value>=2){
                                    //   // setState(() {
                                    //   //   logic.installments2.value =
                                    //   //       logic.installments2.value - 1;
                                    //   // });
                                    //   setState(() {
                                    //     controllersRpc.removeAt(logic.listCountRpc-1);
                                    //
                                    //     if(logic.installments2.value==2){
                                    //       logic.listCountRpc = 2;
                                    //     }
                                    //     if(logic.installments2.value>=2){
                                    //       logic.installments2.value = logic.installments2.value - 1;
                                    //       logic.listCountRpc = logic.installments2.value;
                                    //     }
                                    //
                                    //   });
                                    // }
                                    // setState(() {
                                    //   if(logic.installments2.value==2){
                                    //     // return;
                                    //   }
                                    //   else {
                                    //     // controllersRpc.removeAt(logic.installments2.value-1);
                                    //     logic.listCountRpc = logic.installments2.value-1;
                                    //     logic.installments2.value = logic.installments2.value-1;
                                    //   }
                                    // });
                                  },
                                  child: logic.installments2.value != 2
                                      ? SizedBox(
                                          // color: Colors.blueGrey,

                                          height: 45,

                                          width: 45,

                                          child: Center(
                                            child: Text("-",
                                                style: Constants.customStyle(
                                                    16.0,
                                                    Colors.grey,
                                                    FontWeight.bold)),
                                          ),
                                        )
                                      : const SizedBox(),
                                ),
                              ),
                              logic.listCountRpc != 6
                                  ? Card(
                                      child: InkWell(
                                        onTap: () {
                                          setState(() {
                                            if (logic.installments2.value >=
                                                6) {
                                              logic.listCountRpc = 6;
                                              // return;
                                            } else {
                                              logic.installments2.value =
                                                  logic.installments2.value + 1;
                                              logic.listCountRpc =
                                                  logic.installments2.value;
                                            }
                                          });
                                          // setState(() {
                                          //   if(logic.installments2.value==6){
                                          //     return;
                                          //   }
                                          //   else {
                                          //     logic.listCountRpc = logic.installments2.value+1;
                                          //     logic.installments2.value = logic.installments2.value +1;
                                          //   }

                                          // if (logic.installments2.value == 6) {
                                          //      logic.listCountRpc =  6;
                                          //      return;
                                          //    } else if(logic.installments2.value<=6){
                                          //      logic.installments2.value = logic.installments2.value + 1;
                                          //      logic.listCountRpc = logic.installments2.value;
                                          //    }
                                          //  });
                                        },
                                        child: SizedBox(
                                          // color: Colors.yellowAccent,

                                          height: 45,

                                          width: 45,

                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                top: 10, left: 15),
                                            child: Text("+",
                                                style: Constants.customStyle(
                                                    16.0,
                                                    Colors.black,
                                                    FontWeight.bold)),
                                          ),
                                        ),
                                      ),
                                    )
                                  : const SizedBox(),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          Form(
                            key: _formKey,
                            child: ListView.builder(
                                shrinkWrap: true,
                                padding: EdgeInsets.zero,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: logic.listCountRpc,
                                itemBuilder: (BuildContext context, index) {
                                  return Container(
                                      width: size.width,
                                      height: 55,
                                      margin: const EdgeInsets.only(bottom: 15),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border:
                                            Border.all(color: Colors.black54),
                                      ),
                                      child: Center(
                                          child: Padding(
                                              padding: const EdgeInsets.only(
                                                  left: 5),
                                              child:
                                                  date == DateTime(2022, 12, 34)
                                                      ? Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            InkWell(
                                                              onTap: () async {
                                                                DateTime?
                                                                    newDate =
                                                                    await showDatePicker(
                                                                        context:
                                                                            context,
                                                                        initialDate:
                                                                            DateTime
                                                                                .now(),
                                                                        firstDate:
                                                                            DateTime
                                                                                .now(),
                                                                        lastDate:
                                                                            DateTime.now().add(const Duration(days: 180)))
                                                                    // showDatePicker(
                                                                    //     context:
                                                                    //         context,
                                                                    //     initialDate:
                                                                    //         DateTime
                                                                    //             .now(),
                                                                    //     firstDate:
                                                                    //         DateTime(
                                                                    //             1900),
                                                                    //     lastDate:
                                                                    //         DateTime(
                                                                    //             2100))
                                                                    ;
                                                                if (newDate ==
                                                                    null) {
                                                                  return;
                                                                }
                                                                setState(() {
                                                                  date =
                                                                      newDate;
                                                                });
                                                              },
                                                              child: Text(
                                                                  "DD-MM-YY",
                                                                  style: Constants.customStyle(
                                                                      16.0,
                                                                      subheader,
                                                                      FontWeight
                                                                          .normal)),
                                                            ),
                                                          ],
                                                        )
                                                      : Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .spaceBetween,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            // Text('data'),
                                                            Container(
                                                              color:
                                                                  Colors.white,
                                                              width:
                                                                  size.width *
                                                                      0.4,
                                                              child:
                                                                  TextFormField(
                                                                // key: _formKey,
                                                                enabled: true,
                                                                maxLength: 10,
                                                                // enabled: _isFieldEnabled[index],
                                                                autovalidateMode:
                                                                    AutovalidateMode
                                                                        .onUserInteraction,
                                                                // autovalidateMode: investmentController
                                                                //     .controllersRpc[
                                                                // index].text.isNotEmpty?AutovalidateMode.onUserInteraction:AutovalidateMode.disabled,
                                                                keyboardType:
                                                                    TextInputType
                                                                        .number,
                                                                inputFormatters: <TextInputFormatter>[
                                                                  FilteringTextInputFormatter
                                                                      .digitsOnly
                                                                ],
                                                                textInputAction:
                                                                    TextInputAction
                                                                        .next,
                                                                validator:
                                                                    (value) {
                                                                  if (value!
                                                                      .isEmpty) {
                                                                    return 'Amount is required';
                                                                  } else {
                                                                    int n = int
                                                                        .parse(
                                                                            value);
                                                                    int multipleOf =
                                                                        500;

                                                                    return n % multipleOf !=
                                                                            0
                                                                        ? 'Invalid amount'
                                                                        // "Installment should be multiple of Rs.$multipleOf"
                                                                        : null;
                                                                  }
                                                                  return null;
                                                                },
                                                                controller: controllersRpc[
                                                                        index] ??
                                                                    TextEditingController(),
                                                                decoration:
                                                                    InputDecoration(
                                                                  counterText:
                                                                      '',
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                  filled: true,
                                                                  fillColor:
                                                                      Colors
                                                                          .white,
                                                                  contentPadding:
                                                                      const EdgeInsets
                                                                          .only(
                                                                          left:
                                                                              15),
                                                                  hintText:
                                                                      "Enter Amount",
                                                                  hintStyle: Constants.customStyle(
                                                                      16.0,
                                                                      Colors
                                                                          .black,
                                                                      FontWeight
                                                                          .w500),
                                                                ),
                                                              ),
                                                            ),
                                                            Container(
                                                              color: Colors
                                                                  .transparent,
                                                              width: 100,
                                                              child:
                                                                  TextFormField(
                                                                // decoration: InputDecoration(
                                                                //   labelText: 'Date of birth',
                                                                // ),
                                                                onTap:
                                                                    () async {
                                                                  DateTime?
                                                                      newDate =
                                                                      await showDatePicker(
                                                                    context:
                                                                        context,
                                                                    initialDate:
                                                                        DateTime
                                                                            .now(),
                                                                    firstDate:
                                                                        DateTime
                                                                            .now(),
                                                                    lastDate: DateTime
                                                                            .now()
                                                                        .add(const Duration(
                                                                            days:
                                                                                180)),
                                                                    builder:
                                                                        (context,
                                                                            child) {
                                                                      return Theme(
                                                                        data: Theme.of(context)
                                                                            .copyWith(
                                                                          colorScheme:
                                                                              const ColorScheme.light(
                                                                            primary:
                                                                                primaryColor, // <-- SEE HERE
                                                                            onPrimary:
                                                                                Colors.white, // <-- SEE HERE
                                                                            onSurface:
                                                                                Colors.black, // <-- SEE HERE
                                                                          ),
                                                                          textButtonTheme:
                                                                              TextButtonThemeData(
                                                                            style:
                                                                                TextButton.styleFrom(
                                                                              foregroundColor: primaryColor, // button text color
                                                                            ),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            child!,
                                                                      );
                                                                    },
                                                                  );
                                                                  if (newDate ==
                                                                      null) {
                                                                    return;
                                                                  }
                                                                  setState(() {
                                                                    if (dateFo
                                                                        .contains(
                                                                            "${newDate.day}-${newDate.month}-${newDate.year}")) {
                                                                      const snackBar =
                                                                          SnackBar(
                                                                        backgroundColor:
                                                                            primaryColor,
                                                                        content:
                                                                            Text(
                                                                          "Sorry! You can't choose the same date twice!!",
                                                                          style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 15),
                                                                        ),
                                                                      );
                                                                      ScaffoldMessenger.of(
                                                                              context)
                                                                          .showSnackBar(
                                                                              snackBar);
                                                                    } else {
                                                                      date =
                                                                          newDate;
                                                                      dateFo[index] =
                                                                          "${newDate.day}-${newDate.month}-${newDate.year}";
                                                                      apiDate[index] =
                                                                          "${newDate.year}-${newDate.month}-${newDate.day}";
                                                                    }
                                                                  });
                                                                },
                                                                readOnly: true,
                                                                controller: TextEditingController(
                                                                    text: dateFo[index] ==
                                                                            "DD-MM-YY"
                                                                        ? "DD-MM-YY"
                                                                        : dateFo[index]
                                                                            .toString()),
                                                                style: Constants
                                                                    .customStyle(
                                                                        16.0,
                                                                        Colors
                                                                            .black,
                                                                        FontWeight
                                                                            .w500),
                                                                decoration:
                                                                    const InputDecoration(
                                                                  border:
                                                                      InputBorder
                                                                          .none,
                                                                ),
                                                                validator:
                                                                    (value) {
                                                                  if (dateFo[
                                                                          index] ==
                                                                      "DD-MM-YY") {
                                                                    return 'Invalid date';
                                                                  }
                                                                  // else if (selectedDate.isAfter(DateTime.now())) {
                                                                  //   return 'Date of birth cannot be in the future';
                                                                  // }
                                                                  else {
                                                                    return null;
                                                                  }
                                                                },
                                                                // Text(
                                                                //   dateFo[index].toString(),
                                                                // "${investmentController.datesRpc[index].day.toString()}/${investmentController.datesRpc[index].month.toString()}/${investmentController.datesRpc[index].year.toString()}",
                                                                // '${date.day}-${date.month}-${date.year}',

                                                                // '$currentDate/$month/$year',
                                                                // formattedDate,
                                                                // '${date.day}-${date.month}-${date.year}',
                                                                // style: Constants.customStyle(
                                                                //     16.0,
                                                                //     Colors
                                                                //         .black,
                                                                //     FontWeight
                                                                //         .w500),
                                                              ),
                                                            ),
                                                          ],
                                                        ))));
                                  // }
                                }),
                          ),
                          GetBuilder<PrivilegeCardController>(
                              builder: (logicP) {
                            return InkWell(
                                onTap: () {
                                  if (_formKey.currentState!.validate()) {
                                    _formKey.currentState!.save();
                                    double sums = calculateSum();
                                    print('Sums: $sums');

                                    if (logic.listCountRpc >= 2) {
                                      logic.paymentStatusRpc.add(DataRequestRpc(
                                          date: apiDate[0].toString(),
                                          amount: int.parse(controllersRpc[0]
                                              .text
                                              .toString())));
                                    }
                                    if (logic.listCountRpc >= 2) {
                                      logic.paymentStatusRpc.add(DataRequestRpc(
                                          date: apiDate[1].toString(),
                                          amount: int.parse(controllersRpc[1]
                                              .text
                                              .toString())));
                                    }
                                    if (logic.listCountRpc >= 3) {
                                      logic.paymentStatusRpc.add(DataRequestRpc(
                                          date: apiDate[2].toString(),
                                          amount: int.parse(controllersRpc[2]
                                              .text
                                              .toString())));
                                    }
                                    if (logic.listCountRpc >= 4) {
                                      logic.paymentStatusRpc.add(DataRequestRpc(
                                          date: apiDate[3].toString(),
                                          amount: int.parse(controllersRpc[3]
                                              .text
                                              .toString())));
                                    }
                                    if (logic.listCountRpc >= 5) {
                                      logic.paymentStatusRpc.add(DataRequestRpc(
                                          date: apiDate[4].toString(),
                                          amount: int.parse(controllersRpc[4]
                                              .text
                                              .toString())));
                                    }
                                    if (logic.listCountRpc >= 6) {
                                      logic.paymentStatusRpc.add(DataRequestRpc(
                                          date: apiDate[5].toString(),
                                          amount: int.parse(controllersRpc[5]
                                              .text
                                              .toString())));
                                    }

                                    print(
                                        "Payment Status:::::${logic.paymentStatusRpc.toList()}");

                                    //TODO POST RFC METHOD
                                    logic.paymentAmountRpc.add(int.parse(
                                        controllersRpc[0].text.toString()));
                                    if (sums <
                                        double.parse(logicP
                                            .contributionFeeController.text
                                            .toString())) {
                                      logic.paymentStatusRpc.clear();
                                      const snackBar = SnackBar(
                                        backgroundColor: primaryColor,
                                        content: Text(
                                          "Sorry! Total Contribution amount not reached",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      );
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    }
                                    if (sums >
                                        double.parse(logicP
                                            .contributionFeeController.text
                                            .toString())) {
                                      logic.paymentStatusRpc.clear();
                                      const snackBar = SnackBar(
                                        backgroundColor: primaryColor,
                                        content: Text(
                                          "Sorry! Exceeded total Contribution amount",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 15),
                                        ),
                                      );

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(snackBar);
                                    }
                                    if (sums ==
                                        double.parse(logicP
                                            .contributionFeeController.text
                                            .toString())) {
                                      logic.rpcMultiple(
                                          context,
                                          double.parse(logicP
                                              .contributionFeeController.text
                                              .toString()));
                                      logic.amountController.clear();
                                      logic.paymentStatusRpc.clear();
                                      logic.dates.clear();
                                    }
                                  }
                                },
                                child: Constants.getCommonButton(
                                    size.width, 45, 'Submit'));
                          }),

                          // Padding(
                          //   padding: const EdgeInsets.only(top: 15, bottom: 5),
                          //   child: Text(
                          //     'Date',
                          //     style: Constants.customStyle(
                          //         14.0, Colors.black, FontWeight.w500),
                          //   ),
                          // ),
                          // Container(
                          //     width: size.width,
                          //     height: 45,
                          //     decoration: BoxDecoration(
                          //       borderRadius: BorderRadius.circular(5),
                          //       border: Border.all(color: Colors.black54),
                          //     ),
                          //     child: Center(
                          //         child: Align(
                          //             alignment: Alignment.centerLeft,
                          //             child: Padding(
                          //                 padding:
                          //                     const EdgeInsets.only(left: 15),
                          //                 child: date == DateTime(2022, 12, 34)
                          //                     ? Row(
                          //                         mainAxisAlignment:
                          //                             MainAxisAlignment
                          //                                 .spaceBetween,
                          //                         crossAxisAlignment:
                          //                             CrossAxisAlignment.center,
                          //                         children: [
                          //                           Text("DD-MM-YY",
                          //                               style: Constants
                          //                                   .customStyle(
                          //                                       16.0,
                          //                                       subheader,
                          //                                       FontWeight
                          //                                           .normal)),
                          //                           Padding(
                          //                             padding:
                          //                                 const EdgeInsets.all(
                          //                                     8.0),
                          //                             child: InkWell(
                          //                                 onTap: () async {
                          //                                   DateTime? newDate = await showDatePicker(
                          //                                       context:
                          //                                           context,
                          //                                       initialDate:
                          //                                           DateTime
                          //                                               .now(),
                          //                                       firstDate:
                          //                                           DateTime
                          //                                               .now(),
                          //                                       lastDate: DateTime
                          //                                               .now()
                          //                                           .add(const Duration(
                          //                                               days:
                          //                                                   180)));
                          //                                   if (newDate ==
                          //                                       null) {
                          //                                     return;
                          //                                   }
                          //                                   setState(() {
                          //                                     date = newDate;
                          //                                   });
                          //                                 },
                          //                                 child: Image.asset(
                          //                                     'assets/icons/calender.png')),
                          //                           )
                          //                         ],
                          //                       )
                          //                     : Row(
                          //                         mainAxisAlignment:
                          //                             MainAxisAlignment
                          //                                 .spaceBetween,
                          //                         crossAxisAlignment:
                          //                             CrossAxisAlignment.center,
                          //                         children: [
                          //                           Text(
                          //                             '${date.day}-${date.month}-${date.year}',
                          //                             style:
                          //                                 Constants.customStyle(
                          //                                     16.0,
                          //                                     Colors.black,
                          //                                     FontWeight.w500),
                          //                           ),
                          //                           Padding(
                          //                             padding:
                          //                                 const EdgeInsets.all(
                          //                                     8.0),
                          //                             child: InkWell(
                          //                                 onTap: () async {
                          //                                   DateTime? newDate = await showDatePicker(
                          //                                       context:
                          //                                           context,
                          //                                       initialDate:
                          //                                           DateTime
                          //                                               .now(),
                          //                                       firstDate:
                          //                                           DateTime
                          //                                               .now(),
                          //                                       lastDate: DateTime
                          //                                               .now()
                          //                                           .add(const Duration(
                          //                                               days:
                          //                                                   180)),
                          //                                     builder: (context, child) {
                          //                                       return Theme(
                          //                                         data: Theme.of(context).copyWith(
                          //                                           colorScheme:const ColorScheme.light(
                          //                                             primary: primaryColor, // <-- SEE HERE
                          //                                             onPrimary: Colors.white, // <-- SEE HERE
                          //                                             onSurface: Colors.black, // <-- SEE HERE
                          //                                           ),
                          //                                           textButtonTheme: TextButtonThemeData(
                          //                                             style: TextButton.styleFrom(
                          //                                               primary: primaryColor, // button text color
                          //                                             ),
                          //                                           ),
                          //                                         ),
                          //                                         child: child!,
                          //                                       );
                          //                                     },
                          //                                   );
                          //                                   if (newDate ==
                          //                                       null) {
                          //                                     return;
                          //                                   }
                          //                                   setState(() {
                          //                                     date = newDate;
                          //                                   });
                          //                                 },
                          //                                 child: Image.asset(
                          //                                     'assets/icons/calender.png')),
                          //                           )
                          //                         ],
                          //                       ))))),
                          // Padding(
                          //   padding: const EdgeInsets.only(top: 15, bottom: 5),
                          //   child: Text('Amount',
                          //       style: Constants.customStyle(
                          //           14.0, Colors.black, FontWeight.w500)),
                          // ),
                          // SizedBox(
                          //   // height: 45,
                          //   child: Form(
                          //     key: _formKey,
                          //     child: TextFormField(
                          //       keyboardType: TextInputType.number,
                          //       textInputAction: TextInputAction.done,
                          //       focusNode: _focusNode,
                          //       validator: (value) {
                          //         int n = int.parse(value!);
                          //         int multipleOf = 10000;
                          //
                          //         return n % multipleOf != 0
                          //             ? "Installment should be multiple of Rs.$multipleOf"
                          //             : null;
                          //       },
                          //       controller:
                          //           investmentController.amountController,
                          //       decoration: InputDecoration(
                          //         filled: true,
                          //         fillColor: Colors.white,
                          //         contentPadding:
                          //             const EdgeInsets.only(left: 15),
                          //         hintText: 'Enter Amount',
                          //         hintStyle: Constants.customStyle(
                          //             16.0, Colors.black, FontWeight.w500),
                          //         enabledBorder: const OutlineInputBorder(
                          //             borderSide:
                          //                 BorderSide(color: Colors.black54)),
                          //         errorBorder: const OutlineInputBorder(
                          //             borderRadius:
                          //                 BorderRadius.all(Radius.circular(4)),
                          //             borderSide: BorderSide(
                          //               width: 1,
                          //               color: Colors.red,
                          //             )),
                          //         focusedErrorBorder: const OutlineInputBorder(
                          //           borderRadius:
                          //               BorderRadius.all(Radius.circular(4)),
                          //           borderSide: BorderSide(
                          //             width: 1,
                          //             color: Colors.red,
                          //           ),
                          //         ),
                          //         focusedBorder: const OutlineInputBorder(
                          //             borderSide:
                          //                 BorderSide(color: Colors.black54)),
                          //       ),
                          //     ),
                          //   ),
                          // ),
                          // const SizedBox(
                          //   height: 20,
                          // ),
                          // InkWell(
                          //   onTap: () {
                          //     // setState(() {
                          //     if (_formKey.currentState!.validate()) {
                          //       setState(() {
                          //         if (logic.installments2.value.toString() ==
                          //             logic.paymentStatusRpc.length
                          //                 .toString()) {
                          //           const snackBar = SnackBar(
                          //             backgroundColor: primaryColor,
                          //             content: Text(
                          //               "Sorry! You can't perform this action!!",
                          //               style: TextStyle(
                          //                   color: Colors.white,
                          //                   fontWeight: FontWeight.bold,
                          //                   fontSize: 15),
                          //             ),
                          //           );
                          //           ScaffoldMessenger.of(context)
                          //               .showSnackBar(snackBar);
                          //         } else {
                          //           final status = DataRequestRpc(
                          //             amount: int.parse(
                          //                 logic.amountController.text),
                          //             date:
                          //                 '${date.year}-${date.month}-${date.day}',
                          //           );
                          //           logic.paymentStatusRpc.add(status);
                          //           logic.amountController.clear();
                          //         }
                          //       });
                          //     }
                          //
                          //     // });
                          //   },
                          //   child: Container(
                          //     width: size.width * .25,
                          //     height: 35,
                          //     decoration: BoxDecoration(
                          //         color: primaryColor,
                          //         borderRadius: BorderRadius.circular(5)),
                          //     child: Center(
                          //         child: Text('Add',
                          //             style: Constants.customStyle(20.0,
                          //                 Colors.white, FontWeight.bold))),
                          //   ),
                          // )
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                // Padding(
                //   padding: const EdgeInsets.only(left: 15),
                //   child: Text(
                //     'Payment Status',
                //     style: Constants.customStyle(
                //         16.0, primaryColor, FontWeight.bold),
                //   ),
                // ),
                // const SizedBox(
                //   height: 10,
                // ),
                // ListView.builder(
                //     shrinkWrap: true,
                //     physics: const NeverScrollableScrollPhysics(),
                //     itemCount: logic.paymentStatusRpc.length == 0
                //         ? 0
                //         : logic.paymentStatusRpc.length,
                //     itemBuilder: (BuildContext context, index) {
                //       final List<String> names = <String>[];
                //       // var  paymentList = RfcPayments(amount: logic.payments[index].amount, date: logic.payments[index].date);
                //       // print("Payment List :::${paymentList.toString()}");
                //       return Container(
                //         padding: const EdgeInsets.only(
                //           left: 15,
                //           right: 15,
                //         ),
                //         child: Stack(
                //           children: [
                //             Card(
                //               elevation: 5,
                //               child: SizedBox(
                //                 height: 80,
                //                 width: size.width,
                //                 child: Padding(
                //                   padding: const EdgeInsets.all(10.0),
                //                   child: Column(
                //                     mainAxisAlignment: MainAxisAlignment.start,
                //                     crossAxisAlignment:
                //                         CrossAxisAlignment.start,
                //                     children: [
                //                       Row(
                //                         mainAxisAlignment:
                //                             MainAxisAlignment.spaceBetween,
                //                         crossAxisAlignment:
                //                             CrossAxisAlignment.start,
                //                         children: [
                //                           Text('No:${index + 1}',
                //                               style: Constants.customStyle(
                //                                   14.0,
                //                                   blueheader,
                //                                   FontWeight.normal)),
                //                           Padding(
                //                             padding: const EdgeInsets.only(
                //                                 right: 30),
                //                             child: Text(
                //                                 logic.paymentStatusRpc[index]
                //                                         .dateChange() ??
                //                                     '',
                //                                 style: Constants.customStyle(
                //                                     14.0,
                //                                     Colors.black,
                //                                     FontWeight.w500)),
                //                           ),
                //                         ],
                //                       ),
                //                       const SizedBox(
                //                         height: 10,
                //                       ),
                //                       Text(
                //                           logic.paymentStatusRpc[index].amount
                //                                   .toString() ??
                //                               '',
                //                           style: Constants.customStyle(20.0,
                //                               Colors.black, FontWeight.w500)),
                //                     ],
                //                   ),
                //                 ),
                //               ),
                //             ),
                //             InkWell(
                //               onTap: () {
                //                 setState(() {
                //                   // logic.paymentStatus.remove(logic.paymentStatus[index].amount);
                //                   // logic.paymentStatus.remove(logic.paymentStatus[index].date);
                //                   logic.paymentStatusRpc.removeAt(index);
                //                 });
                //                 print("removed");
                //               },
                //               child: Align(
                //                 alignment: Alignment.topRight,
                //                 child: ClipOval(
                //                   child: Container(
                //                       color: Colors.transparent,
                //                       width: 30,
                //                       height: 30,
                //                       child: const Icon(
                //                         Icons.close,
                //                         color: Colors.red,
                //                         size: 25,
                //                       )),
                //                 ),
                //               ),
                //             ),
                //           ],
                //         ),
                //       );
                //     }),
                const SizedBox(
                  height: 20,
                ),
                // GetBuilder<PrivilegeCardController>(
                //   builder: (logicP) {
                //     return logic.installments2.value.toString() ==
                //         logic.paymentStatusRpc.length.toString()
                //         ? InkWell(
                //         onTap: () {
                //           double sum = logic.paymentStatusRpc
                //               .map((expense) => expense.amount)
                //               .fold(0, (prev, amount) => prev + amount);
                //           print('Sum of amounts :::: $sum');
                //           if (sum <
                //               double.parse(
                //                   logicP.contributionFeeController.text)) {
                //             const snackBar = SnackBar(
                //               backgroundColor: primaryColor,
                //               content: Text(
                //                 "Sorry! Total Membership Fee not reached",
                //                 style: TextStyle(
                //                     color: Colors.white,
                //                     fontWeight: FontWeight.bold,
                //                     fontSize: 15),
                //               ),
                //             );
                //
                //             ScaffoldMessenger.of(context)
                //                 .showSnackBar(snackBar);
                //           }
                //           if (sum ==
                //               double.parse(
                //                   logicP.contributionFeeController.text)) {
                //             print("Double Same Value");
                //           }
                //           if (sum >
                //               double.parse(
                //                   logicP.contributionFeeController.text)) {
                //             const snackBar = SnackBar(
                //               backgroundColor: primaryColor,
                //               content: Text(
                //                 "Sorry! Exceeded total Membership Fee",
                //                 style: TextStyle(
                //                     color: Colors.white,
                //                     fontWeight: FontWeight.bold,
                //                     fontSize: 15),
                //               ),
                //             );
                //
                //             ScaffoldMessenger.of(context)
                //                 .showSnackBar(snackBar);
                //           }
                //           if (sum ==
                //               double.parse(
                //                   logicP.contributionFeeController.text)) {
                //             logic.rpcMultiple(
                //                 context,
                //                 double.parse(
                //                     logicP.contributionFeeController.text));
                //           }
                //           // else{
                //           //
                //           // }
                //         },
                //         child: Padding(
                //           padding: const EdgeInsets.only(bottom: 20,right: 15,left: 15),
                //           child: Constants.getCommonButton(
                //               size.width, 45, 's'),
                //         ))
                //         : InkWell(
                //         onTap: () {
                //           setState(() {
                //             const snackBar = SnackBar(
                //               backgroundColor: primaryColor,
                //               content: Text(
                //                 "Sorry! Number of installments not matching!!!",
                //                 style: TextStyle(
                //                     color: Colors.white,
                //                     fontWeight: FontWeight.bold,
                //                     fontSize: 15),
                //               ),
                //             );
                //             ScaffoldMessenger.of(context)
                //                 .showSnackBar(snackBar);
                //           });
                //         },
                //
                //         // });};,
                //         child: Padding(
                //           padding: const EdgeInsets.only(bottom: 20.0,right: 15,left: 15),
                //           child: Constants.getCommonButton(
                //               size.width, 45, 'Submit'),
                //         ));
                //   },
                // )
              ],
            ),
          ),
        ),
      );
    });
  }
}
