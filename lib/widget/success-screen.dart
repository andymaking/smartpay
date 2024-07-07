import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smartpay_app/utils/themeData.dart';

import '../data/cache/app-images.dart';
import '../localization/locales.dart';
import '/utils/widget_extensions.dart';
import '/utils/string-extensions.dart';
import 'app-button.dart';
import 'apptexts.dart';

class SuccessScreen extends StatelessWidget {
  final VoidCallback onTap;
  final String? title;
  final String? body;
  final String? image;
  final String? buttonText;
  final Widget? icon;
  const SuccessScreen({
    super.key,
    required this.onTap,
    this.title,
    this.body,
    this.image,
    this.icon,
    this.buttonText
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.sp, vertical: 25.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              AppImages.thumbsUp,
                width: 140.45.sp,
              height: 134.33.sp,
            ),
            16.sp.sbH,
            AppText(
              title??"",
              size: 24.sp,
              weight: FontWeight.w700,
              align: TextAlign.center,
            ),
            16.sp.sbH,
            Padding(
              padding: 20.sp.padH,
              child: AppText(
                body??"",
                style: themeData.textTheme.bodySmall?.copyWith(
                  fontSize: 16.sp
                ),
                align: TextAlign.center,
              ),
            ),
            16.sp.sbH,
            AppButton(
              isLoading: false,
              text: buttonText?? LocaleData.getStarted.convertString(),
              onTap: onTap,
            ),
          ],
        ),
      ),
    );
  }
}
