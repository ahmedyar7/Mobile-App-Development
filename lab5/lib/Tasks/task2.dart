import 'package:flutter/material.dart';

class Task2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: AnimationScreen());
  }
}

class AnimationScreen extends StatefulWidget {
  @override
  _AnimationScreenState createState() => _AnimationScreenState();
}

class _AnimationScreenState extends State<AnimationScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 2),
    );

    _animation = Tween<double>(begin: 0, end: 200).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _toggleAnimation() {
    if (_controller.isAnimating) {
      _controller.stop();
    } else {
      _controller.repeat(reverse: true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Flutter Animation - Created by Ahmed Yar')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedBuilder(
              animation: _animation,
              builder: (context, child) {
                return Transform.translate(
                  offset: Offset(_animation.value, 0),
                  child: Container(width: 50, height: 50, color: Colors.blue),
                );
              },
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: _toggleAnimation,
              child: Text('Start / Stop Animation'),
            ),
            SizedBox(height: 20),
            Text(
              'This app was created by Ahmed Yar',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
