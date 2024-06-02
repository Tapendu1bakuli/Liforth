import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:lightforth/service/phone_field_widget.dart';
import 'package:lightforth/utils/colors/app_colors.dart';
import 'package:provider/provider.dart';
import 'package:sizing/sizing.dart';

import '../darkmode/notifier/dark_theme_provider.dart';
import '../device_manger/screen_constants.dart';
import 'intl_phone_field/phone_number.dart';

enum Type {
  textFieldWithSuffix,
  calender,
  passWord,
  confirmPassword,
  name,
  phone,
  phoneWithPrefix,
  dateWithSuffix,
  email,
  otp,
  amount,
  search,
  message,
  filterByTypeWithSuffixIcon
}

// ignore: must_be_immutable
class RequireTextField extends StatefulWidget {
  final FormFieldSetter<String>? onSaved;
  final ValueChanged<PhoneNumber>? onChangedPhone;
  final ValueChanged<String>? onChanged;
  final FormFieldValidator<String>? validator;
  final TextEditingController? controller;
  final Type type;
  final caption;
  var errorFree;
  final FocusNode? myFocusNode;
  final hintText;
  final prefixText;
  final mobileNumber;
  final readWriteStatus;
  final onTap;
  final labelText;
  final autoValidate;
  final autoSubmit;
  final verified;
  final suggestions;
  final autoKey;
  final isPast;
  late final initialValue;
  final double? boxHeight;
  final double? boxWidth;
  final Widget? suffixIcon;
  final Widget? prefixIcon;
  final bool isReadOnly;
  final bool showDecoration;
  final bool suffixEnabled;
  final bool prefixEnabled;
  final bool showDecorationForCall;
  final validationFunction;
  bool onSubmit;
  bool showCountryFlag;

  RequireTextField({
    Key? key,
    required this.type,
    this.controller,
    this.onSaved,
    this.onChanged,
    this.onChangedPhone,
    this.validator,
    this.prefixText,
    this.caption,
    this.errorFree,
    this.myFocusNode,
    this.hintText,
    this.mobileNumber,
    this.readWriteStatus,
    this.onTap,
    this.labelText,
    this.autoValidate,
    this.autoSubmit,
    this.verified = false,
    this.showCountryFlag = false,
    this.suggestions,
    this.autoKey,
    this.initialValue,
    this.isPast = false,
    this.boxHeight,
    this.boxWidth,
    this.suffixIcon,
    this.prefixIcon,
    this.validationFunction,
    this.isReadOnly = false,
    this.showDecoration = false,
    this.suffixEnabled = true,
    this.prefixEnabled = true,
    this.showDecorationForCall = false,
    this.onSubmit = false,
  }) : super(key: key);

  @override
  _RequireTextFieldState createState() => _RequireTextFieldState();
}

class _RequireTextFieldState extends State<RequireTextField> {
  late TextEditingController _controller;
  late Type type;

  var _value;

  bool _errorFree = true;

  bool validate = false;

  get errorFree => _errorFree;

  Type get _type => widget.type;
  var searchTextField;

  TextEditingController get _thisController =>
      widget.controller ?? TextEditingController();
  late GlobalKey<NavigatorState> navigatorKey;
  bool indicator = true;

  @override
  void initState() {
    super.initState();
    navigatorKey = GlobalKey<NavigatorState>();
  }

  void _handleControllerChanged() {
    if (_thisController.text != _value || _value.trim().isNotEmpty)
      didChange(_thisController.text);
  }

  void didChange(var value) {
    setState(() {
      _value = value;
    });
  }

