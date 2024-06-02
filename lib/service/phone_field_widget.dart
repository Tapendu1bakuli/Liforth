/*
 * File name: phone_field_widget.dart
 * Last modified: 2022.02.04 at 14:21:01
 * Author: SmarterVision - https://codecanyon.net/user/smartervision
 * Copyright (c) 2022
 */

import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizing/sizing.dart';

import '../device_manger/screen_constants.dart';
import '../utils/colors/app_colors.dart';
import 'intl_phone_field/countries.dart';
import 'intl_phone_field/country_picker_dialog.dart';
import 'intl_phone_field/intl_phone_field.dart';
import 'intl_phone_field/phone_number.dart';

class PhoneFieldWidget extends StatelessWidget {
  const PhoneFieldWidget(
      {Key? key,
      this.onSaved,
      this.onChanged,
      this.validator,
      this.initialValue,
      this.hintText,
      this.errorText,
      this.labelText,
      this.obscureText = false,
      this.suffixIcon,
      this.style,
      this.textAlign,
      this.suffix,
      this.initialCountryCode,
        this.textEditingController,
        this.hintStyle,
        this.labelStyle,
        this.isReadOnly = false,
        this.showCountryFlag = false,
        this.countries})
      : super(key: key);

  final FormFieldSetter<PhoneNumber>? onSaved;
  final ValueChanged<PhoneNumber>? onChanged;
  final FutureOr<String?> Function(PhoneNumber?)? validator;
  final String? initialValue;
  final String? hintText;
  final TextEditingController? textEditingController;
  final TextStyle? hintStyle;
  final TextStyle? labelStyle;
  final bool isReadOnly;
  final bool showCountryFlag;
  final String? errorText;
  final TextAlign? textAlign;
  final String? labelText;
  final TextStyle? style;
  final bool obscureText;
  final String? initialCountryCode;
  final List<String>? countries;
  final Widget? suffixIcon;
  final Widget? suffix;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        // Text(
        //   labelText ?? "",
        //   style: Theme.of(context).textTheme.displaySmall,
        //   textAlign: textAlign ?? TextAlign.start,
        // ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 0.0),
          child: IntlPhoneField(
              flagsButtonPadding: EdgeInsets.only(left:10),
            showCountryFlag: showCountryFlag,
              readOnly: isReadOnly,
              key: key,
              onSaved: onSaved,
              onChanged: onChanged,
              validator: validator,
              initialValue: initialValue ?? '',
              initialCountryCode: initialCountryCode ?? 'IN',
              showDropdownIcon: true,
              dropdownIcon: const Icon(Icons.keyboard_arrow_down_rounded),
              pickerDialogStyle: PickerDialogStyle(
                  countryCodeStyle:  Theme.of(context).textTheme.bodyLarge!.copyWith(fontFamily: "NunitoSans",color: Get.theme.colorScheme.onSurface),
                  searchFieldCursorColor: Get.theme.colorScheme.primary,
                  countryNameStyle:  Theme.of(context).textTheme.headlineSmall!.copyWith(fontFamily: "NunitoSans",color: Get.theme.colorScheme.onSurface),
                  backgroundColor: Get.theme.colorScheme.onPrimary,
                  searchFieldInputDecoration: InputDecoration(
                      labelText: "Search country",
                      labelStyle: Theme.of(context)
                          .textTheme
                          .displaySmall!
                          .copyWith(fontSize: 15.fss),
                      suffixIcon: Icon(
                        Icons.search,
                        color: Get.theme.colorScheme.primary,
                      ))),
              style: TextStyle(
                      color: Get.theme.colorScheme.onSurface,
                      fontSize: 16.fss,
                      fontFamily: 'NunitoSans'),
              textAlign: textAlign ?? TextAlign.start,
              disableLengthCheck: true,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelText: labelText ?? '',
                hintText: hintText ?? '',
                labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Get.theme.colorScheme.onSurface,
                    fontFamily: 'NunitoSans'),
                hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Get.theme.colorScheme.onSurface,
                    fontFamily: 'NunitoSans'),
                contentPadding: EdgeInsets.all(ScreenConstant.sizeMedium),
                focusedBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                      color: AppColors.primaryColor,
                      width: 1,
                      style: BorderStyle.solid),
                ),
                disabledBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                      color: Color(0xFFEAF0F5),
                      width: 1,
                      style: BorderStyle.solid),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                      color: const Color(0xFFEAF0F5),
                      width: 1,
                      style: BorderStyle.solid),
                ),
                errorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                      color: Color(0xFFE8503A),
                      width: 1,
                      style: BorderStyle.solid),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  borderSide: BorderSide(
                      color: Color(0xFFE8503A),
                      width: 1,
                      style: BorderStyle.solid),
                ),
                errorText: errorText,
              )
          ),
        ),
      ],
    );
  }
}

PhoneNumber getPhoneNumber(String phoneNumber) {
  if (phoneNumber != null && phoneNumber.isNotEmpty) {
    phoneNumber = phoneNumber.replaceAll(' ', '');
    String? dialCode1;
    String? dialCode2;
    String? dialCode3;
    if (phoneNumber.length >= 2) {
      dialCode1 = phoneNumber.substring(1, 2);
    }
    if (phoneNumber.length >= 3) {
      dialCode2 = phoneNumber.substring(1, 3);
    }
    if (phoneNumber.length >= 4) {
      dialCode3 = phoneNumber.substring(1, 4);
    }
    for (int i = 0; i < countries.length; i++) {
      if (countries[i].dialCode == dialCode1) {
        return PhoneNumber(
            countryISOCode: countries[i].code,
            countryCode: dialCode1!,
            number: phoneNumber.substring(2));
      } else if (countries[i].dialCode == dialCode2) {
        return PhoneNumber(
            countryISOCode: countries[i].code,
            countryCode: dialCode2!,
            number: phoneNumber.substring(3));
      } else if (countries[i].dialCode == dialCode3) {
        return PhoneNumber(
            countryISOCode: countries[i].code,
            countryCode: dialCode3!,
            number: phoneNumber.substring(4));
      }
    }
  }
  return new PhoneNumber(countryISOCode: "US", countryCode: '1', number: '');
}
