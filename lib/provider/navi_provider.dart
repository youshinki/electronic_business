import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';
import '../protocols/navi_response_entity.dart';
import '../utils/http_utils.dart';

import 'dart:convert' as json;

class NaviProvider extends Model{
  static NaviProvider instance = NaviProvider();
  List<NaviResponseDataIcon> icons;

  bool _isLoading = true;

  bool get isLoading => _isLoading;
  void requestNavi(url) async{
    _isLoading = true;
    HttpUitls.get(url:url, onCallback: (statecode, res){
      NaviResponseEntity entity = NaviResponseEntity.fromJson(json.jsonDecode(res));
      icons = entity.data.icons;
      _isLoading = false;
      notifyListeners();
    });

  }
  List<NaviResponseDataIcon> getGirl(){
    return icons;
  }

  static NaviProvider of(BuildContext context) =>
      ScopedModel.of<NaviProvider>(context);
}