import 'package:electronic_business/protocols/book_list_response_entity.dart';
import 'package:electronic_business/protocols/navi_response_entity.dart';
import 'package:electronic_business/protocols/category_response_entity.dart';
import 'package:electronic_business/protocols/girl_response_entity.dart';
import 'package:electronic_business/protocols/spinner_response_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "BookListResponseEntity") {
      return BookListResponseEntity.fromJson(json) as T;
    } else if (T.toString() == "NaviResponseEntity") {
      return NaviResponseEntity.fromJson(json) as T;
    } else if (T.toString() == "CategoryResponseEntity") {
      return CategoryResponseEntity.fromJson(json) as T;
    } else if (T.toString() == "GirlResponseEntity") {
      return GirlResponseEntity.fromJson(json) as T;
    } else if (T.toString() == "SpinnerResponseEntity") {
      return SpinnerResponseEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}