import 'package:bloc_pattern_blog/models/Post.dart';
import 'package:bloc_pattern_blog/services/apis/PostApi.dart';

//This will be the entrance of all crude operations related posts
class PostsRepository {
  PostApi postApi = new PostApi();

  //fetch all posts
  Future<PostList> fetchPost() => postApi.loadPosts();
}
