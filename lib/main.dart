import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: HomPage());
  }
}

class HomPage extends StatefulWidget {
  const HomPage({Key? key}) : super(key: key);

  @override
  _HomPageState createState() => _HomPageState();
}

class _HomPageState extends State<HomPage> {
   File? _image;
  final imagePicker = ImagePicker();

  Future getImage() async {
    final image = await imagePicker.getImage(source: ImageSource.camera);

    setState(() {
      _image = File(image!.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: _image == null ? Text("No Image Selected") : Image.file(_image!),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        child: Icon(Icons.camera_alt),
        onPressed: getImage,
      ),
    );
  }
}
