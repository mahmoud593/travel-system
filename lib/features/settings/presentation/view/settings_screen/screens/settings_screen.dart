import 'package:flutter/material.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/features/settings/presentation/view/settings_screen/widgets/settings_item.dart';
import 'package:travel_system/features/settings/presentation/view/settings_screen/widgets/user_info_card.dart';
import 'package:travel_system/styles/colors/color_manager.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(vertical:  screenHeight * 0.02, horizontal: screenHeight * 0.03),
        child: Column(
          children: [

            const UserInfoCard(name: "Mohamed Mamdouh", email: "mohamed.mmdouh.dev@gmail.com"),

            SizedBox(height: screenHeight * 0.05,),

            Container(
              height: screenHeight * 0.36,
              width: double.infinity,
              decoration: BoxDecoration(
                color: ColorManager.gray,
                borderRadius: BorderRadius.circular(SizeConfig.height*0.02),
              ),

              child: Padding(
                padding: EdgeInsets.all(SizeConfig.height*0.03),
                child:  Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    /// Edit Profile
                    SettingsItem(title: 'Edit Profile', icon: Icons.person_outline, onTap: (){}),

                    /// History
                    SettingsItem(title: 'History', icon: Icons.history_outlined, onTap: (){}),

                    ///Notifications
                    SettingsItem(title: 'Notifications', icon: Icons.notifications_outlined, onTap: (){}),


                    /// Delete Account
                    SettingsItem(title: 'Delete Account', icon: Icons.delete_outline, onTap: (){}),

                    /// Logout
                    SettingsItem(title: 'Logout', icon: Icons.logout_outlined, isDivider: false ,onTap: (){}),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
