import 'package:flutter/material.dart';

import 'ui/login.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      /*theme: ThemeData(
        brightness: Brightness.dark,

      ),*/
      //theme: ThemeData.dark(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Color.fromARGB(103, 0, 8, 119),
        ),
      ),
      home: const Login(),
    );
  }
}
