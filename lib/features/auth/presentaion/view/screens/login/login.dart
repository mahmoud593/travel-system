import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:travel_system/core/helper/material_navigation.dart';
import 'package:travel_system/features/auth/presentaion/cubit/login_cubit/login_cubit.dart';
import 'package:travel_system/features/auth/presentaion/view/widgets/login_form.dart';
import 'package:travel_system/features/auth/presentaion/view/widgets/logo_in_circular_avatar.dart';
import 'package:travel_system/features/home_layout/presentation/view/home_layout_screen/screens/home_layout_screen.dart';
import 'package:travel_system/styles/colors/color_manager.dart';
import 'package:travel_system/styles/text_styles/text_styles.dart';
import 'package:travel_system/styles/widets/app_bar_without_height_widget.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    bool isLoading = false;
    return BlocListener<LoginCubit, LoginState>(
  listener: (context, state) {
    if(state is LoginLoading){
      isLoading = true;
    }else if(state is LoginSuccess){
      customPushAndRemoveUntil(context, const HomeLayoutScreen());
    }
  },
  child: ModalProgressHUD(
      inAsyncCall: isLoading,
    progressIndicator:  const CupertinoActivityIndicator(),
      child: Scaffold(
        appBar:  appBarWithoutHeightWidget(),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment:  CrossAxisAlignment.stretch,
              children: [
                /// logo
                const LogoInCircularAvatar(),
                SizedBox( height: MediaQuery.sizeOf(context).height*.03,),
                Text("Login",style: TextStyles.textStyle24Bold.copyWith(color: ColorManager.black,fontSize: MediaQuery.sizeOf(context).height*.033),),
                SizedBox( height: MediaQuery.sizeOf(context).height*.01,),
                Text("Login to continue using the app ",style: TextStyles.textStyle18Medium.copyWith(color: ColorManager.darkGrey.withOpacity(.4),)),
                SizedBox( height: MediaQuery.sizeOf(context).height*.03,),
                /// Login Form
                const LoginForm()
              ],
            ),
          ),
        ),
      ),
    ),
);
  }
}
