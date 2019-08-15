/**
 * @Author: cainsyake
 * @Date:   2019-08-15
 * @Remark: 登录页
 */

import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String userName;
  String password;

  void _forSubmitted() {
    var _form = _formKey.currentState;
    _form.save();
    print('username:$userName');
    print('password:$password');

    Navigator.of(context).pushNamed('/');
  }

  @override
  void initState() {
    super.initState();

    userName = '';
    password = '';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _forSubmitted,
        child: Text('提交'),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    TextFormField(
                      decoration: InputDecoration(labelText: '请输入用户名'),
                      onSaved: (val) {
                        userName = val;
                      },
                    ),
                    TextFormField(
                      decoration: InputDecoration(labelText: '请输入密码'),
                      obscureText: true,
                      onSaved: (val) {
                        password = val;
                      },
                    ),
                  ],
                )
            ),
          )
        ],
      ),
    );
  }
}

class LoginForm extends StatelessWidget {
  LoginForm({this.userName, this.password});

  final String userName;
  final String password;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return null;
  }
}
