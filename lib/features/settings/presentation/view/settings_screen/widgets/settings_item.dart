import 'package:flutter/material.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/styles/colors/color_manager.dart';
import 'package:travel_system/styles/text_styles/text_styles.dart';

class SettingsItem extends StatelessWidget {
  final String title;
  final VoidCallback onTap;
  final IconData icon;
  bool isDivider;
  SettingsItem({super.key, required this.title, required this.onTap, required this.icon, this.isDivider = true});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: SizeConfig.height * 0.07,
        width: SizeConfig.width,
        decoration: BoxDecoration(
          color: ColorManager.gray,
          borderRadius: BorderRadius.circular(SizeConfig.height*0.02),
        ),
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.height*0.02),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Row(
                children: [
                  Icon(
                    icon,
                    color: ColorManager.primaryBlue,
                    size: SizeConfig.height*0.03,
                  ),
                  SizedBox(width: SizeConfig.height*0.01,),
                  Text(
                    title,
                    style: TextStyles.textStyle18Regular.copyWith(color: ColorManager.primaryBlue, fontWeight: FontWeight.w400),
                  ),
                ],
              ),

              Icon(
                Icons.arrow_forward_ios,
                color: ColorManager.primaryBlue,
                size: SizeConfig.height*0.02,
              ),

            ],
          ),
        ),
      ),
    );
  }
}
