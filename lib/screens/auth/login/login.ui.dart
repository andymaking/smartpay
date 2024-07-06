import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay_app/data/cache/app-images.dart';
import 'package:smartpay_app/data/cache/palette.dart';
import 'package:smartpay_app/localization/locales.dart';
import 'package:smartpay_app/utils/string-extensions.dart';
import 'package:smartpay_app/utils/themeData.dart';
import 'package:smartpay_app/utils/validator.dart';
import 'package:smartpay_app/utils/widget_extensions.dart';
import 'package:smartpay_app/widget/app-button.dart';
import 'package:smartpay_app/widget/apptexts.dart';
import 'package:smartpay_app/widget/image_builder.dart';
import 'package:smartpay_app/widget/text_field.dart';

import '../../../widget/app-bar.dart';
import '../../../widget/or-widget.dart';
import '../../base-ui.dart';
import 'login.vm.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<LoginViewModel>(
      builder: (context, model, theme, child)=> Scaffold(
        appBar: AppBars(),
        body: Form(
          key: model.formKey,
          child: Padding(
            padding: 20.sp.padA,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  LocaleData.hiThere.convertString(),
                  size: 24.sp,
                  isBold: true,
                ),
                6.sp.sbH,
                AppText(
                  LocaleData.welcomeBack.convertString(),
                  style: themeData.textTheme.bodySmall?.copyWith(fontSize: 16.sp),
                ),
                30.sp.sbH,
                Expanded(
                  child: ListView(
                    children: [
                      AppTextField(
                        keyboardType: TextInputType.emailAddress,
                        controller: model.emailController,
                        hint: LocaleData.email.convertString(),
                        validator: emailValidator,
                        onChanged: model.onChange,
                      ),
                      16.sp.sbH,
                      AppTextField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: model.passwordController,
                        hint: LocaleData.password.convertString(),
                        isPassword: true,
                        validator: passwordValidator,
                        onChanged: model.onChange,
                      ),
                      16.sp.sbH,
                      AppText(
                        LocaleData.forgotPassword.convertString(),
                        size: 16.sp,
                        isBold: true,
                        color: darkAccent,
                      ),
                      25.sp.sbH,
                      AppButton(
                        isLoading: model.isLoading,
                        text: LocaleData.signIn.convertString(),
                        onTap: model.formKey.currentState?.validate() == true? model.login: null,
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
                              child: buildSvgPicture(image: AppImages.googleLogo, size: 23.sp),
                            ),
                          ),
                          16.sp.sbW,
                          Expanded(
                            child: AppButton(
                              isLoading: false,
                              transparent: true,
                              child: buildSvgPicture(image: AppImages.appleLogo, size: 23.sp),
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
                        LocaleData.dontHaveAnAccount.convertString(),
                        style: themeData.textTheme.bodySmall?.copyWith(fontSize: 16.sp),
                      ),
                      InkWell(
                        onTap: model.goToSignUp,
                        child: Padding(
                          padding: 5.sp.padV,
                          child: AppText(
                            LocaleData.signUp.convertString(),
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


