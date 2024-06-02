

import 'package:get/get.dart';
import 'package:lightforth/views/authentication/screen/link_sent_successful_screen.dart';
import 'package:lightforth/views/authentication/screen/new_password_screen.dart';
import 'package:lightforth/views/authentication/screen/privacy_policy.dart';
import 'package:lightforth/views/authentication/screen/terms_and_conditions_screen.dart';
import 'package:lightforth/views/dashboard/screen/ai_companion.dart';
import 'package:lightforth/views/dashboard/screen/chat_screen.dart';
import 'package:lightforth/views/dashboard/screen/home_top_tabs/ai_mock_home_top.dart';
import 'package:lightforth/views/dashboard/screen/home_top_tabs/auto_apply_home_top.dart';
import 'package:lightforth/views/dashboard/screen/home_top_tabs/resume_ai_home_top.dart';
import 'package:lightforth/views/dashboard/screen/notification_screen.dart';
import 'package:lightforth/views/dashboard/screen/search_screen.dart';
import 'package:lightforth/views/settings/screen/edit_profile_screen.dart';
import 'package:lightforth/views/settings/screen/linked_accounts_screen.dart';
import 'package:lightforth/views/settings/screen/settings_screen.dart';
import '../views/authentication/screen/forget_password_screen.dart';
import '../views/authentication/screen/login_screen.dart';
import '../views/authentication/screen/verification_code_screen.dart';
import '../views/dashboard/screen/home_bottom_sheet_view.dart';
import '../views/dashboard/screen/home_top_tabs/ai_companion_home_top.dart';
import '../views/landing_screen/screens/landing_screen.dart';
import '../views/authentication/screen/signup_screen.dart';
import '../views/splashscreen/screen/splash_screen.dart';
import 'route_constants.dart';

class NavRouter {
  static final generateRoute = [
    GetPage(
      name: splash,
      page: () => const SplashScreen(),
    ),
    GetPage(
      name: landing,
      page: () => LandingScreen(),
    ),
    GetPage(
      name: signUp,
      page: () => SignUp(),
    ),
    GetPage(
      name: login,
      page: () => Login(),
    ),
    GetPage(
      name: forgotPassword,
      page: () => ForgotPassword(),
    ),
    GetPage(
      name: sendLinkSuccessful,
      page: () => const LinkSentSuccessful(),
    ),
    GetPage(
      name: verificationCodeScreen,
      page: () => VerificationCodeScreen(),
    ),
    GetPage(
      name: newPassword,
      page: () => NewPassword(),
    ),
    GetPage(
      name: homeBottomSheetView,
      page: () => HomeBottomNavigationScreenForPatient(),
    ),
    GetPage(
      name: termsAndConditions,
      page: () => const TermsAndCondition(),
    ),
    GetPage(
      name: privacyPolicy,
      page: () => const PrivacyPolicy(),
    ),
    GetPage(
      name: chatScreen,
      page: () => const ChatScreen(),
    ),
    GetPage(
      name: notificationScreen,
      page: () => const NotificationScreen(),
    ),
    GetPage(
      name: settingsScreen,
      page: () => SettingsScreen(),
    ),
    GetPage(
      name: editProfile,
      page: () => EditProfile(),
    ),
    GetPage(
      name: linkedAccounts,
      page: () => LinkedAccounts(),
    ),
    GetPage(
      name: searchScreen,
      page: () => SearchScreen(),
    ),
    GetPage(
      name: aiCompanion,
      page: () => AICompanionScreen(),
    ),
    GetPage(
      name: resumeAi,
      page: () => ResumeAIScreen(),
    ),
    GetPage(
      name: autoApply,
      page: () => AutoApplyScreen(),
    ),
    GetPage(
      name: aiMock,
      page: () => AIMockScreen(),
    ),
  ];
}
