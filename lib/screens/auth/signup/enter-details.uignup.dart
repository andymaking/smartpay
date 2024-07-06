import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay_app/data/cache/palette.dart';
import 'package:smartpay_app/utils/string-extensions.dart';
import 'package:smartpay_app/utils/validator.dart';
import 'package:smartpay_app/utils/widget_extensions.dart';
import 'package:smartpay_app/widget/text_field.dart';

import '../../../localization/locales.dart';
import '../../../widget/app-bar.dart';
import '../../../widget/app-button.dart';
import '../../../widget/image_builder.dart';
import '../../base-ui.dart';
import 'signup.vm.dart';

class EnterDetailsSignUp extends StatelessWidget {
  const EnterDetailsSignUp({super.key});

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
                        text: LocaleData.hiThereTellUs.convertString(),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                      TextSpan(
                        text: LocaleData.yourself.convertString(),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 24.sp,
                            fontWeight: FontWeight.w600,
                            color: darkAccent
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
                        controller: model.fullNameController,
                        validator: fullNameValidator,
                        onChanged: model.onChange,
                        fontWeight: FontWeight.w400,
                        hint: LocaleData.fullName.convertString(),
                      ),
                      20.sp.sbH,
                      AppTextField(
                        controller: model.userNameController,
                        validator: emptyValidator,
                        fontWeight: FontWeight.w400,
                        onChanged: model.onChange,
                        hint: LocaleData.userName.convertString(),
                      ),
                      20.sp.sbH,
                      AppTextField(
                        controller: model.countryController,
                        readonly: true,
                        onTap: model.showCountries,
                        validator: emptyValidator,
                        prefix: model.selectedCountry != null? Padding(
                          padding: 10.sp.padH,
                          child: buildSvgPicture(
                            image: model.selectedCountry?.flag??"", size: 32.sp),
                        ): null,
                        suffixIcon: Transform.rotate(
                          angle: math.pi / 2,
                          child: Icon(
                            Icons.arrow_forward_ios, size: 15.sp,
                          ),
                        ),
                        hint: LocaleData.selectCountry.convertString(),
                      ),
                      20.sp.sbH,
                      AppTextField(
                        controller: model.passwordController,
                        validator: passwordValidator,
                        onChanged: model.onChange,
                        isPassword: true,
                        hint: LocaleData.password.convertString(),
                      ),
                      20.sp.sbH,

                      AppButton(
                        isLoading: model.isLoading,
                        text: LocaleData.signUp.convertString(),
                        onTap: model.formKey.currentState?.validate() == true? model.goToVerifyEmail: null,
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