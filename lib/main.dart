import 'package:flutter/material.dart';
import './providers/menu_provider.dart';
import './providers/cart_provider.dart';
import 'package:learningflutter_threemusketeers_ifcsore/order_app.dart';
import 'package:learningflutter_threemusketeers_ifcsore/theme/colors.dart';
import 'package:learningflutter_threemusketeers_ifcsore/flutter_introduction.dart';
import 'package:learningflutter_threemusketeers_ifcsore/theme/typography.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (context) => MenuProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CartProvider(),
        ),
      ],
      child: MaterialApp(
        title: 'Flutter',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const MyHomePage(title: 'Learning Flutter'),
      ),
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
        title: Text(
          widget.title,
          style: $heading2Light,
        ),
        backgroundColor: Colors.purple.shade500,
      ),
      body: Center(
          child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            const SizedBox(
              width: 400,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Welcome",
                  textAlign: TextAlign.left,
                  style: $heading1Bold,
                  selectionColor: $primary500,
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.all(25)),
            const SizedBox(
              width: 400,
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "List of Content",
                  textAlign: TextAlign.left,
                  style: $heading6Bold,
                  selectionColor: $primary500,
                ),
              ),
            ),
            const Padding(padding: EdgeInsets.all(8)),
            ElevatedButton(
                onPressed: () {
                  Route route = MaterialPageRoute(
                      builder: (context) => const FlutterIntro());
                  Navigator.push(context, route);
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(400, 35),
                    backgroundColor: Colors.purple.shade500,
                    alignment: Alignment.centerLeft),
                child: const Text('Week 1 : Flutter Introduction',
                    style: $caption1Regular)),
            const Padding(padding: EdgeInsets.all(8)),
            ElevatedButton(
                onPressed: () {
                  //
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(400, 35),
                    backgroundColor: Colors.purple.shade500,
                    alignment: Alignment.centerLeft),
                child: const Text('Week 2 : Flutter Introduction',
                    style: $caption1Regular)),
            const Padding(padding: EdgeInsets.all(8)),
            ElevatedButton(
                onPressed: () {
                  Route route = MaterialPageRoute(
                    builder: (context) => const OrderApp());
                  Navigator.push(context, route);
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(400, 35),
                    backgroundColor: Colors.purpleAccent.shade400),
                child: const Text('Week 3 : Flutter Introduction')),
            const Padding(padding: EdgeInsets.all(8)),
            ElevatedButton(
                onPressed: () {
                  // 
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(400, 35),
                    backgroundColor: Colors.purple.shade500,
                    alignment: Alignment.centerLeft),
                child: const Text('Week 4 : Flutter Introduction',
                    style: $caption1Regular)),
            const Padding(padding: EdgeInsets.all(8)),
            ElevatedButton(
                onPressed: () {
                  //
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(400, 35),
                    backgroundColor: Colors.purple.shade500,
                    alignment: Alignment.centerLeft),
                child: const Text('Week 5 : Flutter Introduction',
                    style: $caption1Regular)),
            const Padding(padding: EdgeInsets.all(8)),
            ElevatedButton(
                onPressed: () {
                  //
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(400, 35),
                    backgroundColor: Colors.purple.shade500,
                    alignment: Alignment.centerLeft),
                child: const Text('Week 6 : Flutter Introduction',
                    style: $caption1Regular)),
            const Padding(padding: EdgeInsets.all(8)),
            ElevatedButton(
                onPressed: () {
                  //
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(400, 35),
                    backgroundColor: Colors.purple.shade500,
                    alignment: Alignment.centerLeft),
                child: const Text('Week 7 : Flutter Introduction',
                    style: $caption1Regular)),
            const Padding(padding: EdgeInsets.all(8)),
            ElevatedButton(
                onPressed: () {
                  //
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(400, 35),
                    backgroundColor: Colors.purple.shade500,
                    alignment: Alignment.centerLeft),
                child: const Text('Bonus : Flutter Introduction',
                    style: $caption1Regular)),
            const Padding(padding: EdgeInsets.all(25)),
            ElevatedButton(
                onPressed: () {
                  //
                },
                style: ElevatedButton.styleFrom(
                    fixedSize: const Size(400, 35),
                    backgroundColor: Colors.white,
                    foregroundColor: Colors.purple.shade500,
                    side:
                        const BorderSide(width: 1, color: Colors.purpleAccent)),
                child: const Text(
                  'About Us',
                  style: $caption1Regular,
                )),
          ],
        ),
      )),
    );
  }
}
