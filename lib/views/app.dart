import 'package:flutter/material.dart';
import 'router/page1.dart';
import 'login/index.dart';
import 'img/index.dart';

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
  List<Map<String, String>> list = <Map<String, String>>[];

  @override
  void initState() {
    super.initState();

    list.addAll([
      {'title': '路由页1', 'type': 'router', 'router': '/router/page1'},
      {'title': '登录页', 'type': 'router', 'router': '/login'},
      {'title': '图片', 'type': 'router', 'router': '/img'},

    ]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title != null ? widget.title : '默认首页'),
      ),
      body: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: this.list.length,
          itemBuilder: (_, int index) => _createItem(context, list[index]),
      ),
    );
  }

  _createItem(BuildContext context, Map<String, String> map) {
    return new GestureDetector(
      onTap: () {
//        if (map['type'] == 'pullToRefresh') {
//          // 下拉刷新
//          BRouter.pushRefreshDetail(context);
//        }
        if (map['type'] == 'router') {
          print(map['router']);
          Navigator.of(context).pushNamed(map['router']);
        }
        else if (map['type'] == 'ts') {
          Navigator.of(context).pushNamed('/text/style');
        }
        else {
          Navigator.of(context).pushNamed(map['router']);
        }
      },
      child: new Column(
        children: <Widget>[
          new Container(
            height: 24.0,
            margin: EdgeInsets.all(10.0),
            alignment: Alignment.center,
            child: new Text(map['title']),
          ),
          Divider(
            height: 0.5,
          )
        ],
      ),
    );
  }
}
