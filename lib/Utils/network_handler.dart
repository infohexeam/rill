// ignore_for_file: non_constant_identifier_names, prefer_const_constructors

import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:rill_repository/Utils/com_binding.dart';
import 'package:rill_repository/Utils/session_keys.dart';

import 'app_routes.dart';

class NetWorkHandler {
  // static const baseUrl = 'https://api.rill.stackrootssandbox.co.in/';
  static const baseUrl = 'https://api.rillhospital.co.in/';
  // static const baseUrl = 'https://api.rillhospital.co.in/';
  static final client = http.Client();

  //TODO ApiCall post method
  static Future<String> post(var body, String endpoint) async {
    var response = await client.post(buildUrl(endpoint), body: body, headers: {
      "Content-type": "application/json",
      // "authorization": "Bearer ${'token'}",
    });
    // if (response.statusCode == 401) {
    //   AppSession.to.session.erase();
    //   Get.offAllNamed(Routes.login);
    //   Get.snackbar('Session Expired',
    //       'Your account has been logged in on another device',
    //       duration: Duration(seconds: 5));
    // }
    print("Api Url ::: ${buildUrl(endpoint)}");
    print("response = ${response.body}");
    return response.body;
  }

  //TODO ApiCall post method with token
  static Future<String> postToken(var body, String endpoint) async {
    var response = await client.post(buildUrl(endpoint), body: body, headers: {
      "Content-type": "application/json",
      "authorization":
          "Bearer ${AppSession.to.session.read(SessionKeys.bearer_token)}",
    });
    // if (response.statusCode == 401) {
    //   AppSession.to.session.erase();
    //   Get.offAllNamed(Routes.login);
    //   Get.snackbar('Session Expired',
    //       'Your account has been logged in on another device',
    //       duration: Duration(seconds: 5));
    // }
    print("Api Url ::: ${buildUrl(endpoint)}");
    print(
        "Bearer Token ::: ${AppSession.to.session.read(SessionKeys.bearer_token)}");
    print("response = ${response.body}");
    return response.body;
  }

  //TODO ApiCall put method
  static Future<String> putToken(var body, String endpoint) async {
    var response = await client.put(buildUrl(endpoint), body: body, headers: {
      "Content-type": "application/json",
      "authorization":
          "Bearer ${AppSession.to.session.read(SessionKeys.bearer_token)}",
    });
    // if (response.statusCode == 401) {
    //   AppSession.to.session.erase();
    //   Get.offAllNamed(Routes.login);
    //   Get.snackbar('Session Expired',
    //       'Your account has been logged in on another device',
    //       duration: Duration(seconds: 5));
    // }
    print("Api Url ::: ${buildUrl(endpoint)}");
    print(
        "Bearer Token ::: ${AppSession.to.session.read(SessionKeys.bearer_token)}");
    print("response = ${response.body}");
    return response.body;
  }

  //TODO ApiCall post  without body method with token
  static Future<String> postWithoutBody(String endpoint) async {
    var response = await client.post(buildUrl(endpoint), headers: {
      "Content-type": "application/json",
      "authorization":
          "Bearer ${AppSession.to.session.read(SessionKeys.bearer_token)}",
    });
    // if (response.statusCode == 401) {
    //   AppSession.to.session.erase();
    //   Get.offAllNamed(Routes.login);
    //   Get.snackbar('Session Expired',
    //       'Your account has been logged in on another device',
    //       duration: Duration(seconds: 5));
    // }
    print(response.statusCode);
    print("Api Url ::: ${buildUrl(endpoint)}");
    print(
        "Bearer Token ::: ${AppSession.to.session.read(SessionKeys.bearer_token)}");
    print("response = ${response.body}");
    return response.body;
  }

  //TODO ApiCall get method
  static Future<String> get(
    String endpoint,
  ) async {
    var response = await client.get(buildUrl(endpoint), headers: {
      "Content-type": "application/json",
      "authorization":
          "Bearer ${AppSession.to.session.read(SessionKeys.bearer_token)}",
    });
    if (response.statusCode == 401) {
      AppSession.to.session.erase();
      Get.offAllNamed(Routes.login);
      // Get.snackbar('Session Expired',
      //     'Your account has been logged in on another device',
      //     duration: Duration(seconds: 5));
    }
    print("Api Url ::: ${buildUrl(endpoint)}");
    print(
        "Bearer Token ::: ${AppSession.to.session.read(SessionKeys.bearer_token)}");
    print("response = ${response.body}");
    return response.body;
  }

  Future<String> postfc(Map<String, dynamic> json) async {
    var response = await client
        .post(buildUrl("investment/user/rfc"), body: json, headers: {
      "Content-type": "application/json",
      "authorization":
          "Bearer ${AppSession.to.session.read(SessionKeys.bearer_token)}",
    });
    // if (response.statusCode == 401) {
    //   AppSession.to.session.erase();
    //   Get.offAllNamed(Routes.login);
    //   Get.snackbar('Session Expired',
    //       'Your account has been logged in on another device',
    //       duration: Duration(seconds: 5));
    // }
    print("Api Url ::: ${buildUrl("investment/user/rfc")}");
    print(
        "Bearer Token ::: ${AppSession.to.session.read(SessionKeys.bearer_token)}");
    print("response = ${response.body}");
    return response.body;
  }
  // uploadFile() async {
  //   var postUri = Uri.parse("${baseUrl}/kyc/user-aadhaar");
  //   var request = http.MultipartRequest("PUT", postUri);
  //   request.fields['aadhaar'] = '4111411141114111';
  //   request.files.add(http.MultipartFile.fromBytes('file', await File.fromUri(uri).readAsBytes(), contentType: MediaType('image', 'jpeg')))
  //
  //   request.send().then((response) {
  //     if (response.statusCode == 200) print("Uploaded!");
  //   });
  // }

  static Uri buildUrl(String endpoint) {
    String host = baseUrl;
    final apiPath = host + endpoint;
    if (kDebugMode) {
      // print(apiPath.toString());
    }
    return Uri.parse(apiPath);
  }
}
