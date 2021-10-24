import 'dart:io';
import 'package:flutter/material.dart';
import 'placeholder_widget.dart';
import 'package:image_picker/image_picker.dart';

enum ImageSourceType { gallery, camera }

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  File? _image;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: AppBar(
              flexibleSpace: TabBar(
            indicatorColor: Colors.white,
            tabs: [
              Tab(text: 'Camera', icon: Icon(Icons.camera_alt)),
              Tab(text: 'Photos', icon: Icon(Icons.photo)),
            ],
          )),
          body: TabBarView(
            children: [
              Center(
                  child: OutlinedButton.icon(
                onPressed: () {
                  _getFromCamera();
                },
                icon: Icon(Icons.camera_alt_outlined, size: 50),
                label: Text("TAKE PHOTO"),
              )),
              Center(
                  child: OutlinedButton.icon(
                onPressed: () {
                  _getFromGallery();
                },
                icon: Icon(Icons.camera_alt_outlined, size: 50),
                label: Text("GET FROM GALLERY"),
              )),
            ],
          ),
        ));
  }

  _getFromGallery() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  /// Get from Camera
  _getFromCamera() async {
    XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }
}
