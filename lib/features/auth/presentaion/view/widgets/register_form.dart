import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/core/helper/material_navigation.dart';
import 'package:travel_system/features/auth/presentaion/cubit/register_cubit/register_cubit.dart';
import 'package:travel_system/features/auth/presentaion/view/screens/login/login.dart';
import 'package:travel_system/features/auth/presentaion/view/widgets/aircraft_gridview_widget.dart';
import 'package:travel_system/features/auth/presentaion/view/widgets/auth_text_form_field.dart';
import 'package:travel_system/styles/colors/color_manager.dart';
import 'package:travel_system/styles/text_styles/text_styles.dart';
import 'package:travel_system/styles/widets/default_button.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {

    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = RegisterCubit.get(context);
        return Form(
          key: cubit.formKey,
          child: Column(
            children: [

              /// User name
              AuthTextFormField(
                labelText: "Username",
                hintText: "Enter your name",
                controller:cubit. userNameController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "User name is required";
                  }
                  return null;
                },
                keyboardType: TextInputType.name,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(
                height: SizeConfig.height * .01,
              ),

              /// Email
              AuthTextFormField(
                labelText: "Email",
                hintText: "Enter your e-mail",
                controller:cubit.emailController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "E-mail is required";
                  }
                  return null;
                },
                keyboardType: TextInputType.emailAddress,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(
                height: SizeConfig.height * .01,
              ),

              /// Phone number
              AuthTextFormField(
                labelText: "Phone number",
                hintText: "Enter your phone number",
                controller:cubit.phoneNumberController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Phone number is required";
                  }
                  return null;
                },
                keyboardType: TextInputType.phone,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(
                height: SizeConfig.height * .01,
              ),

              /// Beas number
              AuthTextFormField(
                labelText: "Beas number",
                hintText: "Enter your Beas number",
                controller: cubit.peasController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Beas number is required";
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(
                height: SizeConfig.height * .01,
              ),

              /// rank
              AuthTextFormField(
                labelText: "Rank",
                hintText: "Enter your rank",
                controller: cubit.rankController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Rank is required";
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(
                height: SizeConfig.height * .01,
              ),

              /// PayRoll number
              AuthTextFormField(
                labelText: "PayRoll number",
                hintText: "Enter your payroll number",
                controller: cubit.payrollNumberController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Rank is required";
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
              ),
              SizedBox(
                height: SizeConfig.height * .01,
              ),

              const AircraftGridviewWidget(),


              /// Password
              AuthTextFormField(
                isPassword: true,
                withSuffix: true,
                labelText: "Password",
                hintText: "Enter your password",
                controller: cubit.passwordController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Password is required";
                  }
                  return null;
                },
                keyboardType: TextInputType.text,
                textInputAction: TextInputAction.done,
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
                      email: cubit.emailController.text,
                      password: cubit.passwordController.text,
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
                height: SizeConfig.height * .01,
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
              )
            ],
          ),
        );
      },
    );
  }
}
