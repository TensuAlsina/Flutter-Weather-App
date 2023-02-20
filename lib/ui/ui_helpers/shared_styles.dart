import 'package:flutter/material.dart';

import 'app_colors.dart';

// Box Decorations

BoxDecoration kbdToDoContainerDecoration = BoxDecoration(
  color: kcBoxColor,
  borderRadius: BorderRadius.circular(13),
);

BoxDecoration kbdAddTaskDialogContainerDecoration = BoxDecoration(
    color: kcPrimaryColor, borderRadius: BorderRadius.circular(10));

const TextStyle ktsWhiteLargeTextStyle =
    TextStyle(color: kcWhite, fontWeight: FontWeight.bold, fontSize: 37);
const TextStyle ktsblueMidumTextStyle = TextStyle(
    color: Color(0xFF7D9AE6), fontWeight: FontWeight.w500, fontSize: 15);

TextStyle ktsTaskNameTextStyle(bool isChecked) {
  return TextStyle(
      color: kcWhite,
      fontSize: 18,
      decoration: isChecked ? TextDecoration.lineThrough : TextDecoration.none);
}

// Paddings
const EdgeInsets appSymmetricEdgePadding = EdgeInsets.symmetric(horizontal: 12);
const EdgeInsets customDialogPadding = EdgeInsets.all(28.0);
