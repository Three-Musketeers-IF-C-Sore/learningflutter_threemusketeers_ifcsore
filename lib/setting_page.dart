import 'package:flutter/material.dart';
import 'change.dart';

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
  final ThemeData _dark =
      ThemeData(brightness: Brightness.dark, primaryColor: Colors.white);
  final ThemeData _light =
      ThemeData(brightness: Brightness.light, primaryColor: Colors.black);

  @override
  Widget build(BuildContext context) {
    ThemeData currentTheme = isDarkMode && !isReadMode ? _dark : _light;
    Color backgroundColor = isReadMode
        ? Colors.orange.shade100
        : currentTheme.scaffoldBackgroundColor;

    if (isDarkMode && isReadMode) {
      // Automatically turn off isDarkMode and isReadMode when isDarkMode is turned on
      isDarkMode = false;
      isReadMode = false;
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: currentTheme,
      home: Scaffold(
        backgroundColor: backgroundColor,
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: const Text("Display"),
          backgroundColor: Colors.purple,
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
                    isDarkMode = !isDarkMode;
                    if (isDarkMode && isReadMode) {
                      isReadMode = false;
                    }
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('Dark Mode'),
                    Switch(
                      value: isDarkMode,
                      onChanged: (value) {
                        setState(() {
                          isDarkMode = value;
                        });
                      },
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    isReadMode = !isReadMode;
                    if (isReadMode && isDarkMode) {
                      isDarkMode = false;
                    }
                  });
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Text('Read Mode'),
                    Switch(
                      value: isReadMode,
                      onChanged: (value) {
                        setState(() {
                          isReadMode = value;
                        });
                      },
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
