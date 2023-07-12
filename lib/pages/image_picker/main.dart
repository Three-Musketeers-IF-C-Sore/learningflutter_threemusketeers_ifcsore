import 'package:flutter/material.dart';
import 'package:learningflutter_threemusketeers_ifcsore/pages/image_picker/provider.dart';
import 'package:learningflutter_threemusketeers_ifcsore/pages/image_picker/screen.dart';
import 'package:provider/provider.dart';

void main(List<String> args) {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => ImagePickerProvider()),
  ], child: const MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Image Picker',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: Brightness.light,
        primaryColor: Colors.purple,
      ),
      home: const ImagePickerScreen(),
    );
  }
}