import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Sized24Container extends StatelessWidget {
  final Widget? child;
  final Decoration? decoration;

  const Sized24Container({super.key, this.child, this.decoration});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: decoration,
      margin: EdgeInsets.symmetric(horizontal: 24.sp, vertical: 10.sp),
      child: child,
    );
  }
}