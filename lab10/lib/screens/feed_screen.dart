import 'dart:io';

import 'package:flutter/material.dart';
import '../models/post.dart';
import 'upload_screen.dart';
import 'update_screen.dart';
import '../widgets/post_tile.dart';

class FeedScreen extends StatefulWidget {
  @override
  _FeedScreenState createState() => _FeedScreenState();
}

class _FeedScreenState extends State<FeedScreen> {
  List<Post> posts = [];

  void _addPost(Post post) {
    setState(() => posts.add(post));
  }

  void _updatePost(int index, Post post) {
    setState(() => posts[index] = post);
  }

  void _deletePost(int index) {
    showDialog(
      context: context,
      builder:
          (ctx) => AlertDialog(
            title: Text("Delete Post"),
            content: Text("Are you sure you want to delete this post?"),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(ctx),
                child: Text("No"),
              ),
              TextButton(
                onPressed: () {
                  setState(() => posts.removeAt(index));
                  Navigator.pop(ctx);
                },
                child: Text("Yes"),
              ),
            ],
          ),
    );
  }

  void _navigateToUpload() async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UploadScreen()),
    );
    if (result is Post) _addPost(result);
  }

  void _navigateToUpdate(int index) async {
    final result = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => UpdateScreen(post: posts[index])),
    );
    if (result is Post) _updatePost(index, result);
  }

  void _downloadImage(File image) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("Image downloaded successfully!")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Feed")),
      body: ListView.builder(
        itemCount: posts.length,
        itemBuilder:
            (context, index) => PostTile(
              post: posts[index],
              onDelete: () => _deletePost(index),
              onEdit: () => _navigateToUpdate(index),
              onLongPressImage: () {
                if (posts[index].image != null) {
                  _downloadImage(posts[index].image!);
                }
              },
            ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _navigateToUpload,
        child: Icon(Icons.add),
      ),
    );
  }
}
