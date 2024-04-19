import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rill_repository/ui/previlege_card/model/isprivilegecard_exists_model.dart';
import 'package:rill_repository/ui/previlege_card/model/privilegeCard_statusModel.dart';

import '../../../Utils/app_routes.dart';
import '../../../Utils/network_handler.dart';
import '../../home_screen/bind/homescreen_binding.dart';

import '../model/personalDetailsModel.dart';
import '../model/privilege_card_requestModel.dart';
import '../model/privilege_card_responseModel.dart';
import '../model/user_personalDetails_ResponseModel.dart';

class PrivilegeCardBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(PrivilegeCardController());
  }
}

class PrivilegeCardController extends GetxController {
  static PrivilegeCardController get to => Get.find();

  TextEditingController fatherNameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController pinControler = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController =
      TextEditingController(text: 'India');
  TextEditingController nomineeFnameController = TextEditingController();
  TextEditingController nomineeRelationController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController dobCtrl = TextEditingController();

  TextEditingController contributionFeeController = TextEditingController();
  var theChangedValue = "State".obs;
  var nomineeRelationValue = "Relation with nominee".obs;
  List relation = [
    "FATHER",
    "MOTHER",
    "SPOUSE",
    "BROTHER",
    "SISTER",
    "SON",
    "DAUGHTER"
  ].obs;
  List states = [
    "Andhra Pradesh",
    "Arunachal Pradesh",
    "Assam",
    "Bihar",
    "Chhattisgarh",
    "Goa",
    "Gujarat",
    "Haryana",
    "Himachal Pradesh",
    "Jharkhand",
    "Karnataka",
    "Kerala",
    "Madhya Pradesh",
    "Maharashtra	",
    "Manipur",
    "Meghalaya",
    "Mizoram",
    "Nagaland",
    "Odisha",
    "Punjab",
    "Rajasthan",
    "Sikkim",
    "Tamil Nadu	",
    "Telangana",
    "Tripura",
    "Uttar Pradesh",
    "Uttarakhand",
    "West Bengal",
    "Andaman and Nicobar Islands",
    "Chandigarh",
    "Dadra & Nagar Haveli",
    "Daman & Diu",
    "Delhi",
    "Jammu and Kashmir",
    "Ladakh",
    "Lakshadweep",
    "Puducherry",
  ].obs;
  // GetFullNameResponseModel? getfullnameResponseModel;
  PersonalDetailsModel? personalDetailsModel;
  UserPersonalDetailsResponseModel? userPersonalDetailsModel;
  PrivilegeCardStatusModel? privilegecardstatusModel;
  IsPrivilegeCardExistsModel? privilegecardexistModel;
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    isprivilegecardExists();
    userPersonalDetails();
    // getFullName();

    privilegecardStatus();
  }

  void privilegeCardDetails() async {
    // try {
    PrivilegeCardRequestModel prvilegecardModel = PrivilegeCardRequestModel(
        dob: dobCtrl.text,
        fatherName: fatherNameController.text,
        streetAddress: addressController.text,
        pinCode: pinControler.text,
        state: theChangedValue.value,
        country: countryController.text);
    var response = await NetWorkHandler.putToken(
        privilegeCardRequestModelToJson(prvilegecardModel), 'user/privilege');
    var data = jsonDecode(response);

    if (data["isError"] == false) {
      HomeScreenController();
      privilegecardStatus();
      userPersonalDetails();
      Get.toNamed(Routes.paymentmethod);
      Get.snackbar(
        "Alert",
        data["message"].toString().substring(0, 1).toUpperCase() +
            data["message"].toString().substring(1).toLowerCase(),
        icon:const Icon(Icons.person, color: Colors.white),
        snackPosition: SnackPosition.TOP,

      );

      var actualresponse = PrivilegeCardResponseModel.fromJson(data);
      update();

      print("Response::: ${data["isError"]}");

    } else {

      Get.defaultDialog(
          middleText: data["message"].toString().substring(0, 1).toUpperCase() +
              data["message"].toString().substring(1).toLowerCase());
    }
  }
  //   catch (e) {
  //     print("Error Logout ::: $e");
  //   }
  // }

  

  void userPersonalDetails() async {
    // try {
    var responsePersonal = await NetWorkHandler.get('user/personal-details');
    var dataPersonal = jsonDecode(responsePersonal);
    if (dataPersonal["isError"] == false) {
      personalDetailsModel = PersonalDetailsModel.fromJson(dataPersonal);
      print("Response::: ${dataPersonal["isError"]}");
      update();
    }
    // }
    // catch (e) {
    //   print("Error Logout ::: $e");
    // }
  }

  void privilegecardStatus() async {
    // try {
    var response = await NetWorkHandler.get('user/privilege');
    var data = jsonDecode(response);
    if (data["isError"] == false) {
      privilegecardstatusModel = PrivilegeCardStatusModel.fromJson(data);
      update();
      print("Response::: ${data["isError"]}");
    }
    // } catch (e) {
    //   print("Error Logout ::: $e");
    // }
  }

  void isprivilegecardExists() async {
    // try {
    var response = await NetWorkHandler.get('privilege-card/user/check');
    var data = jsonDecode(response);
    if (data["isError"] == false) {
      privilegecardexistModel = IsPrivilegeCardExistsModel.fromJson(data);
      update();
      print("privilege-card/user/check Response::: ${data["isError"]}");
    }
  }
  //   catch (e) {
  //     print("Error Logout ::: $e");
  //   }
  // }
}
