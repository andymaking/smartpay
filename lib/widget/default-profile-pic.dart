import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay_app/utils/themeData.dart';

import '../data/cache/palette.dart';
import 'apptexts.dart';

class DefaultProfilePic extends StatelessWidget {
  final String? picture;
  final String userName;
  final double? size;
  final BoxFit? fit;
  final double? textSize;
  const DefaultProfilePic({
    super.key,
    this.picture,
    this.size,
    this.textSize,
    this.userName = "",
    this.fit,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: size?? 40.sp,
      width: size?? 40.sp,
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: themeData.primaryColor,
        shape: BoxShape.circle,
      ),
      child:  AppText(
        "${((userName??"").split(" ")[0])[0]}${((userName??"").split(" ")[1])[0]}",
        size: textSize?? 16, weight: FontWeight.w700,
        color: Colors.white,
      )
    );
  }
}