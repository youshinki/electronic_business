import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';
import '../pages/detail_page.dart';

Handler bookDetailHandler = Handler(handlerFunc: (BuildContext context, Map<String, dynamic> params) {
  return BookDetail(book:params["book"][0]);
});

