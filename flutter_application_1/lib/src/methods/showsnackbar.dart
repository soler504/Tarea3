import 'package:flutter/material.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
  BuildContext context,
  String texto,
) {
  return ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      backgroundColor: Colors.red,
      action: SnackBarAction(label: 'Cerrar', onPressed: () {}),
      content: Text(texto),
    ),
  );
}
