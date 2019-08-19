import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class SelectImage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SelectImageState();
  }
}

class _SelectImageState extends State<SelectImage> {
  List imgList=new List<File>();
  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    if (image != null) {
      setState(() {
        imgList.add(image);
      });
    }
  }
  dynamic getBody() {
    if (showLoadingDialog()) {
      return getProgressDialog();
    } else {
      return getListView();
    }
  }

  bool showLoadingDialog() {
    if (imgList.length == 0) {
      return true;
    }

    return false;
  }

  Center getProgressDialog() {
    return Center(
        child: Column(
          children: <Widget>[
            Text('暂无数据'),
            CircularProgressIndicator()
          ],
        )
    );
  }

  ListView getListView()=>new ListView.builder(
      itemCount: imgList.length,
      itemBuilder: (BuildContext context, int position) {
        return Image.file(imgList[position],height: 300);
      }
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body:getBody(),

      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}


