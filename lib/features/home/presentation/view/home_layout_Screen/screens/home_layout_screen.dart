import 'package:flutter/material.dart';
import 'package:travel_system/features/home/presentation/view/home_layout_Screen/widgets/bottom_navigation_bar_widget.dart';
import 'package:travel_system/features/home/presentation/view/home_layout_Screen/widgets/floating_action_button_widget.dart';

class HomeLayoutScreen extends StatelessWidget {
  const HomeLayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: const Center(
        child: Text('HomeLayoutScreen'),
      ),
      floatingActionButton: floatingActionButtonWidget(),
      bottomNavigationBar: bottomNavigationBarWidget(),

    );
  }
}
