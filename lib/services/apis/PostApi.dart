import 'dart:convert';

import 'package:bloc_pattern_blog/models/Post.dart';
import 'package:flutter/services.dart';

class PostApi {
  Future<PostList> loadPosts() async {
    final json = await rootBundle.loadString('assets/posts.json');
    Map<String, dynamic> parsedJson = jsonDecode(json);
    PostList postList = PostList.fromJson(parsedJson['posts']);
    return postList;
  }
}
