import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Indicators extends StatelessWidget {
  final int total;
  final int current;
  final Function(int)? onChange;
  const Indicators({Key? key, required this.total, required this.current, this.onChange}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
    //   ! isVertical?
    // Row(
    //     mainAxisAlignment: MainAxisAlignment.center,
    //     children: _indicatorContent(context, isVertical)
    // ):
    Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: _indicatorContent(context)
    );
  }

  List<Widget> _indicatorContent(BuildContext context) {
    return List<Widget>.generate(total, (int index) {
        return GestureDetector(
          onTap: (){
            if(onChange != null){
              onChange!(index);
            }
          },
          child: Container(
            width: current == index? 32.sp: 6.sp,
            height: 6.sp,
            margin: EdgeInsets.symmetric(horizontal:3.sp),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7.5.sp),
              color: current == index
                  ? Theme.of(context).primaryColor
                  : const Color(0XFFE5E7EB),
            ),
          ),
        );
      });
  }
}