import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/core/helper/material_navigation.dart';
import 'package:travel_system/features/auth/presentaion/cubit/auth_cubit/auth_cubit.dart';
import 'package:travel_system/features/auth/presentaion/view/screens/login/login.dart';
import 'package:travel_system/features/auth/presentaion/view/widgets/logo_in_circular_avatar.dart';
import 'package:travel_system/features/auth/presentaion/view/widgets/register_form.dart';
import 'package:travel_system/features/home_layout/presentation/view/home_layout_screen/screens/home_layout_screen.dart';
import 'package:travel_system/styles/colors/color_manager.dart';
import 'package:travel_system/styles/text_styles/text_styles.dart';
import 'package:travel_system/styles/widets/app_bar_without_height_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
         if (state is RegisterSuccess) {
          customPushAndRemoveUntil(context, const HomeLayoutScreen());
        }
      },
      builder: (BuildContext context, AuthState state) {
        return ModalProgressHUD(
          inAsyncCall: state is RegisterLoading,
          progressIndicator: const CupertinoActivityIndicator(),
          child: Scaffold(
            backgroundColor: ColorManager.primaryBlue,
            body: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.cover,
                    opacity: .4,
                    image: NetworkImage('https://img.freepik.com/premium-photo/travel-world-monument-concept_1097408-13.jpg?w=740'),
                  )              ),
              child: Column(
                children: [
                  /// Back Icon Button
                  Container(
                    alignment: Alignment.centerLeft,
                    margin: EdgeInsets.zero,
                    padding: EdgeInsets.only(
                      left: SizeConfig.height * 0.025,
                      top:  SizeConfig.height * 0.025,
                    ),
                    height: SizeConfig.height * 0.12,
                    // color: Colors.transparent,
                    child: GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: const Icon(
                        Icons.arrow_back_ios,
                        color: ColorManager.white,
                      ),
                    ),
                  ),
                  /// Plan Image
                  SizedBox(
                    height: SizeConfig.height * .15,
                    width: SizeConfig.width,
                    child: Image.asset(
                      "assets/images/airplane.png",
                      fit: BoxFit.contain,
                    ),
                  ),
                  /// White Container with Register Form
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                          horizontal: SizeConfig.height * 0.001,
                      ),
                      clipBehavior: Clip.antiAliasWithSaveLayer,
                      height: SizeConfig.height * 0.85,
                      decoration: BoxDecoration(
                        color: ColorManager.white,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(SizeConfig.height * .07),
                          topRight: Radius.circular(SizeConfig.height * .07),
                        ),
                      ),
                      child: const SingleChildScrollView(
                        child: Padding(
                          padding: EdgeInsets.all(20.0),
                          child: RegisterForm(),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}