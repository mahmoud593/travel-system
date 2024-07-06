import 'package:flutter/material.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/features/settings/presentation/view/notification_screen/widgets/notification_item.dart';
import 'package:travel_system/styles/colors/color_manager.dart';
import 'package:travel_system/styles/text_styles/text_styles.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Notifications',
          style: TextStyles.textStyle18Medium.copyWith(
              color: ColorManager.black),
        ),
        centerTitle: true,
      ),

      body: SizedBox(
        height: SizeConfig.height,
        width: SizeConfig.width,
        child: Padding(
          padding: EdgeInsets.all(SizeConfig.height*0.02),
          child: ListView.separated(
            separatorBuilder: (context, index){
              return SizedBox(height: SizeConfig.height*0.01);
            },
            itemBuilder: (context, index){
              return const NotificationItem(title: 'Notification Title', body: 'Notification Body');
            },
            itemCount: 10,
          ),
        ),
      ),
    );
  }
}
