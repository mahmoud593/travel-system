import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/core/helper/material_navigation.dart';
import 'package:travel_system/features/auth/presentaion/cubit/auth_cubit/auth_cubit.dart';
import 'package:travel_system/features/auth/presentaion/view/widgets/login_form.dart';
import 'package:travel_system/features/home_layout/presentation/view/home_layout_screen/screens/home_layout_screen.dart';
import 'package:travel_system/styles/colors/color_manager.dart';
import 'package:travel_system/styles/text_styles/text_styles.dart';
import 'package:travel_system/styles/widets/toast.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
     return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
         if (state is LoginSuccess) {
          customPushAndRemoveUntil(context, const HomeLayoutScreen());

        }
         else if (state is LoginFailure) {
           customToast(title: "Invalid email or password", color: ColorManager.error);
         }
      }, builder: (BuildContext context, AuthState state) {
        return ModalProgressHUD(
          inAsyncCall: state is LoginLoading,
          progressIndicator: const CupertinoActivityIndicator(),
          child: Scaffold(
            backgroundColor: ColorManager.primaryBlue,

            body: SingleChildScrollView(
              child: Container(
                height: SizeConfig.height,
                width: SizeConfig.width,
                decoration: const BoxDecoration(
                  // color: ColorManager.primaryBlue,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      opacity: .4,
                      image: NetworkImage('https://img.freepik.com/premium-photo/travel-world-monument-concept_1097408-13.jpg?w=740'),
                    )
                ),
                child: Stack(
                  children: [
                    Positioned(
                      top: SizeConfig.height * .4,
                      bottom: SizeConfig.height * .001,
                      child: Container(
                        width: SizeConfig.width,
                        decoration: BoxDecoration(
                          color: ColorManager.white,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(SizeConfig.height * .07),
                            topRight: Radius.circular(SizeConfig.height * .07),
                          ),
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SizedBox(
                                height: MediaQuery.sizeOf(context).height * .015,
                              ),
                              Text(
                                "Login",
                                style: TextStyles.textStyle24Bold.copyWith(
                                    color: ColorManager.black,
                                    fontSize:
                                    MediaQuery.sizeOf(context).height * .033),
                              ),
                              SizedBox(
                                height: MediaQuery.sizeOf(context).height * .01,
                              ),
                              Text("Login to continue using the app ",
                                  style: TextStyles.textStyle18Medium.copyWith(
                                    color: ColorManager.darkGrey.withOpacity(.4),
                                  )),
                              SizedBox(
                                height: MediaQuery.sizeOf(context).height * .03,
                              ),

                              /// Register Form
                              const LoginForm()
                            ],
                          ),
                        ),
                      ),
                    ),

                    /// Plane Image
                    Positioned(
                      top: SizeConfig.height * .08,
                      child: Image.asset(
                        "assets/images/airplane2.png",
                        height: SizeConfig.height * .25,
                        width: SizeConfig.width * 1,
                      ),
                    ),
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
