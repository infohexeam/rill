import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rill_repository/Utils/colors_list.dart';
import 'package:rill_repository/ui/investment/bind/investment_form_binding.dart';

import '../../../constants/constant.dart';

class InvoiceScreen extends StatelessWidget {
  const InvoiceScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return GetBuilder<InvestmentFormController>(builder: (logic) {
      return Scaffold(
        backgroundColor: bgcolor,
        appBar: Constants.InvoiceAppBar(
            title: 'INVOICE DETAILS',
            icon: const Icon(Icons.arrow_back, size: 30)),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 25,
            ),
            Constants.InvoiceData(
                size.width * 0.4,
                size.width * 0.1,
                size.width * 0.4,
                'Payment For',
                logic.invoiceModel?.data.payment.paymentFor ?? ''),
            const SizedBox(
              height: 25,
            ),
            Constants.InvoiceData(
                size.width * 0.4,
                size.width * 0.1,
                size.width * 0.4,
                'Transaction Type',
                logic.invoiceModel?.data.payment.paymentMethod ?? ''),
            const SizedBox(
              height: 25,
            ),
            Constants.InvoiceData(
                size.width * 0.4,
                size.width * 0.1,
                size.width * 0.4,
                'Payment Type',
                logic.invoiceModel?.data.payment.paymentType ?? ''),
            const SizedBox(
              height: 25,
            ),
            Constants.InvoiceData(
                size.width * 0.4,
                size.width * 0.1,
                size.width * 0.4,
                'Invester file number',
                logic.invoiceModel?.data.clubId ?? ''),
            const SizedBox(
              height: 25,
            ),
            Constants.InvoiceData(
                size.width * 0.4,
                size.width * 0.1,
                size.width * 0.4,
                'Investment plan',
                logic.invoiceModel?.data.plan.replaceAll('_', ' ') ?? ''),
            const SizedBox(
              height: 25,
            ),
            Constants.InvoiceData(
                size.width * 0.4,
                size.width * 0.1,
                size.width * 0.4,
                'Acknowledgment date',
                logic.invoiceModel?.data.payment.acknowledgementDateChange() ??
                    ''),
            const SizedBox(
              height: 25,
            ),
            const Divider(
              thickness: 1,
              color: Colors.black,
            ),
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                    width: size.width * .4,
                    child: Text(
                      'Transaction Amount ',
                      style: Constants.customStyle(
                          16.0, Colors.black, FontWeight.w500),
                    )),
                SizedBox(
                    width: size.width * .1,
                    child: Text(":",
                        style: Constants.customStyle(
                            16.0, Colors.black, FontWeight.w500))),
                SizedBox(
                    width: size.width * .4,
                    child: Text(
                        '₹ ${logic.invoiceModel?.data.payment.amount ?? ''}',
                        style: Constants.customStyle(
                            16.0, Colors.black, FontWeight.w500)))
              ],
            ),
          ],
        ),
      );
    });
  }
}
