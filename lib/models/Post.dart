class Post {
  final int id;
  final String title;
  final String body;
  final String url;

  Post(this.id, this.title, this.body, this.url);

  factory Post.fromJson(Map<String, dynamic> parsedJson) {
    return Post(parsedJson['id'], parsedJson['title'], parsedJson['body'],
        parsedJson['url']);
  }
}

class PostList {
  final List<Post> postList;

  PostList(this.postList);

  factory PostList.fromJson(List<dynamic> parsedJson) {
    return PostList(parsedJson
        .map((json) => Post.fromJson(json as Map<String, dynamic>))
        .toList());
  }
}
