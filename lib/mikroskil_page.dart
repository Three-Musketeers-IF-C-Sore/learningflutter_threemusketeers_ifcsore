import 'package:flutter/material.dart';
import 'package:learningflutter_threemusketeers_ifcsore/main.dart';
import 'package:learningflutter_threemusketeers_ifcsore/providers/setting_provider.dart';
import 'package:learningflutter_threemusketeers_ifcsore/service/navigate.dart';
import 'package:learningflutter_threemusketeers_ifcsore/setting_page.dart';
import 'package:learningflutter_threemusketeers_ifcsore/theme/colors.dart';
import 'package:learningflutter_threemusketeers_ifcsore/theme/typography.dart';
import 'package:provider/provider.dart';
import 'mikroskil_card_page.dart';

class MikroskilPage extends StatefulWidget {
  const MikroskilPage({super.key});

  @override
  State<MikroskilPage> createState() => _MikroskilPageState();
}

class _MikroskilPageState extends State<MikroskilPage> {
  final ThemeData _dark =
      ThemeData(brightness: Brightness.dark, primaryColor: Colors.white);
  final ThemeData _light =
      ThemeData(brightness: Brightness.light, primaryColor: Colors.black);

  void _goToSettingPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Setting()),
    );
  }

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

    Color color = setting.isReadMode
        ? Colors.black
        : setting.isDarkMode
            ? Colors.white
            : Colors.black;

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
              onPressed: () => {navigate(context, const MyHomePage(title: 'Learning Flutter',))},
            ),
            centerTitle: true,
            title: const Text(
              'Mikroskil',
              style: $heading2Light,
            ),
            backgroundColor: isDarkModeBackgroundColor,
            actions: [
              PopupMenuButton(
                onSelected: (value) {
                  if (value == 'setting') {
                    _goToSettingPage();
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry>[
                  const PopupMenuItem(
                    value: 'setting',
                    child: Text('Setting'),
                  ),
                ],
              ),
            ],
          ),
          body: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.only(
                  top: 40, bottom: 85, left: 15, right: 15),
              child: Column(children: [
                Image.asset(
                  'assets/images/mikroskil.jpeg',
                  width: 500,
                ),
                const Padding(padding: EdgeInsets.all(8)),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    'Program Pendidikan',
                    style: $heading5Bold.copyWith(color: color),
                  ),
                ),
                const Divider(),
                Box(),
              ]),
            ),
          ),
        ));
  }
}
