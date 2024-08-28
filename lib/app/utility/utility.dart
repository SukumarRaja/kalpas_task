import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

timeBasedGetGreetingMessage() {
  final now = DateTime.now();
  final hour = now.hour;

  if (hour < 12) {
    return 'Good morning!';
  } else if (hour < 17) {
    return 'Good afternoon!';
  } else if (hour < 21) {
    return 'Good evening!';
  } else {
    return 'Good night!';
  }
}

currentDayInNumber() {
  var now = DateTime.now();
  debugPrint("day ${now.weekday}");
  return now.weekday;
}

getTime() {
  DateTime now = DateTime.now();
  debugPrint(
      "time ${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}");
  return "${now.hour.toString().padLeft(2, '0')}:${now.minute.toString().padLeft(2, '0')}:${now.second.toString().padLeft(2, '0')}";
}

convertTo12HourFormat({time}) {
  final formatter = DateFormat('HH:mm');
  final parsedTime = formatter.parse(time);
  final formattedTime = DateFormat('h:mm a').format(parsedTime);
  // debugPrint("convert rime $formattedTime");
  return formattedTime;
}

isoToDateMonthTime({date}) {
  DateTime dateTime = DateFormat("yyyy-MM-dd HH:mm:ss").parse(date);
  return DateFormat("dd MMM, hh:mm a").format(dateTime);
}

convertDate({date}) {
  DateTime parsedDate = DateTime.parse(date);
  var formattedDate =
      DateFormat("EEE, dd MMM yyyy HH:mm 'GMT'").format(parsedDate);
  return formattedDate;
}
