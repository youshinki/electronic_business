import 'package:flutter/material.dart';
import 'package:provide/provide.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../protocols/book_list_response_entity.dart';
import '../provide/category_provide.dart';
import '../protocols/category_response_entity.dart';
import '../protocols/book_list_response_entity.dart';

class BookDetail extends StatelessWidget {
  final String book;
  const BookDetail({Key key, this.book}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('图书详情'),),
      backgroundColor: Colors.white,
      body: Provide<CategoryProvide>(
        builder: (context, child, categoryProvide){
          return categoryProvide==null?Text('loading...'):_buildDetail(categoryProvide, book);
        },
      ),
    );
  }

  _buildDetail(CategoryProvide categoryProvide, String id){
    BookListResponseData data = categoryProvide.getBookDetail(id);
    return Container(
      width: ScreenUtil().setWidth(750),
      height: ScreenUtil().setHeight(1000),
      child: Center(
        child: Column(
          children: <Widget>[
            Image.network(
              data.imageUrl,
              width: ScreenUtil().setWidth(750),
              ),
            Text(
              '${data.title}',
              style: TextStyle(
                fontSize: ScreenUtil().setSp(50),
              ),
            ),
            Text('作者：${data.writer}'),
            Text('出版社：${data.publisher}'),
          ],
        ),
      ),
    );
  }
}