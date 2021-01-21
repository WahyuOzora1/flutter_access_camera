import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() => runApp(CameraApp());

class CameraApp extends StatefulWidget {
  @override
  _CameraAppState createState() => _CameraAppState();
}

class _CameraAppState extends State<CameraApp> {
  File image;

  //To use Gallery or file manager to pick image
  picker() async {
    print('Picker is Called');
    File img = await ImagePicker.pickImage(source: ImageSource.camera);

    if (img != null) {
      image = img;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Image Picker'),
        ),
        body: Container(
          child: Center(
            child: image == null ? Text('No image to Show') : Image.file(image),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: picker,
          child: Icon(Icons.camera_alt),
        ),
      ),
    );
  }
}
