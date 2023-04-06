import 'package:flutter/material.dart';
import 'package:learningflutter_threemusketeers_ifcsore/theme/colors.dart';
import 'package:learningflutter_threemusketeers_ifcsore/flutter_introduction.dart';
import 'package:learningflutter_threemusketeers_ifcsore/theme/typography.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Learning Flutter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Route route = MaterialPageRoute(builder: (context) => const FlutterIntro());
                Navigator.push(context, route);
              }, 
              child: const Text('Flutter Introduction')
            ),
            const Text(
              "Hello",
              style: $heading1Bold,
              selectionColor: $primary500,
            )
          ],
        ),
      ),
    );
  }
}
