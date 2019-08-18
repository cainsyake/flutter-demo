/**
 * @Author: cainsyake
 * @Date:   2019-08-15
 * @Remark: 登录页
 */

import 'package:flutter/material.dart';
import '../user/index.dart';

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: LoginForm(),
          )
        ],
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  @override
  _LoginFormState createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String userName;
  String password;

  void _forSubmitted() {
    var _form = _formKey.currentState;
    _form.save();
    print('username:$userName');
    print('password:$password');

    Navigator.of(context).push(MaterialPageRoute(builder: (_) {
      return UserIndex(userName: userName,);
    }));
//    Navigator.of(context).pushNamed('/');4
  }

  @override
  void initState() {
    super.initState();

    userName = '';
    password = '';
  }

  @override
  Widget build(BuildContext context) {
    return Form(
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
            RaisedButton(
              onPressed: _forSubmitted,
              textColor: Colors.white,
              color: Colors.blue,
              padding: const EdgeInsets.all(10.0),
              child: Text('登录'),
            )
          ],
        )
    );
  }
}
