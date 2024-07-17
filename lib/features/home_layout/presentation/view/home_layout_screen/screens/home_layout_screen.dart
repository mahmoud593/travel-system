import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_system/core/constants/constants.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/core/helper/material_navigation.dart';
import 'package:travel_system/features/filter/presentation/view/screens/filter_screen.dart';
import 'package:travel_system/features/home_layout/presentation/cubit/home_layout_cubit.dart';
import 'package:travel_system/features/home_layout/presentation/cubit/home_layout_states.dart';
import 'package:travel_system/features/home_layout/presentation/view/home_layout_Screen/widgets/floating_action_button_widget.dart';
import 'package:travel_system/features/home_layout/presentation/view/home_layout_screen/widgets/bottom_navigation_bar_widget.dart';
import 'package:travel_system/features/posts/presentation/cubit/posts_cubit/posts_cubit.dart';
import 'package:travel_system/features/posts/presentation/cubit/posts_states/posts_states.dart';
import 'package:travel_system/styles/colors/color_manager.dart';


class HomeLayoutScreen extends StatelessWidget {
  const HomeLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostsCubit,PostsStates>(
          builder: (context,state){
            return Scaffold(
                backgroundColor: Colors.white,
                extendBody: true,
                floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
                appBar: AppBar(toolbarHeight: 0.0,),
                body: Constants.homeLayoutScreens[PostsCubit.get(context).currentIndex],
                bottomNavigationBar: const BottomNavigationBarWidget()

            );
          });
  }
}
