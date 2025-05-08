import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:mad_lsbs/firebase_options.dart';
import 'package:mad_lsbs/lab9/home_page.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

void main() async {
  await dotenv.load(); // Load environment variables
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  ); // fixed spelling
  runApp(MyApp()); // Add your app entry point here
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: HomePage());
  }
}
