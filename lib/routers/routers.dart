import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import './router_handler.dart';

class Routers{
  static String root = '/';
  static String detailPage = '/detail';

  static void configureRouters(Router router){
    router.notFoundHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
        print('ERROR ==> ROUTER WAS NOT FOUND');
    });
    
    router.define(detailPage,  handler: bookDetailHandler);

  }
}