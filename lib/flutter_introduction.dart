import 'package:flutter/material.dart';
import 'package:learningflutter_threemusketeers_ifcsore/theme/typography.dart';

class FlutterIntro extends StatefulWidget {
  const FlutterIntro({super.key});

  @override
  State<FlutterIntro> createState() => _FlutterIntroState();
}

class _FlutterIntroState extends State<FlutterIntro> {
  bool isReadMode = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: isReadMode == true ? Colors.orange.shade100 : Colors.white,
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white,),
          onPressed: () => Navigator.of(context).pop(),
        ),
        centerTitle: true,
        title: const Text('Flutter', style: $heading2Light,),
        backgroundColor: Colors.purple,
        actions: [
          PopupMenuButton(
            icon: const Icon(Icons.more_vert, color: Colors.white,),
            itemBuilder: (context) {
              return [
                PopupMenuItem(
                  value: "read",
                  child: Container(
                    color: isReadMode ? Colors.blue.shade400 : Colors.white,
                    padding: const EdgeInsets.all(10),
                    child: Row(children: const [
                      Icon(Icons.chrome_reader_mode_outlined, color: Colors.black,),
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
                      Icon(Icons.arrow_upward, color: Colors.black,),
                      Padding(padding: EdgeInsets.only(left: 10)),
                      Text('Scroll Up')
                    ]),
                  ),
                )
              ];
            },
            onSelected: (value) {
              if(value == "read") {
                setState(() {
                  isReadMode = !isReadMode;
                });
              } else if (value == "up") {
                
              }
            },
          )
        ],
      ),
    );
  }
}