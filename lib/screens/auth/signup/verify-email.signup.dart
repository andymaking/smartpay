import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay_app/localization/locales.dart';
import 'package:smartpay_app/utils/string-extensions.dart';
import 'package:smartpay_app/utils/themeData.dart';
import 'package:smartpay_app/utils/widget_extensions.dart';
import 'package:smartpay_app/widget/apptexts.dart';

import '../../../widget/app-bar.dart';
import '../../../widget/app-button.dart';
import '../../../widget/text_field.dart';
import '../../base-ui.dart';
import 'signup.vm.dart';

class VerifyEmailSignUp extends StatelessWidget {
  const VerifyEmailSignUp({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SignUpViewModel>(
      onModelReady: (model)=>model.verifyInitializer(),
      builder: (context, model, theme, child)=> Scaffold(
        appBar: const AppBars(),
        body: Form(
          key: model.formKey,
          child: Padding(
            padding: 16.sp.padA,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                10.sp.sbH,
                AppText(
                  LocaleData.verifyItsYou.convertString(),
                  size: 24.sp,
                  isBold: true,
                ),
                16.sp.sbH,
                RichText(
                  text: TextSpan(
                    children: [
                      TextSpan(
                        text: LocaleData.weSentACode.convertString(),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          fontSize: 16.sp
                        ),
                      ),
                      TextSpan(
                        text: model.appCache.email??"",
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.w600
                        ),
                      ),
                      TextSpan(
                        text: LocaleData.enterItToVerify.convertString(),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                  textAlign: TextAlign.start,
                ),
                16.sp.sbH,
                PinTextField(
                  controller: model.otpController,
                  onChanged: model.onPinChange,
                  validator: (val){
                    String? value = model.otpController.text.trim();
                    print(value);
                    if(value == null && value.isEmpty){
                      return "";
                    }else if(value.length != 5){
                      return "";
                    }
                    return null;
                  },
                ),
                20.sp.sbH,
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    InkWell(
                      onTap: model.timer?.isActive==true ? null: model.resendOTP,
                      child: AppText(
                        "${LocaleData.resendCode.convertString()}${model.timer?.isActive==true ? "${model.secondsRemaining} secs":""}",
                        color: model.timer?.isActive==true ? const Color(0xFF727272) : themeData.colorScheme.secondary,
                        weight: FontWeight.w700,
                        size: 16.sp,
                      ),
                    )
                  ],
                ),
                const Spacer(),
                20.sp.sbH,
                AppButton(
                  isLoading: model.isLoading,
                  text: LocaleData.confirm.convertString(),
                  onTap: model.formKey.currentState?.validate() == true? model.verifyOtp: null,
                ),
                30.sp.sbH,
              ],
            ),
          ),
        ),
      ),
    );
  }
}