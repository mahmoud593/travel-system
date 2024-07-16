import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/core/helper/material_navigation.dart';
import 'package:travel_system/features/auth/presentaion/cubit/auth_cubit/auth_cubit.dart';
import 'package:travel_system/features/auth/presentaion/view/screens/register/resgister.dart';
import 'package:travel_system/styles/colors/color_manager.dart';
import 'package:travel_system/styles/text_styles/text_styles.dart';
import 'package:travel_system/styles/widets/default_button.dart';

import 'auth_text_form_field.dart';

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
          AuthTextFormField(
            labelText: "Email",
            hintText: "Enter your e-mail",
            controller: cubit.loginEmailController,
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
          /// Password
          AuthTextFormField(
            isPassword: true,
            withSuffix: true,
            labelText: "Password",
            hintText: "Enter your password",
            controller: cubit.loginPasswordController,
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
