import 'package:flutter/material.dart';

final elevatedButtonStyle = ButtonStyle(
  backgroundColor: WidgetStateProperty.resolveWith(
    (states) => Colors.blueGrey.shade900,
  ),
  foregroundColor: WidgetStateProperty.resolveWith((states) => Colors.yellow),
  shape: WidgetStateProperty.all(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(25),
    ),
  ),
);
