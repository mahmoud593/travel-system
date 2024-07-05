import 'package:flutter/material.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/styles/colors/color_manager.dart';
import 'package:travel_system/styles/text_styles/text_styles.dart';

class UserInfoCard extends StatelessWidget {
  final String name, email;
  const UserInfoCard({super.key, required this.name, required this.email});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.height * 0.1,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: ColorManager.gray,
        borderRadius: BorderRadius.circular(SizeConfig.height),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          CircleAvatar(
            radius: SizeConfig.height * 0.05,
            backgroundImage: const AssetImage('assets/images/plane.png'),
          ),
          SizedBox(width: SizeConfig.height * 0.01,),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: TextStyles.textStyle18Bold.copyWith(color: ColorManager.primaryBlue),
                ),
                Text(
                  email,
                  style: TextStyles.textStyle12Medium.copyWith(color: ColorManager.primaryBlue, fontWeight: FontWeight.w400),
                  maxLines: 2,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
