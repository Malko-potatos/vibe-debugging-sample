import 'package:flutter/material.dart';

class StateMismatchBug extends StatefulWidget {
  const StateMismatchBug({super.key});

  @override
  State<StateMismatchBug> createState() => StateMismatchBugState();
}

class StateMismatchBugState extends State<StateMismatchBug> {
  String _data = '데이터 로딩 중...'; // 초기 상태

  @override
  void initState() {
    super.initState();
    _loadData();
  }

  Future<void> _loadData() async {
    // 2초 동안 비동기 데이터 요청 시뮬레이션
    await Future.delayed(const Duration(seconds: 2));
    
    // 🚨 버그 지점: 변수 값은 변경되었지만, UI 갱신 신호(setState)가 없음.
    _data = '새로운 데이터 로드 완료!'; 
    // setState(() {}); // 이 부분이 누락됨
  }

  @override
  Widget build(BuildContext context) {
    // initState에서 build가 처음 실행된 후, 2초가 지나도 이 위젯은 다시 그려지지 않음.
    return Scaffold(
      appBar: AppBar(title: const Text('State Mismatch Bug')),
      body: Center(
        child: Text(
          _data, // 2초 후에도 '데이터 로딩 중...' 상태 유지
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}