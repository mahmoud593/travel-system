import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_system/features/posts/data/models/post_model.dart';
import 'package:travel_system/features/posts/presentation/cubit/posts_cubit/posts_cubit.dart';
import 'package:travel_system/features/posts/presentation/cubit/posts_states/posts_states.dart';
import 'package:travel_system/features/posts/presentation/view/posts_screen/widgets/post_widget.dart';
import 'package:travel_system/styles/colors/color_manager.dart';
import 'package:travel_system/styles/text_styles/text_styles.dart';

class HistoryScreen extends StatelessWidget {
  const HistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'History',
        style: TextStyles.textStyle18Medium.copyWith(color: ColorManager.black),
        ),
        centerTitle: true,
      ),
      body: BlocBuilder<PostsCubit,PostsStates>(
        builder: (context, state) {
          return ListView.separated(
              physics: const BouncingScrollPhysics(),
              itemBuilder: (context, index) =>  state is GetPostsSuccessState ? PostWidget(postModel: PostsCubit.get(context).flights[index],):CupertinoActivityIndicator(),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: 10
          );
        },
      )
    );
  }
}
