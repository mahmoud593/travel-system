import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_system/core/constants/constants.dart';
import 'package:travel_system/core/helper/material_navigation.dart';
import 'package:travel_system/features/filter/presentation/view/screens/filter_screen.dart';
import 'package:travel_system/features/home_layout/presentation/cubit/home_layout_cubit.dart';
import 'package:travel_system/features/home_layout/presentation/cubit/home_layout_states.dart';
import 'package:travel_system/features/home_layout/presentation/view/home_layout_Screen/widgets/floating_action_button_widget.dart';
import 'package:travel_system/features/home_layout/presentation/view/home_layout_screen/widgets/bottom_navigation_bar_widget.dart';
import 'package:travel_system/styles/colors/color_manager.dart';


class HomeLayoutScreen extends StatelessWidget {
  const HomeLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeLayoutCubit,HomeLayoutStates>(
          builder: (context,state){
            var cubit=HomeLayoutCubit.get(context);
            return Scaffold(
                backgroundColor: Colors.white,
                extendBody: true,
                floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
                appBar: AppBar(
                  title: Text(Constants.homeLayoutTitles[HomeLayoutCubit.get(context).currentIndex]),
                  actions: [
                    if(HomeLayoutCubit.get(context).currentIndex==0)
                    IconButton(
                        onPressed: ()=>customPushNavigator(context,  FilterScreen()),
                        icon: const Icon(
                          Icons.menu,
                          color: ColorManager.primaryBlue,
                        )
                    ),
                  ],
                ),
                body: Constants.homeLayoutScreens[HomeLayoutCubit.get(context).currentIndex],
                floatingActionButton:  const FloatingActionButtonWidget(),
                bottomNavigationBar: const BottomNavigationBarWidget()

            );
          });
  }
}
