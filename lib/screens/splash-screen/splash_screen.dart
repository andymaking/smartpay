import 'dart:math' as math;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../data/cache/constants.dart';
import '../../data/cache/database-keys.dart';
import '../../data/routes/routes.dart';
import '../../localization/locales.dart';
import '../../utils/themeData.dart';
import '../../widget/image_builder.dart';
import '../../data/cache/app-images.dart';
import '../../data/cache/palette.dart';
import '../../utils/string-extensions.dart';
import '../../utils/widget_extensions.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;

  bool? isLogIn = false;
  bool? isUserSetPin = false;
  bool? onBoardingCompleted = false;

  @override
  void initState() {
    super.initState();
    _controller =
    AnimationController(vsync: this, duration: const Duration(seconds: 2))
      ..forward()
      ..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          appRelaunch();
        }
      });
  }
  Future<Object> appRelaunch() async {
    isLogIn = userService.isUserLoggedIn;
    isUserSetPin = userService.isUserSetPin;
    onBoardingCompleted = await storageService.readItem(key: StorageKey.ONBOARDING_TABLE_NAME) == true;
    if (isUserSetPin != null && isUserSetPin == true) {
      return navigationService.navigateToReplace(PINLOGINROUTE);
    }else if(onBoardingCompleted != null && onBoardingCompleted == true){
      return navigationService.navigateToReplace(LOGINROUTE);
    } else {
      return navigationService.navigateToReplace(ONBOARDING);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _controller,
              builder: (_, child) {
                return Transform.rotate(
                  angle: _controller.value * 2 * math.pi,
                  child: child,
                );
              },
              child: buildSvgPicture(
                image: AppImages.appSplashLogo,
                size: 72.sp
              ),
            ),
            16.sp.sbH,
            Container(
              alignment: Alignment.center,
              padding: 10.sp.padA,
              child: Center(
                  child: Text.rich(
                    TextSpan(
                      text: LocaleData.smart.convertString(),
                      semanticsLabel: LocaleData.smart.convertString(),
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: themeData.primaryColor,
                        fontSize: 32.sp,
                        fontWeight: FontWeight.w600,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: LocaleData.pay.convertString(),
                          semanticsLabel: LocaleData.pay.convertString(),
                          style: themeData.textTheme.bodyMedium?.copyWith(
                            color: darkAccent,
                            fontSize: 32.sp,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ]))),
            )
          ],
        ),
      ),
    );
  }
}
