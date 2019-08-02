import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../routers/routers.dart';
import '../routers/application.dart';
import '../provide/category_provide.dart';
import '../protocols/category_response_entity.dart';
import '../protocols/book_list_response_entity.dart';
class CategoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return  Scaffold(
        body:_CategoryPage(),
      );
  }
}

class _CategoryPage extends StatefulWidget {
  @override
  __CategoryPageState createState() {
    return __CategoryPageState();
  }
}

class __CategoryPageState extends State<_CategoryPage> {


  @override
  void initState() {
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Provide.value<CategoryProvide>(context).requestCategory("category");
    Provide.value<CategoryProvide>(context).requestBooks('booklist', 0, 0);
    // TODO: implement build
    return  Container(
      child: Row(
        children: <Widget>[
          LeftCategory(),
          Column(
            children: <Widget>[
              RightSubCategory(),
              RightBookList(),
            ],
          ),
        ],
      ),
    );
  }


}

class LeftCategory extends StatefulWidget {
  @override
  _LeftCategoryState createState() {
    return _LeftCategoryState();
  }
}

class _LeftCategoryState extends State<LeftCategory> {
  int currentIndex = 0;
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: Provide<CategoryProvide>(
        builder: (context, child, categoryProvide){
          return categoryProvide==null?Text('loading...'):_buildList(categoryProvide.categoryData);
        },
      ),
    );
  }


  _buildItem(List<CategoryResponseData> list, int index){
    bool isAcitve = (index == currentIndex);
    return InkWell(
      onTap: (){
        setState(() {
          currentIndex = index;
        });

        Provide.value<CategoryProvide>(context).changeSubCategory(index);

      },
      child: Container(
        height: ScreenUtil().setWidth(90),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 5),
        decoration: BoxDecoration(
            color: isAcitve? Colors.black12 : Colors.white,
            border: Border(
              bottom: BorderSide(color: Colors.black26, width: 1),
            )
        ),
        child: Text(
          '${list[index].name}',
          style: TextStyle(fontSize: ScreenUtil().setSp(30)),
        ),
      ),
    );
  }

  _buildList(List<CategoryResponseData> list){
    return Expanded(
        child: Container(
          width: ScreenUtil().setWidth(190),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                right: BorderSide(color: Colors.black26, width: 1),
              )
          ),
          child: ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index){
                return _buildItem(list, index);
              }),
        ));
  }
}

class RightSubCategory extends StatefulWidget {
  @override
  _RightSubCategoryState createState() {
    return _RightSubCategoryState();
  }
}

class _RightSubCategoryState extends State<RightSubCategory> {
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: ScreenUtil().setWidth(570),
      height: ScreenUtil().setHeight(60),
      child: Provide<CategoryProvide>(
        builder: (context, child, categoryProvide){
          return _buildList(categoryProvide.subCategoryData, categoryProvide.subIndex);
        },
      ),
    );
  }

  _buildItem(List<CategoryResponseDataSubcategroy> list, int index, int subIndex){
    bool isActive = (index == subIndex);
    return InkWell(
      onTap: (){
//        setState(() {
//          currentIndex = index;
//        });
//
        Provide.value<CategoryProvide>(context).changeSubIndex(index);

      },
      child: Container(
        height: ScreenUtil().setHeight(60),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(color: Colors.black26, width: 1),
            )
        ),
        child: Text(
          '${list[index].name}',
          style: TextStyle(
              fontSize: ScreenUtil().setSp(30),
              color: isActive?Colors.pink:Colors.black,
          ),
        ),
      ),
    );
  }

  _buildList(List<CategoryResponseDataSubcategroy> list, int subIndex){
    return  Container(
          
          width: ScreenUtil().setWidth(570),
          decoration: BoxDecoration(
              color: Colors.white,
              border: Border(
                right: BorderSide(color: Colors.black26, width: 1),
              )
          ),
          child: ListView.builder(
              scrollDirection:Axis.horizontal,
              itemCount: list.length,
              itemBuilder: (context, index){
                return _buildItem(list, index, subIndex);
              }),
        );
  }

}

