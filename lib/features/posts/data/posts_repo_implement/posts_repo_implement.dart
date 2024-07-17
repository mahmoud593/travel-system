import 'dart:async';
import 'dart:ffi';
import 'package:firebase_database/firebase_database.dart';
import 'package:travel_system/core/constants/constants.dart';
import 'package:travel_system/features/posts/data/models/post_model.dart';
import 'package:travel_system/features/posts/data/posts_repo/posts_repo.dart';

class PostsRepoImplement implements PostsRepo{


  @override
  Future<Set<PostModel>> getPosts()async {
    Completer<Set<PostModel>> completer = Completer();

    Set<PostModel> posts = {};
      Constants.database.child('posts').onValue.listen((event) async{
       event.snapshot.children.forEach((element) {
        posts.add(PostModel.fromJson(element.value as Map));
      });
       completer.complete(posts);
      });
    return completer.future;
  }

}