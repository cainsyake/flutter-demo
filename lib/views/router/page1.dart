import 'package:flutter/material.dart';

class PageOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('路由页1'),
      ),
      body: Center(
        child: Text('路由页1内容'),
      ),
    );
  }
}