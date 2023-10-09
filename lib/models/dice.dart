import 'package:collection/collection.dart';
import 'dart:math';
import 'package:flutter/material.dart';

class Dice {
  final List<int?> _values;
  final List<bool> _held;
  int numDice;
  Dice(this.numDice)
      : _values = List<int?>.filled(numDice, null),
        _held = List<bool>.filled(numDice, false);
  List<int> get values => List<int>.unmodifiable(_values.whereNotNull());

  int? operator [](int index) => _values[index];

  bool isHeld(int index) => _held[index];

  int rollsLeft = 3;
  void resetRollsLeft() {
    rollsLeft = 3;
  }

  void clear() {
    for (var i = 0; i < _values.length; i++) {
      _values[i] = null;
      _held[i] = false;
    }
  }

  void roll() {
    for (var i = 0; i < _values.length; i++) {
      if (!_held[i]) {
        _values[i] = Random().nextInt(6) + 1;
      }
    }
  }

  void toggleHold(int index) {
    _held[index] = !_held[index];
  }
}
