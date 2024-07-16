import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ticket_material/ticket_material.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/features/posts/data/models/post_model.dart';
import 'package:travel_system/features/posts/presentation/cubit/posts_cubit/posts_cubit.dart';
import 'package:travel_system/features/posts/presentation/cubit/posts_states/posts_states.dart';
import 'package:travel_system/features/posts/presentation/view/posts_screen/widgets/ticket_data_widget.dart';
import 'package:travel_system/features/posts/presentation/view/posts_screen/widgets/ticket_right_child_widget.dart';
import 'package:travel_system/styles/colors/color_manager.dart';

class PostWidget extends StatelessWidget {
  const PostWidget({super.key,required this.postModel});

  final PostModel postModel;
  
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsCubit, PostsStates>(
      builder: (context, state) {
        return Padding(
          padding: const EdgeInsets.all(10.0),
          child: GestureDetector(
            onTap: (){},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [

                TicketMaterial(
                  height: SizeConfig.height * 0.25,
                  radiusBorder: 15,
                  colorBackground: ColorManager.primaryBlue.withOpacity(.6),
                  leftChild:  TicketDataWidget(postModel: postModel,),
                  rightChild: const TicketRightChildWidget(),
                ),

              ],
            ),
          ),
        );
      },
    );
  }
}

