import 'package:bloc_pattern_blog/main.dart';
import 'package:bloc_pattern_blog/models/Post.dart';
import 'package:flutter/material.dart';

class BlogPosts extends StatefulWidget {
  @override
  _BlogPostsState createState() => _BlogPostsState();
}

class _BlogPostsState extends State<BlogPosts> {
  @override
  Widget build(BuildContext context) {
    final postBloc = MyAppInheritedWidget.of(context).postBLoC;
    return Scaffold(
      appBar: AppBar(
        title: Text("Blog Posts"),
      ),
      body: StreamBuilder(
          stream: postBloc.postsStream,
          builder: (context, AsyncSnapshot<PostList> snapshot) {
            if (snapshot.hasData) {
              return PostListView(snapshot);
            }
            return Center(child: CircularProgressIndicator());
          }),
    );
  }
}

class PostListView extends StatefulWidget {
  final AsyncSnapshot<PostList> snapshot;

  const PostListView(this.snapshot);

  @override
  _PostListViewState createState() => _PostListViewState();
}

class _PostListViewState extends State<PostListView> {
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        itemCount: widget.snapshot.data.postList.length,
        itemBuilder: (BuildContext context, int index) {
          return GestureDetector(
            onTap: () => {},
            child: Container(
              padding:
                  EdgeInsets.only(top: 15, left: 15, right: 15, bottom: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Container(
                      height: 250,
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(8.0),
                          child: Image.network(
                              widget.snapshot.data.postList[index].url,
                              fit: BoxFit.cover))),
                  Container(
                    child: Text(
                      widget.snapshot.data.postList[index].title,
                      style: TextStyle(fontSize: 20),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
        separatorBuilder: (context, index) {
          return Container(
              margin: EdgeInsets.only(left: 15, right: 15), child: Divider());
        });
  }
}
