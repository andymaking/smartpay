import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:smartpay_app/data/cache/app-images.dart';
import 'package:smartpay_app/data/cache/constants.dart';
import 'package:smartpay_app/data/cache/palette.dart';
import 'package:smartpay_app/localization/locales.dart';
import 'package:smartpay_app/utils/string-extensions.dart';
import 'package:smartpay_app/utils/themeData.dart';
import 'package:smartpay_app/utils/widget_extensions.dart';
import 'package:smartpay_app/widget/app-card.dart';
import 'package:smartpay_app/widget/apptexts.dart';
import 'package:smartpay_app/widget/image_builder.dart';
import 'package:smartpay_app/widget/text_field.dart';

import '../data/model/country-selector-model.dart';

class SelectCountryView extends StatefulWidget {
  final List<CountrySelectorModel> countries;
  final CountrySelectorModel? selectedCountry;
  final Function(CountrySelectorModel) selectCountry;
  const SelectCountryView({
    super.key,
    required this.selectCountry,
    this.selectedCountry,
    required this.countries
  });

  @override
  State<SelectCountryView> createState() => _SelectCountryViewState();
}

class _SelectCountryViewState extends State<SelectCountryView> {
  List<CountrySelectorModel> countries = [];

  @override
  void initState() {
    countries = widget.countries;
    super.initState();
  }
  
  getCountries(String? val){
    if(val == null ){
      setState(() {});
      return;
    }else{
      countries = widget.countries.where((element) => element.name.toLowerCase().contains(val!.toLowerCase())).toList();
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 20.sp, left: 16.sp, right: 20.sp),
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                child: AppTextField(
                  borderRadius: 20.sp,
                  onChanged: getCountries,
                  prefix: Padding(
                    padding: 6.sp.padH,
                    child: buildSvgPicture(image: AppImages.search, size: 24.sp,),
                  ),
                  hint: LocaleData.search.convertString(),
                ),
              ),
              InkWell(
                onTap: navigationService.goBack,
                child: Padding(
                  padding: EdgeInsets.only(left: 20.sp, top: 5.sp, bottom: 5.sp),
                  child: AppText(
                    LocaleData.cancel.convertString(),
                    weight: FontWeight.w700,
                    size: 16.sp,
                  ),
                ),
              )
            ],
          ),
          16.sp.sbH,
          Expanded(
            child: ListView.builder(
              padding: 16.sp.padB,
              itemCount: countries.length,
              itemBuilder: (_, index){
                return AppCard(
                  borderRadius: BorderRadius.circular(16.sp),
                  onTap:()=> widget.selectCountry(countries[index]),
                  margin: 8.sp.padB,
                  color: widget.selectedCountry == countries[index]? textFieldBackgroundColor: null,
                  child: Row(
                    children: [
                      Expanded(
                        child: Row(
                          children: [
                            SvgPicture.asset(
                              countries[index].flag,
                              width: 32.sp,
                              fit: BoxFit.fitWidth,
                            ),
                            16.sp.sbW,
                            AppText(
                              countries[index].shortCode,
                              size: 16.sp,
                              color: const Color(0xFF6B7280),
                            ),
                            16.sp.sbW,
                            AppText(
                              countries[index].name,
                              size: 16.sp,
                            ),
                          ],
                        ),
                      ),
                      widget.selectedCountry == countries[index]? Icon(CupertinoIcons.check_mark, color: themeData.colorScheme.secondary,): 0.0.sbW
                    ],
                  ),
                );
              }
            ),
          )
        ],
      ),
    );
  }
}
