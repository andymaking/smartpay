import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay_app/utils/string-extensions.dart';
import 'package:smartpay_app/utils/widget_extensions.dart';

import '../../../localization/locales.dart';
import '../../../utils/themeData.dart';
import '../../../widget/app-bar.dart';
import '../../../widget/app-button.dart';
import '../../../widget/apptexts.dart';
import '../../../widget/text_field.dart';
import '../../base-ui.dart';
import 'signup.vm.dart';

class CreatePinScreen extends StatelessWidget {
  const CreatePinScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<SignUpViewModel>(
      builder: (_, model, theme, child)=> Scaffold(
        appBar: const AppBars(),
        body: Form(
          key: model.formKey,
          child: Padding(
            padding: 16.sp.padA,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppText(
                  LocaleData.setYourPin.convertString(),
                  size: 24.sp,
                  isBold: true,
                ),
                6.sp.sbH,
                AppText(
                  LocaleData.weUseStateOfTheArt.convertString(),
                  style: themeData.textTheme.bodySmall?.copyWith(fontSize: 16.sp),
                ),
                30.sp.sbH,
                PinTextField(
                  controller: model.otpController,
                  rounded: false,
                  obscureText: true,
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
                const Spacer(),
                20.sp.sbH,
                AppButton(
                  isLoading: model.isLoading,
                  text: LocaleData.confirm.convertString(),
                  onTap: model.formKey.currentState?.validate() == true? model.setPin: null,
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
