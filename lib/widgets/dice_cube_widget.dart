import 'package:dice_roller_app/controllers/dice_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:math';

class DiceCube extends StatelessWidget {
  DiceCube({super.key, required this.Rotation});

  final bool Rotation;

  @override
  Widget build(BuildContext context) {
    final DiceController controller = Get.find();

    // Set dimensions based on the Rotation flag
    double diceSize = Rotation ? 100 : 220;
    double halfDiceSize = diceSize / 2;
    double distance = halfDiceSize - 10; // Adjust distance from the center

    return Obx(() {
      return Transform(
        alignment: Alignment.center,
        transform: Matrix4.identity()
          ..rotateX(controller.rotationX.value)
          ..rotateY(controller.rotationY.value),
        child: Stack(
          children: [
            buildFace(0, 0, -distance, 'assets/images/dice-1.png', diceSize),
            buildFace(distance, 0, 0, 'assets/images/dice-2.png', diceSize,
                rotateY: -pi / 2),
            buildFace(0, distance, 0, 'assets/images/dice-3.png', diceSize,
                rotateX: pi / 2),
            buildFace(-distance, 0, 0, 'assets/images/dice-4.png', diceSize,
                rotateY: pi / 2),
            buildFace(0, -distance, 0, 'assets/images/dice-5.png', diceSize,
                rotateX: -pi / 2),
            buildFace(
                0,
                0,
                distance,
                'assets/images/dice-${controller.resultImage.value}.png',
                diceSize),
          ],
        ),
      );
    });
  }

  Widget buildFace(
      double x, double y, double z, String assetPath, double diceSize,
      {double rotateX = 0, double rotateY = 0}) {
    return Transform(
      alignment: Alignment.center,
      transform: Matrix4.identity()
        ..translate(x, y, z)
        ..rotateX(rotateX)
        ..rotateY(rotateY),
      child: Container(
        height: diceSize,
        width: diceSize,
        decoration: BoxDecoration(
          color: Colors.blueGrey.shade800,
          borderRadius: BorderRadius.circular(25),
        ),
        child: Image.asset(
          assetPath,
          fit: BoxFit.cover,
          alignment: Alignment.center,
        ),
      ),
    );
  }
}
