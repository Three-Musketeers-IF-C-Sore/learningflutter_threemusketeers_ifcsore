import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:learningflutter_threemusketeers_ifcsore/pages/image_picker/components/button.dart';
import 'package:learningflutter_threemusketeers_ifcsore/pages/image_picker/components/carousel.dart';
import 'package:learningflutter_threemusketeers_ifcsore/pages/image_picker/provider.dart';
import 'package:provider/provider.dart';

class ImagePickerScreen extends StatefulWidget {
  const ImagePickerScreen({Key? key}) : super(key: key);

  @override
  State<ImagePickerScreen> createState() => _ImagePickerScreenState();
}

class _ImagePickerScreenState extends State<ImagePickerScreen> {
  List<XFile>? listImg;

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<ImagePickerProvider>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Image Picker'),
      ),
      body: ListView(
        children: [
          const CarouselSliderWidget(),

          prov.isImageLoaded == true
          ? Image.file(File(prov.img!.path))
          : Container(),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const ButtonImagePicker(
                  isGallery: true, 
                  title: 'Open Gallery',
                ),
                TextButton(
                  onPressed: () async {
                    var pilihGambar = ImagePicker();
                    var hasil = await pilihGambar.pickMultiImage();

                    if (hasil == null) {
                      print("Tidak ada foto");
                    } else {
                      setState(() {
                        listImg = hasil;
                      });
                    }
                  }, 
                  child: const Text('Multi Image')
                ),
                const ButtonImagePicker(
                  isGallery: false, 
                  title: 'Camera',
                )
              ],
            ),
          ),
          Column(
            children: [
              listImg != null 
              ? Padding(
                padding: const EdgeInsets.all(16.0),
                child: SizedBox(
                  height: 300,
                  width: MediaQuery.of(context).size.width,
                  child: GridView.count(
                    crossAxisCount: 2,
                    crossAxisSpacing: 10,
                    mainAxisSpacing: 4,
                    children: listImg!.map((e) {
                      return Image.file(File(e.path));
                    }).toList(),
                  ),
                ),
              )
              : Container(),
            ],
          )
        ],
      )
    );
  }
}