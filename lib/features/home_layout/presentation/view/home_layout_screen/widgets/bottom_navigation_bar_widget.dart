
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/features/home_layout/presentation/cubit/home_layout_cubit.dart';
import 'package:travel_system/features/home_layout/presentation/cubit/home_layout_states.dart';
import 'package:travel_system/features/posts/presentation/cubit/posts_cubit/posts_cubit.dart';
import 'package:travel_system/features/posts/presentation/cubit/posts_states/posts_states.dart';
import 'package:travel_system/styles/assets/asset_manager.dart';
import 'package:travel_system/styles/colors/color_manager.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';


class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsCubit,PostsStates>(
        builder: (context,state){
          var cubit=PostsCubit.get(context);
          return SalomonBottomBar(
            backgroundColor: ColorManager.white,
            currentIndex: cubit.currentIndex,
            onTap: (i) => cubit.switchBottomNav(i),
            items: [
              /// Home
              SalomonBottomBarItem(
                icon: Icon(Icons.home),
                title: Text("Home"),
                selectedColor: ColorManager.primaryBlue,
                unselectedColor: ColorManager.lightBlue
              ),
              /// Chat
              SalomonBottomBarItem(
                  icon: Icon(Icons.favorite),
                  title: Text("Favorites"),
                  selectedColor: ColorManager.primaryBlue,
                  unselectedColor: ColorManager.lightBlue
              ),
              /// Profile
              SalomonBottomBarItem(
                icon: Icon(Icons.person),
                title: Text("Profile"),
                selectedColor: ColorManager.primaryBlue,
                unselectedColor: ColorManager.lightBlue
              ),


            ],
          );
        });
  }
}
