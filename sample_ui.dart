import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Overflow Intentionally Caused',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const OverflowBug(),
    );
  }
}

class OverflowBug extends StatelessWidget {
  const OverflowBug({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Overflow Intentionally Caused')),
      body: Row(
        children: <Widget>[
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.info, size: 40),
          ),
          // Removing Expanded to intentionally cause an overflow.
          // The Text widget will now try to take its intrinsic width,
          // which will exceed the available space in the Row.
          const Text(
            '이것은 매우 긴 알림 메시지입니다. 화면을 넘어서 오버플로우가 발생할 것입니다! 이것은 매우 긴 알림 메시지입니다. 화면을 넘어서 오버플로우가 발생할 것입니다!',
            style: TextStyle(fontSize: 18),
            // No overflow handling, allowing the text to overflow naturally.
          ),
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: Icon(Icons.close),
          ),
        ],
      ),
    );
  }
}