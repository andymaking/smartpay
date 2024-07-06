import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:smartpay_app/utils/app-buttom-sheet.dart';
import 'package:smartpay_app/utils/dartz.x.dart';
import 'package:smartpay_app/utils/snack_message.dart';

import '../../../data/cache/constants.dart';
import '../../../data/model/country-selector-model.dart';
import '../../../data/routes/routes.dart';
import '../../../widget/select-country-view.dart';
import '../../base-vm.dart';

class SignUpViewModel extends BaseViewModel {
  TextEditingController emailController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  TextEditingController fullNameController = TextEditingController();
  TextEditingController userNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController countryController = TextEditingController();


  CountrySelectorModel? selectedCountry;
  int secondsRemaining = 60;
  Timer? timer;

  selectCountry(CountrySelectorModel val){
    navigationService.goBack();
    countryController = TextEditingController(text: val.name);
    selectedCountry = val;
    notifyListeners();
    onChange("");
  }
  
  showCountries()async{
    appBottomSheet(ratio: 617/812, child: SelectCountryView(selectCountry: selectCountry, countries: countries, selectedCountry: selectedCountry,));
  }

  String formatTime(int seconds) {
    Duration duration = Duration(seconds: seconds);
    String formattedTime =
    DateFormat('mm:ss').format(DateTime(0, 1, 1, 0, 0, 0).add(duration));
    return formattedTime;
  }

  startTimer() {
    const oneSecond = Duration(seconds: 1);
    secondsRemaining = 60;
    timer = Timer.periodic(oneSecond, (Timer timer) {
      if (secondsRemaining > 0) {
        secondsRemaining--;
        notifyListeners();
      } else {
        timer.cancel(); // Stop the timer when it reaches 0
        notifyListeners();
      }
    });
  }

  verifyInitializer(){
    otpController.clear();
    otpController = TextEditingController(text: appCache.otp);
    startTimer();
    notifyListeners();
  }

  goToLogin()async{
    navigationService.navigateTo(LOGINROUTE);
  }

  onChange(String? val){
    formKey.currentState!.validate();
    notifyListeners();
  }

  onPinChange(String? val){
    otpController = TextEditingController(text: val);
    formKey.currentState!.validate();
    notifyListeners();
  }

  goToVerifyEmail() async {
    startLoader();
    try{
      var res = await repository.getOtp(email: emailController.text.trim());
      if(res.isRight()){
        stopLoader();
        TokenResModel tokenResModel = TokenResModel.fromJson(res.asRight().data);
        appCache.email = emailController.text.trim();
        appCache.otp = tokenResModel.token??"";
        navigationService.navigateTo(VERIFYOTPROUTE);
      }else{
        showCustomToast(res.asLeft().message??"");
        stopLoader();
      }
    }catch(err){
      debugPrint(err.toString());
      stopLoader();
    }

  }

  resendOTP()async{
    startLoader();
    try{
      var res = await repository.getOtp(email: appCache.email??"");
      if(res.isRight()){
        stopLoader();
        TokenResModel tokenResModel = TokenResModel.fromJson(res.asRight().data);
        appCache.otp = tokenResModel.token??"";
        otpController.clear();
        notifyListeners();
        showCustomToast("Your new pin is '${appCache.otp}'", seconds: 15, success: true);
      }else{
        showCustomToast(res.asLeft().message??"");
        stopLoader();
      }
    }catch(err){
      debugPrint(err.toString());
      stopLoader();
    }
  }

  verifyOtp()async{
    startLoader();
    try{
      var res = await repository.verifyOTP(email: appCache.email??"", token: otpController.text.trim());
      if(res.isRight()){
        stopLoader();
        showCustomToast(res.asRight().message??"", success: true);
        goToEnterDetails();
      }else{
        stopLoader();
        showCustomToast("Invalid OTP");
      }
    }catch(err){
      debugPrint(err.toString());
      stopLoader();
    }
  }


  goToEnterDetails()async{
    navigationService.navigateTo(ENTERDETAILSSIGNUPROUTE);
  }
}

class TokenResModel {
  String? token;

  TokenResModel({this.token});

  TokenResModel.fromJson(Map<String, dynamic> json) {
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['token'] = this.token;
    return data;
  }
}