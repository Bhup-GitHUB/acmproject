import 'package:flutter/material.dart';

ThemeData darkmode = ThemeData(
  brightness: Brightness.dark,
  colorScheme: ColorScheme.dark(
    background: Colors.grey.shade800,
    primary: Colors.grey.shade700,
    secondary: Colors.grey.shade600,
    inversePrimary: Colors.grey.shade200,

  ),
  textTheme: ThemeData.dark().textTheme.apply(
    bodyColor: Colors.grey,
    displayColor: Colors.white,
  )
);
