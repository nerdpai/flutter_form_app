import 'package:flutter/material.dart';

extension MaterialStates on Set<MaterialState> {
  get isDisabled => contains(MaterialState.disabled);
  get isDragged => contains(MaterialState.dragged);
  get isError => contains(MaterialState.error);
  get isFocused => contains(MaterialState.focused);
  get isHovered => contains(MaterialState.hovered);
  get isPressed => contains(MaterialState.pressed);
  get isScrolledUnder => contains(MaterialState.scrolledUnder);
  get isSelected => contains(MaterialState.selected);
}
