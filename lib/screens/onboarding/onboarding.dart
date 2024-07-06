import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smartpay_app/data/cache/constants.dart';
import 'package:smartpay_app/data/cache/database-keys.dart';
import 'package:smartpay_app/data/routes/routes.dart';
import 'package:smartpay_app/localization/locales.dart';
import 'package:smartpay_app/utils/string-extensions.dart';
import 'package:smartpay_app/utils/widget_extensions.dart';

import '../../widget/app-button.dart';
import '../../widget/apptexts.dart';
import '../../widget/inidicator.dart';
import '../../widget/onboarding-slider.dart';
import '../../widget/size24container.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({Key? key}) : super(key: key);

  @override
  _OnboardingPageState createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  List<SliderModel> slides = [];
  int currentIndex = 0;
  PageController? _controller;

  @override
  void initState() {
    super.initState();
    _controller = PageController(initialPage: 0);
    slides = getSlides();
  }

  @override
  void dispose(){
    _controller!.dispose();
    super.dispose();
  }

  skip(){
    storageService.storeItem(key: StorageKey.ONBOARDING_TABLE_NAME, value: true);
    navigationService.navigateToReplace(LOGINROUTE);
  }

  @override
  Widget build(BuildContext context) {
    return  AnnotatedRegion<SystemUiOverlayStyle>(
      value: SystemUiOverlayStyle.dark,
      child: Scaffold(
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          child: Stack(
              children:[
                Column(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 40,),
                      width: double.infinity,
                      child: GestureDetector(
                        onTap: skip,
                        child: Sized24Container(
                          child: Padding(
                            padding: const EdgeInsets.only(top: 16.0),
                            child: AppText(
                                LocaleData.skip.convertString(),
                                isBold: true,
                                size: 16.sp,
                                color: Theme.of(context).colorScheme.secondary,
                                align :TextAlign.end
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: PageView.builder(
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (value){
                            setState(() {
                              currentIndex = value;
                            });
                          },
                          itemCount: slides.length,
                          itemBuilder: (context, index){
                            return OnBoardingSlider(
                              image: slides[index].getImage(),
                              title: slides[index].getTitle(),
                              description: slides[index].getDescription(),
                            );
                          }
                      ),
                    ),
                    const SizedBox(height: 14,),
                    // Container created for dots
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Indicators(total: slides.length, current: currentIndex)
                      ],
                    ),
                    130.sp.sbH
                  ],
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child:  Padding(
                    padding: EdgeInsets.only(top: 34, bottom: 54.sp, left: 24, right: 24),
                    //width: double.infinity,
                    child: AppButton(
                      isLoading: false,
                      text: LocaleData.getStarted.convertString(),
                      onTap: skip,
                    ),
                  ),
                )
              ]
          ),
        ),
      ),
    );
  }
}