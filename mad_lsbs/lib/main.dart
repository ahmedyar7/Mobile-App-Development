import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'providers/todos_provider.dart'; // ✅ import your provider
import 'models/todo.dart'; // ✅ import the Todo model if needed
// ... other imports

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => TodosProvider(),
      child: const MyApp(),
    ),
  );
}
