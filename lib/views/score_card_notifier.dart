import 'package:flutter/material.dart';
import 'package:mp2/models/dice.dart';
import '../models/scorecard.dart';
import 'dice_game_notifier.dart';

class ScoreCardNotifier extends ChangeNotifier {
  late Dice dice;
  late ScoreCard scoreCard;

  ScoreCardNotifier() {
    dice = Dice(5);
    scoreCard = ScoreCard();
  }

  void clearDice() {
    dice.clear();
    dice.resetRollsLeft();
    notifyListeners();
  }

  void onScoreSelected(
      BuildContext context, ScoreCategory category, List<int> diceValues) {
    scoreCard.registerScore(category, diceValues);

    if (scoreCard.completed) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(
              'Game Over',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            content: Text('Your total score is: ${scoreCard.total}'),
            actions: [
              ElevatedButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  scoreCard.clear();
                  clearDice(); // Clear dice when playing again
                },
                child: const Text('Play Again'),
              ),
            ],
          );
        },
      );
    }

    notifyListeners();
  }
}
