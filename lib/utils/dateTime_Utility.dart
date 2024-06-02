import 'package:flutter/cupertino.dart';
import 'package:intl/intl.dart';

class DateTimeUtility {
  String parse({String? dateTime, String? returnFormat}) {
    DateTime dt = DateTime.parse(dateTime!).toLocal();
    DateFormat dateFormat = DateFormat(returnFormat);
    String returnDT = dateFormat.format(dt);
    return returnDT;
  }

  String parseTime({String? dateTime, String? returnFormat}) {
    DateFormat dtFor = DateFormat("HH:mm:ss");
    DateTime dt = dtFor.parse(dateTime!);
    DateFormat dateFormat = DateFormat(returnFormat);
    String returnDT = dateFormat.format(dt);
    return returnDT;
  }

  DateTime convertDateFromString(String strDate) {
    DateTime todayDate = DateTime.parse(strDate);
    return todayDate;
  }

  String getTimeFromTimeStamp(timeInMillis) {
    //int timeInMillis = 1586348737122;
    print(timeInMillis);
    var date = DateTime.fromMillisecondsSinceEpoch(timeInMillis);
    String formattedDate = DateTimeUtility()
        .parse(dateTime: date.toString(), returnFormat: "hh:mm a");
    return formattedDate;
  }

  String getDateFromTimeStamp(timeInMillis) {
    //int timeInMillis = 1586348737122;
    var date = DateTime.fromMillisecondsSinceEpoch(timeInMillis);
    String formattedDate = DateFormat.yMMMd().format(date);
    return formattedDate;
  }

  DateTime openCloseFormat({String? dateTime}) {
    print(dateTime);
    DateFormat dtFor = DateFormat("hh:mm");
    DateTime dt = dtFor.parse(dateTime!);
    return dt;
  }

  String parseToLocal({String? dateTime, String? returnFormat, String? parseFormat}) {
    final dateNow = DateTime.now();
    if (dateTime == null) {
      return "";
    } else if (parseFormat != null) {
      DateTime formattedTime = DateFormat(
        parseFormat,
      ).parse(dateTime);
      formattedTime = formattedTime.add(dateNow.timeZoneOffset);
      debugPrint("formattedTime:$formattedTime");
      DateFormat dateFormat = DateFormat(returnFormat);
      String returnDT = dateFormat.format(formattedTime);
      return returnDT;
    } else {
      DateTime dt = DateTime.parse(dateTime);
      dt = dt.add(dateNow.timeZoneOffset);
      DateFormat dateFormat = DateFormat(returnFormat);
      String returnDT = dateFormat.format(dt);
      return returnDT;
    }
  }
}
