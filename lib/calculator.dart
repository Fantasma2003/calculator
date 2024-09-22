import 'package:calculator/button.dart';
import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class Calculator extends StatefulWidget {
  const Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  List<String> buttons = [
    'C',
    'DEL',
    '%',
    '/',
    '9',
    '8',
    '7',
    '*',
    '6',
    '5',
    '4',
    '-',
    '3',
    '2',
    '1',
    '+',
    '0',
    '.',
    'ANS',
    '='
  ];

  String userQuestion = '';
  String userAnswer = '';
  String lastAnswer = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[100],
      body: Column(
        children: [
          Expanded(
            child: SafeArea(
              child: Column(
                children: [
                  const SizedBox(height: 50),
                  Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.centerLeft,
                    child: Text(userQuestion,
                        style: const TextStyle(fontSize: 20)),
                  ),
                  Container(
                    padding: const EdgeInsets.all(20),
                    alignment: Alignment.bottomRight,
                    child:
                        Text(userAnswer, style: const TextStyle(fontSize: 30)),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: GridView.builder(
              itemCount: buttons.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 4,
              ),
              itemBuilder: (context, index) {
                if (index == 0) {
                  return MyButton(
                    buttonColor: Colors.green,
                    textColor: Colors.white,
                    buttonText: buttons[index],
                    onTap: () {
                      setState(() {
                        userQuestion = '';
                        userAnswer = '';
                      });
                    },
                  );
                } else if (index == 1) {
                  return MyButton(
                    buttonColor: Colors.red,
                    textColor: Colors.white,
                    buttonText: buttons[index],
                    onTap: () {
                      setState(() {
                        if (userQuestion.isNotEmpty) {
                          userQuestion = userQuestion.substring(
                              0, userQuestion.length - 1);
                        }
                      });
                    },
                  );
                } else if (index == buttons.length - 1) {
                  return MyButton(
                    buttonColor: Colors.deepPurple,
                    textColor: Colors.white,
                    buttonText: buttons[index],
                    onTap: () {
                      setState(() {
                        equalOperation();
                      });
                    },
                  );
                } else {
                  return MyButton(
                    buttonColor: isOperator(buttons[index])
                        ? Colors.deepPurple
                        : Colors.white,
                    textColor: isOperator(buttons[index])
                        ? Colors.white
                        : Colors.deepPurple,
                    buttonText: buttons[index],
                    onTap: () {
                      setState(() {
                        userQuestion += buttons[index];
                      });
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  bool isOperator(String x) {
    if (x == '%' || x == '/' || x == '*' || x == '-' || x == '+' || x == '=') {
      return true;
    }

    return false;
  }

  void equalOperation() {
    String question = userQuestion;
    question = question.replaceAll('ANS', lastAnswer);

    Parser p = Parser();
    Expression exp = p.parse(question);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    userAnswer = eval.toString();
    lastAnswer = userAnswer;
  }
}
