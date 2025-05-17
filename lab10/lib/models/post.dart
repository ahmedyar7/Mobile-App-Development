import 'dart:io';

class Post {
  String title;
  String description;
  File? image;

  Post({required this.title, required this.description, this.image});
}
