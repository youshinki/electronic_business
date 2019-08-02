import 'package:flutter/material.dart';
import 'package:fluro/fluro.dart';

import './pages/index_page.dart';
import 'package:provide/provide.dart';
import './provide/counter.dart';
import './provide/category_provide.dart';
import './routers/application.dart';
import './routers/routers.dart';

void main(){
  var conter = Counter();
  var prividers = Providers();
  var categoryProivde = CategoryProvide();
  prividers..provide(Provider<Counter>.value(conter))
           ..provide(Provider<CategoryProvide>.value(categoryProivde));
  
  Application.router = Router();
  Routers.configureRouters(Application.router);

  runApp(ProviderNode(child: MyApp(), providers: prividers,));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      child: MaterialApp(
        title: 'Red Shop',
        onGenerateRoute: Application.router.generator,
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primaryColor: Colors.pink,

        ),
        home: IndexPage(),
      ),
    );
  }

}

