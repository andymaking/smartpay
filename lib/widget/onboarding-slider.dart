import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay_app/localization/locales.dart';
import 'package:smartpay_app/utils/string-extensions.dart';
import 'package:smartpay_app/utils/themeData.dart';

import '../data/cache/app-images.dart';
import '../utils/widget_extensions.dart';
import 'apptexts.dart';

class OnBoardingSlider extends StatelessWidget {
  String? image, title, description;

  OnBoardingSlider(
      {super.key,
        required this.image,
        required this.title,
        required this.description});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height(context),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 80.0, left: 10),
            child: SizedBox(
              child: Image(
                image: AssetImage(image!),
                //fit: BoxFit.cover,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              height: height(context) / 4.5,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20.sp),
                color: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
          ),
          Padding(
            padding: 84.sp.padB,
            child: Align(
              alignment: Alignment.bottomCenter,
              child: AppText(
                title!,
                size: 24.sp,
                align: TextAlign.center,
                isBold: true,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: 8.sp.padA,
              child: AppText(
                description!,
                style: themeData.textTheme.bodySmall?.copyWith(height: 1.5.sp, fontSize: 14.sp, color: const Color(0xFF6B7280)),
                align: TextAlign.center,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class SliderModel {
  String? image;
  String? title;
  String? description;

  // Constructor for variables
  SliderModel({this.title, this.description, this.image});

  void setImage(String getImage) {
    image = getImage;
  }

  void setTitle(String getTitle) {
    title = getTitle;
  }

  void setDescription(String getDescription) {
    description = getDescription;
  }

  String? getImage() {
    return image;
  }

  String? getTitle() {
    return title;
  }

  String? getDescription() {
    return description;
  }
}

// List created
List<SliderModel> getSlides() {
  List<SliderModel> slides = [];
  SliderModel sliderModel = new SliderModel();

  // Item 1
  sliderModel.setImage(AppImages.onBoardingSlice1);
  sliderModel.setTitle(LocaleData.onBoardingTitle1.convertString());
  sliderModel.setDescription(LocaleData.onBoardingDescription1.convertString());
  slides.add(sliderModel);
  sliderModel = new SliderModel();

  // Item 2
  sliderModel.setImage(AppImages.onBoardingSlice2);
  sliderModel.setTitle(LocaleData.onBoardingTitle2.convertString());
  sliderModel.setDescription(LocaleData.onBoardingDescription2.convertString());
  slides.add(sliderModel);
  sliderModel = new SliderModel();

  return slides;
}