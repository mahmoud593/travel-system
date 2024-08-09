import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:travel_system/core/constants/constants.dart';
import 'package:travel_system/features/post_info/data/comment_repo_implement/comment_repo_implement.dart';
import 'package:travel_system/features/post_info/data/model/comment_model.dart';

part 'comments_state.dart';

class CommentsCubit extends Cubit<CommentsState> {
  CommentsCubit() : super(CommentsInitial());
  static CommentsCubit get(context) => BlocProvider.of(context);

  var commentController = TextEditingController();
  var formKey = GlobalKey<FormState>();


  Future<void> uploadComment({
    required String postId,
    required String userName,
    required String userImage,
    required String comment,
  }) async {
    emit(UploadCommentsLoading());

    try {
      await CommentRepoImplement().postComment(
        postId: postId,
        userName: userName,
        userImage: userImage,
        comment: comment,
      );
      print("Comment uploaded successfully");
      emit(UploadCommentsSuccess());
    } catch (error) {
      print("Error uploading comment: $error");
      emit(UploadCommentsError());
    }
  }

  List<CommentModel> commentsList=[];

  Future<void> getComments({required String postId}) async {
    commentsList=[];
    emit(GetCommentsLoading());

    try{
      Constants.database.child('posts').child(postId).child('Comments').onValue.listen((event) {
        commentsList=[];
        event.snapshot.children.forEach((element) {
          print('Comments Length : ${event.snapshot.children.length}');
          var comments=CommentModel.fromJson(element.value as Map);
          commentsList.add(comments);
        });
        emit(GetCommentsSuccess());
      });
    } catch(error){
      print(error.toString());
      emit(GetCommentsError());
    }
  }
}
