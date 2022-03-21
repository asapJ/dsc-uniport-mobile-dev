// import 'package:flutter/material.dart';
import 'package:flutter/material.dart';

class CalculatorHome extends StatefulWidget {
  const CalculatorHome({Key? key}) : super(key: key);

  @override
  State<CalculatorHome> createState() => _CalculatorHomeState();
}

class _CalculatorHomeState extends State<CalculatorHome> {
  TextEditingController _firstNumberController = TextEditingController();
  TextEditingController _secondNumberController = TextEditingController();

  int answer = 0;

  void _sumNumbers() {
    var firstNumber = _firstNumberController.text;
    var secondNumber = _secondNumberController.text;

    setState(() {
      answer = int.parse(firstNumber) + int.parse(secondNumber);
    });
  }

  void _multiplyNumbers() {
    var firstNumber = _firstNumberController.text;
    var secondNumber = _secondNumberController.text;

    setState(() {
      answer = int.parse(firstNumber) * int.parse(secondNumber);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Calculator'),
      ),
      body: Padding(
        padding: EdgeInsets.all(24),
        child: Column(children: [
          MyTextBox(
            controller: _firstNumberController,
            hint: 'First Number',
          ),
          SizedBox(
            height: 18,
          ),
          MyTextBox(
            controller: _secondNumberController,
            hint: 'Second Number',
          ),
          SizedBox(
            height: 32,
          ),
          MyButton(
            icon: Icons.add,
            onPressed: _sumNumbers,
            buttonText: "Add",
          ),
          SizedBox(
            height: 12,
          ),
          MyButton(
            icon: Icons.close,
            onPressed: _multiplyNumbers,
            buttonText: "Multily",
          ),
          SizedBox(
            height: 32,
          ),
          Text(
            answer.toString(),
            style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
          )
        ]),
      ),
    );
  }
}

class MyTextBox extends StatelessWidget {
  const MyTextBox({Key? key, required this.controller, this.hint})
      : super(key: key);

  final String? hint;
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(hintText: hint ?? ''),
    );
  }
}

class MyButton extends StatelessWidget {
  const MyButton(
      {Key? key, this.buttonText, required this.onPressed, required this.icon})
      : super(key: key);

  final String? buttonText;
  final void Function() onPressed;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: size.width / 2,
        height: 50,
        decoration: BoxDecoration(
            color: Colors.red, borderRadius: BorderRadius.circular(8)),
        child: Center(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              icon,
              color: Colors.white,
            ),
            SizedBox(
              width: 10,
            ),
            Text(
              buttonText ?? "Click Me",
              style: TextStyle(color: Colors.white, fontSize: 18),
            )
          ],
        )),
      ),
    );
  }
}
