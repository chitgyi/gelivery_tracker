import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gelivery_tracker/gelivery_app.dart';
import 'package:gelivery_tracker/src/di/di.dart';
import 'package:shared_preferences/shared_preferences.dart';

FutureOr<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final sharePref = await SharedPreferences.getInstance();
  set<SharedPreferences>(sharePref);
  configDependencies();
  runApp(const GeliveryApp());
}
