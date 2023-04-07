import 'package:flutter/material.dart';
import 'package:learningflutter_threemusketeers_ifcsore/theme/typography.dart';

class FlutterIntro extends StatefulWidget {
  const FlutterIntro({super.key});

  @override
  State<FlutterIntro> createState() => _FlutterIntroState();
}

class _FlutterIntroState extends State<FlutterIntro> {
  bool isReadMode = false;
  late ScrollController _scrollController;

  @override
  void initState() {
    _scrollController = ScrollController();

    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose(); // dispose the controller
    super.dispose();
  }

  void _scrollToTop() {
    _scrollController.animateTo(0,
        duration: const Duration(seconds: 1), curve: Curves.linear);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:
          isReadMode == true ? Colors.orange.shade100 : Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: const Text(
          'Flutter',
          style: $heading2Light,
        ),
        backgroundColor: Colors.purple,
        actions: [
          PopupMenuButton(
            icon: const Icon(
              Icons.more_vert,
              color: Colors.white,
            ),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: "read",
                  child: Container(
                    color: isReadMode ? Colors.blue.shade400 : Colors.white,
                    padding: const EdgeInsets.all(10),
                    child: Row(children: const [
                      Icon(
                        Icons.chrome_reader_mode_outlined,
                        color: Colors.black,
                      ),
                      Padding(padding: EdgeInsets.only(left: 10)),
                      Text('Read Mode'),
                    ]),
                  ),
                ),
                PopupMenuItem(
                  value: "up",
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    child: Row(children: const [
                      Icon(
                        Icons.arrow_upward,
                        color: Colors.black,
                      ),
                      Padding(padding: EdgeInsets.only(left: 10)),
                      Text('Scroll Up')
                    ]),
                  ),
                )
              ];
            },
            onSelected: (value) {
              if (value == "read") {
                setState(() {
                  isReadMode = !isReadMode;
                });
              } else if (value == "up") {
                _scrollToTop();
              }
            },
          )
        ],
      ),
      body: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 40, bottom: 85, left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Image.asset('asset/images/intro.jpeg'),
              const Padding(padding: EdgeInsets.all(8)),
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'What is Flutter?',
                  style: $heading3Bold,
                ),
              ),
              const Divider(),
              const Text(
                  'Flutter is a new and evolving cross-platform mobile development framework made by Google. It allows you to create beautiful, cross-platform mobile applications with native performance, all from one codebase.'),
              const Padding(padding: EdgeInsets.all(8)),
              RichText(
                text: const TextSpan(
                    text: 'Its support for',
                    style: TextStyle(color: Colors.black),
                    children: <TextSpan>[
                      TextSpan(
                          text: ' hot reloading ',
                          style: TextStyle(fontWeight: FontWeight.bold)),
                      TextSpan(
                          text:
                              'allows a developer to quickly experiment and add features with split-second reloading times. This can speed up the development progress of applications substantially, setting Flutter apart from similar frameworks.'),
                    ]),
              ),
              const Padding(padding: EdgeInsets.all(8)),
              const Text(
                  'Flutter takes advantage of many different techniques in order to achieve high performance and productivity. These include:'),
              const Padding(padding: EdgeInsets.all(3)),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(padding: EdgeInsets.all(3)),
                  Text("\u2022"),
                  Padding(padding: EdgeInsets.all(3)),
                  Expanded(
                    child: Text("Compiling to native code"),
                  )
                ],
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: const [
                  Padding(padding: EdgeInsets.all(3)),
                  Text("\u2022"),
                  Padding(padding: EdgeInsets.all(3)),
                  Expanded(
                    child: Text(
                        "Using widgets and only rendering them when necessary"),
                  ),
                ],
              ),
              const Padding(padding: EdgeInsets.all(8)),
              const Text(
                'What kind of things can I build with Flutter?',
                style: $heading5Bold,
              ),
              const Divider(),
              const Text(
                  'Flutter is optimized to create 2D mobile apps that run on both Android and iOS. However, recent news shows that Flutter is expanding to the web, desktop and embedded environments. In your apps, you can implement geolocation, camera, network, 3rd-party SDKs and more.'),
              const Padding(padding: EdgeInsets.all(8)),
              const Text(
                'What IDE can I use with Flutter?',
                style: $heading5Bold,
              ),
              const Divider(),
              Image.asset('asset/images/ide.jpeg'),
              const Padding(padding: EdgeInsets.all(8)),
              const Text(
                  "Flutter supports plugins for IntelliJ, VS Code and Android Studio. It’s really down to preference, but I love using VS Code, just because it’s lightweight and gives me the ability to edit, build and debug with ease."),
              const Padding(padding: EdgeInsets.all(8)),
              const Text(
                'What language is used to write Flutter Code?',
                style: $heading5Bold,
              ),
              const Divider(),
              const Text(
                  'Dart is the programming language that is used when coding Flutter applications. Dart was first shown back in October 2011, over 7 years ago. Dart follows object-oriented programming concepts like loops, classes, functions, methods, operators and some exceptions like throw and catch.'),
              const Padding(padding: EdgeInsets.all(8)),
              const Text(
                'Installing Flutter',
                style: $heading5Bold,
              ),
              const Divider(),
              const Text(
                  'You will need to start by installing Flutter on your device. Flutter has full support for macOS, Linux and Windows. I would highly recommend using Visual Studio Code as your IDE, as well as the Dart Code extension, however Android Studio and IntelliJ are great alternatives.'),
              const Padding(padding: EdgeInsets.all(8)),
              const Text(
                'Creating a new Flutter Project',
                style: $heading5Bold,
              ),
              const Divider(),
              const Text('Using terminal:'),
              const Padding(padding: EdgeInsets.all(3)),
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  color: const Color.fromARGB(255, 0, 25, 88),
                ),
                padding: const EdgeInsets.all(15),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(padding: EdgeInsets.all(2)),
                    const Text(
                      '#  Creating a new flutter introduction',
                      style:
                          TextStyle(color: Color.fromARGB(133, 224, 224, 224)),
                    ),
                    const Padding(padding: EdgeInsets.all(2)),
                    const Text('\$  flutter create demo',
                        style: TextStyle(color: Colors.white)),
                    const Padding(padding: EdgeInsets.all(2)),
                    const Text(
                      '#  Changing directory',
                      style:
                          TextStyle(color: Color.fromARGB(133, 224, 224, 224)),
                    ),
                    const Padding(padding: EdgeInsets.all(2)),
                    RichText(
                      text: TextSpan(
                        text: '\$  cd ',
                        style: TextStyle(color: Colors.orange.shade300),
                        children: const <TextSpan>[
                          TextSpan(
                              text: 'demo',
                              style: TextStyle(color: Colors.white)),
                        ],
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(2)),
                    const Text(
                      '#  Opening file in VS Code',
                      style:
                          TextStyle(color: Color.fromARGB(133, 224, 224, 224)),
                    ),
                    const Padding(padding: EdgeInsets.all(2)),
                    RichText(
                      text: TextSpan(
                        text: '\$  code ',
                        style: const TextStyle(color: Colors.white),
                        children: <TextSpan>[
                          TextSpan(
                              text: '.',
                              style: TextStyle(color: Colors.orange.shade300)),
                        ],
                      ),
                    ),
                    const Padding(padding: EdgeInsets.all(2)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _scrollToTop,
        child: const Icon(Icons.arrow_upward),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