  @override
  void didUpdateWidget(RequireTextField oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      oldWidget.controller!.removeListener(_handleControllerChanged);
      widget.controller!.addListener(_handleControllerChanged);

      if (widget.controller == null) {
        _controller =
            TextEditingController.fromValue(oldWidget.controller!.value);
      }
      _thisController.text = widget.controller!.text;
      if (oldWidget.controller == null) _controller;
    }
  }

  @override
  void dispose() {
    // widget.controller!.removeListener(_handleControllerChanged);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    switch (_type) {
      case Type.otp:
        {
          return BoxEntryTextField(
            // key: Get.isRegistered<ProfileController>()?Get.find<ProfileController>().navigatorKey:Get.find<AuthController>().navigatorKey,
            textColor: Theme.of(context).indicatorColor,
            cursorColor: Colors.red,
            boxColor: Theme.of(context).indicatorColor,
            boxHeight: widget.boxHeight ?? 56.ss,
            boxWidth: widget.boxWidth ?? 56.ss,
            onSubmit: (String pin) {
              setState(() {
                _thisController.text = pin;
              });
            }, // end onSubmit
          );
        }
      case Type.phone:
        {
          return PhoneFieldWidget(
              showCountryFlag: widget.showCountryFlag,
              textEditingController: _thisController,
              labelText: widget.labelText,
              hintStyle:  Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Get.theme.colorScheme.onSurface.withOpacity(0.6),
                  fontFamily: 'NunitoSans'),
              labelStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Get.theme.colorScheme.error,
                  fontFamily: 'NunitoSans'),
              hintText: widget.hintText,
              isReadOnly: widget.isReadOnly,
              initialCountryCode:
              getPhoneNumber(widget.initialValue).countryISOCode,
              initialValue: getPhoneNumber(widget.initialValue).number,
              onChanged: widget.onChangedPhone,
              validator: phoneValidator,
              errorText: validatePhone);
        }

      case Type.amount:
        {
          return TextFormField(
              initialValue: widget.initialValue,
              readOnly: widget.isReadOnly,
              onChanged: widget.onChanged,
              onSaved: widget.onSaved,
              autofocus: false,
              maxLines: 1,
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp("[0-9]"))
              ],
              keyboardType:
                  const TextInputType.numberWithOptions(decimal: true),
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Get.theme.colorScheme.onSurface,
                  fontFamily: 'NunitoSans'),
              decoration: InputDecoration(
                  floatingLabelBehavior: FloatingLabelBehavior.always,
                  labelText: widget.labelText,
                  hintText: widget.hintText,
                  labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Get.theme.colorScheme.onSurface,
                      fontFamily: 'NunitoSans'),
                  hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: Get.theme.colorScheme.onSurface,
                      fontFamily: 'NunitoSans'),
                  contentPadding: EdgeInsets.all(ScreenConstant.sizeMedium),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Get.theme.colorScheme.outline,
                        width: 1.0,
                        style: BorderStyle.solid),
                  ),
                  disabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Get.theme.colorScheme.outline,
                        width: 1.0,
                        style: BorderStyle.solid),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Get.theme.colorScheme.outline,
                        width: 1.0,
                        style: BorderStyle.solid),
                  ),
                  errorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.redAccent,
                        width: 1.0,
                        style: BorderStyle.solid),
                  ),
                  focusedErrorBorder: const OutlineInputBorder(
                    borderSide: BorderSide(
                        color: Colors.redAccent,
                        width: 1.0,
                        style: BorderStyle.solid),
                  ),
                  errorText: validateName));
        }
      case Type.filterByTypeWithSuffixIcon:
        {
          return TextFormField(
              readOnly: widget.isReadOnly,
              controller: _thisController,
              keyboardType:
                  TextInputType.numberWithOptions(signed: true, decimal: true),
              autofocus: false,
              maxLines: 1,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              style: Theme.of(context).textTheme.labelSmall,
              decoration: InputDecoration(
                suffixIcon: widget.suffixIcon,
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelText: widget.labelText,
                hintText: widget.hintText,
                labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Get.theme.colorScheme.onSurface,
                    fontFamily: 'NunitoSans'),
                hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Get.theme.colorScheme.onSurface,
                    fontFamily: 'NunitoSans'),
                contentPadding: EdgeInsets.all(ScreenConstant.sizeMedium),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Get.theme.colorScheme.outline,
                      width: 1.0,
                      style: BorderStyle.solid),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Get.theme.colorScheme.outline,
                      width: 1.0,
                      style: BorderStyle.solid),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Get.theme.colorScheme.outline,
                      width: 1.0,
                      style: BorderStyle.solid),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.redAccent,
                      width: 1.0,
                      style: BorderStyle.solid),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.redAccent,
                      width: 1.0,
                      style: BorderStyle.solid),
                ),
              ));
        }

      case Type.message:
        {
          return TextFormField(
              onChanged: widget.onChanged,
              onTap: widget.onTap,
              readOnly: widget.isReadOnly,
              keyboardType: TextInputType.text,
              autofocus: false,
              maxLines: 5,
              autovalidateMode: AutovalidateMode.onUserInteraction,
              style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                  color: Get.theme.colorScheme.onSurface,
                  fontFamily: 'NunitoSans'),
              decoration: InputDecoration(
                floatingLabelBehavior: FloatingLabelBehavior.always,
                labelText: widget.labelText,
                hintText: widget.hintText,
                labelStyle: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: Get.theme.colorScheme.onSurface,
                    fontFamily: 'NunitoSans'),
                hintStyle: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: Get.theme.colorScheme.onSurface,
                    fontFamily: 'NunitoSans'),
                contentPadding: EdgeInsets.all(ScreenConstant.sizeMedium),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Get.theme.colorScheme.outline,
                      width: 1.0,
                      style: BorderStyle.solid),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Get.theme.colorScheme.outline,
                      width: 1.0,
                      style: BorderStyle.solid),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Get.theme.colorScheme.outline,
                      width: 1.0,
                      style: BorderStyle.solid),
                ),
                errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.redAccent,
                      width: 1.0,
                      style: BorderStyle.solid),
                ),
                focusedErrorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.redAccent,
                      width: 1.0,
                      style: BorderStyle.solid),
                ),
              ));
        }
      default:
        {
          return TextFormField(
            controller: _thisController,
            keyboardType: TextInputType.text,
            autofocus: false,
            maxLines: 1,
            // style: TextStyles.smallHintText,
            decoration: InputDecoration(
              //hintStyle: TextStyles.lowerSubTitle,
              hintText: widget.hintText,
            ),
          );
        }
    }
  }

  void toggle() {
    setState(() {
      indicator = !indicator;
    });
  }

  String? get validateEmail {
    final text = widget.initialValue;
    if (text.isEmpty) {
      if (widget.onSubmit) {
        return "Email field can not be blank";
      } else {
        return null;
      }
    }
    return null;
  }

  String? nameValidator(String? value) {
    if (value!.trim().isEmpty) {
      if (widget.onSubmit) {
        return "Name field can not be blank.";
      } else {
        return null;
      }
    }
    return null;
  }

  String? get validatePhone {
    final text = _thisController.text;
    if (widget.onSubmit) {
      if (text.isEmpty) {
        return "Phone number field can not be blank";
      } else {
        if (GetUtils.isPhoneNumber(text)) {
          return null;
        } else {
          return "Kindly provide a valid phone number.";
        }
      }
    }
    // return null if the text is valid
    return null;
  }

  String? get validateName {
    final value = widget.initialValue;
    if (value!.isEmpty) {
      if (widget.onSubmit) {
        return "Name field can not be blank.";
      } else {
        return null;
      }
    }
    return null;
  }

  String? get validatePassword {
    final value = widget.initialValue;
    String pattern =
        r"(^(?=.*[a-z])(?=.*[A-Z])(?=.*[@$!%*?&.*':;â‚¬#])[A-Za-z\d@$!%*?&.*':;â‚¬#]{8,}$)";
    // ignore: unused_local_variable
    RegExp regExp = RegExp(pattern);
    if (value.isEmpty) {
      if (widget.onSubmit) {
        return "Password field can not be blank.";
      } else {
        return null;
      }
    }
    return null;
  }
  String? phoneValidator(PhoneNumber? value) {
    if (value!.number.isEmpty) {
      return "Phone field is empty";
    } else {
      if (GetUtils.isPhoneNumber(value.number)) {
        return null;
      } else {
        return "Should be a valid phone.";
      }
    }
  }
  String? get validateAmount {
    final value = _thisController.value.text;
    if (value.isEmpty) {
      return null;
    } else if (GetUtils.isNum(value) && double.parse(value) < 1) {
      return "AppLabels.amountRequired.tr";
    }
    return null;
  }

