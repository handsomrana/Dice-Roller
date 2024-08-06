import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

class DiceController extends GetxController {
  var currentDiceRoll = 3.obs;
  Offset offset = Offset.zero;
  var isRolling = false.obs; // Add this line
  final Random _random = Random();

  void rollDice() async {
    isRolling.value = true;
    await Future.delayed(
        const Duration(seconds: 1)); // Simulate dice roll delay
    currentDiceRoll.value = _random.nextInt(6) + 1;
    isRolling.value = false;
  }
}
