import 'package:flutter/material.dart';

Widget gradient(ColorScheme colors) {
  return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: const FractionalOffset(0.0, 0.1),
              end: const FractionalOffset(0.0, 1.0),
              colors: [colors.primary, colors.tertiary])));
}
