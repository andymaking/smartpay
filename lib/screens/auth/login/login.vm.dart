import 'package:flutter/material.dart';
import 'package:smartpay_app/data/cache/constants.dart';
import 'package:smartpay_app/data/cache/database-keys.dart';
import 'package:smartpay_app/data/routes/routes.dart';
import 'package:smartpay_app/localization/locales.dart';
import 'package:smartpay_app/utils/dartz.x.dart';
import 'package:smartpay_app/utils/snack_message.dart';
import 'package:smartpay_app/utils/string-extensions.dart';

import '../../base-vm.dart';

class LoginViewModel extends BaseViewModel{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController otpController = TextEditingController();

  // UPDATE APP STATE
  onChange(String? val){
    formKey.currentState!.validate();
    notifyListeners();
  }

  // NAVIGATE TO SIGN UP
  goToSignUp()async{
    navigationService.navigateTo(SIGNUPROUTE);
  }

  // NAVIGATE TO FORGET PASSWORD
  goToForgotPassword()async{
    navigationService.navigateTo(FORGOTHOMEROUTE);
  }

  // UPDATE STATE WHEN PIN IS EDITED
  onPinChange(String? val){
    otpController = TextEditingController(text: val);
    formKey.currentState!.validate();
    notifyListeners();
  }

  validatePin() async {
    var res = await storageService.readItem(key: StorageKey.PIN_SET_TABLE_NAME);
    if(otpController.text.trim()==res){
      showCustomToast("${LocaleData.welcomeBackUser.convertString()}${userService.user.fullName??""}", success: true);
      goHome();
    }else{
      showCustomToast("Sorry your pin is in correct");
    }
  }

  // LOGIN THEN HANDLE RESPONSES
  login()async{
    startLoader();
    try{
      var response = await repository.login(
        email: emailController.text.trim(), 
        password: passwordController.text.trim()
      );
      if(response.isRight()){
        stopLoader();
        showCustomToast(response.asRight().message??"", success: true);
        if(await storageService.readItem(key: StorageKey.PIN_SET_TABLE_NAME) == null){
          // HOLD INFORMATION IN CACHE
          appCache.loginResponse = response.asRight();
          appCache.fromLogin = true;
          // NAVIGATE TO SET PIN IF NO PIN IS SET
          goToSetPin();
        }else{
          // NAVIGATE TO DASHBOARD
          goHome();
        }
        notifyListeners();
      }else{
        stopLoader();
        showCustomToast(response.asLeft().message??"");
      }
    }catch(err){
      debugPrint(err.toString());
      stopLoader();
    }
  }
}