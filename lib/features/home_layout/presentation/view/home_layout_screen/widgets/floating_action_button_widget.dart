import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_system/features/home_layout/presentation/cubit/home_layout_cubit.dart';
import 'package:travel_system/features/home_layout/presentation/cubit/home_layout_states.dart';
import 'package:travel_system/styles/colors/color_manager.dart';

class FloatingActionButtonWidget extends StatelessWidget {
  const FloatingActionButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeLayoutCubit,HomeLayoutStates>(
        builder: (context,state){
          var cubit=HomeLayoutCubit.get(context);
          return FloatingActionButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            backgroundColor: ColorManager.primaryBlue,
            child: const Icon(Icons.add,color: ColorManager.white,),
            onPressed: (){
              HomeLayoutCubit.get(context).switchBottomNav(1);
            },
          );
        });
  }
}
