import 'package:flutter/material.dart';

class TextSelectionColors {
  TextSelectionColors._({
    required this.cursorColor,
  });

  TextSelectionColors.lightTheme() : this._(cursorColor: Colors.deepPurple);
  TextSelectionColors.darkTheme() : this._(cursorColor: Colors.blue);
  final Color cursorColor;
}
