import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provide/provide.dart';
import '../provide/counter.dart';

class CartPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      body: Center(
        child: Column(
          children: <Widget>[
            Number(),
            MyButton(),
            MyButton1(),
          ],
        ),
      ),
    );
  }
}

class Number extends StatelessWidget {
  const Number({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Provide<Counter>(
        builder: (context, child, counter){
          return Text(
            '${counter.value}',
            style: TextStyle(
              color: Colors.pink,
              fontSize: ScreenUtil().setSp(50)
            ),
            );
        },
      )
    );
  }
}


class MyButton extends StatelessWidget {
  const MyButton({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var borderRadius2 = 5;
    return Container(
      child: RaisedButton(
        color: Colors.pink,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        onPressed: (){
          Provide.value<Counter>(context).increment();
        },
        child: Text(
          'add', 
          style: TextStyle(
            fontSize: ScreenUtil().setSp(50),
          ),
        ),
        
      ),
    );
  }
}

class MyButton1 extends StatelessWidget {
  const MyButton1({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: RaisedButton(
        color: Colors.pink,
        textColor: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(5)),
        ),
        onPressed: (){
          Provide.value<Counter>(context).decrement();
        },
        child: Text(
          'decrease',
          style: TextStyle(
            fontSize: ScreenUtil().setSp(50),
          ),
        ),
      ),
    );
  }
}