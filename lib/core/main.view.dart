import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'bindings/initial.binding.dart';
import 'routes/pages.routes.dart';
import 'styles/apptheme.style.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GitStars',
      theme: AppTheme.themeData,
      debugShowCheckedModeBanner: false,
      getPages: PagesRoutes.routes,
      defaultTransition: PagesRoutes.DEFAULT_TRANSITION,
      transitionDuration: PagesRoutes.DEFAULT_TRANSITION_DURATION,
      initialRoute: PagesRoutes.INITIAL,
      initialBinding: InitialBinding(),
    );
  }
}
