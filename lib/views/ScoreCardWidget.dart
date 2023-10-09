import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'score_card_notifier.dart'; // Import your ScoreCardNotifier
import '../models/scorecard.dart';
import '../models/dice.dart';

class ScoreCardDisplay extends StatelessWidget {
  final List<int> diceValues;

  const ScoreCardDisplay({Key? key, required this.diceValues})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ScoreCardNotifier(),
      child: _ScoreCardDisplayWidget(diceValues: diceValues),
    );
  }
}

class _ScoreCardDisplayWidget extends StatefulWidget {
  final List<int> diceValues;

  const _ScoreCardDisplayWidget({required this.diceValues});

  @override
  State<_ScoreCardDisplayWidget> createState() => _ScoreCardDisplayState();
}

class _ScoreCardDisplayState extends State<_ScoreCardDisplayWidget> {
  late ScoreCardNotifier scoreCardNotifier; // Instance of ScoreCardNotifier

  @override
  void initState() {
    super.initState();
    // Initialize ScoreCardNotifier
    scoreCardNotifier = Provider.of<ScoreCardNotifier>(context, listen: false);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: ScoreCategory.values
          .map((category) =>
              _buildScoreRow(context, category, scoreCardNotifier.scoreCard))
          .toList(),
    );
  }

  Widget _buildScoreRow(
      BuildContext context, ScoreCategory category, ScoreCard scoreCard) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 2.0, vertical: 2.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            category.name,
            style: TextStyle(fontSize: 20.0),
          ),
          const SizedBox(
            width: 10,
          ),
          ElevatedButton(
            onPressed: () {
              setState(() {
                scoreCardNotifier.clearDice();
                scoreCardNotifier.onScoreSelected(
                    context, category, widget.diceValues);
              });
            },
            child: Text('Select'),
          ),
        ],
      ),
    );
  }
}
