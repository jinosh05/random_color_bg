import 'package:flutter/material.dart';
import 'package:random_color_bg/screens/homepage.dart';

void main() {
  runApp(const Main());
}

///
/// Main Widget Where the Project Begins
///
class Main extends StatelessWidget {
  /// Empty Constructor
  const Main({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}
