import 'package:flutter/material.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/styles/colors/color_manager.dart';
import 'package:travel_system/styles/text_styles/text_styles.dart';

class NotificationItem extends StatelessWidget {
  final String title, body;
  const NotificationItem({super.key, required this.title, required this.body});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: SizeConfig.height*0.1,
      width: SizeConfig.width,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeConfig.height*0.01),
        color: ColorManager.gray,
      ),

      child: Padding(
        padding: EdgeInsets.all(SizeConfig.height*0.01),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Notification Title
            Text(
              title,
              style: TextStyles.textStyle18Medium.copyWith(
                  color: ColorManager.black
              ),
            ),

            /// Notification Body
            Expanded(
              child: Text(
                body,
                style: TextStyles.textStyle12Regular.copyWith(
                    color: ColorManager.black
                ),
                maxLines: 3,
                overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
