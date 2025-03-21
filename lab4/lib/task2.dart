import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Complex UI -Ahmed Yar"),
        backgroundColor: Colors.blueAccent,
      ),
      body: const Padding(padding: EdgeInsets.all(16.0), child: HomeContent()),
      floatingActionButton: FloatingActionButton(
        onPressed: _onFabPressed,
        backgroundColor: Colors.blueAccent,
        child: const Icon(Icons.add),
      ),
    );
  }

  static void _onFabPressed() {
    debugPrint("FAB Clicked!");
  }
}

class HomeContent extends StatelessWidget {
  const HomeContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildProfileSection(),
        const SizedBox(height: 20),
        _buildTextField(label: "Enter your name", icon: Icons.person),
        const SizedBox(height: 15),
        _buildTextField(label: "Enter your email", icon: Icons.email),
        const SizedBox(height: 20),
        _buildButtonRow(),
      ],
    );
  }

  static Widget _buildProfileSection() {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.blue[100],
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundColor: Colors.blueAccent,
            child: Icon(Icons.person, size: 50, color: Colors.white),
          ),
          const SizedBox(width: 16),
          const Text(
            "Ahmed Yar ",
            style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  static Widget _buildTextField({
    required String label,
    required IconData icon,
  }) {
    return TextField(
      decoration: InputDecoration(
        labelText: label,
        border: const OutlineInputBorder(),
        prefixIcon: Icon(icon),
      ),
    );
  }

  static Widget _buildButtonRow() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ElevatedButton(
          onPressed: _onSubmitPressed,
          child: const Text("Submit"),
        ),
        ElevatedButton(
          onPressed: _onCancelPressed,
          style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
          child: const Text("Cancel"),
        ),
      ],
    );
  }

  static void _onSubmitPressed() {
    debugPrint("Submit Clicked!");
  }

  static void _onCancelPressed() {
    debugPrint("Cancel Clicked!");
  }
}
