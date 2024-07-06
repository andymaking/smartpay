import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../data/cache/constants.dart';
import '../data/cache/palette.dart';
import '../utils/widget_extensions.dart';
import '../utils/themeData.dart';
import 'apptexts.dart';

class AppBars extends StatelessWidget implements PreferredSizeWidget {
  final bool hasLead;
  final Widget? title;
  final Widget? leading;
  final String? text;
  final bool? hasNotification;
  final bool? noLeading;
  final Widget? flexibleSpace;
  final double? elevation;
  final SystemUiOverlayStyle? systemOverlayStyle;
  final Color? backgroundColor;
  final Color? buttonBackgroundColor;
  final Color? textAppColor;
  final PreferredSizeWidget? bottom;
  final List<Widget>? actions;
  const AppBars({Key? key,
    this.hasLead=true, this.title,
    this.actions, this.flexibleSpace,
    this.bottom, this.text,
    this.hasNotification,
    this.leading, this.elevation,
    this.backgroundColor, this.systemOverlayStyle,
    this.textAppColor, this.buttonBackgroundColor, this.noLeading
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return AppBar(
      automaticallyImplyLeading: false,
      leading: noLeading == true? 0.0.sbHW: Navigator.of(context).canPop()? (hasLead==false? null:leading?? BackButtons(backgroundColor: buttonBackgroundColor,)):null,
      title: title??(text!=null? AppText("$text", style: themeData.appBarTheme.titleTextStyle?.copyWith(color: textAppColor),):null),
      flexibleSpace: flexibleSpace,
      backgroundColor: backgroundColor,
      bottom: bottom,
      actions: actions,
      systemOverlayStyle: systemOverlayStyle,
      scrolledUnderElevation: 0.0,
      centerTitle: true,
      elevation: elevation,
    );
  }

  //:(hasLead==false? null:leading?? const BackButtons())

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}

class BackButtons extends StatelessWidget {
  final VoidCallback? onTap;
  final Color? backgroundColor;
  const BackButtons({Key? key, this.onTap, this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap?? navigationService.goBack,
      child: Align(
        alignment: Alignment.center,
        child: Container(
          margin: 10.0.padL,
          width: 40.sp,
          height: 40.sp,
          padding: 7.0.padA,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.sp),
            border: Border.all(width: 1.sp, color: const Color(0xFFE5E7EB)),
            color: Colors.transparent
          ),
          child: const Icon(Icons.arrow_back_ios_new_outlined, size: 16,),
        ),
      ),
    );
  }
}