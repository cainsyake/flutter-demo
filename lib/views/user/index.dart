import 'package:flutter/material.dart';



class UserIndex extends StatefulWidget {
  UserIndex({Key key, this.userName}) : super(key: key);

  final String userName;

  @override
  _UserIndexState createState() => _UserIndexState();
}

class _UserIndexState extends State<UserIndex> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('用户中心'),
      ),
      body: Center(
        child: Text('欢迎登录：${widget.userName}'),
      ),
    );
  }
}