class RightBookList extends StatefulWidget {
  @override
  _RightBookListState createState() {
    return _RightBookListState();
  }
}

class _RightBookListState extends State<RightBookList> {

  GlobalKey<ClassicsFooterState> _globalKey = new GlobalKey<ClassicsFooterState>();


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Provide<CategoryProvide>(
        builder: (context, child, categoryProvide){
          return _buildList(categoryProvide.booksData);
        },
      ),
    );
  }
  
  _buildLeftImage(String src){
    return Container(
      width: ScreenUtil().setWidth(150),
      child: Image.network(src),
    );
  }

  _buildRightTitle(String title){
    return Container(
      width: ScreenUtil().setWidth(380),
      padding: EdgeInsets.only(left: 5),

      child: Text(
        '${title}',
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(35),
        ),
      ),
    );
  }
  _buildRightWriter(String writer) {
    return Container(
      width: ScreenUtil().setWidth(380),
      padding: EdgeInsets.only(left: 5),
      child: Text(
        '作者：${writer}',
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(30),
          color: Colors.black45,

        ),
      ),
    );
  }
  _buildRightPublisher(String publisher) {
    return Container(
      width: ScreenUtil().setWidth(380),
      padding: EdgeInsets.only(left: 5),
      child: Text(
        '出版社：${publisher}',
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: ScreenUtil().setSp(30),
          color: Colors.black45,

        ),
      ),
    );
  }

  _buildRightPrice() {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Text(
        '￥37.50',
        style: TextStyle(
          fontSize: ScreenUtil().setSp(30),
          color: Colors.red,

        ),
      ),
    );
  }

  _buildRightPriceOld() {
    return Container(
      padding: EdgeInsets.only( top: 20),
      child: Text(
        '￥37.50',
        style: TextStyle(
          fontSize: ScreenUtil().setSp(30),
          color: Colors.black26,
          decoration: TextDecoration.lineThrough,
        ),
      ),
    );
  }

  _buildItem(List<BookListResponseData> list, int index){
    return InkWell(
      onTap: (){
        Application.router.navigateTo(context, '${Routers.detailPage}?book=${list[index].id.toString()}');
      },
      child: Container(
        height: ScreenUtil().setHeight(200),
        alignment: Alignment.centerLeft,
        padding: EdgeInsets.only(left: 10),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              bottom: BorderSide(color: Colors.black26, width: 1),
            )
        ),
        child: Row(
          children: <Widget>[
            _buildLeftImage(list[index].imageUrl),
            Column(
              children: <Widget>[
                _buildRightTitle(list[index].title),
                _buildRightWriter(list[index].writer),
                _buildRightPublisher(list[index].publisher),
                Row(
                  children: <Widget>[
                    _buildRightPrice(),
                    _buildRightPriceOld(),
                  ],
                ),

              ],
            ),
          ],
        )
      ),
    );
  }

  _buildList(List<BookListResponseData> list){
    return Expanded(
      child: Container(

        width: ScreenUtil().setWidth(570),
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border(
              right: BorderSide(color: Colors.black26, width: 1),
            )
        ),
        child:EasyRefresh(
            refreshFooter: ClassicsFooter(
              key: _globalKey,
              bgColor: Colors.white,
              textColor: Colors.pink,
              moreInfoColor: Colors.pink,
              showMore: true,
              noMoreText: '',
              moreInfo: '加载中',
              loadReadyText:'上拉加载',
            ),
            child:  ListView.builder(
              itemCount: list.length,
              itemBuilder: (context, index){
                return _buildItem(list, index);
              }),
            loadMore: (){
              Fluttertoast.showToast(
                  msg: '没有更多数据了',
                  toastLength: Toast.LENGTH_SHORT,
                  gravity: ToastGravity.CENTER,
                  timeInSecForIos: 1,
                  backgroundColor: Colors.pink,
                  textColor: Colors.white,
                  fontSize: 16.0
              );
            },
        )
      ),
    );
  }
}
