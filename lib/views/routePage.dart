import 'package:flutter/material.dart';

class RoutePage extends StatelessWidget {
  RoutePage({this.title});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('这是动态跳转过来的路由')
          ],
        ),
      ),
    );
  }
}