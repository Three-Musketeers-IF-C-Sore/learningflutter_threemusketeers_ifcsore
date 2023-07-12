import 'package:flutter/material.dart';
import 'package:learningflutter_threemusketeers_ifcsore/pages/image_picker/provider.dart';
import 'package:provider/provider.dart';

class ButtonImagePicker extends StatelessWidget {
  final String title;
  final bool isGallery;
  const ButtonImagePicker(
    {Key? key, required this.isGallery, required this.title}
  ) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<ImagePickerProvider>(context);

    return ElevatedButton(
      onPressed: () async {
        await prov.pickImage(isGallery);
      }, 
      child: Text(title),
    );
  }
}