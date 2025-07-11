import 'package:flutter/material.dart';

buttonStyle(ColorScheme colors) {
  return ButtonStyle(
      fixedSize: const WidgetStatePropertyAll(Size(120, 45)),
      backgroundColor: WidgetStatePropertyAll(colors.secondary),
      shadowColor: WidgetStatePropertyAll(colors.tertiary),
      overlayColor: WidgetStatePropertyAll(colors.onPrimaryFixedVariant),
      foregroundColor: WidgetStatePropertyAll(colors.onSecondary),
      textStyle: WidgetStatePropertyAll(TextStyle(
          fontSize: 12,
          color: colors.onSecondary,
          fontWeight: FontWeight.bold)),
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(color: colors.tertiary, width: 1.75))));
}

iconButtonStyle(ColorScheme colors) {
  return ButtonStyle(
      fixedSize: const WidgetStatePropertyAll(Size(60, 60)),
      backgroundColor: WidgetStatePropertyAll(colors.secondary),
      shadowColor: WidgetStatePropertyAll(colors.tertiary),
      overlayColor: WidgetStatePropertyAll(colors.onPrimaryFixedVariant),
      foregroundColor: WidgetStatePropertyAll(colors.onSecondary),
      textStyle: WidgetStatePropertyAll(TextStyle(
          fontSize: 14,
          color: colors.onSecondary,
          fontWeight: FontWeight.bold)),
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(color: colors.tertiary, width: 1.75))));
}

dialogButtonStyle(ColorScheme colors) {
  return ButtonStyle(
      fixedSize: const WidgetStatePropertyAll(Size(100, 30)),
      backgroundColor: WidgetStatePropertyAll(colors.secondary),
      shadowColor: WidgetStatePropertyAll(colors.tertiary),
      overlayColor: WidgetStatePropertyAll(colors.onPrimaryFixedVariant),
      foregroundColor: WidgetStatePropertyAll(colors.onSecondary),
      textStyle: WidgetStatePropertyAll(TextStyle(
          fontSize: 12,
          color: colors.onSecondary,
          fontWeight: FontWeight.bold)),
      shape: WidgetStatePropertyAll(RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
          side: BorderSide(color: colors.tertiary, width: 1.75))));
}
