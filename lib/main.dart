import 'package:flutter/material.dart';
import 'package:pizza/ecran_master.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pizza App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PizzaMenuPage(), 
    );
  }
}

