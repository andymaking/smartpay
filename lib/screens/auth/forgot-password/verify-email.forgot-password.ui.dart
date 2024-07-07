import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay_app/data/cache/app-images.dart';
import 'package:smartpay_app/utils/string-extensions.dart';
import 'package:smartpay_app/utils/widget_extensions.dart';
import 'package:smartpay_app/widget/app-card.dart';
import 'package:smartpay_app/widget/image_builder.dart';

import '../../../data/cache/palette.dart';
import '../../../localization/locales.dart';
import '../../../utils/themeData.dart';
import '../../../utils/validator.dart';
import '../../../widget/app-bar.dart';
import '../../../widget/app-button.dart';
import '../../../widget/apptexts.dart';
import '../../../widget/text_field.dart';
import '../../base-ui.dart';
import 'forgot-password.vm.dart';

class VerifyEmailForgotScreen extends StatelessWidget {
  const VerifyEmailForgotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ForgotPasswordViewModel>(
      builder: (_, model, theme, child)=> Scaffold(
        appBar: AppBars(),
        body: Padding(
          padding: 16.sp.padA,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              buildSvgPicture(image: AppImages.verifyProfile, size: 90.24.sp),
              30.sp.sbH,
              Expanded(
                child: ListView(
                  children: [
                    AppText(
                      LocaleData.verifyYourIdentity.convertString(),
                      size: 24.sp,
                      isBold: true,
                    ),
                    16.sp.sbH,
                    RichText(
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: LocaleData.whereWouldYouLike.convertString(),
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: 16.sp,
                            ),
                          ),
                          TextSpan(
                            text: LocaleData.smartPay.convertString(),
                            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                                color: darkAccent
                            ),
                          ),
                          TextSpan(
                            text: LocaleData.toSendYourSecuirtyCode.convertString(),
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              fontSize: 16.sp,
                            ),
                          ),
                        ],
                      ),
                      textAlign: TextAlign.start,
                    ),
                    30.sp.sbH,
                    AppCard(
                      backgroundColor: textFieldBackgroundColor,
                      heights: 88.sp,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          buildSvgPicture(image: AppImages.check, size: 20.sp),
                          16.sp.sbW,
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                AppText(
                                  LocaleData.email.convertString(),
                                  size: 16.sp,
                                  isBold: true,
                                ),
                                AppText(
                                  "${(model.appCache.email??"").split("@").first[0].toUpperCase()}******@${(model.appCache.email??"").split("@").last}",
                                  style: themeData.textTheme.bodySmall?.copyWith(fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          ),
                          buildSvgPicture(image: AppImages.mail, size: 24.sp)
                        ],
                      ),
                    ),
                    30.sp.sbH,
                  ],
                ),
              ),
              25.sp.sbH,
              AppButton(
                isLoading: model.isLoading,
                text: LocaleData.continues.convertString(),
                onTap:model.goToCreateNewPassword,
              ),
              30.sp.sbH,
            ],
          ),
        ),
      ),
    );
  }
}
