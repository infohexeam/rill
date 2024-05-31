import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:rill_repository/ui/kyc_form/model/kyc_docs_model.dart';
import 'package:rill_repository/ui/kyc_form/model/kyc_personalDetailsRequestModel.dart';
import 'package:rill_repository/ui/previlege_card/bind/privilege_card_binding.dart';

import '../../../Utils/app_routes.dart';
import '../../../Utils/network_handler.dart';
import '../model/kyc_personalDetailsResponseModel.dart';

class KycFormBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(KycFormController());
  }
}

class KycFormController extends GetxController {
  static KycFormController get to => Get.find();
  KycDocsModel? kycdocsmodel;
  var privilegecontroller = Get.put(PrivilegeCardController());

  TextEditingController fnameControler = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneControler = TextEditingController();
  TextEditingController fatherNameController = TextEditingController();
  TextEditingController dobController = TextEditingController();
  TextEditingController dobCtrl = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController pinControler = TextEditingController();
  TextEditingController stateController = TextEditingController();
  TextEditingController countryController = TextEditingController();
  TextEditingController nomineeFnameController = TextEditingController();
  TextEditingController nomineeRelationController = TextEditingController();
  var theChangedValue = "State".obs;
  String nomineeRelationValue = "Relation with nominee";
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

  @override
  void onInit() {
    super.onInit();
    kycDocsStatus();
  }

  void personalDetailswithNominee() async {
    try {
      KycPersonalDetailsRequestModel personalDetails =
          KycPersonalDetailsRequestModel(
        fatherName: fatherNameController.text,
        streetAddress: addressController.text,
        pinCode: pinControler.text,
        state: theChangedValue.value,
        country: 'INDIA',
        nomineeName: nomineeFnameController.text,
        relation: nomineeRelationValue,
        dob: dobCtrl.text,
      );
      print("fatherName:::${fatherNameController.text}");
      print("Address:::${addressController.text}");
      print("pinCode:::${pinControler.text}");
      print("state:::${theChangedValue.value}");
      print("country:::${'INDIA'}");
      print("relation:::$nomineeRelationValue");
      print("nomineeName:::${nomineeFnameController.text}");
      //Api Call
      var response = await NetWorkHandler.putToken(
          kycPersonalDetailsRequestModelToJson(personalDetails),
          'user/update/details');

      var data = jsonDecode(response);

      if (data["isError"] == false) {
        var actualresponse = KycPersonalDetailsResponseModel.fromJson(data);
        update();
        PrivilegeCardController();
        kycDocsStatus();
        PrivilegeCardController.to.userPersonalDetails();
        PrivilegeCardController.to.privilegecardStatus();
      
        if (privilegecontroller.privilegecardstatusModel?.data?.detailsFilled ==
                true &&
            privilegecontroller.personalDetailsModel?.data?.data
                    ?.personalDetails?.nomineeAdded ==
                true) {
          
          Get.toNamed(Routes.investmentplan);
        } else {
          Get.toNamed(Routes.kycscreen2);
        }
        print("Response::: ${actualresponse.isError.toString()}");
        PrivilegeCardController.to.isprivilegecardExists();
      } else {
        Get.defaultDialog(middleText: data["message"].toString());
      }
    } catch (e) {
      print("Error Logout ::: $e");
    }
  }

  void personalDetailswithNomineeInvest() async {
    try {
      KycPersonalDetailsRequestModel personalDetails =
          KycPersonalDetailsRequestModel(
        fatherName: fatherNameController.text,
        streetAddress: addressController.text,
        pinCode: pinControler.text,
        state: theChangedValue.value,
        country: 'INDIA',
        nomineeName: nomineeFnameController.text,
        relation: nomineeRelationValue,
        dob: dobCtrl.text,
      );
      print("fatherName:::${fatherNameController.text}");
      print("Address:::${addressController.text}");
      print("pinCode:::${pinControler.text}");
      print("state:::${theChangedValue.value}");
      print("country:::${'INDIA'}");
      print("relation:::$nomineeRelationValue");
      print("nomineeName:::${nomineeFnameController.text}");
      //Api Call
      var response = await NetWorkHandler.putToken(
          kycPersonalDetailsRequestModelToJson(personalDetails),
          'user/update/details');

      var data = jsonDecode(response);

      if (data["isError"] == false) {
        var actualresponse = KycPersonalDetailsResponseModel.fromJson(data);
        update();
        PrivilegeCardController();
        kycDocsStatus();
        PrivilegeCardController.to.userPersonalDetails();
        PrivilegeCardController.to.privilegecardStatus();
       
        Get.toNamed(Routes.updatekyc);
        print("Response::: ${actualresponse.isError.toString()}");
        PrivilegeCardController.to.isprivilegecardExists();
      } else {
        Get.defaultDialog(middleText: data["message"].toString());
      }
    } catch (e) {
      print("Error Logout ::: $e");
    }
  }

  void kycDocsStatus() async {
    // try {
    var response = await NetWorkHandler.get('kyc/user');
    var data = jsonDecode(response);
    if (data["isError"] == false) {
      kycdocsmodel = KycDocsModel.fromJson(data);
      update();
      print("Response::: $data");
    }
    // } catch (e) {
    //   print("Error Logout ::: $e");
    // }
  }
}
