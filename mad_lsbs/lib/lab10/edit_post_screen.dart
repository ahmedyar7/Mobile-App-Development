import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';

class EditPostScreen extends StatefulWidget {
  final String postId;
  final String currentTitle;
  final String currentDescription;
  final String currentImageUrl;

  EditPostScreen({
    required this.postId,
    required this.currentTitle,
    required this.currentDescription,
    required this.currentImageUrl,
  });

  @override
  _EditPostScreenState createState() => _EditPostScreenState();
}

class _EditPostScreenState extends State<EditPostScreen> {
  late TextEditingController _titleController;
  late TextEditingController _descController;
  File? _image;
  final picker = ImagePicker();
  late String imageUrl;

  @override
  void initState() {
    super.initState();
    _titleController = TextEditingController(text: widget.currentTitle);
    _descController = TextEditingController(text: widget.currentDescription);
    imageUrl = widget.currentImageUrl;
  }

  Future<void> _getImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _image = File(pickedFile.path);
      });
    }
  }

  Future<void> _updatePost() async {
    if (_titleController.text.isEmpty || _descController.text.isEmpty) return;

    if (_image != null) {
      final oldRef = FirebaseStorage.instance.refFromURL(imageUrl);
      await oldRef.delete();

      final newRef = FirebaseStorage.instance
          .ref()
          .child('posts')
          .child('${DateTime.now()}.jpg');
      await newRef.putFile(_image!);
      imageUrl = await newRef.getDownloadURL();
    }

    await FirebaseFirestore.instance
        .collection('posts')
        .doc(widget.postId)
        .update({
          'title': _titleController.text,
          'description': _descController.text,
          'imageUrl': imageUrl,
        });

    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Edit Post")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: _titleController,
              decoration: InputDecoration(labelText: "Title"),
            ),
            TextField(
              controller: _descController,
              decoration: InputDecoration(labelText: "Description"),
            ),
            SizedBox(height: 10),
            ElevatedButton(onPressed: _getImage, child: Text("Change Image")),
            SizedBox(height: 10),
            Image.network(imageUrl, height: 150),
            SizedBox(height: 20),
            ElevatedButton(onPressed: _updatePost, child: Text("Update")),
          ],
        ),
      ),
    );
  }
}
