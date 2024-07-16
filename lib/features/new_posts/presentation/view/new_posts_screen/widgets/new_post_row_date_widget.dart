import 'package:flutter/material.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/styles/assets/asset_manager.dart';
import 'package:travel_system/styles/colors/color_manager.dart';
import 'package:travel_system/styles/text_styles/text_styles.dart';

class NewPostRowDateWidget extends StatelessWidget {
  const NewPostRowDateWidget({super.key,required this.icon,required this.text,required this.description});

  final String icon;
  final String text;
  final String description;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [

            Image(
              image:  AssetImage(icon),
              height: SizeConfig.height * 0.04,
            ),

            SizedBox(width: SizeConfig.height * 0.01,),

            Text(text,style: TextStyles.textStyle24Bold.copyWith(
                color: ColorManager.black
            ),),
          ],
        ),

        SizedBox(height: SizeConfig.height * 0.01,),

        Text(description,style: TextStyles.textStyle18Medium.copyWith(
            color: Colors.black
        ),),
      ],
    );
  }
}
