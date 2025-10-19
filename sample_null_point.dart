import 'package:flutter/material.dart';

class NullPointBug extends StatefulWidget {
  const NullPointBug({super.key});

  @override
  State<NullPointBug> createState() => _NullPointBugState();
}

class _NullPointBugState extends State<NullPointBug> {
  // 1. 🚨 버그 지점: '나중에 초기화될 것을 약속'하는 late 변수
  late String _userName; 

  @override
  void initState() {
    super.initState();
    // 초기화 로직이 실수로 누락되거나 주석 처리되었다고 가정합니다.
    // _userName = '홍길동'; // 이 코드가 있어야 함
  }

  @override
  Widget build(BuildContext context) {
    // 2. build 메서드에서 초기화되지 않은 late 변수에 접근.
    // 이 시점에서 LateInitializationError가 발생하며 앱이 충돌합니다.
    return Scaffold(
      appBar: AppBar(title: const Text('Null Point Bug')),
      body: Center(
        child: Text(
          '환영합니다, $_userName 님', // 초기화되지 않은 _userName에 접근
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}