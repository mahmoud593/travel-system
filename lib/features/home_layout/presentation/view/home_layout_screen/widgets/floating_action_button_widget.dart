import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_system/features/home_layout/presentation/cubit/home_layout_cubit.dart';
import 'package:travel_system/features/home_layout/presentation/cubit/home_layout_states.dart';
import 'package:travel_system/features/posts/presentation/cubit/posts_cubit/posts_cubit.dart';
import 'package:travel_system/features/posts/presentation/cubit/posts_states/posts_states.dart';
import 'package:travel_system/styles/colors/color_manager.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsCubit,PostsStates>(
        builder: (context,state){
          var cubit=PostsCubit.get(context);
          return FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            backgroundColor: ColorManager.primaryBlue,
            child: const Icon(Icons.add,color: ColorManager.white,),
            onPressed: (){
              PostsCubit.get(context).switchBottomNav(1);
            },
          );
        });
  }
}
