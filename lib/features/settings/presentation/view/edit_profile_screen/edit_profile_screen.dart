import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height*0.01),
                        border: Border.all(
                          color: Colors.grey.withOpacity(0.5),
                        )
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          hint: Text('Base',style: TextStyles.textStyle18Regular
                              .copyWith(color: ColorManager.darkGrey.withOpacity(.5)),),
                          icon: const Icon(Icons.arrow_drop_down),
                          elevation: 5,
                          padding: EdgeInsets.only(left: SizeConfig.height * 0.01,),
                          dropdownColor: Colors.white,
                          value:cubit.base,
                          style: TextStyles.textStyle18Regular.copyWith(color: ColorManager.darkGrey.withOpacity(.5)),
                          onChanged: (String? newValue) {
                            cubit.setBeasDropDownValue(value: newValue);
                          },
                          items: Constants.baseList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value, style: TextStyles.textStyle18Regular.copyWith(color: ColorManager.black.withOpacity(.5)),),
                            );
                          }).toList(),
                        ),
                      ),
                    ),

                    SizedBox(height: SizeConfig.height * 0.01,),

                    Text(
                      'Rank',
                      style: TextStyles.textStyle18Medium
                          .copyWith(color: ColorManager.black),
                    ),
                    SizedBox(height: SizeConfig.height * 0.01,),
                    /// rank dropdown
                    Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height*0.01),
                          border: Border.all(
                            color: Colors.grey.withOpacity(0.5),
                          )
                      ),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          hint: Text('Rank',style: TextStyles.textStyle18Regular
                              .copyWith(color: ColorManager.darkGrey.withOpacity(.5)),),
                          icon: const Icon(Icons.arrow_drop_down),
                          elevation: 5,
                          padding: EdgeInsets.only(left: SizeConfig.height * 0.01,),
                          dropdownColor: Colors.white,
                          value:cubit.rank,
                          style: TextStyles.textStyle18Regular.copyWith(color: ColorManager.darkGrey.withOpacity(.5)),
                          onChanged: (String? newValue) {
                            cubit.setRankDropDownValue(value: newValue);
                          },
                          items: Constants.rankList
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value, style: TextStyles.textStyle18Regular.copyWith(color: ColorManager.black.withOpacity(.5)),),
                            );
                          }).toList(),
                        ),
                      ),
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
                      onPressed: () {},
                      buttonColor: ColorManager.primaryBlue,
                      large: false,
                    ),
                    SizedBox(height: SizeConfig.height * 0.05,),

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
