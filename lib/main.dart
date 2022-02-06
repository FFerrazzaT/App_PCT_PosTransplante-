<<<<<<< Updated upstream
=======
import 'package:app_helptmo/screens/medicamentos_screen.dart';
>>>>>>> Stashed changes
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
<<<<<<< Updated upstream
      home: FirstScreen(),
=======
      //home: FirstScreen(),
      home: MedicamentosScreen(),
>>>>>>> Stashed changes
    );
  }
}
