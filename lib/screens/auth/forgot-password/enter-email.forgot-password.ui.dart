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

class EnterEmailForgotScreen extends StatelessWidget {
  const EnterEmailForgotScreen({super.key});

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
                buildSvgPicture(image: AppImages.lock, size: 90.24.sp),
                30.sp.sbH,
                Expanded(
                  child: ListView(
                    children: [
                      AppText(
                        LocaleData.recoverPassword.convertString(),
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
                        keyboardType: TextInputType.emailAddress,
                        controller: model.emailController,
                        hint: LocaleData.email.convertString(),
                        validator: emailValidator,
                        onChanged: model.onChange,
                      ),
                      30.sp.sbH,
                    ],
                  ),
                ),
                25.sp.sbH,
                AppButton(
                  isLoading: model.isLoading,
                  text: LocaleData.sendMeEmail.convertString(),
                  onTap: model.formKey.currentState?.validate() == true? model.goToVerify: null,
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
