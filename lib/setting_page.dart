import 'package:flutter/material.dart';
import 'package:learningflutter_threemusketeers_ifcsore/mikroskil_page.dart';
import 'package:learningflutter_threemusketeers_ifcsore/providers/setting_provider.dart';
import 'package:learningflutter_threemusketeers_ifcsore/service/navigate.dart';
import 'package:learningflutter_threemusketeers_ifcsore/theme/colors.dart';
import 'package:learningflutter_threemusketeers_ifcsore/theme/typography.dart';
import 'package:provider/provider.dart';

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
    final setting = Provider.of<SettingProvider>(context);

    ThemeData currentTheme =
        setting.isDarkMode && !setting.isReadMode ? _dark : _light;
    Color backgroundColor = setting.isReadMode
        ? Colors.orange.shade100
        : currentTheme.scaffoldBackgroundColor;

    Color isDarkModeBackgroundColor =
        setting.isDarkMode ? Colors.black : $primary500;

    // if (isDarkMode && isReadMode) {
    //   // Automatically turn off isDarkMode and isReadMode when isDarkMode is turned on
    //   isDarkMode = false;
    //   isReadMode = false;
    // }

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
              onPressed: () => {navigate(context, const MikroskilPage())}),
          centerTitle: true,
          title: const Text(
            "Display",
            style: $heading2Light,
          ),
          backgroundColor: isDarkModeBackgroundColor,
        ),
        body: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Display Setting",
                  style: $heading4Regular,
                ),
              ),
              const Divider(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Dark Mode',
                    style: $body1Regular,
                  ),
                  Switch(
                    value: setting.isDarkMode,
                    onChanged: (value) {
                      setState(() {
                        setting.isDarkMode = value;
                        if (setting.isReadMode) setting.isReadMode = false;
                      });
                    },
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  const Text(
                    'Read Mode',
                    style: $body1Regular,
                  ),
                  Switch(
                    value: setting.isReadMode,
                    onChanged: (value) {
                      setState(() {
                        setting.isReadMode = value;
                        if (setting.isDarkMode) setting.isDarkMode = false;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
