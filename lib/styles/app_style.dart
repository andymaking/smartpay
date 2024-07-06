import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../data/cache/palette.dart';

class Styles {

  static ThemeData themeData({bool? isDark}) {
    return ThemeData(
        fontFamily: 'SF Pro Display',
        primaryColor: isDark == true? primaryDarkColor: primaryColor,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        unselectedWidgetColor: isDark == true? Colors.white: Colors.black,
        colorScheme: ColorScheme.fromSwatch(
          primarySwatch: Colors.blue,
          errorColor: const Color(0xffde3163),
          accentColor: const Color(0xff2FA2B9)
        ).copyWith(
          background: isDark == true? Colors.black: Colors.white,
        ),
        indicatorColor: const Color(0xffCBDCF8),

        splashColor: primaryColor.withOpacity(0.2),
        highlightColor: primaryColor.withOpacity(0.2),
        hoverColor: const Color(0xff4285F4),

        focusColor: const Color(0xffA8DAB5),
        disabledColor: Colors.grey,
        iconTheme: IconThemeData(
          color: isDark == true? Colors.white: const Color(0xFF6B7280)
        ),
        dividerColor: Colors.grey.shade100,
        textTheme: TextTheme(
          bodyMedium: TextStyle(
            color: isDark == true? Colors.white : textColor,
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
          ),
          bodySmall: TextStyle(
            color: isDark == true? Colors.white : const Color(0xFF6B7280),
            fontSize: 14.sp,
            fontWeight: FontWeight.normal,
          ),
          bodyLarge: TextStyle(
            color: isDark == true? Colors.white : textColor,
            fontSize: 24.sp,
            fontWeight: FontWeight.w700,
          ),
          titleLarge: TextStyle(
            fontSize: 16.sp,
            fontWeight: FontWeight.w700,
            color: isDark == true? Colors.white : textColor
          ),
        ),
        cardColor: isDark == true? Colors.black: Colors.white,
        canvasColor: Colors.grey[50],
        brightness: Brightness.light,
        appBarTheme:  AppBarTheme(
          elevation: 0.0,
          systemOverlayStyle: isDark == true? SystemUiOverlayStyle.light: SystemUiOverlayStyle.dark,
          color: Colors.transparent,
          foregroundColor: textColor,
          iconTheme: IconThemeData(color: isDark == true? Colors.white : textColor),
          titleTextStyle: TextStyle(
            fontSize: 20.sp,
            fontWeight: FontWeight.w700,
            color: isDark == true? Colors.white : textColor,
          ),
        ),
        scaffoldBackgroundColor: isDark == true?
        Colors.black87:
        Colors.white,
        shadowColor: Colors.grey,
    );

  }
}