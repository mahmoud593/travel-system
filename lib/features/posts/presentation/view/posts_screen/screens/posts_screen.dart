import 'package:flutter/material.dart';
import 'package:travel_system/features/posts/presentation/view/posts_screen/widgets/post_widget.dart';

class PostsScreen extends StatelessWidget {
  const PostsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) => const PostWidget(),
        separatorBuilder: (context, index) => const Divider(),
        itemCount: 10
    );
  }
}
