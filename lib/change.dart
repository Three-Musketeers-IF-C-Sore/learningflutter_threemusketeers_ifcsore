import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:learningflutter_threemusketeers_ifcsore/providers/setting_provider.dart';
import 'package:learningflutter_threemusketeers_ifcsore/setting_page.dart';
import 'package:provider/provider.dart';

import 'mikroskil_page.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(create: (_) => SettingProvider()),
  ], child: const MikroskilPage()));
}

class MyTheme extends StatelessWidget {
  const MyTheme({super.key});

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<SettingProvider>(context);
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: prov.enableDarkMode == true ? prov.dark : prov.light,
      home: SettingPage(),
    );
  }
}
