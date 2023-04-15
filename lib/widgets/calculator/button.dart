import 'package:flutter/material.dart';
import 'package:learningflutter_threemusketeers_ifcsore/theme/colors.dart';


class CalculatorButton extends StatefulWidget {
  const CalculatorButton({super.key, required this.text, required this.handleOnPressed});

  final String text;
  final Function handleOnPressed;

  @override
  State<CalculatorButton> createState() => _CalculatorButtonState();
}

class _CalculatorButtonState extends State<CalculatorButton> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: SizedBox(
        width: 77.5,
        height: 56.0,
        child: OutlinedButton(
          style: OutlinedButton.styleFrom(
            foregroundColor: $primary500,
            side: const BorderSide(
              color: $primary500,
              width: 2,
            ),
          ),
          onPressed: () => widget.handleOnPressed(),
          child: Text(
            widget.text
          ),
        ),
      ),
    );
  }
}