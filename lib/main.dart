import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';
import 'package:sizing/sizing.dart';
import 'darkmode/darkutils/styles.dart';
import 'darkmode/notifier/dark_theme_provider.dart';
import 'routers/nav_router.dart';
import 'routers/route_constants.dart';
import 'stores/hive_store.dart';

// /// To verify things are working, check out the native platform logs.
// Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
//   // If you're going to use other Firebase services in the background, such as Firestore,
//   // make sure you call `initializeApp` before using other Firebase services.
//   await Firebase.initializeApp();
//   print('Handling a background message ${message.messageId}');
// }

// /// Create a [AndroidNotificationChannel] for heads up notifications
// const AndroidNotificationChannel channel = AndroidNotificationChannel(
//   'high_importance_channel', // id
//   'High Importance Notifications', // title
//   //'This channel is used for important notifications.', // description
//   importance: Importance.high,
// );

// /// Initialize the [FlutterLocalNotificationsPlugin] package.
// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await HiveStore().initBox();
  // await Firebase.initializeApp(
  //     //  options: DefaultFirebaseOptions.currentPlatform,
  //     );
  // if (!GetPlatform.isWeb) {
  //   await flutterLocalNotificationsPlugin
  //       .resolvePlatformSpecificImplementation<
  //           AndroidFlutterLocalNotificationsPlugin>()
  //       ?.createNotificationChannel(channel);
  // }

  // /// Update the iOS foreground notification presentation options to allow
  // /// heads up notifications.
  // await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
  //   alert: true,
  //   badge: true,
  //   sound: true,
  // );
  // // Set the background messaging handler early on, as a named top-level function
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  // WidgetsFlutterBinding.ensureInitialized();

  // await HiveStore().initBox();
  runApp(LightForth());
}

class LightForth extends StatefulWidget {
  const LightForth({Key? key}) : super(key: key);

  @override
  State<LightForth> createState() => _LightForthState();
}

class _LightForthState extends State<LightForth> with WidgetsBindingObserver {
  DarkThemeProvider themeChangeProvider = DarkThemeProvider();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    getCurrentAppTheme();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    WidgetsBinding.instance.removeObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      var brightness =
          SchedulerBinding.instance.platformDispatcher.platformBrightness;
      bool isDarkMode = brightness == Brightness.dark;

      debugPrint("isDarkMode:- $isDarkMode");
      if (isDarkMode) {
        themeChangeProvider.darkTheme = true;
      } else {
        themeChangeProvider.darkTheme = false;
      }
    }
  }

  void getCurrentAppTheme() async {
    themeChangeProvider.darkTheme =
        await themeChangeProvider.darkThemePreference.getTheme();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var brightness =
        SchedulerBinding.instance.platformDispatcher.platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    if (isDarkMode) {
      themeChangeProvider.darkTheme = true;
    } else {
      themeChangeProvider.darkTheme = false;
    }
    return ChangeNotifierProvider(
      create: (_) {
        return themeChangeProvider;
      },
      child: Consumer<DarkThemeProvider>(
        builder: (context, value, child) {
          return SizingBuilder(
              builder: () => GetMaterialApp(
                    debugShowCheckedModeBanner: false,
                    initialRoute: splash,
                    defaultTransition: Transition.fade,
                    getPages: NavRouter.generateRoute,
                    useInheritedMediaQuery: true,
                    theme: Styles.themeData(
                        themeChangeProvider.darkTheme, context),
                    title: "LightForth",
                  ));
        },
      ),
    );
  }
}
