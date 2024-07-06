import 'dart:convert';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../utils/get-device-name.dart';
import '../../model/default.model.dart';
import '../../model/loginResponse.dart';
import 'base.api.service.dart';

class AuthenticationService {

  Future<Either<ResModel, ResModel>> signUp({
    required String phoneNumber,
    required String email,
    required String firstName,
    required String lastName,
    required String gender,
    required String password,
  }) async {
    try {
      Response response = await connect().post("auth/signup/password", data: {
        "phoneNumber": phoneNumber,
        "email": email,
        "name": "$firstName $lastName",
        "gender": gender.toUpperCase(),
        "password": password,
      });
      return Right(ResModel.fromJson(jsonDecode(response.data)));
    } on DioError catch (e) {
      return Left(resModelFromJson(e.response?.data));
    } catch (e) {
      return Left(ResModel(message: e.toString()));
    }
  }

  Future<Either<ResModel, LoginResponse>> login({
    required String email,
    required String password
  }) async {
    try {
      Response response = await connect().post("auth/login", data: {
        "email": email,
        "password": password,
        "device_name": await getDeviceName()
      });
      return Right(LoginResponse.fromJson(jsonDecode(response.data)));
    } on DioError catch (e) {
      return Left(resModelFromJson(e.response?.data));
    } catch (e) {
      return Left(ResModel(message: e.toString()));
    }
  }

  Future<Either<ResModel, ResModel>> getOtp({
    required String email
  }) async {
    try {
      Response response = await connect().post("auth/email", data: {
        "email": email,
      });
      return Right(ResModel.fromJson(jsonDecode(response.data)));
    } on DioError catch (e) {
      return Left(resModelFromJson(e.response?.data));
    } catch (e) {
      return Left(ResModel(message: e.toString()));
    }
  }

  Future<Either<ResModel, ResModel>> verifyOTP({
    required String email,
    required String token,
  }) async {
    try {
      Response response = await connect().post("auth/email/verify", data: {
        "email": email,
        "token": token,
      });
      return Right(ResModel.fromJson(jsonDecode(response.data)));
    } on DioError catch (e) {
      return Left(resModelFromJson(e.response?.data));
    } catch (e) {
      return Left(ResModel(message: e.toString()));
    }
  }



}
