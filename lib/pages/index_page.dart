import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'home_page.dart';
import 'category_page.dart';
import 'cart_page.dart';
import 'member_page.dart';

class IndexPage extends StatefulWidget {
  @override
  _IndexPageState createState() {
    return _IndexPageState();
  }
}

class _IndexPageState extends State<IndexPage> {
  final List<BottomNavigationBarItem> bottomTabs = [
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.home),
      title: Text('首页'),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.search),
      title: Text('分类'),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.shopping_cart),
      title: Text('购物车'),
    ),
    BottomNavigationBarItem(
      icon: Icon(CupertinoIcons.profile_circled),
      title: Text('会员中心'),
    ),
  ];

  final List<Widget> tabBodys = [
    HomePage(),
    CategoryPage(),
    CartPage(),
    MemberPage(),
  ];

  final List<String> tabTitles = [
    "首页",
    "分类",
    "购物车",
    "会员中心"
  ];

  int currentIndex = 0;
  var currentPage;
  String currentTitle;

  TabController _tabController;

  @override
  void initState() {
    currentPage = tabBodys[currentIndex];
    currentTitle = tabTitles[currentIndex];

    _tabController = TabController(length: 4, vsync: ScrollableState());
    super.initState();

  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink,
        title: Text("${currentTitle}"),
      ),
      backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        items: bottomTabs,
        onTap: (index){
          setState(() {
            currentIndex = index;
            currentPage = tabBodys[currentIndex];
            currentTitle = tabTitles[currentIndex];
          });
        },
      ),
      body:IndexedStack(
        index: currentIndex,
        children: tabBodys
      ) ,
    );

//    return new Scaffold(
//        appBar: AppBar(
//          backgroundColor: Colors.pink,
//          title: Text("${tabTitles[_tabController.index]}"),
//        ),
//        backgroundColor: Color.fromRGBO(244, 245, 245, 1.0),
//        body: new TabBarView(controller: _tabController, children:tabBodys),
//        bottomNavigationBar: new Material(
//          color: Colors.pink,
//          child: new TabBar(
//            controller: _tabController,
//            tabs: <Tab>[
//              new Tab(text: "首页", icon: new Icon(CupertinoIcons.home)),
//              new Tab(text: "分类", icon: new Icon(CupertinoIcons.search)),
//              new Tab(text: "购物车", icon: new Icon(CupertinoIcons.shopping_cart)),
//              new Tab(text: "会员中心", icon: new Icon(CupertinoIcons.profile_circled)),],
//            indicatorWeight: 0.1,),
//        ),
//    );
  }
}