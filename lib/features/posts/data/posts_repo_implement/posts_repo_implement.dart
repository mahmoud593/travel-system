import 'dart:async';
import 'dart:ffi';
import 'package:firebase_database/firebase_database.dart';
import 'package:travel_system/core/constants/constants.dart';
import 'package:travel_system/features/posts/data/models/post_model.dart';
import 'package:travel_system/features/posts/data/posts_repo/posts_repo.dart';

class PostsRepoImplement implements PostsRepo{



  @override
  Future<void> uploadNewPosts(
      {
        required String iHaveFlight,
        required String uid,
        required String dateTime,
        required String startTime,
        required String endTime,
        required String hours,
        required String willToFly,
        required String rank,
        required String planeType,
        required String iWantFlight,
        required String userName
      }
      ) async{

    DatabaseReference  databaseReference = Constants.database.child('posts').push();

    PostModel postModel = PostModel(
        iHaveFlight: iHaveFlight,
        uid: uid,
        dateTime: dateTime,
        startTime: startTime,
        endTime: endTime,
        hours: hours,
        willToFly: willToFly,
        rank: rank,
        planeType: planeType,
        iWantFlight: iWantFlight,
        postId: databaseReference.key!,
        userName: userName
    );

    databaseReference.set(postModel.toJson());

  }

}