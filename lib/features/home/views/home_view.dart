import 'package:calculator/core/functions/calculate.dart';
import 'package:calculator/features/home/views/widgets/number_widget.dart';
import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  double _result = 0;

  // final List<String> process = const [
  //   '',
  //   '.',
  //   '=',
  //   '+',
  //   '_',
  //   'X',
  //   'C',
  //   'del',
  //   '%',
  //   '/'
  // ];
  // final List<int> numbers = const [1, 2, 3, 4, 5, 6, 7, 8, 9, 0];

  List<String> equation = [];
  final TextEditingController _textEditingController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Calculator'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          TextField(
            controller: _textEditingController,
            decoration: const InputDecoration(
              hintText: '0.00',
              hintStyle: TextStyle(fontSize: 20),
              border: OutlineInputBorder(
                borderSide: BorderSide.none,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NumberWidget(
                title: 'C',
                onTap: () {
                  // log('44 char to digit ${int.tryParse('44')}');
                  equation.clear();
                  _textEditingController.clear();
                },
              ),
              NumberWidget(
                title: 'del',
                onTap: () {
                  equation.isEmpty
                      ? null
                      : {
                          equation.removeAt(equation.length - 1),
                          _textEditingController.text =
                              _textEditingController.text.replaceRange(
                                  _textEditingController.text.length - 1,
                                  _textEditingController.text.length,
                                  '')
                        };
                },
              ),
              NumberWidget(
                  title: '%',
                  onTap: () {
                    editText('%');
                    setState(() {});
                  }),
              NumberWidget(
                title: '/',
                onTap: () {
                  editText('/');

                  setState(() {});
                },
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NumberWidget(
                title: '7',
                onTap: () {
                  editText('7');

                  setState(() {});
                },
              ),
              NumberWidget(
                title: '8',
                onTap: () {
                  editText('8');

                  setState(() {});
                },
              ),
              NumberWidget(
                title: '9',
                onTap: () => editText('9'),
              ),
              NumberWidget(
                title: '*',
                onTap: () {
                  editText('*');
                  setState(() {});
                },
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NumberWidget(
                title: '4',
                onTap: () {
                  editText('4');
                  setState(() {});
                },
              ),
              NumberWidget(
                title: '5',
                onTap: () {
                  editText('5');
                  setState(() {});
                },
              ),
              NumberWidget(
                title: '6',
                onTap: () {
                  editText('6');
                  setState(() {});
                },
              ),
              NumberWidget(
                title: '-',
                onTap: () {
                  editText('-');
                  setState(() {});
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NumberWidget(
                title: '1',
                onTap: () {
                  // CalculatorService().charToDigit('1');
                  editText('1');
                  setState(() {});
                },
              ),
              NumberWidget(
                title: '2',
                onTap: () {
                  // CalculatorService().charToDigit('2');
                  editText('2');
                  setState(() {});
                },
              ),
              NumberWidget(
                title: '3',
                onTap: () {
                  editText('3');
                  setState(() {});
                },
              ),
              NumberWidget(
                title: '+',
                onTap: () {
                  editText('+');
                  setState(() {});
                },
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              NumberWidget(
                title: '00',
                onTap: () {
                  editText('00');
                  setState(() {});
                },
              ),
              NumberWidget(
                title: '.',
                onTap: () {
                  editText('.');
                  setState(() {});
                },
              ),
              NumberWidget(
                title: '0',
                onTap: () {
                  editText('0');
                  setState(() {});
                },
              ),
              NumberWidget(
                title: '=',
                onTap: () {
                  // log('the length ${equation.length.toString()}');

                  _result = CalculatorService().calculateExpression(equation);
                  equation.clear();
                  equation.add(_result.toString());
                  _textEditingController.text = _result.toString();
                  setState(() {});
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  editText(String item) {
    equation.add(item);
    _textEditingController.text += item;
  }
}
