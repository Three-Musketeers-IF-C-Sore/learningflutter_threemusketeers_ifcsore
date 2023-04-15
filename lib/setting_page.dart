import 'package:flutter/material.dart';
import 'package:learningflutter_threemusketeers_ifcsore/providers/setting_provider.dart';
import 'package:learningflutter_threemusketeers_ifcsore/theme/colors.dart';
import 'package:learningflutter_threemusketeers_ifcsore/theme/typography.dart';
import 'package:provider/provider.dart';

class SettingPage extends StatelessWidget {
  const SettingPage({super.key});

  get dark => null;

  @override
  Widget build(BuildContext context) {
    final prov = Provider.of<SettingProvider>(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: const Text('Setting'),
        automaticallyImplyLeading: false,
        centerTitle: true,
        backgroundColor: $primary500,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Center(
          child: Column(mainAxisAlignment: MainAxisAlignment.start, children: [
            const Text(
              'Display Setting',
              style: $heading6Bold,
            ),
            const Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text('Dark Mode'),
                Switch(
                  value: prov.enableDarkMode,
                  activeColor: Colors.green,
                  onChanged: (val) {
                    prov.setBrightness = val;
                  },
                )
              ],
            )
          ]),
        ),
      ),
      floatingActionButton: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: $primary500,
          ),
          onPressed: () {
            Navigator.of(context).popUntil((route) => route.isFirst);
          },
          child: const Text('Back to Home Page')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
