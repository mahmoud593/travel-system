import 'package:flutter/material.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/styles/assets/asset_manager.dart';
import 'package:travel_system/styles/colors/color_manager.dart';
import 'package:travel_system/styles/text_styles/text_styles.dart';

class NewPostRowDateWidget extends StatelessWidget {
  const NewPostRowDateWidget({super.key,required this.icon,required this.text});

  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [

        Image(
          image:  AssetImage(icon),
          height: SizeConfig.height * 0.04,
        ),

        SizedBox(width: SizeConfig.height * 0.01,),

        Text(text,style: TextStyles.textStyle18Bold.copyWith(
            color: ColorManager.black
        ),),
      ],
    );
  }
}
