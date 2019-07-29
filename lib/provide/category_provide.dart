import 'package:flutter/material.dart';

import 'dart:convert' as json;

import '../protocols/category_response_entity.dart';
import '../protocols/book_list_response_entity.dart';
import '../utils/http_utils.dart';
import '../config/service_url.dart';

class CategoryProvide with ChangeNotifier{
  List<CategoryResponseData> categoryData = [];
  List<CategoryResponseDataSubcategroy> subCategoryData = [];
  List<BookListResponseData> booksData = [];

  int mainIndex = 0;
  int subIndex = 0;
  requestCategory(String  uri) async{
    String url = servicePath[uri];

    HttpUitls.get(url:url, onCallback: (statecode, res){

      CategoryResponseEntity entity = CategoryResponseEntity.fromJson(json.jsonDecode(res));
      categoryData.clear();
      categoryData.addAll(entity.data);

      subCategoryData.clear();
      subCategoryData.addAll(entity.data[0].subCategroy);

      mainIndex = 0;
      notifyListeners();
    });
  }

  changeSubCategory(int index) async{
    if(index>= 0 && index < categoryData.length) {
      subCategoryData.clear();
      subCategoryData.addAll(categoryData[index].subCategroy);
      subIndex = 0;
      mainIndex = index;


      requestBooks('booklist', mainIndex, subIndex);
      notifyListeners();
    }
  }

  changeSubIndex(int index) async{
    subIndex = index;
    requestBooks('booklist', mainIndex, subIndex);

    notifyListeners();
  }


  requestBooks(String  uri, int category, int subcategory) async{
    String url = servicePath[uri];
    Map<String, dynamic> param = {'category':category, 'subcategory':subcategory};

    HttpUitls.get(url:url, parameters: param, onCallback: (statecode, res){

      BookListResponseEntity entity = BookListResponseEntity.fromJson(json.jsonDecode(res));
      booksData.clear();
      booksData.addAll(entity.data);

      notifyListeners();
    });
  }
}