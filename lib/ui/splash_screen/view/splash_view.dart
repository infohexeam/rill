import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rill_repository/Utils/app_routes.dart';
import 'package:rill_repository/Utils/colors_list.dart';
import 'package:rill_repository/ui/splash_screen/bind/splash_binding.dart';

import '../../../Utils/com_binding.dart';
import '../../../Utils/session_keys.dart';
import '../../../constants/constant.dart';
import '../model/firebase_token_model.dart';

Future _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  print("Handling a background message: ${message.messageId}");
}

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  late final FirebaseMessaging _messaging;
  late int _totalNotifications;
  PushNotification? _notificationInfo;
  void registerNotification() async {
    // 1. Initialize the Firebase app
    await Firebase.initializeApp();
    // 2. Instantiate Firebase Messaging
    _messaging = FirebaseMessaging.instance;
    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    // 3. On iOS, this helps to take the user permissions
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      if (kDebugMode) {
        print('User granted permission');
      }
      FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) async {
        PushNotification notification = PushNotification(
          title: message.notification?.title,
          body: message.notification?.body,
        );

        setState(() {
          _notificationInfo = notification;
          _totalNotifications++;
        });

      });
      FirebaseMessaging.onMessage.listen((RemoteMessage message) {
        // Parse the message received
        PushNotification notification = PushNotification(
          title: message.notification?.title,
          body: message.notification?.body,
        );

        setState(() {
          _notificationInfo = notification;
          _totalNotifications++;
        });
      });
    } else {
      print('User declined or has not accepted permission');
    }
  }

  checkForInitialMessage() async {
    await Firebase.initializeApp();
    RemoteMessage? initialMessage =
        await FirebaseMessaging.instance.getInitialMessage();

    if (initialMessage != null) {
      PushNotification notification = PushNotification(
        title: initialMessage.notification?.title,
        body: initialMessage.notification?.body,
      );
      setState(() {
        _notificationInfo = notification;
        _totalNotifications++;
      });
    }
  }

  @override
  void initState() {
    checkForInitialMessage();
    // For handling notification when the app is in background but not terminated
    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      PushNotification notification = PushNotification(
        title: message.notification?.title,
        body: message.notification?.body,
      );
      setState(() {
        _notificationInfo = notification;
        _totalNotifications++;
      });
    });
    // getToken();
    // splashController.to.sendToken(token!);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: bgcolor,
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
              height: size.height * 0.3,
              child: Image.asset("assets/images/logo.png")),
          SizedBox(
              height: size.height * 0.4,
              child: Image.asset("assets/images/splash.png")),
          SizedBox(
            height: size.height * 0.3,
            child: Column(
              children: [
                const SizedBox(
                  height: 40,
                ),
                AppSession.to.session.read(SessionKeys.bearer_token) == null
                    ? InkWell(
                        onTap: () {
                          Get.toNamed(Routes.onboarding);
                        },
                        child: Container(
                          decoration: BoxDecoration(
                              color: bgcolor,
                              borderRadius: BorderRadius.circular(6)),
                          margin: const EdgeInsets.only(left: 15, right: 15),
                          width: size.width,
                          height: 45,
                          child: Center(
                              child: Text(
                            'GET STARTED',
                            style: Constants.customStyle(
                                20.0, bgcolor, FontWeight.bold),
                          )),
                        ))
                    : Container(
                        decoration: BoxDecoration(
                            color: bgcolor,
                            borderRadius: BorderRadius.circular(6)),
                        margin: const EdgeInsets.only(left: 15, right: 15),
                        width: size.width,
                        height: 45,
                        child: Center(
                            child: Text(
                          '',
                          style: Constants.customStyle(
                              20.0, Colors.white, FontWeight.bold),
                        )),
                      ),
                const SizedBox(
                  height: 40,
                ),
                const Text(
                  'Othukkungal, Malappuram Dt, 676528\nrillhospitalothukkungal@gmail.com\nRillhospital.com',
                  textAlign: TextAlign.center,
                ),
                // Text(
                //   'BODY: ${_notificationInfo?.body??''}',
                //   style: const TextStyle(
                //     fontWeight: FontWeight.bold,
                //     fontSize: 16.0,
                //   ),
                // ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PushNotification {
  PushNotification({
    this.title,
    this.body,
  });
  String? title;
  String? body;
}
