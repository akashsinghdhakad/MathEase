import 'package:expressions/expressions.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class CalculatorScreen extends StatefulWidget {
  const CalculatorScreen({
    super.key,
  });

  @override
  State<CalculatorScreen> createState() => _CalculatorScreenState();
}

class _CalculatorScreenState extends State<CalculatorScreen> {
  String defaultInputVal = "";
  late String input;
  String? output = "";

  // late int? viewportWidth;

  @override
  void initState() {
    input = defaultInputVal;

    // if (kIsWeb) {
    //   viewportWidth = html.window.document.documentElement?.clientWidth;
    // }
    // (viewportWidth != null && viewportWidth! > 700) ? 700 : null,
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.bottomRight,
                child: ListView(
                  shrinkWrap: true,
                  padding: const EdgeInsets.all(16.0),
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          input == "" ? "0" : input,
                          style: const TextStyle(fontSize: 50),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                decoration: const BoxDecoration(
                  color: Color(0xFFFBF7F7),
                  border: Border(
                    top: BorderSide(
                      color: Colors.black,
                      width: 0.1,
                    ),
                  ),
                ),
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    const SizedBox(height: 8.0),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                              child: ButtonWidget(
                            buttonValue: "Ac",
                            onTapCallback: (value) async {
                              onAllClear();
                            },
                          )),
                          Expanded(
                            child: ButtonWidget(
                              buttonValue: "X",
                              icon: Icons.cancel_presentation_outlined,
                              onTapCallback: (value) async {
                                setState(() {
                                  if (input.isNotEmpty) {
                                    input = input.substring(0, input.length - 1);
                                  }
                                });
                              },
                            ),
                          ),
                          Expanded(
                              child: ButtonWidget(
                            buttonValue: "/",
                            onTapCallback: (value) async {
                              onArithOperBtnTap(value);
                            },
                          )),
                          Expanded(
                              child: ButtonWidget(
                            buttonValue: "*",
                            onTapCallback: (value) async {
                              onArithOperBtnTap(value);
                            },
                          )),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                              child: ButtonWidget(
                            buttonValue: "7",
                            onTapCallback: (value) async {
                              onNumArithOperatorButtonTap(value);
                            },
                          )),
                          Expanded(
                              child: ButtonWidget(
                            buttonValue: "8",
                            onTapCallback: (value) async {
                              onNumArithOperatorButtonTap(value);
                            },
                          )),
                          Expanded(
                              child: ButtonWidget(
                            buttonValue: "9",
                            onTapCallback: (value) async {
                              onNumArithOperatorButtonTap(value);
                            },
                          )),
                          Expanded(
                              child: ButtonWidget(
                            buttonValue: "-",
                            onTapCallback: (value) async {
                              onArithOperBtnTap(value);
                            },
                          )),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          Expanded(
                            flex: 3,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Expanded(
                                          child: ButtonWidget(
                                        buttonValue: "4",
                                        onTapCallback: (value) async {
                                          onNumArithOperatorButtonTap(value);
                                        },
                                      )),
                                      Expanded(
                                          child: ButtonWidget(
                                        buttonValue: "5",
                                        onTapCallback: (value) async {
                                          onNumArithOperatorButtonTap(value);
                                        },
                                      )),
                                      Expanded(
                                          child: ButtonWidget(
                                        buttonValue: "6",
                                        onTapCallback: (value) async {
                                          onNumArithOperatorButtonTap(value);
                                        },
                                      )),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Expanded(
                                          child: ButtonWidget(
                                        buttonValue: "1",
                                        onTapCallback: (value) async {
                                          onNumArithOperatorButtonTap(value);
                                        },
                                      )),
                                      Expanded(
                                          child: ButtonWidget(
                                        buttonValue: "2",
                                        onTapCallback: (value) async {
                                          onNumArithOperatorButtonTap(value);
                                        },
                                      )),
                                      Expanded(
                                          child: ButtonWidget(
                                        buttonValue: "3",
                                        onTapCallback: (value) async {
                                          onNumArithOperatorButtonTap(value);
                                        },
                                      )),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    crossAxisAlignment: CrossAxisAlignment.stretch,
                                    children: [
                                      Expanded(
                                        flex: 2,
                                        child: ButtonWidget(
                                          buttonValue: "0",
                                          onTapCallback: (value) async {
                                            onNumArithOperatorButtonTap(value);
                                          },
                                        ),
                                      ),
                                      Expanded(
                                          child: ButtonWidget(
                                        buttonValue: ".",
                                        onTapCallback: (value) async {
                                          List<String> result = splitStringByOper();
                                          String lastInputString = result[result.length - 1];
                                          if (lastInputString.contains(".") == false) {
                                            onNumArithOperatorButtonTap(value);
                                          }
                                        },
                                      )),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.stretch,
                              children: [
                                Expanded(
                                    child: ButtonWidget(
                                  buttonValue: "+",
                                  onTapCallback: (value) async {
                                    onArithOperBtnTap(value);
                                  },
                                )),
                                Expanded(
                                    child: ButtonWidget(
                                  buttonValue: "=",
                                  onTapCallback: (value) async {
                                    final List<String> listOfInvalidChar = ["+", "-", "*", "/", "."];
                                    if (input.isEmpty) {
                                      return;
                                    }
                                    final String lastInput = input.substring(input.length - 1);
                                    if (input.isEmpty || listOfInvalidChar.contains(lastInput)) {
                                      return;
                                    }
                                    Expression expression = Expression.parse(input);
                                    var evaluator = const ExpressionEvaluator();
                                    var result = evaluator.eval(expression, {});

                                    setState(() {
                                      input = result.toString();
                                    });
                                  },
                                )),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 8.0),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  List<String> splitStringByOper() {
    String expressionInput = input;
    List<String> letters = ["+", "-", "*", "/"];

    String pattern = letters.map((letter) => RegExp.escape(letter)).join('|');

    List<String> result = expressionInput.split(RegExp(pattern));
    return result;
  }

  void onArithOperBtnTap(String value) {
    if (input.isEmpty) {
      input = "0";
    }
    final String lastInput = input.substring(input.length - 1);
    final List<String> listOfArithOper = ["+", "-", "*", "/"];
    if (listOfArithOper.contains(lastInput)) {
      input = input.substring(0, input.length - 1);
    }
    onNumArithOperatorButtonTap(value);
  }

  void onAllClear() {
    setState(() {
      input = "";
    });
  }

  void onNumArithOperatorButtonTap(String value) {
    setState(() {
      input += value;
    });
  }
}

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    super.key,
    required this.buttonValue,
    this.icon,
    required this.onTapCallback,
  });

  final String buttonValue;
  final IconData? icon;

  final AsyncValueSetter<String> onTapCallback;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: ElevatedButton(
        onPressed: () async {
          try {
            await onTapCallback(buttonValue);
          } catch (e) {
            if (context.mounted) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(e.toString()),
                ),
              );
            }
          }
        },
        style: Theme.of(context).elevatedButtonTheme.style?.copyWith(
              padding: const WidgetStatePropertyAll(EdgeInsets.all(0)),
            ),
        child: icon != null ? Icon(icon) : Text(buttonValue),
      ),
    );
  }
}
