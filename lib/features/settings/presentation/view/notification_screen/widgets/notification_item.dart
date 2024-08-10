import 'package:flutter/material.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/features/posts/data/models/post_model.dart';
import 'package:travel_system/styles/colors/color_manager.dart';
import 'package:travel_system/styles/text_styles/text_styles.dart';

class NotificationItem extends StatelessWidget {
  final PostModel postModel;
  final String percentage;
  const NotificationItem({super.key, required this.postModel, required this.percentage});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: SizeConfig.width,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(SizeConfig.height*0.01),
        color: ColorManager.gray,
      ),

      child: Padding(
        padding: EdgeInsets.all(SizeConfig.height*0.01),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            /// Notification Title
            const Icon(
              Icons.notifications_active,
              color: ColorManager.primaryBlue,
            ),

            SizedBox(width: SizeConfig.height*0.01),

            Expanded(
              child: Text(
                "${postModel.userName} add a new trip corresponding to your trip with $percentage%",
                style: TextStyles.textStyle18Medium.copyWith(
                    color: ColorManager.black,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
