import 'dart:async';
import 'dart:ffi';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:travel_system/core/constants/constants.dart';
import 'package:travel_system/core/helper/friebase_api.dart';
import 'package:travel_system/core/local/shared_preferences.dart';
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
        required List<String> willToFly,
        required String rank,
        required String planeType,
        required String iWantFlight,
        required String phoneNumber,
        required String userName
      }
      ) async{

    DatabaseReference  databaseReference = Constants.database.child('posts').push();

    // PostModel postModel = PostModel(
    //     iHaveFlight: iHaveFlight,
    //     uid: uid,
    //     dateTime: dateTime,
    //     phoneNumber: phoneNumber,
    //     startTime: startTime,
    //     endTime: endTime,
    //     iWantHours: hours,
    //     willToFly: willToFly,
    //     rank: rank,
    //     planeType: planeType,
    //     iWantFlight: iWantFlight,
    //     postId: databaseReference.key!,
    //     userName: userName
    // );

    // databaseReference.set(postModel.toJson());

  }

  @override
  Future<void> addPostToFavorites({required PostModel postModel}) async{
    await FirebaseApi.putCall(
        path: "Users/${UserDataFromStorage.userId}/favorites/${postModel.postId}",
        data: postModel.toJson(),
    ).then((value){
      debugPrint("Add post to favorites Successfully");
    }).catchError((error){
      debugPrint("Error in Add post to favorites ============> ${error.toString()}");
    });
  }

  @override
  Future<void> deletePostFromFavorites({required PostModel postModel}) async{
    await FirebaseApi.deleteCall(
      path: "Users/${UserDataFromStorage.userId}/favorites/${postModel.postId}",
    ).then((value){
      debugPrint("Delete post From favorites Successfully");
    }).catchError((error){
      debugPrint("Error in Delete post From favorites ============> ${error.toString()}");
    });
  }

}