import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay_app/utils/string-extensions.dart';

import '../localization/locales.dart';
import '../utils/themeData.dart';
import '../utils/widget_extensions.dart';
import 'apptexts.dart';

class OrWidget extends StatelessWidget {
  const OrWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Container(
            width: width(context),
            height: 1.sp,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [Colors.white, const Color(0xFFE5E7EB).withOpacity(0.4), const Color(0xFFE5E7EB)],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight
                )
            ),
          ),
        ),
        16.sp.sbW,
        AppText(
          LocaleData.or.convertString(),
          style: themeData.textTheme.bodySmall,
        ),
        16.sp.sbW,
        Expanded(
          child: Container(
            width: width(context),
            height: 1.sp,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                    colors: [const Color(0xFFE5E7EB),const Color(0xFFE5E7EB).withOpacity(0.4),  Colors.white],
                    begin: Alignment.centerLeft,
                    end: Alignment.centerRight
                )
            ),
          ),
        ),
      ],
    );
  }
}