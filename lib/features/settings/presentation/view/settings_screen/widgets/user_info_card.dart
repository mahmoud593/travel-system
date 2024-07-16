import 'package:flutter/material.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/styles/colors/color_manager.dart';
import 'package:travel_system/styles/text_styles/text_styles.dart';

class UserInfoCard extends StatelessWidget {
  final String name, email, image;
  const UserInfoCard({super.key, required this.name, required this.email, required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.height * 0.21,
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: ColorManager.gray,
        borderRadius: BorderRadius.circular(SizeConfig.height*0.02),
      ),

      child: Padding(
        padding: EdgeInsets.all(SizeConfig.height*0.02),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: SizeConfig.height * 0.055,
              backgroundImage: NetworkImage(image),
            ),
            SizedBox(width: SizeConfig.height * 0.01,),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    name,
                    style: TextStyles.textStyle24Bold.copyWith(color: ColorManager.primaryBlue),
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
      ),
    );
  }
}
