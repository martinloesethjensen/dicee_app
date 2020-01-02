import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int rightDiceNumber = 5;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child: Row(
          children: <Widget>[
            buildExpandedDice(leftDiceNumber, randomizeDie),
            buildExpandedDice(rightDiceNumber, randomizeDie),
          ],
        ),
      ),
    );
  }

  Expanded buildExpandedDice(int diceNumber, Function action) {
    return Expanded(
              child: FlatButton(
            child: Image.asset("images/dice$diceNumber.png"),
            onPressed: action,
          ));
  }

  void randomizeDie() => setState(() {
        rightDiceNumber = Random().nextInt(6) + 1;
        leftDiceNumber = Random().nextInt(6) + 1;
      });
}
