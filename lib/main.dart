import 'package:flutter/material.dart';
import 'views/app.dart';

void main() {
  runApp(MyApp());
}

//class FirstRoute extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text('First Route'),
//      ),
//      body: Center(
//        child: Column(
//          children: [
//            RaisedButton(
//              child: Text('Open route'),
//              onPressed: () {
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(builder: (context) => SecondRoute()),
//                );
//              },
//            ),
//            RaisedButton(
//              child: Text('跳转至登录页'),
//              onPressed: () {
//                Navigator.push(
//                  context,
//                  MaterialPageRoute(builder: (context) => Login()),
//                );
//              },
//            ),
//            RaisedButton(
//              child: Text('跳转至静态路由页1'),
//              onPressed: () {
//                Navigator.of(context).pushNamed('/router/static');
//              },
//            ),
//            RaisedButton(
//              child: Text('跳转至动态路由页'),
//              onPressed: () {
//                Navigator
//                    .of(context)
//                    .push(MaterialPageRoute(builder: (_) {
//                      return RoutePage(title: '测试传参',);
//                }));
//              },
//            ),
//          ],
//        ),
//      ),
//    );
//  }
//}
//
//class SecondRoute extends StatelessWidget {
//  @override
//  Widget build(BuildContext context) {
//    return Scaffold(
//      appBar: AppBar(
//        title: Text("Second Route"),
//      ),
//      body: Center(
//        child: RaisedButton(
//          onPressed: () {
//            Navigator.pop(context);
//          },
//          child: Text('Go back!'),
//        ),
//      ),
//    );
//  }
//}