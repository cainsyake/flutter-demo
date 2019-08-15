import 'package:flutter/material.dart';

class StaticOne extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('静态页面1'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('静态页面1'),
            RaisedButton(
              child: Text('返回上一页'),
              onPressed: () {
                Navigator.of(context).pop('return from static');
              },
            )
          ],
        ),
      ),
    );
  }
}
