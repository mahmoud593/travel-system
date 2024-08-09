import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:travel_system/core/constants/constants.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/features/settings/presentation/cubit/settings_cubit.dart';
import 'package:travel_system/features/settings/presentation/cubit/settings_state.dart';
import 'package:travel_system/features/settings/presentation/view/edit_profile_screen/widget/user_edit_image_item.dart';
import 'package:travel_system/styles/colors/color_manager.dart';
import 'package:travel_system/styles/text_styles/text_styles.dart';
import 'package:travel_system/styles/widets/default_button.dart';
import 'package:travel_system/styles/widets/default_text_field.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({super.key});

  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
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
          body: ModalProgressHUD(
              inAsyncCall: state is UpdateUserProfileLoadingState,
              progressIndicator: const CupertinoActivityIndicator(),
              child: SizedBox(
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
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [

                        /// user edit image item
                        Align(
                          alignment: Alignment.center,
                          child: UserEditImageItem(onTap: () => cubit.getProfileImage()),
                        ),

                        SizedBox(height: SizeConfig.height * 0.05,),

                        Text(
                          'Name',
                          style: TextStyles.textStyle18Medium
                              .copyWith(color: ColorManager.black),
                        ),
                        SizedBox(height: SizeConfig.height * 0.01,),
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


                        Text(
                          'Email',
                          style: TextStyles.textStyle18Medium
                              .copyWith(color: ColorManager.black),
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

                        Text(
                          'Base',
                          style: TextStyles.textStyle18Medium
                              .copyWith(color: ColorManager.black),
                        ),
                        SizedBox(height: SizeConfig.height * 0.01,),
                        /// base dropdown

                        DefaultTextField(
                          controller: cubit.contractType,
                          hintText: "${cubit.base}",
                          enable: false,
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

                        Text(
                          'Rank',
                          style: TextStyles.textStyle18Medium
                              .copyWith(color: ColorManager.black),
                        ),
                        SizedBox(height: SizeConfig.height * 0.01,),
                        /// rank dropdown

                        DefaultTextField(
                          controller: cubit.contractType,
                          hintText: "${cubit.rank}",
                          enable: false,
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

                        Text(
                          'Payroll Number',
                          style: TextStyles.textStyle18Medium
                              .copyWith(color: ColorManager.black),
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

                        Text(
                          'Mobile Number',
                          style: TextStyles.textStyle18Medium
                              .copyWith(color: ColorManager.black),
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
                          onPressed: () {
                            cubit.updateUserData();
                          },
                          buttonColor: ColorManager.primaryBlue,
                          large: false,
                        ),
                        SizedBox(height: SizeConfig.height * 0.05,),

                      ],
                    ),
                  ),
                ),
              ),
          )
        );
      },
    );
  }
}
