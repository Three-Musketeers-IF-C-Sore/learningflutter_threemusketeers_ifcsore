import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerProvider extends ChangeNotifier {
  List<XFile> _multiImage = [];
  List<XFile> get multiImage => _multiImage;

  final ImagePicker _imagePicker = ImagePicker();

  addLockScreen() async {
    var hasil = await _imagePicker.pickMultiImage();
    _multiImage = hasil;
    notifyListeners();
  }

}