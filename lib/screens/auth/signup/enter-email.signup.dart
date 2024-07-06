import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay_app/data/cache/palette.dart';
import 'package:smartpay_app/utils/string-extensions.dart';
import 'package:smartpay_app/utils/validator.dart';
import 'package:smartpay_app/utils/widget_extensions.dart';
import 'package:smartpay_app/widget/text_field.dart';

import '../../../data/cache/app-images.dart';
import '../../../localization/locales.dart';
import '../../../utils/themeData.dart';
import '../../../widget/app-bar.dart';
import '../../../widget/app-button.dart';
import '../../../widget/apptexts.dart';
import '../../../widget/image_builder.dart';
import '../../../widget/or-widget.dart';
import '../../base-ui.dart';
import 'signup.vm.dart';

class EnterEmailSignUp extends StatelessWidget {
  const EnterEmailSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SignUpViewModel>(
      builder: (context, model, theme, child)=> Scaffold(
        appBar: AppBars(),
        body: Form(
          key: model.formKey,
          child: Padding(
            padding: 16.sp.padA,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: LocaleData.createA.convertString(),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600
                        ),
                      ),
                      TextSpan(
                        text: LocaleData.smartPay.convertString(),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          fontSize: 24.sp,
                          fontWeight: FontWeight.w600,
                          color: darkAccent
                        ),
                      ),
                      const TextSpan(
                        text: "\n",
                      ),
                      TextSpan(
                        text: LocaleData.account.convertString(),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.start,
                ),
                30.sp.sbH,
                Expanded(
                  child: ListView(
                    children: [
                      AppTextField(
                        controller: model.emailController,
                        validator: emailValidator,
                        onChanged: model.onChange,
                        hint: LocaleData.email.convertString(),
                      ),
                      20.sp.sbH,
                      AppButton(
                        isLoading: model.isLoading,
                        text: LocaleData.signUp.convertString(),
                        onTap: model.formKey.currentState?.validate() == true? model.goToVerifyEmail: null,
                      ),
                      30.sp.sbH,
                      const OrWidget(),
                      20.sp.sbH,
                      Row(
                        children: [
                          Expanded(
                            child: AppButton(
                              isLoading: false,
                              transparent: true,
                              child: buildSvgPicture(
                                image: AppImages.googleLogo, size: 23.sp
                              ),
                            ),
                          ),
                          16.sp.sbW,
                          Expanded(
                            child: AppButton(
                              isLoading: false,
                              transparent: true,
                              child: buildSvgPicture(
                                image: AppImages.appleLogo, size: 23.sp
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                10.sp.sbH,
                Padding(
                  padding: 16.sp.padB,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppText(
                        LocaleData.alreadyHaveAnAccount.convertString(),
                        style: themeData.textTheme.bodySmall?.copyWith(fontSize: 16.sp),
                      ),
                      InkWell(
                        onTap: model.goToLogin,
                        child: Padding(
                          padding: 5.sp.padV,
                          child: AppText(
                            LocaleData.signIn.convertString(),
                            color: darkAccent,
                            size: 16.sp,
                            isBold: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}