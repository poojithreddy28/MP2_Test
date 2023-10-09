import 'package:flutter/material.dart';
import '../models/dice.dart';
import '../models/scorecard.dart';
import 'DiceWidget.dart';

class Yahtzee extends StatefulWidget {
  final Dice dice;
  final ScoreCard scoreCard;

  const Yahtzee({
    super.key,
    required this.dice,
    required this.scoreCard,
  });

  @override
  State<Yahtzee> createState() => _YahtzeeState();
}

class _YahtzeeState extends State<Yahtzee> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Yahtzee Game',
          style: TextStyle(fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        backgroundColor: Color.fromARGB(255, 7, 43, 84),
      ),
      body: Container(
        color: Color.fromARGB(255, 232, 227, 229),
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const DiceGame(),
          ],
        ),
      ),
    );
  }
}
