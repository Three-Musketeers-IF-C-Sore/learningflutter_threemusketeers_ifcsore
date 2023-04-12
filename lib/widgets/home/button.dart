import 'package:flutter/material.dart';
import 'package:learningflutter_threemusketeers_ifcsore/theme/colors.dart';
import 'package:learningflutter_threemusketeers_ifcsore/flutter_introduction.dart';


class HomeButton extends StatefulWidget {
  const HomeButton({super.key, required this.text, required this.handleOnPressed, this.isOutlined = false});

  final bool isOutlined;
  final String text;
  final Function handleOnPressed;

  @override
  State<HomeButton> createState() => _HomeButtonState();
}

class _HomeButtonState extends State<HomeButton> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () {
          widget.handleOnPressed();
        },
        style: ElevatedButton.styleFrom(
          fixedSize: const Size(400, 35),
          backgroundColor: widget.isOutlined ? $white : $primary500,
          foregroundColor: widget.isOutlined ? $primary500 : null,
          side: widget.isOutlined ? const BorderSide(width: 1, color: $primary500) : null,
        ),
        child: Text(widget.text));
  }
}