import 'package:app_helptmo/screens/medicamentos_screen.dart';
import 'package:flutter/material.dart';
import 'package:app_helptmo/screens/first_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Help TMO',
      //home: FirstScreen(),
      home: MedicamentosScreen(),
    );
  }
}
