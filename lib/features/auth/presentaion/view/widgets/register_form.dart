import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/core/helper/material_navigation.dart';
import 'package:travel_system/features/auth/presentaion/cubit/auth_cubit/auth_cubit.dart';
import 'package:travel_system/features/auth/presentaion/view/screens/login/login.dart';
import 'package:travel_system/features/auth/presentaion/view/widgets/aircraft_gridview_widget.dart';
import 'package:travel_system/styles/colors/color_manager.dart';
import 'package:travel_system/styles/text_styles/text_styles.dart';
import 'package:travel_system/styles/widets/default_button.dart';
import 'package:travel_system/styles/widets/default_text_field.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return Form(
          key: cubit.formKey,
          child: Column(
            children: [

              /// User name
              DefaultTextField(
                controller: cubit.userNameController,
                hintText: "User name",
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
              SizedBox(
                height: SizeConfig.height * .02,
              ),

              /// Email
              DefaultTextField(
                controller: cubit.registerEmailController,
                hintText: "E-mail",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your e-mail';
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
                fillColor: ColorManager.white,
              ),
              SizedBox(
                height: SizeConfig.height * .02,
              ),

              /// Phone number
              DefaultTextField(
                controller: cubit.phoneNumberController,
                hintText: "Phone Number",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Phone Number';
                  }
                  return null;
                },
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                fillColor: ColorManager.white,
              ),

              SizedBox(
                height: SizeConfig.height * .02,
              ),

              /// Beas number
              DefaultTextField(
                controller: cubit.peasController,
                hintText: "Beas number",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Beas number';
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
                fillColor: ColorManager.white,
              ),
              SizedBox(
                height: SizeConfig.height * .02,
              ),

              /// rank
              DefaultTextField(
                controller: cubit.payrollNumberController,
                hintText: "PayRoll Number",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your PayRoll Number';
                  }
                  return null;
                },
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
                fillColor: ColorManager.white,
              ),


              SizedBox(
                height: SizeConfig.height * .02,
              ),

              /// PayRoll number
              DefaultTextField(
                controller: cubit.rankController,
                hintText: "Rank",
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Rank';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
                fillColor: ColorManager.white,
              ),
              SizedBox(
                height: SizeConfig.height * .02,
              ),

              /// Aircraft check box
              const AircraftGridviewWidget(),


              /// Password
              DefaultTextField(
                controller: cubit.registerPasswordController,
                hintText: "Password",
                isPassword: true,
                withSuffix: true,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Please enter your Password';
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
                fillColor: ColorManager.white,
              ),
              SizedBox(
                height: SizeConfig.height * .02,
              ),

              /// Register Button
              DefaultButton(
                  width: SizeConfig.width,
                  buttonText: "Register",
                  onPressed: () {
                    if (cubit.formKey.currentState!.validate()) {
                      cubit.register(
                      email: cubit.registerEmailController.text,
                      password: cubit.registerPasswordController.text,
                      userName:cubit. userNameController.text,
                      phoneNumber:cubit. phoneNumberController.text,
                      beasNumber: cubit.peasController.text,
                      rank: cubit.rankController.text,
                      payRollNumber:cubit. payrollNumberController.text,
                      airCrafts: cubit.selectedAirCrafts
                      );
                    }},
                  buttonColor: ColorManager.primaryBlue,
                  large: true),

              SizedBox(
                height: SizeConfig.height * .03,
              ),

              /// Already have an account
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already have an account?",
                    style: TextStyles.textStyle18Regular
                        .copyWith(color: ColorManager.black),
                  ),
                  GestureDetector(
                      onTap: () {
                        customPushAndRemoveUntil(context, const LoginScreen());
                      },
                      child: Text("  Login",
                          style: TextStyles.textStyle18Regular.copyWith(
                              color: ColorManager.primaryBlue
                          ))),
                ],
              ),
              SizedBox(
                height: SizeConfig.height * .03,
              ),
            ],
          ),
        );
      },
    );
  }
}
