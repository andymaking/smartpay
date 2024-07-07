import 'package:flutter/material.dart';
import 'package:smartpay_app/data/cache/constants.dart';
import 'package:smartpay_app/data/routes/routes.dart';
import 'package:smartpay_app/utils/snack_message.dart';

import '../../base-vm.dart';

class ForgotPasswordViewModel extends BaseViewModel {

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  onChange(String? val){
    formKey.currentState!.validate();
    notifyListeners();
  }

  goToVerify(){
    appCache.email = emailController.text.trim();
    navigationService.navigateTo(VERIFYFORGOTHOMEROUTE);
  }

  goToCreateNewPassword(){
    navigationService.navigateTo(CREATEPASSWORDFORGOTHOMEROUTE);
  }

  goBackLogin(){
    showCustomToast("We are sorry API not given for this");
    navigationService.navigateToAndRemoveUntil(LOGINROUTE);
  }

}