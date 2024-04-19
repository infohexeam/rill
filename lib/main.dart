
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_custom_utils/util/context_utils.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:overlay_support/overlay_support.dart';

import 'Utils/app_pages.dart';
import 'Utils/app_routes.dart';
import 'Utils/com_binding.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // runApp(MyApp());
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitUp,DeviceOrientation.portraitDown])
      .then((_) { runApp(MyApp());},
  );
}


class MyApp extends StatefulWidget {

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  void initState() {
    super.initState();

   getToken();
  }
  String? token;
  getToken() async {
    token = (await FirebaseMessaging.instance.getToken())!;
  }
  @override
  Widget build(BuildContext context) {
    return
    OverlaySupport(
      child: GetMaterialApp(
        debugShowCheckedModeBanner: false,
        initialRoute: Routes.authentication,
        initialBinding: comBinding(),
        defaultTransition: Transition.fade,
        theme: ThemeData(fontFamily: 'SfPro'),
        builder: EasyLoading.init(
          builder: (context, child) {
            return MediaQuery(
              data: mQuery(context).copyWith(
                textScaleFactor: context.cIsTablet ? 1.2 : 1.0,
              ),
              child: child ?? const Text('error'),
            );
          },
        ),
        getPages: AppPages.pages,
      ),
    );
  }
}

