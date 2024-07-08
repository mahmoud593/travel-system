import 'package:flutter/material.dart';
import 'package:travel_system/core/helper/material_navigation.dart';
import 'package:travel_system/features/auth/presentaion/view/screens/login/login.dart';
import 'package:travel_system/styles/colors/color_manager.dart';
import 'package:travel_system/styles/text_styles/text_styles.dart';

class SkipButtonWidget extends StatelessWidget {
  const SkipButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
          onPressed: (){
            customPushAndRemoveUntil(context, const LoginScreen());
          }, child: Text("Skip",style: TextStyles.textStyle18Medium.copyWith(
          color: ColorManager.primaryBlue
      ),)),
    );
  }
}
