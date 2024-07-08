import 'package:flutter/material.dart';
import 'package:travel_system/styles/colors/color_manager.dart';

class LogoInCircularAvatar extends StatelessWidget {
  const LogoInCircularAvatar({super.key});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      radius: MediaQuery.sizeOf(context).height*.1,
      backgroundColor: ColorManager.primaryBlue.withOpacity(.3),
      child: Image.asset("assets/images/logo.png"),
    );
  }
}
