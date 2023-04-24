import 'package:flutter/material.dart';

class MyWidget extends StatelessWidget {
  const MyWidget({Key? key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Setting(),
    );
  }
}

class Setting extends StatefulWidget {
  const Setting({Key? key});

  @override
  State<Setting> createState() => _MySettingState();
}

class _MySettingState extends State<Setting> {
  bool _switch = false;
  bool isReadMode = false;

  final ThemeData _dark =
      ThemeData(brightness: Brightness.dark, primaryColor: Colors.white);
  final ThemeData _light =
      ThemeData(brightness: Brightness.light, primaryColor: Colors.black);

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = _switch && !isReadMode ? _dark : _light;
    Color backgroundColor = isReadMode
        ? Colors.orange.shade100
        : currentTheme.scaffoldBackgroundColor;

    if (_switch && isReadMode) {
      // Automatically turn off _switch and isReadMode when _switch is turned on
      _switch = false;
      isReadMode = false;
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: currentTheme,
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          title: const Text("Light & Dark Theme"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              const Icon(
                Icons.lightbulb_circle_outlined,
                size: 35,
                color: Colors.yellowAccent,
              ),
              const SizedBox(
                height: 30,
              ),
              const Text(
                "Switch",
                style: TextStyle(
                  fontSize: 40,
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _switch = !_switch;
                    if (_switch && isReadMode) {
                      isReadMode = false;
                    }
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('Dark Mode'),
                    Switch(
                      value: _switch,
                      onChanged: null,
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isReadMode = !isReadMode;
                    if (isReadMode && _switch) {
                      _switch = false;
                    }
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('Read Mode'),
                    Switch(
                      value: isReadMode,
                      onChanged: null,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
