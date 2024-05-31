import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../Utils/colors_list.dart';
import '../../../../constants/constant.dart';
import '../../../previlege_card/bind/privilege_card_binding.dart';
import '../../bind/investment_form_binding.dart';

class RfcOneTime extends StatefulWidget {
  const RfcOneTime({super.key});

  @override
  State<RfcOneTime> createState() => _RfcOneTimeState();
}

class _RfcOneTimeState extends State<RfcOneTime> {
  var investmentController = Get.put(InvestmentFormController());
  var privilegecontroller = Get.put(PrivilegeCardController());
  var data = Get.arguments;
  DateTime date = DateTime.now();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<InvestmentFormController>(builder: (logic) {
      return Scaffold(
        resizeToAvoidBottomInset: true,
        // appBar: Constants.commonAppBar(
        //     title: 'Rill Founders Club',
        //     icon: const Icon(Icons.arrow_back, size: 30)),
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: primaryColor,
          toolbarHeight: 130,
          centerTitle: false,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          title: Padding(
            padding: const EdgeInsets.only(left: 10.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InkWell(
                    onTap: () {
                      logic.payments.clear();
                      Get.back();
                    },
                    child: const Icon(Icons.arrow_back, size: 30)),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Rill Founders Club',
                  style: Constants.customStyle(
                      20.0, Colors.white, FontWeight.bold),
                ),
              ],
            ),
          ),
        ),
        body: SizedBox(
          height: size.height,
          child: Stack(
            children: [
              SizedBox(
                child: SingleChildScrollView(
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
                          'One time Payment',
                          // data[0] == "1" ? 'One time Payment' : 'Installments',
                          style: Constants.customStyle(
                              16.0, primaryColor, FontWeight.bold),
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
                            Text(
                              'Amount : Rs. 12,500',
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
                                left: 15, right: 15, top: 15, bottom: 20),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15, bottom: 5),
                                    child: Text(
                                      'Date',
                                      style: Constants.customStyle(
                                          14.0, Colors.black, FontWeight.w500),
                                    ),
                                  ),
                                  Container(
                                      width: size.width,
                                      height: 45,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(5),
                                        border:
                                            Border.all(color: Colors.black54),
                                      ),
                                      child: Center(
                                          child: Align(
                                              alignment: Alignment.centerLeft,
                                              child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 15),
                                                  child:
                                                      date ==
                                                              DateTime(
                                                                  2022, 12, 34)
                                                          ? Row(
                                                              mainAxisAlignment:
                                                                  MainAxisAlignment
                                                                      .spaceBetween,
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Text("DD-MM-YY",
                                                                    style: Constants.customStyle(
                                                                        16.0,
                                                                        subheader,
                                                                        FontWeight
                                                                            .normal)),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                  child: InkWell(
                                                                      onTap: () async {
                                                                        DateTime?
                                                                            newDate =
                                                                            await showDatePicker(
                                                                                context: context,
                                                                                initialDate: DateTime.now(),
                                                                                firstDate: DateTime.now(),
                                                                                lastDate: DateTime.now().add(const Duration(days: 180)))
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
                                                                        setState(
                                                                            () {
                                                                          date =
                                                                              newDate;
                                                                        });
                                                                      },
                                                                      child: Image.asset('assets/icons/calender.png')),
                                                                )
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
                                                                Text(
                                                                  '${date.day}-${date.month}-${date.year}',
                                                                  style: Constants.customStyle(
                                                                      16.0,
                                                                      Colors
                                                                          .black,
                                                                      FontWeight
                                                                          .w500),
                                                                ),
                                                                Padding(
                                                                  padding:
                                                                      const EdgeInsets
                                                                          .all(
                                                                          8.0),
                                                                  child: InkWell(
                                                                      onTap: () async {
                                                                        DateTime?
                                                                            newDate =
                                                                            await showDatePicker(
                                                                          context:
                                                                              context,
                                                                          initialDate:
                                                                              DateTime.now(),
                                                                          firstDate:
                                                                              DateTime.now(),
                                                                          lastDate:
                                                                              DateTime.now().add(const Duration(days: 180)),
                                                                          builder:
                                                                              (context, child) {
                                                                            return Theme(
                                                                              data: Theme.of(context).copyWith(
                                                                                colorScheme: const ColorScheme.light(
                                                                                  primary: primaryColor, // <-- SEE HERE
                                                                                  onPrimary: Colors.white, // <-- SEE HERE
                                                                                  onSurface: Colors.black, // <-- SEE HERE
                                                                                ),
                                                                                textButtonTheme: TextButtonThemeData(
                                                                                  style: TextButton.styleFrom(
                                                                                    foregroundColor: primaryColor, // button text color
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                              child: child!,
                                                                            );
                                                                          },
                                                                        );
                                                                        if (newDate ==
                                                                            null) {
                                                                          return;
                                                                        }
                                                                        setState(
                                                                            () {
                                                                          date =
                                                                              newDate;
                                                                        });
                                                                      },
                                                                      child: Image.asset('assets/icons/calender.png')),
                                                                )
                                                              ],
                                                            ))))),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        top: 15, bottom: 5),
                                    child: Text('Amount',
                                        style: Constants.customStyle(14.0,
                                            Colors.black, FontWeight.w500)),
                                  ),
                                  SizedBox(
                                    height: 45,
                                    child: TextFormField(
                                      keyboardType: TextInputType.number,
                                      textInputAction: TextInputAction.next,
                                      readOnly: true,
                                      // controller: investmentController.amountController,
                                      decoration: InputDecoration(
                                        contentPadding:
                                            const EdgeInsets.only(left: 15),
                                        hintText: privilegecontroller
                                                    .privilegecardexistModel
                                                    ?.data
                                                    .privileCardExists ==
                                                true
                                            ? 'Rs. 10500'
                                            : 'Rs. 12500',
                                        hintStyle: Constants.customStyle(16.0,
                                            Colors.black, FontWeight.w500),
                                        enabledBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black54)),
                                        focusedBorder: const OutlineInputBorder(
                                            borderSide: BorderSide(
                                                color: Colors.black54)),
                                      ),
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 20,
                                  ),
                                  InkWell(
                                    onTap: () {
                                      setState(() {
                                        if (logic.payments.isEmpty) {
                                          // logic.addTypes('${date.day}-${date.month}-${date.year}', privilegecontroller.privilegecardexistModel?.data.privileCardExists==true?'Rs. 10500':   'Rs. 12500');
                                          logic.addRfc(
                                              '${date.year}-${date.month}-${date.day}',
                                              privilegecontroller
                                                          .privilegecardexistModel
                                                          ?.data
                                                          .privileCardExists ==
                                                      true
                                                  ? 10500
                                                  : 12500);
                                          print("Added to types ::::");
                                          // print(jsonEncode(RfcOneTimeModel()));
                                        } else {
                                          const snackBar = SnackBar(
                                            backgroundColor: primaryColor,
                                            content: Text(
                                              "Sorry! You can't perform this action!!",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 15),
                                            ),
                                          );

                                          ScaffoldMessenger.of(context)
                                              .showSnackBar(snackBar);
                                          // print(jsonEncode(RfcOneTimeModel()));
                                        }
                                      });
                                    },
                                    child: Container(
                                      width: size.width * .25,
                                      height: 35,
                                      decoration: BoxDecoration(
                                          color: primaryColor,
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      child: Center(
                                          child: Text('Add',
                                              style: Constants.customStyle(
                                                  20.0,
                                                  Colors.white,
                                                  FontWeight.bold))),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 15),
                        child: Text(
                          'Payment Status',
                          style: Constants.customStyle(
                              16.0, primaryColor, FontWeight.bold),
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      SizedBox(
                        height: size.height * .2,
                        child: ListView.builder(
                            itemCount: logic.payments.isEmpty ? 0 : 1,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (BuildContext context, index) {
                              return Padding(
                                padding:
                                    const EdgeInsets.only(left: 15, right: 15),
                                child: Stack(
                                  children: [
                                    Card(
                                      elevation: 5,
                                      child: Container(
                                        padding: const EdgeInsets.only(
                                          left: 0,
                                          right: 15,
                                        ),
                                        height: size.height * .12,
                                        width: size.width,
                                        child: Padding(
                                          padding: const EdgeInsets.all(10.0),
                                          child: Column(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceBetween,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                children: [
                                                  Text('No:${index + 1}',
                                                      style:
                                                          Constants.customStyle(
                                                              14.0,
                                                              blueheader,
                                                              FontWeight
                                                                  .normal)),
                                                  Text(
                                                      logic.payments[index]
                                                              .dateChange() ??
                                                          '',
                                                      style:
                                                          Constants.customStyle(
                                                              14.0,
                                                              Colors.black,
                                                              FontWeight.w500)),
                                                ],
                                              ),
                                              const SizedBox(
                                                height: 10,
                                              ),
                                              Text(
                                                  logic.payments[index].amount
                                                          .toString() ??
                                                      '',
                                                  style: Constants.customStyle(
                                                      20.0,
                                                      Colors.black,
                                                      FontWeight.w500)),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                    InkWell(
                                      onTap: () {
                                        setState(() {
                                          // logic.paymentStatus.remove(logic.paymentStatus[index].amount);
                                          // logic.paymentStatus.remove(logic.paymentStatus[index].date);
                                          logic.payments.removeAt(index);
                                        });
                                        print("removed");
                                      },
                                      child: Align(
                                        alignment: Alignment.topRight,
                                        child: ClipOval(
                                          child: Container(
                                              color: Colors.transparent,
                                              width: 30,
                                              height: 30,
                                              child: const Icon(
                                                Icons.close,
                                                color: Colors.red,
                                                size: 25,
                                              )),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              );
                            }),
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                ),
              ),
              logic.payments.length == 1
                  ? Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: InkWell(
                            onTap: () {
                              print("Amount :::: ${logic.payments[0].amount}");
                              print("date :::: ${logic.payments[0].date}");
                              logic.rfcSingle(
                                  context,
                                  '${date.year}-${date.month}-${date.day}',
                                  privilegecontroller.privilegecardexistModel
                                              ?.data.privileCardExists ==
                                          true
                                      ? 10500
                                      : 12500);
                              // logic.postData(logic.payments![0].amount,logic.payments![0].date);
                            },
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: Constants.getCommonButton(
                                  size.width, 45, 'Submit'),
                            )),
                      ),
                    )
                  : Align(
                      alignment: Alignment.bottomCenter,
                      child: Padding(
                        padding: const EdgeInsets.only(bottom: 20),
                        child: InkWell(
                            onTap: () {
                              setState(() {
                                const snackBar = SnackBar(
                                  backgroundColor: primaryColor,
                                  content: Text(
                                    "Sorry! Number of installments not matching!!!",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15),
                                  ),
                                );
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);
                              });
                            },

                            // });};,
                            child: Padding(
                              padding:
                                  const EdgeInsets.only(left: 15, right: 15),
                              child: Constants.getCommonButton(
                                  size.width, 45, 'Submit'),
                            )),
                      ),
                    )
            ],
          ),
        ),
      );
    });
  }
}
