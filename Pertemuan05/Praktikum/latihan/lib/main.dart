import 'package:flutter/material.dart';
import 'package:latihan/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',

      theme: ThemeData(
        primarySwatch: Colors.blue,
        fontFamily: 'Oswald',
        useMaterial3: false,
      ),
      
      home: const FirstScreen(),
    );
  }
}

