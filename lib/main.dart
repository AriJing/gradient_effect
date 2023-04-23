import 'package:flutter/material.dart';

import 'halo_effect.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Mouse Cursor Gradient',
        home: HaloEffect(radius: 2000, centerColor: Colors.purpleAccent));
  }
}
