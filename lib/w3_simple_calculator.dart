import 'package:flutter/material.dart';
import 'package:learningflutter_threemusketeers_ifcsore/theme/colors.dart';
import 'package:learningflutter_threemusketeers_ifcsore/widgets/calculator/button.dart';
import 'package:learningflutter_threemusketeers_ifcsore/widgets/main/appbar.dart';

class SimpleCalculator extends StatefulWidget {
  const SimpleCalculator({super.key});

  @override
  State<SimpleCalculator> createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const MainAppBar(title: "Simple Calculator"),
      body: Container(
        padding: const EdgeInsets.only(top: 160, left: 16, right: 16),
        child: Column(
          children: [
            const TextField(
               decoration: InputDecoration(
                contentPadding: EdgeInsets.symmetric(vertical: 40.0, horizontal: 16.0),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: $primary500,
                    width: 3,
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: $primary500,
                    width: 3,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: $primary500,
                    width: 3,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CalculatorButton(text: "7", handleOnPressed: () => {}),
                const SizedBox(width: 16),
                CalculatorButton(text: "7", handleOnPressed: () => {}),
                const SizedBox(width: 16),
                CalculatorButton(text: "7", handleOnPressed: () => {}),
                const SizedBox(width: 16),
                CalculatorButton(text: "7", handleOnPressed: () => {}),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CalculatorButton(text: "7", handleOnPressed: () => {}),
                const SizedBox(width: 16),
                CalculatorButton(text: "7", handleOnPressed: () => {}),
                const SizedBox(width: 16),
                CalculatorButton(text: "7", handleOnPressed: () => {}),
                const SizedBox(width: 16),
                CalculatorButton(text: "7", handleOnPressed: () => {}),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CalculatorButton(text: "7", handleOnPressed: () => {}),
                const SizedBox(width: 16),
                CalculatorButton(text: "7", handleOnPressed: () => {}),
                const SizedBox(width: 16),
                CalculatorButton(text: "7", handleOnPressed: () => {}),
                const SizedBox(width: 16),
                CalculatorButton(text: "7", handleOnPressed: () => {}),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CalculatorButton(text: "7", handleOnPressed: () => {}),
                const SizedBox(width: 16),
                CalculatorButton(text: "7", handleOnPressed: () => {}),
                const SizedBox(width: 16),
                CalculatorButton(text: "7", handleOnPressed: () => {}),
                const SizedBox(width: 16),
                CalculatorButton(text: "7", handleOnPressed: () => {}),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
