import 'package:dice_roller_app/controllers/dice_controller.dart';
import 'package:dice_roller_app/dice_roller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GradientContainer extends StatelessWidget {
  GradientContainer({
    super.key,
  });

  final controller = Get.put(DiceController());

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Colors.black54,
            Theme.of(context).colorScheme.primary,
          ],
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
        ),
      ),
      child: Center(
        child: DicerRoller(),
      ),
    );
  }
}
