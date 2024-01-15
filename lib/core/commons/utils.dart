import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:fpdart/fpdart.dart';
import 'package:image_picker/image_picker.dart';

void showSnackBar(BuildContext context, String content) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(content)));
}

Future<File?> pickImageFromGallery() async {
  File? file;
  final ImagePicker pickedImage = ImagePicker();
  final Xfile = await pickedImage.pickImage(source: ImageSource.gallery);
  if (file != null) {
    file = File(Xfile!.path);
  }
  return file;
}

void pickImage() async {
  FilePickerResult? result = await FilePicker.platform.pickFiles();

  if (result != null) {
    File file = File(result.files.single.path!);
  } else {
    // User canceled the picker
  }
}
