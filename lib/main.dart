import 'package:flutter/material.dart';

void main() {
  runApp(new MaterialApp(
    title: 'Flutter Tutorial',
    home: new TutorialHome(),
  ));
}

class TutorialHome extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Scaffold是Material中主要的布局组件.
    return new Scaffold(
      appBar: new AppBar(
        leading: new IconButton(
          icon: new Icon(Icons.menu),
          tooltip: 'Navigation menu',
          onPressed: null,
        ),
        title: new Text('标题栏1'),
        actions: <Widget>[
          new IconButton(
            icon: new Icon(Icons.search),
            tooltip: 'Search',
            onPressed: null,
          ),
        ],
      ),
      //body占屏幕的大部分
      body: new Center(
        child: new Column(
          children: [
            new Text('Hello, wu bobo!'),
            new Text('Hello, wu bobo2'),
            new Row(
              children: [
                new Text('left'),
                new Text('right')
              ],
            ),
            new MyCounter(),
          ],
        ),
      ),
      floatingActionButton: new FloatingActionButton(
        tooltip: 'Add', // used by assistive technologies
        child: new Icon(Icons.add),
        onPressed: null,
      ),
    );
  }
}

class CounterDisplay extends StatelessWidget {
  CounterDisplay({this.count});

  final int count;
  @override
  Widget build(BuildContext context) {
    return new Text('count:$count');
  }
}

class CounterIncrementor extends StatelessWidget {
  CounterIncrementor({this.onPressed});
  final VoidCallback onPressed;
  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      onPressed: onPressed,
      child: new Text('点这里加1'),
    );
  }
}

class MyCounter extends StatefulWidget {
  @override
  _MyCounterState createState() => new _MyCounterState();
}

class _MyCounterState extends State<MyCounter> {
  int _counter = 0;

  void _operate() {
    setState(() {
      _counter++;
    });

    print(_counter);
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new CounterIncrementor(onPressed: _operate),
        new CounterDisplay(count: _counter,),
      ],
    );
  }
}