import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_easyrefresh/easy_refresh.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../provider/books_provider.dart';
import '../config/service_url.dart';
import '../provider/spinner_provider.dart';
import '../provider/navi_provider.dart';
class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    ScreenUtil.instance = ScreenUtil(width: 750, height: 1334)..init(context);

    BooksProvider provider = BooksProvider.instance;
    if(provider.isLoading) {
      provider.requestBooks(servicePath['books']);
    }

    SpinnerProvider spinnerProvider = SpinnerProvider.instance;
    if(spinnerProvider.isLoading) {
      spinnerProvider.requestSpinners(servicePath['spinner']);
    }

    NaviProvider naviProvider = NaviProvider.instance;
    if(naviProvider.isLoading){
      naviProvider.requestNavi(servicePath['navi']);
    }
    // TODO: implement build
    return ScopedModel<BooksProvider>(
      model: provider,
      child:  ScopedModel<SpinnerProvider>(
        model: spinnerProvider,
        child: ScopedModel<NaviProvider>(
          model: naviProvider,
          child: Scaffold(
            body: _HomePage(),
          ),
        )
      )
    );
  }
}

class _HomePage extends StatefulWidget{


  @override
  __HomePageState createState() {
    return __HomePageState();
  }
}

class __HomePageState extends State<_HomePage>  with AutomaticKeepAliveClientMixin  {

  BooksProvider model;
  SpinnerProvider spinnerProvider;

  GlobalKey<ClassicsFooterState> _globalKey = new GlobalKey<ClassicsFooterState>();
  @override
  bool get wantKeepAlive => true;

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
    return EasyRefresh(
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
      child: ListView(
        children: <Widget>[
          SwiperDiy(),
          TopNavigater(),
          AdBanner(adPicture:'http://img61.ddimg.cn/upload_img/00796/1/1242x332_dl_0722-1563949014.jpg'),
          LeaderPhone(
            leaderImage: 'http://img55.ddimg.cn/117110047250985_y.jpg',
            leaderPhone: '13521135911',
          ),
          _buildTitle(),
          ScopedModelDescendant<BooksProvider>(
            builder: (context, child, model) {
              this.model = model;
              return model.isLoading
                  ? _buildCircularProgressIndicator()
                  : _buildListView();
            },
          )
        ],
      ),
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
    );
  }

  _buildCircularProgressIndicator() {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
  _buildTitle(){
    return Container(
      margin: EdgeInsets.only(top:10),
      alignment: Alignment.center,
      color: Colors.transparent,
      child: Text(
        '火爆专区',
        style: TextStyle(
          color: Colors.pink,
          fontSize: ScreenUtil().setSp(30)
        ),
      ),
    );
  }
  _buildListView(){
    if(model.isLoading){
      return Text('loading');
    }else{
      List<Widget> listwidget = [];
      for (var book in model.getBooks()) {
        Widget w = InkWell(
              onTap: (){},
              child: Container(
                width: ScreenUtil().setWidth(372),
                color: Colors.white,
                padding: EdgeInsets.all(5),
                margin: EdgeInsets.only(bottom: 3),
                child: Column(
                  children: <Widget>[
                    Image.network(
                      '${book.imageUrl}',
                      width: ScreenUtil().setWidth(370),
                    ),
                    Text(
                      '${book.title}', 
                      maxLines: 1, 
                      overflow: 
                      TextOverflow.ellipsis, 
                      style: TextStyle(
                        color: Colors.pink,
                        fontSize: ScreenUtil().setSp(26),
                      ),
                    ),
                    Text(
                      '${book.description}',
                      maxLines: 1, 
                      overflow: 
                      TextOverflow.ellipsis, 
                      style: TextStyle(
                        color: Colors.pink,
                        fontSize: ScreenUtil().setSp(26),
                      ),
                    ),
                  ],
                ),
              ),
            );
            listwidget.add(w);
      }
      return Wrap(
        spacing: 2,
        children: listwidget
      ) ;
    }
  }
}

class SwiperDiy extends StatelessWidget {
  SpinnerProvider spinnerProvider;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModelDescendant<SpinnerProvider>(
      builder: (context, child, model){
        this.spinnerProvider = model;
        return _buildSpinnerView();
      },
    );


  }
  _buildSpinnerView(){
    return Container(
      height: ScreenUtil().setHeight(230),
      child: spinnerProvider.isLoading
          ? Center(child: Text("loading..."),)
          :Swiper(
        itemCount: spinnerProvider.spinners.length,
        itemBuilder: (context, index){
          return Image.network(spinnerProvider.spinners[index].imageUrl, fit: BoxFit.fill,);
        },
        pagination: SwiperPagination(),
        autoplay: true,
      ),
    );
  }
}


class TopNavigater extends StatelessWidget {
  NaviProvider naviProvider;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return ScopedModelDescendant<NaviProvider>(
      builder: (context, child, model){
        this.naviProvider = model;
        return _buildNavigater();
      },
    );
  }

  _buildNavigater(){
    return Container(
      height: ScreenUtil().setHeight(300),
      child: naviProvider.isLoading? Center(child: Text('loading...'),):
          GridView.builder(
            physics: NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 4),
            itemCount: naviProvider.icons.length, 
            itemBuilder: (context, index){
             return InkWell(
               onTap: (){ print('点击了${naviProvider.icons[index].iconName}');},
               child: Image.network(naviProvider.icons[index].iconUrl),
             );
          }),
    );
  }

}

class AdBanner extends StatelessWidget {
  String adPicture;

  AdBanner({Key key, this.adPicture}) :super(key:key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: ScreenUtil().setHeight(200),
      child: Image.network(adPicture, fit: BoxFit.fill,),
    );
  }
}


class LeaderPhone extends StatelessWidget {
  String leaderImage ='';
  String leaderPhone = '';


  LeaderPhone({Key key, this.leaderImage, this.leaderPhone}):super(key : key);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      height: ScreenUtil().setHeight(200),
      child: InkWell(
        onTap: (){},
        child: Image.network(this.leaderImage),
      ),
    );
  }
}
