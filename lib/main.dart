import 'package:flutter/material.dart';
import './providers/menu_provider.dart';
import './providers/cart_provider.dart';
import 'package:learningflutter_threemusketeers_ifcsore/theme/colors.dart';
import 'package:learningflutter_threemusketeers_ifcsore/flutter_introduction.dart';
import 'package:learningflutter_threemusketeers_ifcsore/theme/typography.dart';
import 'package:learningflutter_threemusketeers_ifcsore/w3_simple_calculator.dart';
import 'package:learningflutter_threemusketeers_ifcsore/widgets/home/button.dart';
import 'package:learningflutter_threemusketeers_ifcsore/widgets/main/appbar.dart';
import 'package:learningflutter_threemusketeers_ifcsore/service/navigate.dart';
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
      appBar: const MainAppBar(title: "Learning Flutter"),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(8),
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
                const Padding(padding: EdgeInsets.all(30)),
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
                const Padding(padding: EdgeInsets.all(25)),

                HomeButton(text: "Week 1-2: Flutter Introduction", handleOnPressed: () => {
                  navigate(context, const FlutterIntro()),
                }),
                const Padding(padding: EdgeInsets.all(8)),

                HomeButton(text: "Week 3: Simple Calculator", handleOnPressed: () => {
                  navigate(context, const SimpleCalculator()),
                }),
                const Padding(padding: EdgeInsets.all(8)),

                HomeButton(text: "Week 4: ", handleOnPressed: () => {}),
                const Padding(padding: EdgeInsets.all(8)),

                HomeButton(text: "Week 5: ", handleOnPressed: () => {}),
                const Padding(padding: EdgeInsets.all(8)),

                HomeButton(text: "Week 6: ", handleOnPressed: () => {}),
                const Padding(padding: EdgeInsets.all(8)),

                HomeButton(text: "Week 7: ", handleOnPressed: () => {}),
                const Padding(padding: EdgeInsets.all(8)),

                HomeButton(text: "Bonus: ", handleOnPressed: () => {}),
                const Padding(padding: EdgeInsets.all(30)),

                HomeButton(isOutlined: true, text: "About Us", handleOnPressed: () => {}),
              ],
            ),
          )
        )
      ),      
    );
  }
}
