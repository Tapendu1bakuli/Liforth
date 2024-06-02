import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../utils/text_utils/text_utils.dart';

class SettingsController extends GetxController {
  RxBool switchValue = true.obs;
  RxBool editProfileEnabled = false.obs;
  TextEditingController editProfileFullNameController = TextEditingController();
  TextEditingController editProfileEmailController = TextEditingController();
  TextEditingController editProfileBioController = TextEditingController();
  TextEditingController editProfilePhoneController = TextEditingController();
  var isUserNameError = false.obs;
  var isEmailError = false.obs;
  String editProfileBirthday = "";
  String? phone = "";
  RxBool onSubmit = false.obs;
  RxBool isExpand = false.obs;
  RxList<String> accounts = ["Facebook","Google"].obs;
  RxList<String> accountsIcon = ["asset/images/facebook.svg","asset/images/gmail.svg"].obs;

  String? validateName(String? name) {
    if (name == null || name.trim().isEmpty) {
      isUserNameError.value = true;
      return "Full name is required";
    } else if (!RegExp(r'^[a-zA-Z\s]*$').hasMatch(name)) {
      isUserNameError.value = true;
      return "Full name must contain only alphabet characters";
    } else {
      isUserNameError.value = false;
    }
    return null;
  }

  String? validateEmail(
      String? email,
      ) {
    String pattern =
        r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regex = RegExp(pattern);
    if (email == null || email.isEmpty) {
      isEmailError.value = true;
      return "Email is required";
    } else if (!regex.hasMatch(email)) {
      isEmailError.value = true;
      return AppStrings.pleaseEnterValidEmailAddress.tr;
    } else {
      isEmailError.value = false;
    }
    isEmailError.value = false;
    return null;
  }
}