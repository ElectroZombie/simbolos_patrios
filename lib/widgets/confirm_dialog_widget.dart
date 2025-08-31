import 'package:flutter/material.dart';

import '../styles/button_style.dart';

Future<bool> confirmDialogWidget(String text, BuildContext context) async {
  ColorScheme colors = Theme.of(context).colorScheme;
  bool value = false;
  await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: const Text(
          'CONFIRMACIÓN',
          style: TextStyle(fontSize: 20),
        ),
        backgroundColor: colors.surface,
        content: Text(
          text,
          textAlign: TextAlign.justify,
          style: const TextStyle(fontSize: 14),
        ),
        actions: [
          TextButton(
            onPressed: () {
              value = true;
              Navigator.pop(context);
            },
            style: dialogButtonStyle(Theme.of(context).colorScheme),
            child: const Text("CONFIRMAR"),
          ),
          TextButton(
            onPressed: () {
              value = false;
              Navigator.pop(context);
            },
            style: dialogButtonStyle(Theme.of(context).colorScheme),
            child: const Text("CANCELAR"),
          ),
        ],
      );
    },
  );
  return value;
}
