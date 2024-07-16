import 'package:flutter/material.dart';
import 'package:travel_system/features/posts/presentation/cubit/posts_cubit/posts_cubit.dart';
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
      body: ListView.separated(
          physics: const BouncingScrollPhysics(),
          itemBuilder: (context, index) =>  PostWidget(postModel: PostsCubit.get(context).flights[index],),
          separatorBuilder: (context, index) => const Divider(),
          itemCount: 10
      ),
    );
  }
}
