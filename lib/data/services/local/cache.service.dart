import 'package:smartpay_app/data/model/loginResponse.dart';

class AppCache {

  String? email;
  bool? fromLogin;
  String? otp;
  LoginResponse? loginResponse;

  clearAuth(){
    email = null;
    otp = null;
    loginResponse = null;
  }

}
