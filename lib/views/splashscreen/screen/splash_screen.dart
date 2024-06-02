// ignore_for_file: unnecessary_null_comparison

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:sizing/sizing.dart';
import '../../../device_manger/screen_constants.dart';
import '../../../routers/route_constants.dart';
import '../../../stores/hive_store.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController controller;

  Future<dynamic> onSelectNotification(String? payload) async {
    /*Do whatever you want to do on notification click. In this case, I'll show an alert dialog*/
    print("payload");
  }

  @override
  void initState() {
    SystemChannels.textInput.invokeMethod('TextInput.hide');
    Timer(const Duration(seconds: 4), () async {
      controller.stop();
      // _saveDeviceToken();

      // ///flutter local notification package
      // var initializationSettingsAndroid =
      //     const AndroidInitializationSettings('notification_icon');
      // var initializationSettingsIOS = const DarwinInitializationSettings();
      // var initializationSettings = InitializationSettings(
      //     android: initializationSettingsAndroid,
      //     iOS: initializationSettingsIOS);
      // flutterLocalNotificationsPlugin.initialize(
      //   initializationSettings,
      //   onDidReceiveNotificationResponse:
      //       (NotificationResponse notificationResponse) {},
      // );
      // FirebaseMessaging.instance.requestPermission();
      // FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      //   RemoteNotification notification = message.notification!;
      //   AndroidNotification android;
      //   AppleNotification ios;
      //   if (GetPlatform.isIOS) {
      //     ios = message.notification!.apple!;
      //     if (notification != null && ios != null) {
      //       flutterLocalNotificationsPlugin.show(
      //           notification.hashCode,
      //           notification.title,
      //           notification.body,
      //           const NotificationDetails(
      //             iOS: DarwinNotificationDetails(),
      //           ));
      //     }
      //   } else {
      //     android = message.notification!.android!;
      //     if (notification != null && android != null) {
      //       flutterLocalNotificationsPlugin.show(
      //           notification.hashCode,
      //           notification.title,
      //           notification.body,
      //           NotificationDetails(
      //             android: AndroidNotificationDetails(
      //               channel.id,
      //               channel.name,
      //               //color: AppColors.primaryColor,
      //               icon: 'notification_icon',
      //             ),
      //           ));
      //     }
      //   }
      //   print("Message : ${message.data}");
      // });

      // FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      //   print('A new onMessageOpenedApp event was published!');
      // });
      String? accessToken = await HiveStore().get(
        Keys.accessToken,
      );
      if (accessToken != null) {
        Get.offAllNamed(homeBottomSheetView,arguments: [HiveStore().get(Keys.userName)]);
      } else {
        Get.offAllNamed(landing);
      }
    });
    controller = AnimationController(
      /// [AnimationController]s can be created with `vsync: this` because of
      /// [TickerProviderStateMixin].
      vsync: this,
      duration: const Duration(seconds: 3),
    )..addListener(() {
        setState(() {});
      });
    controller.repeat();

    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenConstant.setScreenAwareConstant(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Positioned(
              top: 0,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                color: Theme.of(context).splashColor,
              )),
          Positioned(
            top: .2.sh,
            bottom: .2.sh,
            child: Row(
              children: [
                SvgPicture.asset(
                  "asset/images/Logo.svg",
                ),
                Container(
                  width: 10.ss,
                ),
                // SvgPicture.asset(
                //   "asset/images/ExcelMind.svg",
                // ),
              ],
            ),
          ),
          Positioned(
            top: .89.sh,
            left: .2.sw,
            right: .2.sw,
            child: LoadingAnimationWidget.fallingDot(
              color: Colors.white,
              size: 50.ss,
            ),
          ),
        ],
      ),
    );
  }

  // _saveDeviceToken() async {
  //   await HiveStore().initBox();
  //   String? fcmToken = await FirebaseMessaging.instance.getToken();
  //   print("FCM token : $fcmToken");
  //   if (fcmToken != null) {
  //     await HiveStore().put(Keys.FCMTOKEN, fcmToken);
  //     // Hive.box(HiveString.hiveName).put(HiveString.fcmToken,fcmToken);
  //   }
  // }
}
