import 'package:flutter/material.dart';

import './pages/index_page.dart';
import 'package:provide/provide.dart';
import './provide/counter.dart';
import './provide/category_provide.dart';

void main(){
  var conter = Counter();
  var prividers = Providers();
  var categoryProivde = CategoryProvide();
  prividers..provide(Provider<Counter>.value(conter))
           ..provide(Provider<CategoryProvide>.value(categoryProivde));

  runApp(ProviderNode(child: MyApp(), providers: prividers,));
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: MaterialApp(
        title: 'Red Shop',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.pink,

        ),
        home: IndexPage(),
      ),
    );
  }

}

