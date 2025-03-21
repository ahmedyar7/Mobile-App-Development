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

  static void _onFabPressed() {
    debugPrint("FAB Clicked by Ahmed Yar!");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("ListView - Ahmed Yar"),
        backgroundColor: Colors.green,
      ),
      body: const ItemListView(),
      floatingActionButton: FloatingActionButton(
        onPressed: _onFabPressed,
        backgroundColor: Colors.green,
        child: const Icon(Icons.add, color: Colors.white),
      ),
    );
  }
}

class ItemListView extends StatelessWidget {
  const ItemListView({super.key});

  static final List<String> items = List.generate(
    20,
    (index) => "Item ${index + 1} - Ahmed Yar",
  );

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        return _buildListItem(items[index]);
      },
    );
  }

  static Widget _buildListItem(String item) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: ListTile(
        leading: const Icon(Icons.star, color: Colors.orange),
        title: Text(
          item,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
        subtitle: const Text(
          "Description - Ahmed Yar",
          style: TextStyle(color: Colors.black54),
        ),
        trailing: const Icon(Icons.arrow_forward_ios, color: Colors.red),
        onTap: () => debugPrint("$item clicked by Ahmed Yar"),
      ),
    );
  }
}
