import 'package:firebase_database/firebase_database.dart';
import 'package:get/get.dart';
import 'package:travel_system/core/constants/constants.dart';
import 'package:travel_system/features/posts/data/models/post_model.dart';
import 'package:travel_system/features/posts/data/posts_repo/posts_repo.dart';

class PostsRepoImplement implements PostsRepo{

  @override
  Future<List<PostModel>> getPosts()async {

    List<PostModel> posts = [];

    await Constants.database.child('Posts').get().then((value) {

      value.children.forEach((element) {
        posts.add(PostModel.fromJson(element.value as Map));
      });

    });

    return posts;


  }





}