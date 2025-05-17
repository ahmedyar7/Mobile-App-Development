import 'package:flutter/material.dart';
import 'screens/feed_screen.dart';

void main() => runApp(SocialMediaApp());

class SocialMediaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Social Media App',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: FeedScreen(),
    );
  }
}
