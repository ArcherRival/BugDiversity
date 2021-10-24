import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:image/image.dart' as I;
import 'placeholder_widget.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tflite/tflite.dart';

enum ImageSourceType { gallery, camera }

class CameraPage extends StatefulWidget {
  const CameraPage({Key? key}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  bool _loading = true;
  late File _image;
  late List _output;
  final picker = ImagePicker(); //allows us to pick image from gallery or camera

  @override
  void initState() {
    //initS is the first function that is executed by default when this class is called
    super.initState();
    loadModel().then((value) {
      setState(() {});
    });
  }

  @override
  void dispose() {
    //dis function disposes and clears our memory
    super.dispose();
    Tflite.close();
  }

  Uint8List imageToByteListUint8(I.Image image, int inputSize) {
    var convertedBytes = Uint8List(1 * inputSize * inputSize * 3);
    var buffer = Uint8List.view(convertedBytes.buffer);
    int pixelIndex = 0;
    for (var i = 0; i < inputSize; i++) {
      for (var j = 0; j < inputSize; j++) {
        var pixel = image.getPixel(j, i);
        buffer[pixelIndex++] = I.getRed(pixel);
        buffer[pixelIndex++] = I.getGreen(pixel);
        buffer[pixelIndex++] = I.getBlue(pixel);
      }
    }
    return convertedBytes.buffer.asUint8List();
  }

  classifyImage(File image) async {
    //this function runs the model on the image
    var output = await Tflite.runModelOnImage(
      path: image.path,
      numResults:
          1, //the amout of categories our neural network can predict (here no. of animals)
      threshold: 0.01,
    );
    setState(() {
      _output = output!;
      _loading = false;
    });
  }

  loadModel() async {
    //this function loads our model
    Tflite.close();
    await Tflite.loadModel(
      model: 'assets/unquant_model.tflite',
      labels: 'assets/unquant_labels.txt',
    );
  }

  pickImage() async {
    //this function to grab the image from camera
    var image = await picker.pickImage(source: ImageSource.camera);
    if (image == null) return null;

    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image);
  }

  pickGalleryImage() async {
    //this function to grab the image from gallery
    var image = await picker.pickImage(source: ImageSource.gallery);
    if (image == null) return null;

    setState(() {
      _image = File(image.path);
    });
    classifyImage(_image);
  }

  @override
  Widget build(BuildContext context) {
    if (_loading == true) {
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
                    pickImage();
                  },
                  icon: Icon(Icons.camera_alt_outlined, size: 50),
                  label: Text("TAKE PHOTO"),
                )),
                Center(
                    child: OutlinedButton.icon(
                  onPressed: () {
                    pickGalleryImage();
                  },
                  icon: Icon(Icons.camera_alt_outlined, size: 50),
                  label: Text("GET FROM GALLERY"),
                )),
              ],
            ),
          ));
    } else {
      if (_output[0] != null) {
        return Column(children: <Widget>[
          Text('The insect is: ${_output[0]['label']}',
              style: DefaultTextStyle.of(context)
                  .style
                  .apply(fontSizeFactor: 2.0)),
          Expanded(
              child: FittedBox(
            fit: BoxFit.cover,
            clipBehavior: Clip.hardEdge,
            child: Image(
              image: FileImage(_image),
              fit: BoxFit.cover,
            ),
          ))
        ]);
      } else {
        return Text("Not an insect.");
      }
    }
  }
}
