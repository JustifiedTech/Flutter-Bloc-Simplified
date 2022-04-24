import 'package:flutter/material.dart';

import '../models/post.dart';

class PostDetails extends StatelessWidget {
  const PostDetails({Key? key, required this.post}) : super(key: key);

  final Posts post;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(post.id.toString())),
      body: Center(
        child: Text(post.title ?? 'nothing here'),
      ),
    );
  }
}
