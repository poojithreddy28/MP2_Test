import 'package:flutter/foundation.dart';
import '../models/dice.dart';
import 'DiceWidget.dart';

class DiceGameNotifier extends ChangeNotifier {
  late Dice dice;

  DiceGameNotifier() {
    dice = Dice(5);
  }

  void rollDice() {
    if (dice.rollsLeft > 0) {
      dice.roll();
      dice.rollsLeft--;
      notifyListeners();
    } else {
      dice.clear();
      dice.resetRollsLeft();
      notifyListeners();
    }
  }

  void toggleHold(int index) {
    dice.toggleHold(index);
    notifyListeners();
  }
}
