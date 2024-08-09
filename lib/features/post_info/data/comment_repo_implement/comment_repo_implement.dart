import 'package:firebase_database/firebase_database.dart';
import 'package:travel_system/core/constants/constants.dart';
import 'package:travel_system/features/post_info/data/comment_repo/comment_repo.dart';
import 'package:travel_system/features/post_info/data/model/comment_model.dart';

class CommentRepoImplement extends CommentRepo {


  @override
  Future<void> postComment(
      {required String postId,
        required String userName,
        required String userImage,
        required String comment}) async {

    DatabaseReference databaseReference = Constants.database
        .child('posts')
        .child(postId)
        .child('Comments').push();
    CommentModel commentModel = CommentModel(
        userName: userName,
        userImage: userImage,
        comment: comment,
        postId: postId,);

    databaseReference.set(commentModel.toJson());

  }


}