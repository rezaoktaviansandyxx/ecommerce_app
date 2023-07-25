import 'dart:ui';

import 'package:ecommerce_app/routes/approutes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sizer/sizer.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  final _navigatorKey = GlobalKey<NavigatorState>();

  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return GetMaterialApp(
          title: 'Ecommerce App',
          debugShowCheckedModeBanner: false,
          scrollBehavior: const MaterialScrollBehavior().copyWith(
            dragDevices: {PointerDeviceKind.mouse, PointerDeviceKind.touch},
          ),
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          navigatorKey: _navigatorKey,
          getPages: AppRoutes.routes.entries
              .map((e) => GetPage(
                  name: e.key,
                  page: () => e.value(null, null),
                  bindings:
                      AppRoutes.bindings.entries.map((e) => e.value).toList()))
              .toList(),
        );
      },
    );
  }
}
