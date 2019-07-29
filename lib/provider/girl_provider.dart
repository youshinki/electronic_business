import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';
import '../protocols/girl_response_entity.dart';
import '../utils/http_utils.dart';

import 'dart:convert' as json;

class GirlProvider extends Model{
  GirlResponseData girl;

  bool _isLoading = true;

  bool get isLoading => _isLoading;
  void requestGirl(url, name) async{
    _isLoading = true;
    Map<String, dynamic> param = {'name':name};
    HttpUitls.post(url:url, parameters: param, onCallback: (statecode, res){
      GirlResponseEntity entity = GirlResponseEntity.fromJson(json.jsonDecode(res));
      girl = entity.data;
      _isLoading = false;
      notifyListeners();
    });

  }
  GirlResponseData getGirl(){
    return girl;
  }

  static GirlProvider of(BuildContext context) =>
      ScopedModel.of<GirlProvider>(context);
}