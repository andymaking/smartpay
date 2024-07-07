import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../utils/shimmer_loaders.dart';
import '../utils/widget_extensions.dart';

class TextLoader extends StatelessWidget {
  const TextLoader({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
            height: 35.sp,
            margin: 10.sp.padB,
            width: width(context),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8.sp),
                child: ShimmerCard()
            )
        ),
        Container(
            height: 35.sp,
            margin: 10.sp.padB,
            width: width(context),
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8.sp),
                child: ShimmerCard()
            )
        ),
        Container(
            height: 35.sp,
            margin: 10.sp.padB,
            width: width(context)/2,
            child: ClipRRect(
                borderRadius: BorderRadius.circular(8.sp),
                child: ShimmerCard()
            )
        ),
      ],
    );
  }
}