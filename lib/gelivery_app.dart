import 'package:flutter/material.dart';
import 'package:gelivery_tracker/flavors.dart';

class GeliveryApp extends StatelessWidget {
  const GeliveryApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(child: Text(F.name)),
      ),
    );
  }
}
