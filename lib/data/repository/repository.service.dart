import 'package:dartz/dartz.dart';
import 'package:smartpay_app/data/cache/constants.dart';
import 'package:smartpay_app/utils/dartz.x.dart';

import '../../locator.dart';
import '../model/default.model.dart';
import '../model/loginResponse.dart';
import '../services/web/authentication.service.dart';

AuthenticationService _auth = locator<AuthenticationService>();

class Repository {

  Future<Either<ResModel, LoginResponse>> login({
    required String email,
    required String password
  }) async {
    var response = await _auth.login(email: email, password: password);
    if(response.isRight()){
      if(response.asRight().status == true){
        await userService.storeToken(accessToken: response.asRight().data?.token??"");
        await userService.storeUser(response.asRight().data?.user);
      }
    }
    return response;
  }

  Future<Either<ResModel, ResModel>> getOtp({
    required String email
  }) async {
    var response = await _auth.getOtp(email: email);
    return response;
  }

  Future<Either<ResModel, ResModel>> verifyOTP({
    required String email,
    required String token,
  }) async {
    var response = await _auth.verifyOTP(email: email, token: token);
    return response;
  }


}