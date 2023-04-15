import 'package:flutter/material.dart';
import 'package:learningflutter_threemusketeers_ifcsore/theme/colors.dart';
import 'package:learningflutter_threemusketeers_ifcsore/widgets/calculator/button.dart';
import 'package:learningflutter_threemusketeers_ifcsore/widgets/main/appbar.dart';
import 'package:math_expressions/math_expressions.dart';


class SimpleCalculator extends StatefulWidget {
  const SimpleCalculator({super.key});

  @override
  State<SimpleCalculator> createState() => _SimpleCalculatorState();
}

class _SimpleCalculatorState extends State<SimpleCalculator> {
  var userInput = '';
  var result = '';
  var inputController = TextEditingController(text: "");

  @override
  void initState() {
    inputController.text = userInput;
    super.initState();
  }

  @override
   void dispose() {
    inputController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: const MainAppBar(title: "Simple Calculator"),
      body: Container(
        padding: const EdgeInsets.only(top: 160, left: 16, right: 16),
        child: Column(
          children: [
            TextField(
              controller: inputController,
               decoration: const InputDecoration(
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
                CalculatorButton(text: "+", handleOnPressed: () {
                  setState(() => {
                    userInput += "+",
                    inputController.text = userInput,
                  });
                }),
                const SizedBox(width: 16),
                CalculatorButton(text: "-", handleOnPressed: () {
                  setState(() => {
                    userInput += "-",
                    inputController.text = userInput,
                  });
                }),
                const SizedBox(width: 16),
                CalculatorButton(text: "*", handleOnPressed: () {
                  setState(() => {
                    userInput += "*",
                    inputController.text = userInput,
                  });
                }),
                const SizedBox(width: 16),
                CalculatorButton(text: "/", handleOnPressed: () {
                  setState(() => {
                    userInput += "/",
                    inputController.text = userInput,
                  });
                }),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CalculatorButton(text: "7", handleOnPressed: () {
                  setState(() => {
                    userInput += "7",
                    inputController.text = userInput,
                  });
                }),
                const SizedBox(width: 16),
                CalculatorButton(text: "8", handleOnPressed: () {
                  setState(() => {
                    userInput += "8",
                    inputController.text = userInput,
                  });
                }),
                const SizedBox(width: 16),
                CalculatorButton(text: "9", handleOnPressed: () {
                  setState(() => {
                    userInput += "9",
                    inputController.text = userInput,
                  });
                }),
                const SizedBox(width: 16),
                CalculatorButton(text: "C", handleOnPressed: () {
                  setState(() => {
                    userInput = '',
                    inputController.text = userInput,
						      });
                }),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CalculatorButton(text: "4", handleOnPressed: () {
                  setState(() => {
                    userInput += "4",
                    inputController.text = userInput,
                  });
                }),
                const SizedBox(width: 16),
                CalculatorButton(text: "5", handleOnPressed: () {
                  setState(() => {
                    userInput += "5",
                    inputController.text = userInput,
                  });
                }),
                const SizedBox(width: 16),
                CalculatorButton(text: "6", handleOnPressed: () {
                  setState(() => {
                    userInput += "6",
                    inputController.text = userInput,
                  });
                }),
                const SizedBox(width: 16),
                CalculatorButton(text: "=", handleOnPressed: () {
                  setState(() {
                    handleEqual();
                  });
                })],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                CalculatorButton(text: "1", handleOnPressed: () {
                  setState(() => {
                    userInput += "1",
                    inputController.text = userInput,
                  });
                }),
                const SizedBox(width: 16),
                CalculatorButton(text: "2", handleOnPressed: () {
                  setState(() => {
                    userInput += "2",
                    inputController.text = userInput,
                  });
                }),
                const SizedBox(width: 16),
                CalculatorButton(text: "3", handleOnPressed: () {
                  setState(() => {
                    userInput += "3",
                    inputController.text = userInput,
                  });
                }),
                const SizedBox(width: 16),
                CalculatorButton(text: "0", handleOnPressed: () {
                  setState(() => {
                    userInput += "0",
                    inputController.text = userInput,
                  });
                }),
              ],
            ),
          ],
        ),
      ),
    );
  }


  void handleEqual() {
    String finaluserinput = userInput;
    finaluserinput = userInput.replaceAll('x', '*');

    Parser p = Parser();
    Expression exp = p.parse(finaluserinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);
    userInput = eval.toString();
    inputController.text = userInput;
  }
}
