import 'package:flutter_application_hw/themes_data/elements_colors/text_selection_colors.dart';

import 'elements_colors/input_decoration_colors.dart';

class ThemeColors {
  final InputDecorationColors inputDecorationColors;
  final TextSelectionColors textSelectionColors;

  const ThemeColors({
    required this.inputDecorationColors,
    required this.textSelectionColors,
  });

  ThemeColors.lightTheme()
      : this(
          inputDecorationColors: InputDecorationColors.lightTheme(),
          textSelectionColors: TextSelectionColors.lightTheme(),
        );

  ThemeColors.darkTheme()
      : this(
          inputDecorationColors: InputDecorationColors.darkTheme(),
          textSelectionColors: TextSelectionColors.darkTheme(),
        );
}
