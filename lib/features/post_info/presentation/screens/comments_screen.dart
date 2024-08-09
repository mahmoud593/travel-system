import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/core/local/shared_preferences.dart';
import 'package:travel_system/features/post_info/data/model/comment_model.dart';
import 'package:travel_system/features/post_info/presentation/cubit/comments_cubit.dart';
import 'package:travel_system/features/post_info/presentation/widgets/comment_input_field.dart';
import 'package:travel_system/features/post_info/presentation/widgets/comment_widget.dart';
import 'package:travel_system/features/posts/data/models/post_model.dart';

import '../../../../styles/colors/color_manager.dart';

class CommentsScreen extends StatefulWidget {
  PostModel postModel;

  CommentsScreen({required this.postModel, super.key});

  @override
  State<CommentsScreen> createState() => _CommentsScreenState();
}

class _CommentsScreenState extends State<CommentsScreen> {
  @override
  void initState() {
    super.initState();
    CommentsCubit.get(context).getComments(postId: widget.postModel.postId);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0.0,
        title: const Text('Comments'),
      ),
      body: BlocConsumer<CommentsCubit, CommentsState>(
        listener: (context, state) {
          if (state is UploadCommentsSuccess) {
            CommentsCubit.get(context).commentController.clear();
          }
        },
        builder: (context, state) {
          var cubit = CommentsCubit.get(context);
          return ModalProgressHUD(
            progressIndicator: const CupertinoActivityIndicator(
              color: ColorManager.primaryBlue,
            ),
            color: Colors.transparent,
            blur: 0.5,
            opacity: 0.5,
            inAsyncCall: state is GetCommentsSuccess ? false : true,
            child: Column(
              children: [
                /// comment body
                Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return CommentWidget(
                        userName: cubit.commentsList[index].userName,
                        userImage: cubit.commentsList[index].userImage,
                        comment: cubit.commentsList[index].comment,
                      );
                    },
                    separatorBuilder: (context, index) => Column(
                      children: [
                        SizedBox(
                          height: SizeConfig.height * 0.01,
                        ),
                        Divider(
                          color: Colors.grey.shade200,
                        ),
                      ],
                    ),
                    itemCount: cubit.commentsList.length,
                  ),
                ),

                /// comment input
                CommentInputField(
                  onTap: () {
                    if (cubit.formKey.currentState!.validate()) {
                      cubit.uploadComment(
                          postId: widget.postModel.postId,
                          userName: UserDataFromStorage.userName,
                          userImage: "",
                          comment: cubit.commentController.text);
                    }
                  },
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
