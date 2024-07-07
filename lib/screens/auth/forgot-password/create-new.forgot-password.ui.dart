import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay_app/data/cache/app-images.dart';
import 'package:smartpay_app/utils/string-extensions.dart';
import 'package:smartpay_app/utils/widget_extensions.dart';
import 'package:smartpay_app/widget/image_builder.dart';

import '../../../localization/locales.dart';
import '../../../utils/themeData.dart';
import '../../../utils/validator.dart';
import '../../../widget/app-bar.dart';
import '../../../widget/app-button.dart';
import '../../../widget/apptexts.dart';
import '../../../widget/text_field.dart';
import '../../base-ui.dart';
import 'forgot-password.vm.dart';

class CreatePasswordForgotScreen extends StatelessWidget {
  const CreatePasswordForgotScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<ForgotPasswordViewModel>(
      builder: (_, model, theme, child)=> Scaffold(
        appBar: AppBars(),
        body: Form(
          key: model.formKey,
          child: Padding(
            padding: 16.sp.padA,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      AppText(
                        LocaleData.creatNewPassword.convertString(),
                        size: 24.sp,
                        isBold: true,
                      ),
                      16.sp.sbH,
                      AppText(
                        LocaleData.enterYourRegisterdEmail.convertString(),
                        style: themeData.textTheme.bodySmall?.copyWith(fontSize: 16.sp),
                      ),
                      30.sp.sbH,
                      AppTextField(
                        controller: model.passwordController,
                        validator: passwordValidator,
                        onChanged: model.onChange,
                        isPassword: true,
                        hint: LocaleData.password.convertString(),
                      ),
                      16.sp.sbH,
                      AppTextField(
                        controller: model.confirmPasswordController,
                        validator: (val){
                          if(model.confirmPasswordController.text.trim().isEmpty){
                            return LocaleData.emptyField.convertString();
                          }else if(model.confirmPasswordController.text.trim() != model.passwordController.text.trim()){
                            return LocaleData.confirmPasswordSamePassword.convertString();
                          }else{
                            return null;
                          }
                        },
                        onChanged: model.onChange,
                        isPassword: true,
                        hint: LocaleData.confirmPassword.convertString(),
                      ),
                      30.sp.sbH,
                    ],
                  ),
                ),
                25.sp.sbH,
                AppButton(
                  isLoading: model.isLoading,
                  text: LocaleData.creatNewPassword.convertString().toCapitalized(),
                  onTap: model.formKey.currentState?.validate() == true? model.goBackLogin: null,
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
