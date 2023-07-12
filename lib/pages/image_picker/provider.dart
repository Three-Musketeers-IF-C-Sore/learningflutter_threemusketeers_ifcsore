import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerProvider extends ChangeNotifier {
  bool _isImageLoaded = false;
  bool get isImageLoaded => _isImageLoaded;
  set setIsImageLoaded(val) {
    _isImageLoaded = false;
    notifyListeners();
  }

  final ImagePicker _imagePicker = ImagePicker();

  XFile? _img; 
  XFile? get img => _img;
  set setImg(val) {
    _img = val;
    notifyListeners();
  }

  pickImage(bool isGallery) async {
    try {
      var res = await _imagePicker.pickImage(
        source: isGallery == true ? ImageSource.gallery : ImageSource.camera,
      );
      if (res != null) {
        setImg = res;
        setIsImageLoaded = true;
      }
    } catch (e) {
      setIsImageLoaded = false;
      print(e.toString());
    }
  }

}