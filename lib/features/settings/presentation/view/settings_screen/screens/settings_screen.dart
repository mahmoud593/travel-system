import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:travel_system/features/settings/presentation/cubit/settings_state.dart';
import 'package:travel_system/features/settings/presentation/view/edit_profile_screen/edit_profile_screen.dart';
import 'package:travel_system/features/settings/presentation/view/history_screen/history_screen.dart';
import 'package:travel_system/features/settings/presentation/view/notification_screen/notificarions_screen.dart';
import 'package:travel_system/features/settings/presentation/view/settings_screen/widgets/settings_item.dart';
import 'package:travel_system/features/settings/presentation/view/settings_screen/widgets/user_info_card.dart';
import 'package:travel_system/styles/colors/color_manager.dart';
import 'package:travel_system/styles/widets/loading_widget.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getUser();

  }

  getUser() async {
    await SettingsCubit.get(context).getUserData();
  }


  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return BlocConsumer<SettingsCubit, SettingsState>(
    listener: (context, state) {},
  builder: (context, state) {
    return Scaffold(
      body: Stack(
        children: [

          Container(
            height: SizeConfig.height,
            width: SizeConfig.width,

            decoration: const BoxDecoration(
                color: ColorManager.white,
                image: DecorationImage(
                  fit: BoxFit.cover,
                  opacity: .6,
                  image: NetworkImage('https://img.freepik.com/premium-photo/travel-world-monument-concept_1097408-13.jpg?w=740'),
                )
            ),
          ),

          Container(
            height: SizeConfig.height,
            width: SizeConfig.width,

            decoration: BoxDecoration(
              color: ColorManager.white,
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.transparent,
                  ColorManager.white.withOpacity(0.9),
                  ColorManager.white,
                ],
              )
            ),

            child: Padding(
              padding: EdgeInsets.symmetric(vertical:  screenHeight * 0.02, horizontal: screenHeight * 0.03),
              child: Column(
                children: [
                  SizedBox(height: screenHeight * 0.03,),


                  /// user info card
                  state is GetUserDataSuccessState ?
                  UserInfoCard(
                    name: SettingsCubit.get(context).userModel!.userName,
                    email: SettingsCubit.get(context).userModel!.email,
                    image: SettingsCubit.get(context).userModel!.userImage,
                  ) : const LoadingAnimationWidget(),

                  SizedBox(height: screenHeight * 0.05,),

                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      /// Edit Profile
                      SettingsItem(
                        title: 'Edit Profile',
                        icon: Icons.person_outline,
                        onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => const EditProfileScreen())),
                      ),
                      SizedBox(height: SizeConfig.height * 0.01,),

                      /// History
                      SettingsItem(
                        title: 'History',
                        icon: Icons.history_outlined,
                        onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => const HistoryScreen())),
                      ),
                      SizedBox(height: SizeConfig.height * 0.01,),


                      ///Notifications
                      SettingsItem(
                        title: 'Notifications',
                        icon: Icons.notifications_outlined,
                        onTap: ()=> Navigator.push(context, MaterialPageRoute(builder: (context) => const NotificationsScreen())),
                      ),
                      SizedBox(height: SizeConfig.height * 0.01,),


                      ///Favorite
                      SettingsItem(
                        title: 'Favorite',
                        icon: Icons.favorite_outline,
                        onTap: (){},
                      ),
                      SizedBox(height: SizeConfig.height * 0.01,),


                      /// Delete Account
                      SettingsItem(title: 'Delete Account', icon: Icons.delete_outline, onTap: (){}),
                      SizedBox(height: SizeConfig.height * 0.01,),

                      /// Logout
                      SettingsItem(
                          title: 'Logout',
                          icon: Icons.logout_outlined,
                          isDivider: false,
                          onTap: () async {
                            await SettingsCubit.get(context).userSignOut(context: context);
                          },
                      ),
                      SizedBox(height: SizeConfig.height * 0.01,),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  },
);
  }
}