// String? get validateName {
//   final value = _thisController.value.text;
//   if (value.isEmpty) {
//     return null;
//   } else if (value.length < 3) {
//     return "AppLabels.nameRequired.tr";
//   }
//   return null;
// }
}

class BoxEntryTextField extends StatefulWidget {
  final String? lastPin;
  final int fields;
  final ValueChanged<String> onSubmit;
  final double fieldWidth;
  final double fieldHeight;
  final double fontSize;
  final bool isTextObscure;
  final bool showFieldAsBox;
  final Color
      cursorColor; // Leaving the data type dynamic for adding Color or Material Color
  final Color boxColor;
  final Color textColor;
  final Color fillColor;
  final double? boxHeight;
  final double? boxWidth;

  const BoxEntryTextField({
    Key? key,
    this.lastPin,
    this.fields = 4,
    required this.onSubmit,
    this.fieldWidth = 56.0,
    this.fieldHeight = 56.0,
    this.fontSize = 22.0,
    this.isTextObscure = false,
    this.showFieldAsBox = true,
    this.cursorColor = Colors
        .transparent, // Adding a Material Color so that if the user want black, it get accepted too
    this.boxColor = Colors.white,
    this.textColor = Colors.black,
    this.fillColor = Colors.black,
    this.boxHeight,
    this.boxWidth,
  }) : super(key: key);

  @override
  State createState() {
    return BoxEntryTextFieldState();
  }
}

