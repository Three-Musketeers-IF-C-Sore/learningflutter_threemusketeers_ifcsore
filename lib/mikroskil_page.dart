import 'package:flutter/material.dart';
import 'package:learningflutter_threemusketeers_ifcsore/setting_page.dart';
import 'package:learningflutter_threemusketeers_ifcsore/theme/typography.dart';
import 'mikroskil_card_page.dart';

class MikroskilPage extends StatefulWidget {
  const MikroskilPage({super.key});

  @override
  State<MikroskilPage> createState() => _MikroskilPageState();
}

class _MikroskilPageState extends State<MikroskilPage> {
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

  void _goToSettingPage() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const Setting()),
    );
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
          'Mikroskil',
          style: $heading2Light,
        ),
        backgroundColor: Colors.purple,
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
        controller: _scrollController,
        child: Padding(
          padding:
              const EdgeInsets.only(top: 40, bottom: 85, left: 15, right: 15),
          child: Column(children: [
            Image.asset('assets/images/mikroskil.jpeg'),
            const Padding(padding: EdgeInsets.all(8)),
            const Align(
              alignment: Alignment.center,
              child: Text(
                'Program Pendidikan',
                style: $heading3Bold,
              ),
            ),
            const Divider(),
            Box(),
          ]),
        ),
      ),
    );
  }
}
