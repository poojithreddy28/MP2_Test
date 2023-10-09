import 'package:flutter/material.dart';
import '../models/dice.dart';
import '../models/scorecard.dart';
import 'views/yahtzee.dart';

void main() {
  final dice = Dice(5);
  final scoreCard = ScoreCard();

  runApp(
    MaterialApp(
      title: 'Yahtzee',
      home: Scaffold(
        body: Yahtzee(
          dice: dice,
          scoreCard: scoreCard,
        ),
      ),
      debugShowCheckedModeBanner: false,
    ),
  );
}
