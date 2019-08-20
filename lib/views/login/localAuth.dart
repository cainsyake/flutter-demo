/**
 * @Author: cainsyake
 * @Date:   2019-08-20
 * @Remark: 本地权限
 */

import 'package:flutter/material.dart';

class LocalAuth extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _LocalAuthState();
  }
}

class _LocalAuthState extends State<LocalAuth> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('本地权限校验'),
      ),
    );
  }
}