class BoxEntryTextFieldState extends State<BoxEntryTextField> {
  final List<String> _pin = <String>[];
  final List<FocusNode> _focusNodes = <FocusNode>[];
  final List<TextEditingController> _textControllers =
      <TextEditingController>[];

  Widget textFields = Container();

  addToTextField() {
    for (int i = 0; i < widget.fields; i++) {
      _textControllers.add(TextEditingController());
      _pin.add("");
      _focusNodes.add(FocusNode());
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      setState(() {
        if (widget.lastPin != null) {
          for (var i = 0; i < widget.lastPin!.length; i++) {
            _pin[i] = widget.lastPin![i];
          }
        }
        textFields = generateTextFields(context);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    addToTextField();
  }

  @override
  void dispose() {
    for (var t in _textControllers) {
      t.dispose();
    }
    super.dispose();
  }

  Widget generateTextFields(BuildContext context) {
    List<Widget> textFields = List.generate(widget.fields, (int i) {
      return buildTextField(i, context, i == 0);
    });

    FocusScope.of(context).requestFocus(_focusNodes[0]);

    return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        verticalDirection: VerticalDirection.down,
        children: textFields);
  }

  void clearTextFields() {
    // for (var tEditController in _textControllers) {
    //   tEditController.clear();
    // }
    _textControllers.clear();
    _pin.clear();
    addToTextField();
  }

  Widget buildTextField(int i, BuildContext context, [bool autofocus = false]) {
    final themeProvider =
        Provider.of<DarkThemeProvider>(context, listen: false);

    _focusNodes[i].addListener(() {
      if (_focusNodes[i].hasFocus) {}
    });

    //final String lastDigit = _textControllers[i].text;

    return Container(
      width: widget.boxWidth,
      height: widget.boxHeight,
      margin: const EdgeInsets.all(12.0),
      child: Stack(
        children: [
          Positioned(
            child: TextField(
              showCursor: false,
              controller: _textControllers[i],
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
                signed: false,
              ),
              textAlign: TextAlign.center,
              maxLength: 1,
              autofocus: autofocus,
              style: TextStyle(
                  fontWeight: FontWeight.w700,
                  color: themeProvider.darkTheme
                      ? Colors.white
                      : const Color(0xFF111A24),
                  // color: Colors.black,
                  fontSize: 22.fss),
              focusNode: _focusNodes[i],
              obscureText: widget.isTextObscure,
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.symmetric(vertical: 50.0),
                fillColor: themeProvider.darkTheme
                    ? AppColors.darkBackgroundColor
                    : AppColors.lightBackgroundColor,
                //filled: widget.showFieldAsBox ? true : false,
                counterText: "",
                // contentPadding: EdgeInsets.symmetric(vertical: 20.ss),
                enabledBorder: widget.showFieldAsBox
                    ? OutlineInputBorder(
                        borderSide:
                            BorderSide(color: Get.theme.colorScheme.onSurface),
                        borderRadius: BorderRadius.circular(12),
                      )
                    : UnderlineInputBorder(
                        borderSide:
                            BorderSide(color: Get.theme.colorScheme.onSurface),
                      ),
                focusedBorder: widget.showFieldAsBox
                    ? OutlineInputBorder(
                        borderSide: const BorderSide(
                            width: 2.0, color: AppColors.primaryColor),
                        borderRadius: BorderRadius.circular(12),
                      )
                    : UnderlineInputBorder(
                        borderSide: BorderSide(color: AppColors.primaryColor),
                      ),
              ),
              onChanged: (String str) {
                setState(() {
                  _pin[i] = str;
                });
                if (i + 1 != widget.fields) {
                  _focusNodes[i].unfocus();
                  if (_pin[i] == '') {
                    if (i != 0) {
                      FocusScope.of(context).requestFocus(_focusNodes[i - 1]);
                    }
                  } else {
                    FocusScope.of(context).requestFocus(_focusNodes[i + 1]);
                  }
                } else {
                  _focusNodes[i].unfocus();
                  if (_pin[i] == '') {
                    FocusScope.of(context).requestFocus(_focusNodes[i - 1]);
                  }
                }
                if (_pin.every((String digit) => digit != '')) {
                  widget.onSubmit(_pin.join());
                }
              },
              onSubmitted: (String str) {
                if (_pin.every((String digit) => digit != '')) {
                  widget.onSubmit(_pin.join());
                }
              },
            ),
          ),
          for (int i = 0; i < _textControllers.length; i++)
            Positioned(
                bottom: 10,
                left: 20,
                child: Container(
                  height: 1,
                  width: 16,
                  color: _pin[i].isNotEmpty
                      ? AppColors.primaryColor
                      : AppColors.whiteColor,
                )),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return textFields;
  }
}
