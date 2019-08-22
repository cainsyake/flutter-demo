import 'package:flutter/material.dart';
import 'router/page1.dart';
import 'login/index.dart';
import 'img/index.dart';
import 'store/index.dart';
import 'webview/index.dart';
import 'login/localAuth.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '示例应用',
      theme: new ThemeData(
        // brightness: Brightness.dark,
        primaryColor: Colors.lightBlue[800],
        accentColor: Colors.cyan[600],
        primarySwatch: Colors.blue,
      ),
      home: HomePage(title: '首页',),
      routes: <String, WidgetBuilder> {
        '/router/page1': (_) => PageOne(),
        '/login': (_) => Login(),
        '/img': (_) => SelectImage(),
        '/store': (_) => LocalStore(),
        '/webview': (_) => WebViewPage(),
        '/localauth': (_) => LocalAuth(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List list = [];

  @override
  void initState() {
    super.initState();

    list.addAll([
      {'title': '路由页1', 'icon': Icons.turned_in, 'type': 'router', 'router': '/router/page1'},
      {'title': '登录页', 'icon': Icons.verified_user, 'type': 'router', 'router': '/login'},
      {'title': '图片', 'icon': Icons.collections, 'type': 'router', 'router': '/img'},
      {'title': '本地存储', 'icon': Icons.wb_cloudy, 'type': 'router', 'router': '/store'},
      {'title': 'webview', 'icon': Icons.web, 'type': 'router', 'router': '/webview'},
      {'title': '本地校验', 'icon': Icons.fingerprint, 'type': 'router', 'router': '/localauth'},
    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title != null ? widget.title : '默认首页'),
      ),
      body: Column(
        children: <Widget>[
          Center(
            child: Container(
              padding: EdgeInsets.fromLTRB(0, 10, 0, 20),
              child: Text(
                'Flutter 示范应用',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 30.0,
                ),
              ),
            ),
          ),
          Center(
            child: _getPageList(),
          )
        ],
      )
    );
  }
  
  Widget _getPageList() {
    List<Widget> pages = <Widget>[];
    if (this.list.length > 0) {
      this.list.forEach((item) {
        pages.add(Container(
          width: 100.0,
          height: 60.0,
          margin: EdgeInsets.fromLTRB(0, 0, 0, 10),
          child: GestureDetector(
            child: Card(
              child: Column(
                children: <Widget>[
                  Icon(
                    item['icon'],
                    color: Colors.blue,
                    size: 30.0,
                  ),
                  Text(item['title']),
                ],
              ),
            ),
            onTap: () {
              if (item['type'] == 'router') {
                Navigator.of(context).pushNamed(item['router']);
              }
              else if (item['type'] == 'ts') {
                Navigator.of(context).pushNamed('/text/style');
              }
              else {
                Navigator.of(context).pushNamed(item['router']);
              }
            },
          ),
        ));
      });
    }
    
    return Wrap(
      children: pages,
    );
  }
}
