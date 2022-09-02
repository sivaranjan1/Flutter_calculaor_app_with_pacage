import 'package:calculator_app/buttons.dart';
import 'package:math_expressions/math_expressions.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Screen(),
    );
  }
}

class Screen extends StatefulWidget {
  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {
  String userInput = '';

  String output = '';

  List<String> names = [
    'C',
    'DEL',
    '%',
    '/',
    '7',
    '8',
    '9',
    'X',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '0',
    '.',
    'CLR',
    '=',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple[100],
      body: Column(
        children: [
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(height: 20),
              Container(
                padding: EdgeInsets.all(30),
                alignment: Alignment.centerLeft,
                child: Text(
                  userInput,
                  style: TextStyle(fontSize: 50),
                ),
              ),
              Container(
                  padding: EdgeInsets.all(30),
                  alignment: Alignment.centerRight,
                  child: Text(
                    output,
                    style: TextStyle(fontSize: 20),
                  ))
            ],
          )),
          Expanded(
            flex: 2,
            child: GridView.builder(
                physics: NeverScrollableScrollPhysics(),
                itemCount: names.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 4),
                itemBuilder: ((context, index) {
                  if (index == 0) {
                    return Buttons(
                      ontapped: () {
                        setState(() {
                          userInput = '';
                        });
                      },
                      Textcolor: Colors.black,
                      color: Colors.green[700],
                      name: names[index],
                    );
                  } else if (index == 1) {
                    return Buttons(
                      ontapped: () {
                        setState(() {
                          userInput =
                              userInput.substring(0, userInput.length - 1);
                        });
                      },
                      Textcolor: Colors.black,
                      color: Colors.red[700],
                      name: names[index],
                    );
                  } else if (index == names.length - 1) {
                    return Buttons(
                      ontapped: () {
                        setState(() {
                          equalpressed();
                        });
                      },
                      Textcolor: Colors.black,
                      color: Colors.deepPurple,
                      name: names[index],
                    );
                  } else if (index == names.length - 2) {
                    return Buttons(
                      ontapped: () {
                        setState(() {
                          output = '';
                          userInput = '';
                        });
                      },
                      Textcolor: Colors.black,
                      color: Colors.red[700],
                      name: names[index],
                    );
                  } else {
                    return Buttons(
                      ontapped: () {
                        setState(() {
                          userInput += names[index];
                        });
                      },
                      Textcolor:
                          isColor(names[index]) ? Colors.white : Colors.black,
                      color: isColor(names[index])
                          ? Colors.deepPurple
                          : Colors.deepPurple[50],
                      name: names[index],
                    );
                  }
                })),
          )
        ],
      ),
    );
  }

  bool isColor(String x) {
    if (x == '%' || x == '/' || x == 'X' || x == '-' || x == '+' || x == '=') {
      return true;
    } else {
      return false;
    }
  }

  void equalpressed() {
    String finalinput = userInput;
    finalinput = finalinput.replaceAll('X', '*');
    Parser p = Parser();
    Expression exp = p.parse(finalinput);
    ContextModel cm = ContextModel();
    double eval = exp.evaluate(EvaluationType.REAL, cm);

    output = eval.toString();
  }
}
