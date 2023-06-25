import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:learningflutter_threemusketeers_ifcsore/widgets/main/appbar.dart';

class MusicPage extends StatefulWidget {
  const MusicPage({super.key});

  @override
  State<MusicPage> createState() => _MusicPageState();
}

class _MusicPageState extends State<MusicPage> {
  bool isPlaying = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MainAppBar(
        title: "Music",
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Column(
            children: [
              Card(
                child: ListTile(
                  leading: Image.asset(
                    "../assets/images/maroon.png",
                    width: 35,
                  ),
                  title: const Text('Memories'),
                  subtitle: const Text('Maroon 5'),
                  trailing: IconButton(
                    icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                    onPressed: () {
                      setState(() {
                        isPlaying = !isPlaying;
                      });
                    },
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Image.asset(
                    "../assets/images/maroon.png",
                    width: 35,
                  ),
                  title: const Text('Memories'),
                  subtitle: const Text('Maroon 5'),
                  trailing: IconButton(
                    icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                    onPressed: () {
                      setState(() {
                        isPlaying = !isPlaying;
                      });
                    },
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Image.asset(
                    "../assets/images/maroon.png",
                    width: 35,
                  ),
                  title: const Text('Memories'),
                  subtitle: const Text('Maroon 5'),
                  trailing: IconButton(
                    icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                    onPressed: () {
                      setState(() {
                        isPlaying = !isPlaying;
                      });
                    },
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Image.asset(
                    "../assets/images/maroon.png",
                    width: 35,
                  ),
                  title: const Text('Memories'),
                  subtitle: const Text('Maroon 5'),
                  trailing: IconButton(
                    icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                    onPressed: () {
                      setState(() {
                        isPlaying = !isPlaying;
                      });
                    },
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Image.asset(
                    "../assets/images/maroon.png",
                    width: 35,
                  ),
                  title: const Text('Memories'),
                  subtitle: const Text('Maroon 5'),
                  trailing: IconButton(
                    icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                    onPressed: () {
                      setState(() {
                        isPlaying = !isPlaying;
                      });
                    },
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Image.asset(
                    "../assets/images/maroon.png",
                    width: 35,
                  ),
                  title: const Text('Memories'),
                  subtitle: const Text('Maroon 5'),
                  trailing: IconButton(
                    icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                    onPressed: () {
                      setState(() {
                        isPlaying = !isPlaying;
                      });
                    },
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Image.asset(
                    "../assets/images/maroon.png",
                    width: 35,
                  ),
                  title: const Text('Memories'),
                  subtitle: const Text('Maroon 5'),
                  trailing: IconButton(
                    icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                    onPressed: () {
                      setState(() {
                        isPlaying = !isPlaying;
                      });
                    },
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Image.asset(
                    "../assets/images/maroon.png",
                    width: 35,
                  ),
                  title: const Text('Memories'),
                  subtitle: const Text('Maroon 5'),
                  trailing: IconButton(
                    icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                    onPressed: () {
                      setState(() {
                        isPlaying = !isPlaying;
                      });
                    },
                  ),
                ),
              ),
              Card(
                child: ListTile(
                  leading: Image.asset(
                    "../assets/images/maroon.png",
                    width: 35,
                  ),
                  title: const Text('Memories'),
                  subtitle: const Text('Maroon 5'),
                  trailing: IconButton(
                    icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
                    onPressed: () {
                      setState(() {
                        isPlaying = !isPlaying;
                      });
                    },
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
