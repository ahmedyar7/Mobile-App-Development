// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'dart:convert';

class Task2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: JsonFetcher());
  }
}

class JsonFetcher extends StatefulWidget {
  @override
  _JsonFetcherState createState() => _JsonFetcherState();
}

class _JsonFetcherState extends State<JsonFetcher> {
  Map<String, dynamic>? _post;
  bool _isLoading = false;

  Future<void> fetchPost() async {
    setState(() {
      _isLoading = true;
    });

    final response = await http.get(
      Uri.parse('https://jsonplaceholder.typicode.com/posts/1'),
    );

    if (response.statusCode == 200) {
      setState(() {
        _post = json.decode(response.body);
        _isLoading = false;
      });
    } else {
      throw Exception('Failed to load post');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("API Fetch Example")),
      body: Center(
        child:
            _isLoading
                ? CircularProgressIndicator()
                : _post == null
                ? Text("No data found")
                : Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        _post!['title'],
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(height: 12),
                      Text(_post!['body']),
                    ],
                  ),
                ),
      ),
    );
  }
}
