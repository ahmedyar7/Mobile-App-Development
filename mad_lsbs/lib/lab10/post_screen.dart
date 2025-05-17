import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'upload_post_screen.dart';
import 'edit_post_screen.dart';

class PostScreen extends StatelessWidget {
  final CollectionReference posts = FirebaseFirestore.instance.collection(
    'posts',
  );

  Future<void> _deletePost(String docId) async {
    final DocumentSnapshot snapshot =
        await FirebaseFirestore.instance.collection('posts').doc(docId).get();
    String imageUrl = snapshot.get('imageUrl');
    final ref = FirebaseStorage.instance.refFromURL(imageUrl);
    await ref.delete();
    await FirebaseFirestore.instance.collection('posts').doc(docId).delete();
  }

  Future<void> _downloadImage(String url, BuildContext context) async {
    final status = await Permission.storage.request();
    if (status.isGranted) {
      final dir = await getApplicationDocumentsDirectory();
      final fileName = url.substring(url.lastIndexOf('/') + 1);
      final filePath = '${dir.path}/$fileName';
      final file = File(filePath);

      final response = await http.get(Uri.parse(url));
      await file.writeAsBytes(response.bodyBytes);
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Image downloaded")));
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Permission denied")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Social Media Feed"),
        actions: [
          IconButton(
            icon: Icon(Icons.add),
            onPressed:
                () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => UploadPostScreen()),
                ),
          ),
        ],
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: posts.orderBy('timestamp', descending: true).snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData)
            return Center(child: CircularProgressIndicator());

          return ListView.builder(
            itemCount: snapshot.data!.docs.length,
            itemBuilder: (context, index) {
              DocumentSnapshot data = snapshot.data!.docs[index];
              String imageUrl = data['imageUrl'];
              String title = data['title'];
              String description = data['description'];
              String docId = data.id;

              return ListTile(
                leading: GestureDetector(
                  onLongPress: () => _downloadImage(imageUrl, context),
                  child: Image.network(
                    imageUrl,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(title),
                subtitle: Text(description),
                trailing: PopupMenuButton<String>(
                  onSelected: (value) {
                    if (value == 'delete') {
                      showDialog(
                        context: context,
                        builder:
                            (context) => AlertDialog(
                              title: Text("Confirm Delete"),
                              content: Text(
                                "Are you sure you want to delete this post?",
                              ),
                              actions: [
                                TextButton(
                                  onPressed: Navigator.of(context).pop,
                                  child: Text("No"),
                                ),
                                TextButton(
                                  onPressed: () {
                                    _deletePost(docId);
                                    Navigator.of(context).pop();
                                  },
                                  child: Text("Yes"),
                                ),
                              ],
                            ),
                      );
                    } else if (value == 'edit') {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder:
                              (context) => EditPostScreen(
                                postId: docId,
                                currentTitle: title,
                                currentDescription: description,
                                currentImageUrl: imageUrl,
                              ),
                        ),
                      );
                    }
                  },
                  itemBuilder:
                      (_) => [
                        PopupMenuItem(value: 'edit', child: Text("Edit")),
                        PopupMenuItem(value: 'delete', child: Text("Delete")),
                      ],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
