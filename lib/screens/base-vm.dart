import 'package:connectivity/connectivity.dart';
import 'package:cupertino_modal_sheet/cupertino_modal_sheet.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smartpay_app/data/cache/app-images.dart';
import 'package:smartpay_app/localization/locales.dart';
import 'package:smartpay_app/utils/string-extensions.dart';

import '../../locator.dart';
import '../data/cache/constants.dart';
import '../data/cache/view_state.dart';
import '../data/model/country-selector-model.dart';
import '../data/repository/repository.service.dart';
import '../data/routes/routes.dart';
import '../data/services/local/cache.service.dart';
import '../data/services/local/locale.service.dart';
import '../data/services/local/storage.service.dart';
import '../data/services/local/user.service.dart';
import '../widget/action-widget.dart';

class BaseViewModel extends ChangeNotifier {
  // IMPORT SERVICES TO BE USED
  ViewState _viewState = ViewState.Loading;
  LocaleService localeService = locator<LocaleService>();
  UserService userService = locator<UserService>();
  AppCache appCache = locator<AppCache>();
  StorageService storageService = locator<StorageService>();
  Repository repository = locator<Repository>();

  ViewState get viewState => _viewState;

  final formKey = GlobalKey<FormState>();

  // NAVIGATE TO SETUP PIN
  goToSetPin()async{
    navigationService.navigateTo(CREATEPINROUTE);
  }

  // NAVIGATE TO DASHBOARD
  goHome()async{
    navigationService.navigateToAndRemoveUntil(HOMEROUTE);
  }

  String convertPhoneNumber(String number) {
    String replacement = "0";
    if (number.length < 3) {
      // If the input string is less than 3 characters, replace the entire string
      return replacement + number.substring(replacement.length);
    } else {
      // Replace the first 3 characters and concatenate the rest of the string
      return replacement + number.substring(3);
    }
  }

  // LOGOUT THE USER
  showLogout()async{
    popDialog(
      context: navigationService.navigatorKey.currentState!.context,
      onTap: userService.logout,
      title: "${LocaleData.logOut.convertString()} ${(userService.user.fullName??"").toTitleCase()}",
    );
  }

  set viewState(ViewState newState) {
    _viewState = newState;
    _viewState == ViewState.Loading ? isLoading = true : isLoading = false;
    notifyListeners();
  }

  bool isLoading = false;

  void startLoader() {
    if (!isLoading) {
      isLoading = true;
      viewState = ViewState.Loading;
      notifyListeners();
    }
  }

  Future popDialog({
    required BuildContext context,
    VoidCallback? onTap,
    VoidCallback? otherOnTap,
    String? title,
    String? subTitle,
    String? cancelButtonText,
    String? doItButtonText,
    Widget? prefixIcon1,
    Widget? child,
    Widget? prefixIcon2,
  }) async {
    return await showCupertinoModalSheet(
      barrierDismissible: false,
      context: context,
      builder: (BuildContext context) => ActionBottomSheet(
        onTap: onTap,
        title: title,
        subTitle: subTitle,
        cancelButtonText: cancelButtonText,
        doItButtonText: doItButtonText,
        prefixIcon1: prefixIcon1,
        prefixIcon2: prefixIcon2,
        otherOnTap: otherOnTap,
        child: child,
      )
    );
  }

  void stopLoader() {
    if (isLoading) {
      isLoading = false;
      viewState = ViewState.Idle;
      notifyListeners();
    }
  }

  List<CountrySelectorModel> countries = [

    CountrySelectorModel(
      flag: AppImages.us,
      shortCode: "US",
      name: LocaleData.unitedState.convertString()
    ),
    CountrySelectorModel(
      flag: AppImages.uk,
      shortCode: "GB",
      name: LocaleData.unitedKingdom.convertString()
    ),
    CountrySelectorModel(
      flag: AppImages.nigeria,
      shortCode: "NG",
      name: LocaleData.nigeria.convertString()
    ),
    CountrySelectorModel(
      flag: AppImages.ghana,
      shortCode: "GH",
      name: LocaleData.ghana.convertString()
    ),
    CountrySelectorModel(
      flag: AppImages.singapore,
      shortCode: "SG",
      name: LocaleData.singapore.convertString()
    ),
    CountrySelectorModel(
      flag: AppImages.china,
      shortCode: "CN",
      name: LocaleData.china.convertString()
    ),
    CountrySelectorModel(
      flag: AppImages.netherlands,
      shortCode: "NL",
      name: LocaleData.netherlands.convertString()
    ),
    CountrySelectorModel(
      flag: AppImages.indonesia,
      shortCode: "ID",
      name: LocaleData.indonesia.convertString()
    ),

  ];


}