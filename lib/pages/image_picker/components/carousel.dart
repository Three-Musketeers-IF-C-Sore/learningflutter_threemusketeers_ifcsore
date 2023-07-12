import 'dart:io';

import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:learningflutter_threemusketeers_ifcsore/pages/image_picker/components/webview.dart';
import 'package:learningflutter_threemusketeers_ifcsore/pages/image_picker/provider.dart';
import 'package:learningflutter_threemusketeers_ifcsore/theme/typography.dart';
import 'package:provider/provider.dart';

class CarouselSliderWidget extends StatelessWidget {
  const CarouselSliderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<ImagePickerProvider>(context);

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [ 
          const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 5), 
            child: Text('Default Lock Screen', style: $heading5Bold),
          ),
          Container(
            padding: const EdgeInsets.only(top: 5),
            height: 600,
            child: CarouselSlider(
              options: CarouselOptions(height: 600.0),
              items: [1,2,3].map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => WebViewWidget(url: 'https://mikroskil.ac.id/pengumuman/354$i'),
                        ),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/lock$i.jpg'),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              'text $i',
                              style: const TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                );
              }).toList(),
            ),
          ),
    
          const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 5), 
            child: Text('Your Lock Screen', style: $heading5Bold),
          ),

          (prov.multiImage).isEmpty
          ? const Padding(
            padding:  EdgeInsets.symmetric(horizontal: 20, vertical: 5), 
            child: Text('Empty', style: $body1Bold),
          )
          : Container(
            padding: const EdgeInsets.only(top: 10),
            height: 600,
            child: CarouselSlider(
              options: CarouselOptions(height: 600.0),
              items: (prov.multiImage).map((i) {
                return Builder(
                  builder: (BuildContext context) {
                    return GestureDetector(
                      onTap: () => Navigator.push(
                        context, 
                        MaterialPageRoute(
                          builder: (context) => const WebViewWidget(url: 'https://mikroskil.ac.id/pengumuman/3540'),
                        ),
                      ),
                      child: Container(
                        width: MediaQuery.of(context).size.width,
                        margin: const EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: Image.file(File(i.path)).image,
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Align(
                            alignment: Alignment.bottomRight,
                            child: Text(
                              'text $i',
                              style: const TextStyle(fontSize: 16.0),
                            ),
                          ),
                        ),
                      ),
                    );
                  }
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}