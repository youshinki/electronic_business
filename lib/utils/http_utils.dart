
import 'package:dio/dio.dart';
import 'dart:convert' as json;

class HttpUitls{


  static void  get({url, Map<String, dynamic> parameters,onCallback}) async{
    try {
      print('http-get url:' + url + ' parameters:' + parameters.toString());
      final response = await Dio().get(url, queryParameters: parameters);
      print(response.toString());

      onCallback(response.statusCode, response.toString());
    }catch(e){
      print(e);
    }
  }

  static void post({url, Map<String, dynamic> parameters, data, onCallback}) async{
    try{
      print('http-post url:' + url + ' parameters:' + parameters.toString());

      final response = await Dio().post(url, data: data, queryParameters: parameters);

      print('http-post response:' + response.toString());

      onCallback(response.statusCode, response.toString());
    }catch (e){
      print(e);
    }
  }
}
