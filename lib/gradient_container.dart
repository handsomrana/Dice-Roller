import 'dart:math';

import 'package:dice_roller_app/controllers/dice_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class GradientContainer extends StatefulWidget {
  GradientContainer({
    super.key,
  });

  @override
  State<GradientContainer> createState() => _GradientContainerState();
}

DiceController controller = Get.put(DiceController());

class _GradientContainerState extends State<GradientContainer> {
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
      child: GestureDetector(
        onPanUpdate: (details) {
          setState(() {
            controller.offset += details.delta;
          });
        },
        child: const Center(
          child: DiceCube(),
        ),
      ),
    );
  }
}

class DiceCube extends StatelessWidget {
  const DiceCube({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Transform(
          transform: Matrix4.identity()
            ..setEntry(3, 2, 0.001)
            ..rotateX(controller.offset.dx * pi / 180)
            ..rotateY(controller.offset.dy * pi / 180),
          child: Image.asset(
            'assets/images/dice-1.png',
            scale: 10,
          ),
        ),
      ],
    );
  }
}
