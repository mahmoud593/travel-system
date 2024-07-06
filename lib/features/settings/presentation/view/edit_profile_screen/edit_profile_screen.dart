import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:travel_system/features/settings/presentation/cubit/settings_state.dart';
import 'package:travel_system/features/settings/presentation/view/edit_profile_screen/widget/user_edit_image_item.dart';
import 'package:travel_system/styles/colors/color_manager.dart';
import 'package:travel_system/styles/text_styles/text_styles.dart';
import 'package:travel_system/styles/widets/default_button.dart';
import 'package:travel_system/styles/widets/default_text_field.dart';

class EditProfileScreen extends StatelessWidget {
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<SettingsCubit, SettingsState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = SettingsCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            title: Text(
              'Edit Profile',
              style: TextStyles.textStyle18Medium.copyWith(
                  color: ColorManager.black),
            ),
            centerTitle: true,
          ),
          body: SizedBox(
            height: SizeConfig.height,
            width: SizeConfig.width,
            child: Padding(
              padding: EdgeInsets.symmetric(
                  horizontal: SizeConfig.height * 0.03,
                  vertical: SizeConfig.height * 0.02),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [

                    /// user edit image item
                    UserEditImageItem(onTap: () => cubit.getProfileImage()),

                    SizedBox(height: SizeConfig.height * 0.05,),

                    DefaultTextField(
                      controller: cubit.editProfileNameController,
                      hintText: "Name",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.name,
                      textInputAction: TextInputAction.next,
                      fillColor: ColorManager.white,
                    ),
                    SizedBox(height: SizeConfig.height * 0.01,),


                    DefaultTextField(
                      controller: cubit.editProfileEmailController,
                      hintText: "Email",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      fillColor: ColorManager.white,
                    ),
                    SizedBox(height: SizeConfig.height * 0.01,),


                    DefaultTextField(
                      controller: cubit.editProfileBaseController,
                      hintText: "Base",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      fillColor: ColorManager.white,
                    ),
                    SizedBox(height: SizeConfig.height * 0.01,),


                    DefaultTextField(
                      controller: cubit.editProfileRankController,
                      hintText: "Rank",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.text,
                      textInputAction: TextInputAction.next,
                      fillColor: ColorManager.white,
                    ),
                    SizedBox(height: SizeConfig.height * 0.01,),


                    DefaultTextField(
                      controller: cubit.editProfilePayrollNumberController,
                      hintText: "Payroll Number",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.number,
                      textInputAction: TextInputAction.next,
                      fillColor: ColorManager.white,
                    ),
                    SizedBox(height: SizeConfig.height * 0.01,),

                    DefaultTextField(
                      controller: cubit.editProfilePhoneNumberController,
                      hintText: "Mobile Number",
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                      keyboardType: TextInputType.phone,
                      textInputAction: TextInputAction.next,
                      fillColor: ColorManager.white,
                    ),
                    SizedBox(height: SizeConfig.height * 0.05,),


                    DefaultButton(
                      buttonText: "Save Changes",
                      onPressed: () {},
                      buttonColor: ColorManager.primaryBlue,
                      large: false,
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
