import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/features/post_info/presentation/cubit/comments_cubit.dart';

import '../../../../styles/colors/color_manager.dart';

class CommentInputField extends StatelessWidget {
  VoidCallback onTap;
    CommentInputField({required this.onTap, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<CommentsCubit, CommentsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = CommentsCubit.get(context);
        return Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 10.0,
            vertical: 10.0,
          ),
          child: Row(
            children: [
              Expanded(
                child: Container(
                  alignment: Alignment.centerLeft,
                  padding:
                  const EdgeInsets.symmetric(horizontal: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15.0),
                    border: Border.all(
                      color: ColorManager.primaryBlue,
                    ),
                  ),
                  child: Form(
                    key: cubit.formKey,
                    child: TextFormField(
                      validator: (value) {
                        if (value!.trim().isEmpty) {
                          return 'Comment must not be empty';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.multiline,
                      textInputAction: TextInputAction.newline,
                      maxLines: null,
                      decoration: const InputDecoration(
                        hintText: 'Post your comment',
                        hintStyle: TextStyle(color: Colors.grey),
                        border: InputBorder.none,
                      ),
                      controller: cubit.commentController,
                    ),
                  ),
                ),
              ),

              /// Send Button
              IconButton(
                  onPressed: onTap,
                  icon: Icon(
                    Icons.send_rounded,
                    color: ColorManager.primaryBlue,
                    size: SizeConfig.height * 0.04,
                  )
              )
            ],
          ),
        );
      },
    );
  }
}
