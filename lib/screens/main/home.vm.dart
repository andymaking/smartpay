import 'package:flutter/foundation.dart';
import 'package:smartpay_app/utils/dartz.x.dart';

import '../../data/model/message-response.dart';
import '../base-vm.dart';

class HomeViewModel extends BaseViewModel {

  MessageData? messageData;

  getMessage()async{
    startLoader();
    try{
      var res = await repository.getMessage();
      if(res.isRight()){
        messageData = MessageData.fromJson(res.asRight().data);
      }
      stopLoader();
      notifyListeners();
    }catch(err){
      debugPrint(err.toString());
      stopLoader();
    }
  }

}