import 'package:flutter/material.dart';

class Task1 extends StatelessWidget {
  Task1({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: Task1Animation());
  }
}

class Task1Animation extends StatefulWidget {
  _Task1AnimationState createState() => _Task1AnimationState();
}

class _Task1AnimationState extends State<Task1Animation> {
  bool _isExpandable = false;
  bool _isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Lab Task 1 Ahmed Yar")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedContainer(
              duration: Duration(seconds: 1),
              height: _isExpandable ? 200 : 100,
              width: _isExpandable ? 200 : 100,
              curve: Curves.fastEaseInToSlowEaseOut,

              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(_isExpandable ? 100 : 50),
                color: _isExpandable ? Colors.orange : Colors.red,
              ),
            ),

            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isExpandable = !_isExpandable;
                });
              },
              child: Text("Expandable Toggle Button"),
            ),

            AnimatedOpacity(
              opacity: _isVisible ? 1.0 : 0.0,
              duration: Duration(seconds: 1),
              child: Text(
                "Lab Task 1 Ahmed Yar",
                style: TextStyle(fontSize: 20),
              ),
            ),

            SizedBox(height: 50),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  _isVisible = !_isVisible;
                });
              },
              child: Text("Visible Toggle Button"),
            ),
          ],
        ),
      ),
    );
  }
}
