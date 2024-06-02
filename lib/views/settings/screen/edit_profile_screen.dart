// ignore_for_file: deprecated_member_use, avoid_print

import 'package:country_picker/country_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:lightforth/service/required_text_field.dart';
import 'package:lightforth/utils/text_utils/text_utils.dart';
import 'package:provider/provider.dart';
import 'package:sizing/sizing.dart';

import '../../../darkmode/notifier/dark_theme_provider.dart';
import '../../../device_manger/screen_constants.dart';
import '../../../utils/colors/app_colors.dart';
import '../../../utils/image_utils/image_utils.dart';
import '../../../utils/widgets_utils/app_button.dart';
import '../controller/settings_controller.dart';

// ignore: must_be_immutable
class EditProfile extends StatelessWidget {
  SettingsController _settingsController = Get.put(SettingsController());

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<DarkThemeProvider>(context);
    return Scaffold(
      backgroundColor: Theme.of(context).focusColor,
      appBar: AppBar(
        scrolledUnderElevation: 0.0,
        //leadingWidth: 40.ss,
        backgroundColor: themeProvider.darkTheme
            ? AppColors.darkBackgroundColor
            : AppColors.lightBackgroundColor,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: Padding(
            padding: EdgeInsets.only(left: 15.0.ss),
            child: SvgPicture.asset(
              "asset/images/forgotPasswordAppbarLeadingBack.svg",
              // height: 20.ss,
            ),
          ),
        ),
        centerTitle: true,
        title: Text("Edit Profile",
            style: TextStyle(
                color: themeProvider.darkTheme
                    ? Colors.white
                    : const Color(0xFF121212),
                fontSize: 18.fss,
                fontWeight: FontWeight.bold,
                fontFamily: 'GorditaBold')),
      ),
      body: Obx(
        () => Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.ss),
          child: ListView(
            children: [
              Container(
                height: 24.ss,
              ),
              InkWell(
                splashColor: Colors.transparent,
                onTap: () {
                  print("Change Profile Image");
                  modalBottomSheetMenu(context, () {}, isFront: false);
                },
                child: Stack(
                  children: [
                    Container(
                      height: 120.ss,
                    ),
                    Center(
                      child: Container(
                        width: 96.ss,
                        height: 96.ss,
                        decoration: const ShapeDecoration(
                          image: DecorationImage(
                            image: NetworkImage(
                                "https://cdn.pixabay.com/photo/2023/01/28/20/23/ai-generated-7751688_1280.jpg"),
                            fit: BoxFit.cover,
                          ),
                          shape: OvalBorder(),
                        ),
                      ),
                    ),
                    Positioned(
                        top: 70,
                        right: 115,
                        child:
                            SvgPicture.asset("asset/images/Ellipse_147.svg")),
                    Positioned(
                        top: 75,
                        right: 123,
                        child: SvgPicture.asset("asset/images/export.svg"))
                  ],
                ),
              ),
              _settingsController.editProfileEnabled.value
                  ? const Offstage()
                  : Container(
                      height: 24.ss,
                    ),
              _settingsController.editProfileEnabled.value
                  ? const Offstage()
                  : InkWell(
                      onTap: () {
                        _settingsController.editProfileEnabled.value = true;
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset("asset/images/iconamoon_edit.svg"),
                          Container(
                            width: 10.ss,
                          ),
                          Text(
                            AppStrings.editProfile.tr,
                            style: TextStyle(
                              color: const Color(0xFF111A24),
                              fontSize: 14.fss,
                              fontFamily: 'Gordita',
                            ),
                          ),
                        ],
                      ),
                    ),
              Container(
                height: 48.ss,
              ),
              Text(
                'Full Name',
                style: TextStyle(
                  color: const Color(0xFF111A24),
                  fontSize: 14.fss,
                  fontFamily: 'GorditaBold',
                ),
              ),
              Container(
                height: 8.ss,
              ),
              TextFormField(
                // Only
                controller: _settingsController.editProfileFullNameController,
                keyboardType: TextInputType.name,
                autofocus: false,
                maxLines: 1,
                cursorColor: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.primaryColor,
                textInputAction: TextInputAction.next,
                validator: _settingsController.validateName,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: TextStyle(
                    color: themeProvider.darkTheme
                        ? AppColors.whiteColor
                        : const Color(0xFF111A24),
                    fontSize: 14.fss,
                    fontFamily: 'Gordita'),
                decoration: InputDecoration(
                  errorMaxLines: 2,
                  hintText: "Emeka Adebayo",
                  hintStyle: TextStyle(
                      color: const Color(0xFF6C7E8E),
                      fontSize: 14.fss,
                      fontFamily: 'Gordita'),
                  errorStyle: TextStyle(
                      color: const Color(0xFFE8503A),
                      fontSize: 12.fss,
                      fontFamily: 'Gordita'),
                  prefixIcon: Obx(
                    () => Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SvgPicture.asset(
                        "asset/images/userIcon.svg",
                        color: _settingsController.isUserNameError.value
                            ? const Color(0xFFE8503A)
                            : themeProvider.darkTheme
                                ? const Color(0xFF6C7E8E)
                                : AppColors.primaryColor,
                      ),
                    ),
                  ),
                  contentPadding: EdgeInsets.all(ScreenConstant.sizeMedium),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: AppColors.primaryColor,
                        width: 1,
                        style: BorderStyle.solid),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: themeProvider.darkTheme
                            ? const Color(0xFF506375)
                            : const Color(0xFFEAF0F5),
                        width: 1,
                        style: BorderStyle.solid),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: themeProvider.darkTheme
                            ? const Color(0xFF506375)
                            : const Color(0xFFEAF0F5),
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
                ),
              ),
              Container(
                height: 16.ss,
              ),
              Text(
                'Email',
                style: TextStyle(
                  color: const Color(0xFF111A24),
                  fontSize: 14.fss,
                  fontFamily: 'GorditaBold',
                ),
              ),
              Container(
                height: 8.ss,
              ),
              TextFormField(
                controller: _settingsController.editProfileEmailController,
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                maxLines: 1,
                cursorColor: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.primaryColor,
                textInputAction: TextInputAction.next,
                validator: _settingsController.validateEmail,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: TextStyle(
                    color: themeProvider.darkTheme
                        ? AppColors.whiteColor
                        : const Color(0xFF111A24),
                    fontSize: 14.fss,
                    fontFamily: 'Gordita'),
                decoration: InputDecoration(
                  hintText: "Enter your email",
                  hintStyle: TextStyle(
                      color: const Color(0xFF6C7E8E),
                      fontSize: 14.fss,
                      fontFamily: 'Gordita'),
                  errorStyle: TextStyle(
                      color: const Color(0xFFE8503A),
                      fontSize: 12.fss,
                      fontFamily: 'Gordita'),
                  prefixIcon: Obx(() => Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: SvgPicture.asset(
                          "asset/images/mailIcon.svg",
                          color: _settingsController.isEmailError.value
                              ? const Color(0xFFE8503A)
                              : themeProvider.darkTheme
                                  ? const Color(0xFF6C7E8E)
                                  : AppColors.primaryColor,
                        ),
                      )),
                  contentPadding: EdgeInsets.all(ScreenConstant.sizeMedium),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: AppColors.primaryColor,
                        width: 1,
                        style: BorderStyle.solid),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: themeProvider.darkTheme
                            ? const Color(0xFF506375)
                            : const Color(0xFFEAF0F5),
                        width: 1,
                        style: BorderStyle.solid),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: themeProvider.darkTheme
                            ? const Color(0xFF506375)
                            : const Color(0xFFEAF0F5),
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
                ),
              ),
              Container(
                height: 16.ss,
              ),
              Text(
                'Phone Number',
                style: TextStyle(
                  color: const Color(0xFF111A24),
                  fontSize: 14.fss,
                  fontFamily: 'GorditaBold',
                ),
              ),
              Container(
                height: 8.ss,
              ),
              RequireTextField(
                showCountryFlag: true,
                initialValue: _settingsController.phone,
                onChangedPhone: (input) {
                  _settingsController.phone = input.completeNumber;
                  _settingsController.editProfilePhoneController.text =
                      input.completeNumber;
                },
                type: Type.phone,
                controller: _settingsController.editProfilePhoneController,
                hintText: "+1 56 3450 4663",
                onSubmit: _settingsController.onSubmit.value,
              ),
              Container(
                height: 16.ss,
              ),
              Text(
                'Location',
                style: TextStyle(
                  color: const Color(0xFF111A24),
                  fontSize: 14.fss,
                  fontFamily: 'GorditaBold',
                ),
              ),
              Container(
                height: 8.ss,
              ),
              TextFormField(
                readOnly: true,
                onTap: () {
                  showCountryPicker(
                    context: context,
                    //Optional.  Can be used to exclude(remove) one ore more country from the countries list (optional).
                    exclude: <String>['KN', 'MF'],
                    favorite: <String>['SE'],
                    //Optional. Shows phone code before the country name.
                    showPhoneCode: true,
                    onSelect: (Country country) {
                      debugPrint('Select country: ${country.displayName}');
                    },
                    // Optional. Sets the theme for the country list picker.
                    countryListTheme: CountryListThemeData(
                      // Optional. Sets the border radius for the bottomsheet.
                      borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(40.0),
                        topRight: Radius.circular(40.0),
                      ),
                      // Optional. Styles the search field.
                      inputDecoration: InputDecoration(
                        labelText: 'Search',
                        hintText: 'Start typing to search',
                        prefixIcon: const Icon(Icons.search),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(
                            color: const Color(0xFF8C98A8).withOpacity(0.2),
                          ),
                        ),
                      ),
                      // Optional. Styles the text in the search field
                      searchTextStyle: const TextStyle(
                        color: Colors.blue,
                        fontSize: 18,
                      ),
                    ),
                  );
                },
                controller: _settingsController.editProfileEmailController,
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                maxLines: 1,
                cursorColor: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.primaryColor,
                textInputAction: TextInputAction.next,
                validator: _settingsController.validateEmail,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: TextStyle(
                    color: themeProvider.darkTheme
                        ? AppColors.whiteColor
                        : const Color(0xFF111A24),
                    fontSize: 14.fss,
                    fontFamily: 'Gordita'),
                decoration: InputDecoration(
                  suffixIcon: const Icon(Icons.keyboard_arrow_down_rounded),
                  hintText: "United States",
                  hintStyle: TextStyle(
                      color: const Color(0xFF111A24),
                      fontSize: 14.fss,
                      fontFamily: 'Gordita'),
                  errorStyle: TextStyle(
                      color: const Color(0xFFE8503A),
                      fontSize: 12.fss,
                      fontFamily: 'Gordita'),
                  prefixIcon: Padding(
                    padding: const EdgeInsets.all(13.0),
                    child: SvgPicture.asset(
                      "asset/images/MaskGroup.svg",
                    ),
                  ),
                  contentPadding: EdgeInsets.all(ScreenConstant.sizeMedium),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: AppColors.primaryColor,
                        width: 1,
                        style: BorderStyle.solid),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: themeProvider.darkTheme
                            ? const Color(0xFF506375)
                            : const Color(0xFFEAF0F5),
                        width: 1,
                        style: BorderStyle.solid),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: themeProvider.darkTheme
                            ? const Color(0xFF506375)
                            : const Color(0xFFEAF0F5),
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
                ),
              ),
              Container(
                height: 16.ss,
              ),
              Text(
                'Birthday',
                style: TextStyle(
                  color: const Color(0xFF111A24),
                  fontSize: 14.fss,
                  fontFamily: 'GorditaBold',
                ),
              ),
              Container(
                height: 8.ss,
              ),
              TextFormField(
                decoration: InputDecoration(
                  hintText: "25 Aug 2001",
                  hintStyle: TextStyle(
                      color: const Color(0xFF6C7E8E),
                      fontSize: 14.fss,
                      fontFamily: 'Gordita'),
                  errorStyle: TextStyle(
                      color: const Color(0xFFE8503A),
                      fontSize: 12.fss,
                      fontFamily: 'Gordita'),
                  prefixIcon: Obx(() => Padding(
                        padding: const EdgeInsets.all(13.0),
                        child: SvgPicture.asset(
                          "asset/images/Calendar.svg",
                          color: _settingsController.isEmailError.value
                              ? const Color(0xFFE8503A)
                              : themeProvider.darkTheme
                                  ? const Color(0xFF6C7E8E)
                                  : AppColors.primaryColor,
                        ),
                      )),
                  contentPadding: EdgeInsets.all(ScreenConstant.sizeMedium),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: AppColors.primaryColor,
                        width: 1,
                        style: BorderStyle.solid),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: themeProvider.darkTheme
                            ? const Color(0xFF506375)
                            : const Color(0xFFEAF0F5),
                        width: 1,
                        style: BorderStyle.solid),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: themeProvider.darkTheme
                            ? const Color(0xFF506375)
                            : const Color(0xFFEAF0F5),
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
                ),
                readOnly: true,
                //set it true, so that user will not able to edit text
                onTap: () async {
                  DateTime? pickedDate = await showDatePicker(
                      context: context,
                      firstDate: DateTime(2010),
                      //DateTime.now() - not to allow to choose before today.
                      lastDate: DateTime(2024));

                  if (pickedDate != null) {
                    print(
                        pickedDate); //pickedDate output format => 2021-03-10 00:00:00.000
                    String formattedDate =
                        DateFormat('yyyy-MM-dd').format(pickedDate);
                    print(formattedDate);
                    _settingsController.editProfileBirthday = formattedDate;
                    //formatted date output using intl package =>  2021-03-16
                    //you can implement different kind of Date Format here according to your requirement
                  } else {
                    print("Date is not selected");
                  }
                },
              ),
              Container(
                height: 16.ss,
              ),
              Text(
                'Bio',
                style: TextStyle(
                  color: const Color(0xFF111A24),
                  fontSize: 14.fss,
                  fontFamily: 'GorditaBold',
                ),
              ),
              Container(
                height: 8.ss,
              ),
              TextFormField(
                controller: _settingsController.editProfileEmailController,
                keyboardType: TextInputType.emailAddress,
                autofocus: false,
                maxLines: 4,
                cursorColor: themeProvider.darkTheme
                    ? AppColors.whiteColor
                    : AppColors.primaryColor,
                textInputAction: TextInputAction.next,
                validator: _settingsController.validateEmail,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                style: TextStyle(
                    color: themeProvider.darkTheme
                        ? AppColors.whiteColor
                        : const Color(0xFF111A24),
                    fontSize: 14.fss,
                    fontFamily: 'Gordita'),
                decoration: InputDecoration(
                  hintText: "Write something about you.",
                  hintStyle: TextStyle(
                      color: const Color(0xFF6C7E8E),
                      fontSize: 14.fss,
                      fontFamily: 'Gordita'),
                  errorStyle: TextStyle(
                      color: const Color(0xFFE8503A),
                      fontSize: 12.fss,
                      fontFamily: 'Gordita'),
                  contentPadding: EdgeInsets.all(ScreenConstant.sizeMedium),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: AppColors.primaryColor,
                        width: 1,
                        style: BorderStyle.solid),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: themeProvider.darkTheme
                            ? const Color(0xFF506375)
                            : const Color(0xFFEAF0F5),
                        width: 1,
                        style: BorderStyle.solid),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: const BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: themeProvider.darkTheme
                            ? const Color(0xFF506375)
                            : const Color(0xFFEAF0F5),
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
                ),
              ),
              Container(
                height: 48.ss,
              ),
              _settingsController.editProfileEnabled.value
                  ? AppButton(
                      onPressed: () {},
                      buttonText: "Save",
                      color: AppColors.primaryColor,
                      borderColor: AppColors.primaryColor,
                      borderRadious: 40,
                      borderWidth: 1,
                      elevation: 0,
                      hight: 50.ss,
                      textStyle: TextStyle(
                        color: AppColors.whiteColor,
                        fontSize: 14.fss,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'GorditaBold',
                      ),
                    )
                  : const Offstage(),
              Container(
                height: 10.ss,
              ),
              _settingsController.editProfileEnabled.value
                  ? OutlinedButton(
                      style: ButtonStyle(
                          side: MaterialStateProperty.all(const BorderSide(
                              color: AppColors.primaryColor,
                              width: 1.0,
                              style: BorderStyle.solid))),
                      onPressed: () {
                        _settingsController.editProfileEnabled.value = false;
                      },
                      child: Text(AppStrings.cancel,
                          style: TextStyle(
                            color: AppColors.primaryColor,
                            fontSize: 14.fss,
                            fontWeight: FontWeight.bold,
                            fontFamily: 'GorditaBold',
                          )))
                  : const Offstage(),
              Container(
                height: 20.ss,
              )
            ],
          ),
        ),
      ),
    );
  }
}
