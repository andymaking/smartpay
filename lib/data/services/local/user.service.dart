import 'dart:convert';

import 'package:smartpay_app/data/routes/routes.dart';

import '../../../locator.dart';
import '../../cache/constants.dart';
import '../../cache/database-keys.dart';
import '../../model/loginResponse.dart';
import '../../repository/repository.service.dart';

Repository _repository = locator<Repository>();

class UserService {
  User user = User();
  bool isUserLoggedIn = false;
  bool isUserSetPin = false;
  bool isUserServiceProvider = false;

  // STORE TOKEN
  storeToken({required String accessToken, String? refreshToken}) async {
    await storageService.storeItem(key: StorageKey.TOKEN_TABLE_NAME, value: accessToken);
    if(refreshToken!=null){
      await storageService.storeItem(key: StorageKey.REFRESH_TOKEN_TABLE_NAME, value: refreshToken);
    }
    isUserLoggedIn = true;
  }

  // INITIALIZE THE USER ACCOUNT TO GET CURRENT STATE OF USER
  initializer() async {
    String? userToken = await storageService.read(key: StorageKey.TOKEN_TABLE_NAME);
    if(userToken==null){
      user = User();
      isUserLoggedIn = false;
    }else{
      isUserLoggedIn = true;
      await getStoreUser();
      if(await storageService.readItem(key: StorageKey.PIN_SET_TABLE_NAME) == null){
        isUserSetPin = false;
      }else{
        isUserSetPin = true;
      }
    }
    print("Is User Logged In:::: $isUserLoggedIn");
    print("Is User Pin Set:::: $isUserSetPin");
  }

  // STORE USER
  storeUser(User? response) async {
    print("Store User");
    await storageService.storeItem(key: StorageKey.USER_TABLE_NAME, value: jsonEncode(response));
    user = response??User();
  }

  // LOGOUT FUNCTION
  logout() async {
    storageService.deleteAllItems();
    await storageService.deleteAllItems();
    isUserLoggedIn = false;
    user = User();
    navigationService.navigateToAndRemoveUntil(LOGINROUTE);
  }

  // GET STORED USER
  Future<User?> getStoreUser()  async {
    String? data = await storageService.readItem(key: StorageKey.USER_TABLE_NAME);
    if(data==null){
      logout();
      return null;
    }else{
      User userResponse = User.fromJson(jsonDecode(data));
      user = userResponse;
      return user;
    }
  }

}