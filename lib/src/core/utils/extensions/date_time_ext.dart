import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

extension DateTimeX on DateTime {
  String toDefaultDateFormat([Locale? locale]) {
    return DateFormat('dd/MM/yyyy', locale?.languageCode).format(this);
  }
}
