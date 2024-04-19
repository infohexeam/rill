import 'dart:convert';

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:rill_repository/Utils/app_routes.dart';
import 'package:rill_repository/ui/home_screen/model/installment_summary.dart';
import 'package:rill_repository/ui/home_screen/model/logout_model.dart';
import 'package:rill_repository/ui/kyc_form/bind/kyc_form_binding.dart';
import 'package:rill_repository/ui/previlege_card/bind/privilege_card_binding.dart';

import '../../../Utils/com_binding.dart';
import '../../../Utils/network_handler.dart';
import '../../dashboard/model/delete_account_response.dart';
import '../../investment/bind/investment_form_binding.dart';
import '../../investment/model/common_model.dart';
import '../../kyc_form/model/kyc_docs_model.dart';
import '../../previlege_card/model/privilegeCard_statusModel.dart';
import '../../splash_screen/model/firebase_token_model.dart';
import '../model/getPersonalDetailsforPrevilegeCardModel.dart';
import '../model/raise_ticketModel.dart';
import '../model/raise_ticket_RequestModel.dart';

class HomeScreenBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(HomeScreenController());
    Get.put(PrivilegeCardController());
    Get.put(InvestmentFormController());
    Get.put(KycFormController());
  }
}

class HomeScreenController extends GetxController {
  static HomeScreenController get to => Get.find();
  LogoutResponseModel? logoutResponseModel;
  PrivilegeCardStatusModel? privilegecardstatusModel;
  KycDocsModel? kycDocsModel;
  InstallmentSummary? installmentsummary;
  UserPersonalDetailsForPrivilegeCardResponseModel?
      UserpersonaldetailsForPrivilegeCardResponseModel;
  RxDouble rpcpercent = 0.0.obs;
  RxDouble rfcpercent = 0.0.obs;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getPersonalDetailsforPrivilegeCard();
    getInstallmentSummary();
  }

  void deleteAccount() async {
    var response = await NetWorkHandler.putToken("{}", 'user/disable');
    var data = jsonDecode(response);
    if (data["isError"] == false) {
      var actualresponse = DeleteAccount.fromJson(data);

      AppSession.to.session.erase();
      Get.snackbar('Alert', actualresponse.message.toString(),
          duration: const Duration(seconds: 3));
      Get.offAllNamed(Routes.login);
    } else {}
  }

  void logoutUser() async {
    try {
      var response = await NetWorkHandler.postWithoutBody('auth/user/logout');
      var data = jsonDecode(response);

      if (data["isError"] == false) {
        logoutResponseModel = LogoutResponseModel.fromJson(data);
        print("Response::: ${data["isError"]}");
        AppSession.to.session.erase();
        Get.snackbar('Alert', logoutResponseModel!.message.toString(),
            duration: const Duration(seconds: 3));
        Get.offAllNamed(Routes.login);
      }
    } catch (e) {
      print("Error Logout ::: $e");
    }
  }

  void privilegeCardStatus() async {
    try {
      var response = await NetWorkHandler.get('privilege-card/user/check');
      var data = jsonDecode(response);
      if (data["isError"] == false) {
        privilegecardstatusModel = PrivilegeCardStatusModel.fromJson(data);
        print("Response::: ${data["isError"]}");
      }
      if (data["error"] == true) {
        AppSession.to.session.erase();
        Get.offAllNamed(Routes.login);
        Get.snackbar('Session Expired',
            'Your account has been logged in on another device',
            duration: const Duration(seconds: 5));
      }
    } catch (e) {
      print("Error Logout ::: $e");
    }
  }

  void getPersonalDetailsforPrivilegeCard() async {
    try {
      var response = await NetWorkHandler.get('user/privilege');
      var data = jsonDecode(response);
      print("object ${data["isError"]}");
      if (data["isError"] == false) {
        UserpersonaldetailsForPrivilegeCardResponseModel =
            UserPersonalDetailsForPrivilegeCardResponseModel.fromJson(data);
        print("Response::: ${data["isError"]}");
      }
    } catch (e) {
      print("Error Logout ::: $e");
    }
  }

  void getInstallmentSummary() async {
    var response = await NetWorkHandler.get('investment/user/summary');
    var data = jsonDecode(response);


    if (data["data"]["data"]["rfc"]["paymentsCompleted"] == true) {
      // rfcpercent.value = double.parse(data["data"]["data"]["rfc"]["completed"].toString()) /
      //     double.parse(data["data"]["data"]["rfc"]["totalCommitted"].toString()) *
      //     100;
      rfcpercent.value = 100.0;
      print("Payment Completed::::${data["data"]["data"]["rfc"]["paymentsCompleted"]}");

      print(rfcpercent);
    }
    if(data["data"]["data"]["rfc"]["paymentsCompleted"] == false){
      rfcpercent.value = double.parse(data["data"]["data"]["rfc"]["completed"].toString()) /
          double.parse(data["data"]["data"]["rfc"]["totalCommitted"].toString()) *
          100;
    }
    // else {
    //   // rpcpercent.value = double.parse(data["data"]["data"]["rpc"]["completed"].toString()) /
    //   //     double.parse(data["data"]["data"]["rpc"]["totalCommitted"].toString()) *
    //   //     100;
    //   // rfcpercent.value = (double.parse(data["data"]["data"]["rfc"]["completed"].toString())/double.parse(data["data"]["data"]["rfc"]["totalCommitted"].toString()))*100;
    //
    // }
    if (data["data"]["data"]["rpc"]["paymentsCompleted"] == true) {
      rpcpercent.value = 100.0;
    } else {
      // print("Rpc value:::::${rfcpercent.value}");
      // print("object ${data["data"]["data"]["rpc"]["completed"]}");
      // print("object ${data["data"]["data"]["rpc"]["pending"]}");

      rpcpercent.value = double.parse(data["data"]["data"]["rpc"]["completed"].toString()) /
          double.parse(data["data"]["data"]["rpc"]["totalCommitted"].toString() )*
          100;
    }
    update();
  }

  void sendToken(String token) async {
    SendFirebaseToken sendFirebaseToken =
        SendFirebaseToken(firebaseToken: token);
    var response = await NetWorkHandler.postToken(
        SendFirebaseTokenToJson(sendFirebaseToken), "user/firebase-token");
    var data = json.decode(response);
    var actualresponse = CommonModel.fromJson(data);
    // var errorResponse = ErrorResponse.fromJson(data);
    if (actualresponse.isError == false) {
      print("Firebase Token $token :::: Send succesfully...");
    } else {
      print("Firebase Token $token :::: Send failed...");
    }
  }

  void raiseTicket(String type, String id) async {
    RaiseTicketModel raiseticket =
        RaiseTicketModel(instalmentId: id, type: type);
    EasyLoading.show(status: 'Raising a Ticket...');
    var response = await NetWorkHandler.postToken(
        raiseTicketModelToJson(raiseticket), "customer-support/user/create");
    EasyLoading.dismiss();
    var data = json.decode(response);
    var actualresponse = RaiseTicket.fromJson(data);
    if (actualresponse.isError == false) {
      // Get.defaultDialog(middleText: 'Ticket raised');
      Get.toNamed(Routes.paymentsuccess);
    } else {
      Get.defaultDialog(middleText: 'Please try again..after some time');
    }
  }
}
