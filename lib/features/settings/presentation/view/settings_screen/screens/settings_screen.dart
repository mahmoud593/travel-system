import 'package:flutter/material.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/features/settings/presentation/view/edit_profile_screen/edit_profile_screen.dart';
import 'package:travel_system/features/settings/presentation/view/history_screen/history_screen.dart';
import 'package:travel_system/features/settings/presentation/view/notification_screen/notificarions_screen.dart';
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

            /// user info card
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
                    SettingsItem(
                        title: 'Edit Profile',
                        icon: Icons.person_outline,
                        onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfileScreen())),
                    ),

                    /// History
                    SettingsItem(
                        title: 'History',
                        icon: Icons.history_outlined,
                        onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => const HistoryScreen())),
                    ),

                    ///Notifications
                    SettingsItem(
                        title: 'Notifications',
                        icon: Icons.notifications_outlined,
                        onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationsScreen())),
                    ),


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
