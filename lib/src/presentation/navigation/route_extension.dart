import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

extension RouteExt on BuildContext {
  void pushToHomePage() => push('/');
  void goToHomePage() => go('/');
  void goToLoginPage() => go('/login');
}
