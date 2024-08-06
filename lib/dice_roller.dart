import 'package:dice_roller_app/controllers/dice_controller.dart';
import 'package:dice_roller_app/style.dart';
import 'package:dice_roller_app/widgets/dice_cube_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DicerRoller extends StatelessWidget {
  const DicerRoller({super.key});

  @override
  Widget build(BuildContext context) {
    final DiceController controller = Get.put(DiceController());
    bool isRotated = MediaQuery.of(context).size.width > 600;

    return Column(
      // mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: <Widget>[
        const SizedBox(
          height: 30,
        ),
        DiceCube(Rotation: isRotated),
        const SizedBox(
          height: 30,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Obx(
            () => ElevatedButton(
              style: elevatedButtonStyle,
              onPressed:
                  controller.isRolling.value ? null : controller.rollDice,
              child: Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  controller.isRolling.value ? "Rolling..." : "Roll",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.kalam(
                      fontSize: 40, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
