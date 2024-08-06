import 'dart:math';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DiceController extends GetxController
    with GetSingleTickerProviderStateMixin {
  late AnimationController animationController;
  var isRolling = false.obs;
  var diceNumber = 1.obs;
  var rotationX = 0.0.obs;
  var rotationY = 0.0.obs;
  var resultImage = 6.obs;

  @override
  void onInit() {
    super.onInit();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    )..addListener(() {
        rotationX.value = animationController.value * 2 * pi;
        rotationY.value = animationController.value * 2 * pi;
      });
  }

  @override
  void onClose() {
    animationController.dispose();
    super.onClose();
  }

  void rollDice() {
    isRolling.value = true;
    diceNumber.value = Random().nextInt(6) + 1;
    resultImage.value = diceNumber.value;
    animationController.reset();
    animationController.forward().then((_) {
      isRolling.value = false;
    });
  }
}
