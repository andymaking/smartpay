import 'package:animated_typing/animated_typing.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay_app/utils/string-extensions.dart';
import 'package:smartpay_app/utils/widget_extensions.dart';
import '../../data/cache/palette.dart';
import '../../localization/locales.dart';
import '../../utils/themeData.dart';
import '../../widget/app-bar.dart';
import '../../widget/apptexts.dart';
import '../../widget/default-profile-pic.dart';
import '../../widget/text-loader.dart';
import '../base-ui.dart';
import 'home.vm.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseView<HomeViewModel>(
      onModelReady: (model)=> model.getMessage(),
      builder: (_, model, theme, child)=> Scaffold(
        appBar: AppBars(
          title: Row(
            children: [
              DefaultProfilePic(
                userName: model.userService.user.fullName??"",
                size: 40.sp,
              ),
              10.sp.sbW,
              AppText(
                "Hi, ${(model.userService.user.fullName??"").split(" ").first}",
                isBold: true,
              )
            ],
          ),
          actions: [
            Row(
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          InkWell(
                            onTap: model.showLogout,
                            child: AppText(
                              LocaleData.logOut.convertString(),
                              isBold: true,
                              size: 16.sp,
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                16.sp.sbW
              ],
            )
          ],
        ),
        body: Padding(
          padding: 16.sp.padA,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppText(
                LocaleData.secretMessage.convertString(),
                size: 25.sp,
                isBold: true,
              ),
              16.sp.sbH,
              Expanded(
                child: ListView(
                  children: [
                    model.isLoading && model.messageData == null?
                    const TextLoader():
                    AnimatedTyping(
                      text: model.messageData?.secret??"",
                      duration: const Duration(
                        seconds: 5,
                      ),
                      style: themeData.textTheme.bodyMedium?.copyWith(
                          color: darkAccent,
                          fontWeight: FontWeight.bold,
                          fontSize: 30.sp
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
