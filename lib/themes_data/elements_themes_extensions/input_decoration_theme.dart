import 'package:flutter/material.dart';
import 'package:flutter_application_hw/themes_data/elements_colors/input_decoration_colors.dart';
import 'package:flutter_application_hw/material_states_extension.dart';

extension IDT on InputDecorationTheme {
  static double _borderThickness(Set<MaterialState> states) =>
      states.isFocused ? 3.0 : 1.0;

  static Color _colorisation({
    required Set<MaterialState> states,
    required InputDecorationColors colors,
    required bool border,
  }) {
    if (states.isDisabled) {
      return colors.disabledColor;
    } else if (states.isError) {
      return colors.errorColor;
    } else if (states.isFocused || states.isHovered || states.isPressed) {
      return colors.focusColor;
    } else {
      if (border) {
        return colors.borderEnabledColor;
      } else {
        return colors.elementsEnabledColor;
      }
    }
  }

  static final _radius = BorderRadius.circular(16);

  InputDecorationTheme getFrom({
    required InputDecorationColors colors,
  }) {
    labelStyle(Set<MaterialState> states) => TextStyle(
          color: _colorisation(states: states, colors: colors, border: false),
          fontSize: 20,
        );

    return InputDecorationTheme(
      contentPadding: const EdgeInsets.all(20),
      errorStyle: TextStyle(
        color: colors.errorColor,
        fontSize: 0.0,
      ),
      errorMaxLines: 1,
      helperStyle: const TextStyle(color: Colors.transparent),
      helperMaxLines: 1,
      labelStyle: MaterialStateTextStyle.resolveWith(
        labelStyle,
      ),
      floatingLabelStyle: MaterialStateTextStyle.resolveWith(
        labelStyle,
      ),
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      floatingLabelAlignment: FloatingLabelAlignment.start,
      border: MaterialStateOutlineInputBorder.resolveWith(
        (states) => OutlineInputBorder(
          borderRadius: _radius,
          borderSide: BorderSide(
            color: _colorisation(
              states: states,
              colors: colors,
              border: true,
            ),
            width: _borderThickness(states),
          ),
        ),
      ),
    );
  }
}
