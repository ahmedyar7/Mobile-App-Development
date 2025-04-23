import 'package:flutter/material.dart';

class Task1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomePage());
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _secondsLeft = 10;
  bool _isRunning = false;

  void _startTimer() async {
    if (_isRunning) return;

    _isRunning = true;
    for (int i = _secondsLeft; i >= 0; i--) {
      setState(() {
        _secondsLeft = i;
      });
      await Future.delayed(Duration(seconds: 1));
    }
    _isRunning = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Timer App")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Countdown: $_secondsLeft seconds",
              style: TextStyle(fontSize: 24),
            ),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _startTimer, child: Text("Start Timer")),
          ],
        ),
      ),
    );
  }
}
