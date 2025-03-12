import 'package:flutter/material.dart';

void main() {
  runApp(const WidgetApp());
}

class WidgetApp extends StatelessWidget {
  const WidgetApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: const Text("Common Widgets in Flutter")),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          mainAxisSize: MainAxisSize.max, // Ensures proper column height usage
          children: [
            // Image at the top
            Image.network(
              'https://plus.unsplash.com/premium_photo-1686245735403-a01147d86b89?q=80&w=1974&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D',
              width: 300,
              height: 200,
              fit: BoxFit.cover,
            ),

            const SizedBox(height: 20),

            // Row with icons and text
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                Icon(Icons.home, size: 40, color: Colors.blue),
                Text("Home", style: TextStyle(fontSize: 18)),
                Icon(Icons.star, size: 40, color: Colors.amber),
                Text("Favorites", style: TextStyle(fontSize: 18)),
              ],
            ),

            const SizedBox(height: 20), // Instead of Spacer()
            // Elevated Button at the bottom
            ElevatedButton(
              onPressed: () {
                debugPrint("Button Pressed!");
              },
              child: const Text("Click Me"),
            ),

            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
