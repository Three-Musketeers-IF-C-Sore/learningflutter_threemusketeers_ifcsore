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
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const Text(
              "Welcome",
              textAlign: TextAlign.left,
              style: $heading1Bold,
              selectionColor: $primary500,
            ),
            const Text(
              "List of Content",
              textAlign: TextAlign.left,
              style: $heading6Bold,
              selectionColor: $primary500,
            ),
            ElevatedButton(
                onPressed: () {
                  Route route = MaterialPageRoute(
                      builder: (context) => const FlutterIntro());
                  Navigator.push(context, route);
                },
                style: ElevatedButton.styleFrom(fixedSize: const Size(350, 35)),
                child: const Text('Week 1 : Flutter Introduction')),
            ElevatedButton(
                onPressed: () {
                  //
                },
                style: ElevatedButton.styleFrom(fixedSize: const Size(350, 35)),
                child: const Text('Week 2 : Flutter Introduction')),
            ElevatedButton(
                onPressed: () {
                  //
                },
                style: ElevatedButton.styleFrom(fixedSize: const Size(350, 35)),
                child: const Text('Week 3 : Flutter Introduction')),
            ElevatedButton(
                onPressed: () {
                  //
                },
                style: ElevatedButton.styleFrom(fixedSize: const Size(350, 35)),
                child: const Text('Week 4 : Flutter Introduction')),
            ElevatedButton(
                onPressed: () {
                  //
                },
                style: ElevatedButton.styleFrom(fixedSize: const Size(350, 35)),
                child: const Text('Week 5 : Flutter Introduction')),
            ElevatedButton(
                onPressed: () {
                  //
                },
                style: ElevatedButton.styleFrom(fixedSize: const Size(350, 35)),
                child: const Text('Week 6 : Flutter Introduction')),
            ElevatedButton(
                onPressed: () {
                  //
                },
                style: ElevatedButton.styleFrom(fixedSize: const Size(350, 35)),
                child: const Text('Week 7 : Flutter Introduction')),
            ElevatedButton(
                onPressed: () {
                  //
                },
                style: ElevatedButton.styleFrom(fixedSize: const Size(350, 35)),
                child: const Text('Bonus : Flutter Introduction')),
            ElevatedButton(
                onPressed: () {
                  //
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(350, 35),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.blue),
                child: const Text('About Us')),
          ],
        ),
      ),
    );
  }
}
