// import 'package:flutter/material.dart';
// import 'dart:math';

// import 'package:google_fonts/google_fonts.dart';

// var randmizer = Random();

// class DicerRoller extends StatefulWidget {
//   const DicerRoller({
//     super.key,
//   });

//   @override
//   State<DicerRoller> createState() => _DicerRollerState();
// }

// class _DicerRollerState extends State<DicerRoller> {
//   int curentdiceroll = 3;

//   void ondiceroll() {
//     setState(() {
//       curentdiceroll = randmizer.nextInt(6) + 1;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: <Widget>[
//         Image.asset(
//           "assets/images/dice-$curentdiceroll.png",
//           width: 200,
//           height: 200,
//         ),
//         const SizedBox(
//           height: 20,
//         ),
//         SizedBox(
//           // height: 50,
//           width: MediaQuery.of(context).size.width * 0.9,
//           child: ElevatedButton(
//             style: ButtonStyle(
//                 backgroundColor: WidgetStateColor.resolveWith(
//                   (states) => Colors.blueGrey.shade900,
//                 ),
//                 foregroundColor:
//                     WidgetStateColor.resolveWith((states) => Colors.yellow),
//                 shape: WidgetStatePropertyAll(RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30)))),
//             onPressed: ondiceroll,
//             child: Padding(
//               padding: const EdgeInsets.all(10.0),
//               child: Text(
//                 "Roll",
//                 textAlign: TextAlign.center,
//                 style: GoogleFonts.kalam(
//                     fontSize: 40, fontWeight: FontWeight.bold),
//               ),
//             ),
//           ),
//         )
//       ],
//     );
//   }
// }

import 'package:dice_roller_app/controllers/dice_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DicerRoller extends StatelessWidget {
  const DicerRoller({super.key});

  @override
  Widget build(BuildContext context) {
    final DiceController controller = Get.put(DiceController());

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Obx(() => Image.asset(
              "assets/images/dice-${controller.currentDiceRoll}.png",
              width: 200,
              height: 200,
            )),
        const SizedBox(
          height: 20,
        ),
        SizedBox(
          width: MediaQuery.of(context).size.width * 0.9,
          child: Obx(() => ElevatedButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.resolveWith(
                      (states) => Colors.blueGrey.shade900,
                    ),
                    foregroundColor: MaterialStateProperty.resolveWith(
                        (states) => Colors.yellow),
                    shape: MaterialStateProperty.all(RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30)))),
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
              )),
        ),
      ],
    );
  }
}
