import 'package:flutter/material.dart';
import '../models/post.dart';

class PostTile extends StatelessWidget {
  final Post post;
  final VoidCallback onDelete;
  final VoidCallback onEdit;
  final VoidCallback onLongPressImage;

  PostTile({
    required this.post,
    required this.onDelete,
    required this.onEdit,
    required this.onLongPressImage,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(post.title),
        subtitle: Text(post.description),
        leading: GestureDetector(
          onLongPress: onLongPressImage,
          child:
              post.image != null
                  ? Image.file(post.image!, width: 50, height: 50)
                  : SizedBox(width: 50, height: 50),
        ),
        trailing: Wrap(
          spacing: 8,
          children: [
            IconButton(icon: Icon(Icons.edit), onPressed: onEdit),
            IconButton(icon: Icon(Icons.delete), onPressed: onDelete),
          ],
        ),
      ),
    );
  }
}
