import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:rill_repository/ui/kyc_form/bind/kyc_form_binding.dart';

import '../../../Utils/com_binding.dart';
import '../../../Utils/network_handler.dart';
import '../../../Utils/session_keys.dart';

class UploadFileService {
  // Future<void> sendFile(String mimeType) async {
  //   var url = Uri.parse('https://api.rillhospital.co.in/kyc/user-pan');
  //   var file = File('/path/to/file');
  //   var request = http.MultipartRequest('PUT', url);
  //
  //   var fileStream = http.ByteStream(file.openRead());
  //   var fileLength = await file.length();
  //
  //   // var mimeType = 'application/pdf'; // specify your desired mimetype here
  //   var multipartFile = http.MultipartFile(
  //     'panNumber',
  //     fileStream,
  //     fileLength,
  //     filename: file.path.split('/').last,
  //     contentType: MediaType.parse(mimeType), // specify mimetype here
  //   );
  //
  //   request.files.add(multipartFile);
  //
  //   var response = await request.send();
  //   if (response.statusCode == 200) {
  //     print('File sent successfully');
  //   } else {
  //     print('Error sending file');
  //   }
  // }
  Future<int> uploadFiles({File? file, String? aadharNo,String? mimeType}) async {
    ///MultiPart request
    var request = http.MultipartRequest(
      'PUT',
      Uri.parse("${NetWorkHandler.baseUrl}kyc/user-aadhaar"),
    );
    Map<String, String> headers = {
      "Authorization":
          "Bearer ${AppSession.to.session.read(SessionKeys.bearer_token)}",
      // "Content-type": mimeType!
      "Content-type": "multipart/form-data"

    };
    request.files.add(
      await http.MultipartFile.fromPath('aadhaar', file!.path,contentType:MediaType.parse(mimeType!)),
    );
    request.headers.addAll(headers);

    request.fields.addAll({
      "aadhaarNumber": aadharNo!,
    });
    if (kDebugMode || kReleaseMode) {
      print("request: $request");
      print("endpoints: $aadharNo");
      print("file: ${file.path}");
    }
    EasyLoading.show(status: 'uploading...');
    var res = await request.send();

    final respStr = await res.stream.bytesToString();
    EasyLoading.dismiss();
    if (kDebugMode || kReleaseMode) {
      print("This is response:$respStr");
      // Get.defaultDialog(middleText: 'Aadhar Uploaded Successfully');
      KycFormController.to.kycDocsStatus();
      KycFormController();
    }
    return res.statusCode;
  }

  Future<int> uploadFilesPan({File? file, String? panNo,String? mimeType}) async {
    ///MultiPart request
    var request = http.MultipartRequest(
      'PUT',
      Uri.parse("${NetWorkHandler.baseUrl}kyc/user-pan"),
    );
    Map<String, String> headers = {
      "Authorization":
          "Bearer ${AppSession.to.session.read(SessionKeys.bearer_token)}",
      "Content-type": "multipart/form-data"
    };
    request.files.add(
      await http.MultipartFile.fromPath('pan', file!.path,contentType:MediaType.parse(mimeType!)),
    );
    request.headers.addAll(headers);

    request.fields.addAll({
      "panNumber": panNo!,
    });
    if (kDebugMode || kReleaseMode) {
      print("request: $request");
    }
    EasyLoading.show(status: 'uploading...');
    var res = await request.send();
    final respStr = await res.stream.bytesToString();
    EasyLoading.dismiss();
    if (kDebugMode || kReleaseMode) {
      print("This is response:$respStr");
      // Get.defaultDialog(middleText: 'Pan Uploaded Successfully');
      KycFormController.to.kycDocsStatus();
      KycFormController();
    }
    return res.statusCode;
  }

  Future<int> uploadFilesBank(
      {File? file, String? bankno, String? name, String? ifscCode,String? mimetype}) async {
    ///MultiPart request
    var request = http.MultipartRequest(
      'PUT',
      Uri.parse("${NetWorkHandler.baseUrl}kyc/user-bank"),
    );
    Map<String, String> headers = {
      "Authorization":
          "Bearer ${AppSession.to.session.read(SessionKeys.bearer_token)}",
      "Content-type": "multipart/form-data"
    };
    request.files.add(
      await http.MultipartFile.fromPath('bank', file!.path,contentType:MediaType.parse(mimetype!)),
    );
    request.headers.addAll(headers);

    request.fields.addAll({
      "accountNumber": bankno!,
      "name": name!,
      "ifscCode": ifscCode!,
    });
    if (kDebugMode || kReleaseMode) {
      print("request: $request");
    }
    EasyLoading.show(status: 'uploading...');
    var res = await request.send();
    final respStr = await res.stream.bytesToString();
    EasyLoading.dismiss();
    if (kDebugMode || kReleaseMode) {
      print("This is response:$respStr");
      // Get.defaultDialog(middleText: 'Bank details Uploaded Successfully');
      KycFormController.to.kycDocsStatus();
    }
    return res.statusCode;
  }
  Future<int> uploadFilesBankWihoutDoc(
      {File? file, String? bankno, String? name, String? ifscCode}) async {
    ///MultiPart request
    var request = http.MultipartRequest(
      'PUT',
      Uri.parse("${NetWorkHandler.baseUrl}kyc/user-bank"),
    );
    Map<String, String> headers = {
      "Authorization":
          "Bearer ${AppSession.to.session.read(SessionKeys.bearer_token)}",
      "Content-type": "multipart/form-data"
    };
    // request.files.add(
    //   await http.MultipartFile.fromPath('bank', file!.path),
    // );
    request.headers.addAll(headers);

    request.fields.addAll({
      "accountNumber": bankno!,
      "name": name!,
      "ifscCode": ifscCode!,
    });
    if (kDebugMode || kReleaseMode) {
      print("request: $request");
    }
    EasyLoading.show(status: 'uploading...');
    var res = await request.send();
    final respStr = await res.stream.bytesToString();
    EasyLoading.dismiss();
    if (kDebugMode || kReleaseMode) {
      print("This is response:$respStr");
      // Get.defaultDialog(middleText: 'Bank details Uploaded Successfully');
      KycFormController.to.kycDocsStatus();
    }
    return res.statusCode;
  }

  Future<int> uploadFilesPassport({File? file, String? passportNo,String? mimetype}) async {
    ///MultiPart request
    var request = http.MultipartRequest(
      'PUT',
      Uri.parse("${NetWorkHandler.baseUrl}kyc/user-passport"),
    );
    Map<String, String> headers = {
      "Authorization":
          "Bearer ${AppSession.to.session.read(SessionKeys.bearer_token)}",
      "Content-type": "multipart/form-data"
    };
    request.files.add(
      await http.MultipartFile.fromPath(
        'passport',
        file!.path,
          contentType:MediaType.parse(mimetype!)
      ),
    );
    request.headers.addAll(headers);

    request.fields.addAll({
      "passportNumber": passportNo!,
    });
    if (kDebugMode || kReleaseMode) {
      print("request: $request");
    }
    EasyLoading.show(status: 'uploading...');
    var res = await request.send();
    final respStr = await res.stream.bytesToString();
    EasyLoading.dismiss();
    if (kDebugMode || kReleaseMode) {
      print("This is response:$respStr");
      // Get.defaultDialog(middleText: 'Passport details Uploaded Successfully');
      KycFormController.to.kycDocsStatus();
    }
    return res.statusCode;
  }
}
