import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:travel_system/features/settings/presentation/cubit/settings_state.dart';
import 'package:travel_system/styles/colors/color_manager.dart';

class UserEditImageItem extends StatelessWidget {
  final VoidCallback onTap;

  const UserEditImageItem({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SettingsCubit.get(context);
        return SizedBox(
          height: SizeConfig.height * 0.15,
          width: SizeConfig.height * 0.15,
          child: Stack(
            children: [

              /// profile image
              Container(
                height: SizeConfig.height * 0.15,
                width: SizeConfig.height * 0.15,

                decoration: BoxDecoration(
                    color: ColorManager.primaryBlue,
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: cubit.uploadedProfileImage != null ? FileImage(cubit.uploadedProfileImage!) : NetworkImage("${cubit.userModel?.userImage}"),
                      fit: BoxFit.fill,
                    )
                ),
              ),

              /// edit image icon
              Align(
                alignment: Alignment.bottomRight,
                child: InkWell(
                  onTap: onTap,
                  child: Padding(
                    padding: EdgeInsets.all(SizeConfig.height * 0.004),
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        CircleAvatar(
                          radius: SizeConfig.height * 0.023,
                          backgroundColor: ColorManager.white,
                        ),
                        CircleAvatar(
                          radius: SizeConfig.height * 0.02,
                          backgroundColor: ColorManager.gray,
                          child: const Icon(
                              Icons.edit, color: ColorManager.primaryBlue),
                        ),
                      ],
                    ),
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
