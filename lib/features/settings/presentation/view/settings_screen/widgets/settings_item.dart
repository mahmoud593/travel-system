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
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
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
          SizedBox(height: SizeConfig.height*0.003,),
          Visibility(
            visible: isDivider,
            child: Divider(
              color: ColorManager.primaryBlue.withOpacity(0.5),
            ),
          ),
        ],
      ),
    );
  }
}
