import 'package:bloc_pattern_blog/BLoCs/PostBLoC.dart';
import 'package:bloc_pattern_blog/screens/blog_posts.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

//Provide the bloc instance to all child widgets
class MyAppInheritedWidget extends InheritedWidget {
  final PostBLoC postBLoC;
  const MyAppInheritedWidget(this.postBLoC, Widget child) : super(child: child);

  static MyAppInheritedWidget of(BuildContext context) {
    return context.dependOnInheritedWidgetOfExactType<MyAppInheritedWidget>();
  }

  @override
  bool updateShouldNotify(MyAppInheritedWidget old) {
    return true;
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final postBloc = PostBLoC();
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'BLoC Pattern Blog',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: MyAppInheritedWidget(postBloc, BlogPosts()));
  }
}
