import 'dart:convert';

import '../models/post.dart';
import '../service/post_service.dart';

class PostsRepository {
  final PostService postService;

  PostsRepository(this.postService);
  Future<List<Posts>> fetchPosts(int page) async {
    final posts = await postService.getPosts(page);
    final p = jsonEncode(posts).toString();
    return postsFromJson(p);
  }
}
