/**
 * @Author: cainsyake
 * @Date:   2019-08-15
 * @Remark: 登录页
 */

import 'package:flutter/material.dart';
import '../user/index.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class Login extends StatefulWidget {
  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  // 登录成功回调函数
  void loginSuccess(String userName) async {
    /**
     * 登录成功后会跳转到用户页面，如果在用户页面点击返回按钮，并不需要回退到登录页面。
     * 也就是想将用户中心的Widget插入栈顶的同时，将登录页也从路由栈移除。
     * 这个时候，我们就要用到pushReplacementNamed()或者popAndPushNamed(),pushReplacement()都可以实现这个目的。
     */
    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (_) {
      return UserIndex(userName: userName,);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('登录'),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: LoginForm(loginSuccess: loginSuccess),
          )
        ],
      ),
    );
  }
}

class LoginForm extends StatefulWidget {
  LoginForm({Key key, this.loginSuccess}) : super(key: key);
  // 登录成功的回调
  final loginSuccess;

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

    // 校验
    _loginValidate();
  }

  // 发送登录校验请求
  void _loginValidate() async {
    print('username:$userName');
    String url = 'https://cms.frps.cainsyake.com/api/public/login';
    var data = {
      'username': userName,
      'password': password
    };
    var response = await http.post(url, body: data);
    if (response.statusCode == 200) {
      var res = convert.jsonDecode(response.body);
      if (res['state'] == 0) {
        // 调用登录成功函数
        widget.loginSuccess(userName);
      } else {
        SnackBar snackBar = SnackBar(content: Text('用户名或密码错误，登录失败'));
        Scaffold.of(context).showSnackBar(snackBar);
        print('登录失败');
      }
    }
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
              keyboardType: TextInputType.number,
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
