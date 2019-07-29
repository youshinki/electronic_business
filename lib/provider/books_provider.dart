import 'package:flutter/cupertino.dart';
import 'package:scoped_model/scoped_model.dart';
import '../protocols/books_response.dart';
import '../utils/http_utils.dart';

import 'dart:convert' as json;

class BooksProvider extends Model{
  static BooksProvider instance = BooksProvider();

  List<BooksResponseBook> books = List<BooksResponseBook>();

  bool _isLoading = true;

  bool get isLoading => _isLoading;
  void requestBooks(url) async{
      HttpUitls.get(url:url, onCallback: (statecode, res){

      BooksResponseEntity entity = BooksResponseEntity.fromJson(json.jsonDecode(res));
      books.clear();
      books.addAll(entity.books);

      _isLoading = false;
      notifyListeners();
    });

  }
  List<BooksResponseBook> getBooks (){
    return books;
  }

  static BooksProvider of(BuildContext context) =>
      ScopedModel.of<BooksProvider>(context);
}