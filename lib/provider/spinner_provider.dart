import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';
import '../protocols/spinner_response_entity.dart';
import '../utils/http_utils.dart';

import 'dart:convert' as json;

class SpinnerProvider extends Model{
  static SpinnerProvider instance = SpinnerProvider();

  List<SpinnerResponseDataSpinner> spinners;

  bool _isLoading = true;

  bool get isLoading => _isLoading;
  void requestSpinners(url) async{
    _isLoading = true;
    HttpUitls.get(url:url, onCallback: (statecode, res){
      SpinnerResponseEntity entity = SpinnerResponseEntity.fromJson(json.jsonDecode(res));
      spinners = entity.data.spinners;
      _isLoading = false;
      notifyListeners();
    });

  }
  List<SpinnerResponseDataSpinner> getSpinners(){
    return spinners;
  }

  static SpinnerProvider of(BuildContext context) =>
      ScopedModel.of<SpinnerProvider>(context);
}