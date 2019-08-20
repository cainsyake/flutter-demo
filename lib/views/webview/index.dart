/**
 * @Author: cainsyake
 * @Date:   2019-08-20
 * @Remark: webview
 */

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

class WebViewPage extends StatefulWidget {
//  String url;
//  final String title;
//
//  WebViewPage({this.url, this.title});

  @override
  _WebViewState createState() => _WebViewState();
}

class _WebViewState extends State<WebViewPage> {
  String url = 'https://flutterchina.club/';

  @override
  void initState() {
    super.initState();
    setState(() {
      url = 'https://m.baidu.com/';
    });
  }

  @override
  void dispose() {

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('webview'),
      ),
      body: Stack(
        children: <Widget>[
          new WebView(
            initialUrl: this.url, // 加载的url
            onWebViewCreated: (WebViewController web) {
              // webview 创建调用，
//              web.loadUrl('https://blogs.cainsyake.com/');
              // 此时也可以初始化一个url
              web.canGoBack().then((res){
                print(res); // 是否能返回上一级
              });
              web.currentUrl().then((url){
                print(url);// 返回当前url
              });
              web.canGoForward().then((res){
                print(res); //是否能前进
              });
            },
            onPageFinished: (String url) {
              print('Page finished loading: $url');
            },
          )
        ],
      ),
    );
  }
}
