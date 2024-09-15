import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:travel_system/core/constants/constants.dart';
import 'package:travel_system/features/auth/presentaion/cubit/auth_cubit/auth_cubit.dart';
import 'package:travel_system/features/auth/presentaion/view/widgets/auth_text_form_field.dart';
import 'package:travel_system/styles/colors/color_manager.dart';
import 'package:travel_system/styles/text_styles/text_styles.dart';
import 'package:travel_system/styles/widets/default_button.dart';
import 'package:travel_system/styles/widets/toast.dart';

import '../../../../../core/helper/app_size_config.dart';

class ForgetPasswordScreen extends StatelessWidget {
   ForgetPasswordScreen({super.key});

  TextEditingController emailController = TextEditingController();

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return  BlocBuilder<AuthCubit,AuthState>(
      builder: (context,state){
        var cubit = AuthCubit.get(context);
        return Scaffold(
          appBar: AppBar(
            titleSpacing: 0.0,
            backgroundColor: ColorManager.primaryBlue,
            iconTheme: const IconThemeData(
              color: ColorManager.white,
            ),
            title: Text(
              'Forget Password',
              style: TextStyles.textStyle18Medium.copyWith(
                  color: ColorManager.white,
                  fontWeight: FontWeight.w700,
                  fontSize: 19
              ),
            ),
          ),

          body:  Container(
            margin: EdgeInsets.symmetric(
              horizontal: SizeConfig.width * 0.05,
            ),
            child: ModalProgressHUD(
              inAsyncCall: state is ForgetPasswordLoading,
              progressIndicator: const CupertinoActivityIndicator(),
              child: Form(
                key: formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    SizedBox( height: SizeConfig.height * 0.04),

                    Text('Please Enter Your Email',style: TextStyles.textStyle18Bold.copyWith(
                        color: Colors.black
                    )),

                    SizedBox( height: SizeConfig.height * 0.015),

                    AuthTextFormField(
                        validator: (value){
                          if(value!.isEmpty){
                            return "Email is required";
                          }
                        },
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.done,
                        hintText: 'E-mail',
                        controller: emailController
                    ),

                    SizedBox( height: SizeConfig.height * 0.07),

                    DefaultButton(
                        buttonText: 'Submit',
                        onPressed: (){
                          if(formKey.currentState!.validate()){
                            cubit.forgetPassword(email: emailController.text.trim());
                          }
                        },
                        buttonColor: ColorManager.primaryBlue,
                        large: true
                    ),

                    SizedBox( height: SizeConfig.height * 0.05),

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
