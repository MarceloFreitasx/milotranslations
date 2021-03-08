import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:milotranslations/core/styles/styles.dart';
import 'package:milotranslations/src/splash/controllers/splash.controller.dart';

class SplashView extends StatefulWidget {
  @override
  _SplashViewState createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  SplashController controller = Get.find();

  @override
  void initState() {
    controller.animationController
      ..addListener(() {
        setState(() {});
      });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: AppColors.GRAYEC,
        padding: EdgeInsets.all(40),
        child: Center(
          child: Transform(
            transform: Matrix4.translationValues(0.0, controller.translateLogo.value * 10, 0.0),
            child: Opacity(
              opacity: controller.opacityLogo.value,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(height: 150, child: SvgPicture.asset(AppAssets.TRANSLATE)),
                  Container(height: 20),
                  Text(
                    "MiloTranslations",
                    style: AppStyles.head2,
                  ),
                  Text(
                    "by @MarceloFreitasx",
                    style: AppStyles.caption1,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
