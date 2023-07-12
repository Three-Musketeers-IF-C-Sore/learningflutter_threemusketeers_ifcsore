import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learningflutter_threemusketeers_ifcsore/pages/image_picker/components/carousel.dart';
import 'package:learningflutter_threemusketeers_ifcsore/pages/image_picker/provider.dart';
import 'package:provider/provider.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({Key? key}) : super(key: key);

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<ImagePickerProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Lock Screen'),
        centerTitle: true,
      ),
      body: const CarouselSliderWidget(),
      floatingActionButton: ElevatedButton(
        onPressed: () async {
          await prov.addLockScreen();
        }, 
        child: const Text('Add Image')
      ),
    );
  }
}