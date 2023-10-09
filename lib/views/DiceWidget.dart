import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/dice.dart';
import 'ScoreCardWidget.dart';
import '../models/scorecard.dart';
import 'dice_game_notifier.dart';

class DiceGame extends StatelessWidget {
  const DiceGame({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => DiceGameNotifier(),
      child: _DiceGameWidget(),
    );
  }
}

class _DiceGameWidget extends StatefulWidget {
  @override
  State<_DiceGameWidget> createState() => _DiceState();
}

class _DiceState extends State<_DiceGameWidget> {
  @override
  Widget build(BuildContext context) {
    final diceGameNotifier = Provider.of<DiceGameNotifier>(context);

    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              for (int i = 0; i < diceGameNotifier.dice.values.length; i++)
                GestureDetector(
                  onTap: () => diceGameNotifier.toggleHold(i),
                  child: Container(
                    margin: EdgeInsets.all(10),
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: diceGameNotifier.dice.isHeld(i)
                          ? Color.fromARGB(255, 187, 78, 70)
                          : Colors.blue,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Center(
                      child: Text(
                        diceGameNotifier.dice.values[i].toString(),
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),
          ElevatedButton(
            onPressed: diceGameNotifier.rollDice,
            child: const Text('Roll Dice'),
          ),
          Text('Rolls Left: ${diceGameNotifier.dice.rollsLeft}'),
          ScoreCardDisplay(diceValues: diceGameNotifier.dice.values),
        ],
      ),
    );
  }
}
