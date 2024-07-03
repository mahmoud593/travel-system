
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/features/home_layout/presentation/cubit/home_layout_cubit.dart';
import 'package:travel_system/features/home_layout/presentation/cubit/home_layout_states.dart';
import 'package:travel_system/styles/assets/asset_manager.dart';
import 'package:travel_system/styles/colors/color_manager.dart';

class BottomNavigationBarWidget extends StatelessWidget {
  const BottomNavigationBarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeLayoutCubit,HomeLayoutStates>(
        builder: (context,state){
          var cubit=HomeLayoutCubit.get(context);
          return BottomAppBar(
            color: ColorManager.gray,
            shape: const CircularNotchedRectangle(),
            notchMargin: 3,
            child: SizedBox(
              child: Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: ()=> cubit.switchBottomNav(0),
                      icon: const Icon(Icons.home,color:ColorManager.primaryBlue,)
                  ),
                  IconButton(
                      onPressed: ()=> cubit.switchBottomNav(2),
                      icon: const Icon(Icons.settings,color: ColorManager.primaryBlue,)
                  ),
                ],
              ),
            ),
          );
        });
  }
}
