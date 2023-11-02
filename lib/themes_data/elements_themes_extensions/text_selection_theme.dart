import 'package:flutter/material.dart';
import 'package:flutter_application_hw/themes_data/elements_colors/text_selection_colors.dart';

extension TST on TextSelectionThemeData {
  TextSelectionThemeData getFrom({
    required TextSelectionColors colors,
  }) {
    return TextSelectionThemeData(
      cursorColor: colors.cursorColor,
    );
  }
}
