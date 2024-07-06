import 'package:flutter/material.dart';
import 'package:smartpay_app/data/cache/constants.dart';
import 'package:smartpay_app/data/routes/routes.dart';
import 'package:smartpay_app/utils/dartz.x.dart';
import 'package:smartpay_app/utils/snack_message.dart';

import '../../base-vm.dart';

class LoginViewModel extends BaseViewModel{
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  onChange(String? val){
    formKey.currentState!.validate();
    notifyListeners();
  }

  goToSignUp()async{
    navigationService.navigateTo(SIGNUPROUTE);
  }
  
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