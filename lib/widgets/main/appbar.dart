import 'package:flutter/material.dart';
import 'package:learningflutter_threemusketeers_ifcsore/theme/typography.dart';

class MainAppBar extends StatefulWidget implements PreferredSizeWidget {
  const MainAppBar(
      {super.key, required this.title, this.actionsBuilder = const []});

  final String title;
  final List<PopupMenuEntry> actionsBuilder;

  @override
  State<MainAppBar> createState() => _MainAppBarState();

  @override
  Size get preferredSize => const Size.fromHeight(64.0);
}

class _MainAppBarState extends State<MainAppBar> {
  @override
  Widget build(BuildContext context) {
    return PreferredSize(
      preferredSize: const Size.fromHeight(64.0),
      child: AppBar(
          leading: IconButton(
            icon: const Icon(
              Icons.arrow_back_ios_new,
              color: Colors.white,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          centerTitle: true,
          title: Text(
            widget.title,
            style: $heading4Bold,
          ),
          backgroundColor: Colors.purple,
          actions: [
            PopupMenuButton(
                icon: const Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
                itemBuilder: (context) {
                  return widget.actionsBuilder;
                }),
          ]),
    );
  }
}
