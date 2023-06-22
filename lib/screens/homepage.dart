import 'dart:math';

import 'package:flutter/material.dart';

/// Widget Where the UI is going to be presented
class HomePage extends StatefulWidget {
  /// Empty Constructor
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  ValueNotifier<Color> colorNotifier = ValueNotifier<Color>(Colors.white);
  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.sizeOf(context).height;
    final fontSize = height * 0.012;
    const blurRadiusCount = 3;

    return ValueListenableBuilder<Color>(
      valueListenable: colorNotifier,
      builder: (context, Color value, child) {
        return Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.purple,
            title: const Text(
              "Rabdom Colors",
            ),
          ),
          backgroundColor: colorNotifier.value,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextButton(
                onPressed: _generateColor,
                child: Text(
                  "Hello there",
                  style: TextStyle(
                    color: Colors.black,
                    shadows: [
                      for (double i = 1; i <= blurRadiusCount; i++)
                        Shadow(
                          color: Colors.yellow,
                          blurRadius: blurRadiusCount * i,
                        )
                    ],
                  ),
                ),
              ),
              Center(
                child: Text(
                  "\nClick on the button to toggle colors",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.w700,
                    fontSize: fontSize,
                    shadows: [
                      for (double i = 1; i <= blurRadiusCount; i++)
                        Shadow(
                          color: Colors.purple,
                          blurRadius: blurRadiusCount * i,
                        )
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  void _generateColor() {
    final generatedColor = Random().nextInt(Colors.primaries.length);
    colorNotifier.value = Colors.primaries[generatedColor];
  }
}
