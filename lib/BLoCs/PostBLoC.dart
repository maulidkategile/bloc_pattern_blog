import 'package:bloc_pattern_blog/models/Post.dart';
import 'package:bloc_pattern_blog/repositories/PostsRepository.dart';
import 'package:rxdart/subjects.dart';

class PostBLoC {
  final _postsRepository = PostsRepository();
  final _postsSubject = BehaviorSubject<PostList>();
  Stream<PostList> get postsStream => _postsSubject.stream;

  PostBLoC() {
    _fetchPosts();
  }

  _fetchPosts() async {
    PostList postList = await _postsRepository.fetchPost();
    _postsSubject.sink.add(postList);
  }

  void dispose() {
    _postsSubject.close();
  }
}
