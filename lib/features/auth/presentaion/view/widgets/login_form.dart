import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/core/helper/material_navigation.dart';
import 'package:travel_system/features/auth/presentaion/cubit/auth_cubit/auth_cubit.dart';
import 'package:travel_system/features/auth/presentaion/view/screens/register/resgister.dart';
import 'package:travel_system/features/home_layout/presentation/view/home_layout_screen/screens/home_layout_screen.dart';
import 'package:travel_system/styles/colors/color_manager.dart';
import 'package:travel_system/styles/text_styles/text_styles.dart';
import 'package:travel_system/styles/widets/default_button.dart';
import 'package:travel_system/styles/widets/default_text_field.dart';
class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

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
          /// Email
              DefaultTextField(
                controller: cubit.loginEmailController,
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
          /// Password
              DefaultTextField(
                controller: cubit.loginPasswordController,
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
              buttonText: "Login",
              onPressed: () {
                if (cubit.formKey.currentState!.validate()) {
                  cubit.login(email: cubit.loginEmailController.text, password: cubit.loginPasswordController.text);
                }
              },
              buttonColor: ColorManager.primaryBlue,
              large: true),

          SizedBox(
            height: SizeConfig.height * .01,
          ),
          /// Don't have an account
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Don't have an account?",
                style: TextStyles.textStyle18Regular
                    .copyWith(color: ColorManager.black),
              ),
              GestureDetector(
                  onTap:  () {
                    customPushAndRemoveUntil(context, const RegisterScreen());
                  },
                  child: Text("  Register",
                      style: TextStyles.textStyle18Regular.copyWith(
                          color: ColorManager.primaryBlue
                      )),
              ),
            ],
          )
        ],
      ),
    );
  },
);
  }
}
