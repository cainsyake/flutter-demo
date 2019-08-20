/**
 * @Author: cainsyake
 * @Date:   2019-08-20
 * @Remark: 本地存储
 */

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStore extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LocalStoreState();
  }
}

class _LocalStoreState extends State<LocalStore> {
  int count = 0;

  @override
  void initState() {
    super.initState();
    initCount();
  }

  // 初始化计数器
  void initCount() async {
    final prefs = await SharedPreferences.getInstance();
    int data = prefs.getInt('count') ?? 0;
    print(data);
    setState(() {
      count = data;
    });
  }

  // 清除本地缓存
  void clearCount() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.remove('count');
    setState(() {
      count = 0;
    });
  }

  void increment() async {
    setState(() {
      count++;
    });
    final prefs = await SharedPreferences.getInstance();
    await prefs.setInt('count', count);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('本地存储'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: increment,
        child: Text('点击加1'),
      ),
      body: Center(
        child: Column(
          children: <Widget>[
            Text('计数:${this.count}'),
            Container(
              child: RaisedButton(
                color: Colors.blue,
                textColor: Colors.white,
                child: Text('清除本地缓存'),
                onPressed: clearCount,
              ),
            )
          ],
        )
      ),
    );
  }
}
