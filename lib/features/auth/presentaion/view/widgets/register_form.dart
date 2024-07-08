import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/core/helper/material_navigation.dart';
import 'package:travel_system/features/auth/presentaion/cubit/register_cubit/register_cubit.dart';
import 'package:travel_system/features/auth/presentaion/view/screens/login/login.dart';
import 'package:travel_system/features/auth/presentaion/view/widgets/auth_text_form_field.dart';
import 'package:travel_system/features/splash/presentation/view/splash_screen.dart';
import 'package:travel_system/styles/colors/color_manager.dart';
import 'package:travel_system/styles/text_styles/text_styles.dart';
import 'package:travel_system/styles/widets/default_button.dart';

class RegisterForm extends StatelessWidget {
  const RegisterForm({super.key});

  @override
  Widget build(BuildContext context) {
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController userNameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController peasController = TextEditingController();
    TextEditingController rankController = TextEditingController();
    TextEditingController payrollNumberController = TextEditingController();
    return BlocConsumer<RegisterCubit, RegisterState>(
      listener: (context, state) {
        if (state is RegisterSuccess) {
          customPushAndRemoveUntil(context, const SplashScreen());
        }},
      builder: (context, state) {
        var cubit = RegisterCubit.get(context);
        return Form(
          key: formKey,
          child: Column(
            children: [

              /// User name
              AuthTextFormField(
                labelText: "Username",
                hintText: "Enter your name",
                controller: userNameController,
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
                controller: emailController,
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
                controller: phoneNumberController,
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
                controller: peasController,
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
                controller: rankController,
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
                controller: payrollNumberController,
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

              /// Password
              AuthTextFormField(
                isPassword: true,
                withSuffix: true,
                labelText: "Password",
                hintText: "Enter your password",
                controller: passwordController,
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
                    if (formKey.currentState!.validate()) {
                      cubit.register(
                      email: emailController.text,
                      password: passwordController.text,
                      userName: userNameController.text,
                      phoneNumber: phoneNumberController.text,
                      beasNumber: peasController.text,
                      rank: rankController.text,
                      payRollNumber: payrollNumberController.text
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
