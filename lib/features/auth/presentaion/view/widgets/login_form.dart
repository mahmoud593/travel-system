import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/core/helper/material_navigation.dart';
import 'package:travel_system/features/auth/presentaion/cubit/login_cubit/login_cubit.dart';
import 'package:travel_system/features/auth/presentaion/view/screens/register/resgister.dart';
import 'package:travel_system/styles/colors/color_manager.dart';
import 'package:travel_system/styles/text_styles/text_styles.dart';
import 'package:travel_system/styles/widets/default_button.dart';

import 'auth_text_form_field.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    GlobalKey<FormState> formKey = GlobalKey<FormState>();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return BlocConsumer<LoginCubit, LoginState>(
  listener: (context, state) {
    if(state is LoginSuccess){
      isLoading = true;
    }
  },
  builder: (context, state) {
    var cubit = LoginCubit.get(context);
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      progressIndicator:  const CupertinoActivityIndicator(),
      child: Form(
        key: formKey,
        child: Column(
          children: [
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
                buttonText: "Login",
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    cubit.login(email: emailController.text, password: passwordController.text);
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
      ),
    );
  },
);
  }
}
