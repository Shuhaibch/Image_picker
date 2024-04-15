import 'dart:io';
import 'dart:developer';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickImage extends StatefulWidget {
  const PickImage({Key? key}) : super(key: key);

  @override
  State<PickImage> createState() => _PickImageState();
}

class _PickImageState extends State<PickImage> {
  XFile? _image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextButton(
                onPressed: _imageHandler, child: const Text("Pick image")),
            if (_image != null) Image.file(File(_image!.path))
          ],
        ),
      ),
    );
  }

  Future _imageHandler() async {
    try {
      final XFile? imagePicker =
          await ImagePicker().pickImage(source: ImageSource.gallery);
      if (imagePicker != null) {
        _image = imagePicker;
      } else {
        /// user canceled
      }
    } catch (e) {
      log(e.toString());
      print(e);
    }
  }
}
