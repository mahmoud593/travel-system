import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_system/core/constants/constants.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/core/helper/material_navigation.dart';
import 'package:travel_system/features/auth/presentaion/cubit/auth_cubit/auth_cubit.dart';
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
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if(state is RegisterSuccess){
          AuthCubit.get(context).registerPasswordController.clear();
          AuthCubit.get(context).registerEmailController.clear();
          AuthCubit.get(context).userNameController.clear();
          AuthCubit.get(context).phoneNumberController.clear();
          AuthCubit.get(context).payrollNumberController.clear();
        }
      },
      builder: (context, state) {
        var cubit = AuthCubit.get(context);
        return Form(
          key: cubit.signUpFormKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                "Sign Up",
                style: TextStyles.textStyle24Bold.copyWith(
                    color: ColorManager.black,
                    fontSize: MediaQuery.sizeOf(context).height * .033),
              ),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .01,
              ),
              Text("Enter Your Personal Information",
                  style: TextStyles.textStyle18Medium.copyWith(
                    color: ColorManager.darkGrey.withOpacity(.4),
                  )),
              SizedBox(
                height: MediaQuery.sizeOf(context).height * .03,
              ),

              /// User name
              AuthTextFormField(
                hintText: "Name",
                controller: cubit.userNameController,
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
                hintText: "E-mail",
                controller: cubit.registerEmailController,
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
                hintText: "Phone Number",
                controller: cubit.phoneNumberController,
                validator: (value) {
                  if(!value!.startsWith('+')){
                    return "please enter your phone number start with +";
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
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F8FA),
                  borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height*0.01),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    hint: Text('Beas',style: TextStyles.textStyle18Regular
                        .copyWith(color: ColorManager.darkGrey.withOpacity(.5)),),
                    icon: const Icon(Icons.arrow_drop_down),
                    elevation: 5,
                    padding: EdgeInsets.only(left: SizeConfig.height * 0.01,),
                    dropdownColor: Colors.white,
                    value:cubit.base,
                    style: TextStyles.textStyle18Regular.copyWith(color: ColorManager.darkGrey.withOpacity(.5)),
                    onChanged: (String? newValue) {
                      cubit.setBeasDropDownValue(value: newValue);
                    },
                    items: cubit.baseList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, style: TextStyles.textStyle18Regular.copyWith(color: ColorManager.black.withOpacity(.5)),),
                      );
                    }).toList(),
                  ),
                ),
              ),

              SizedBox(
                height: SizeConfig.height * .01,
              ),

              /// rank
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFFF7F8FA),
                  borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height*0.01),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    hint: Text('Rank',style: TextStyles.textStyle18Regular
                        .copyWith(color: ColorManager.darkGrey.withOpacity(.5)),),
                    icon: const Icon(Icons.arrow_drop_down),
                    elevation: 5,
                    padding: EdgeInsets.only(left: SizeConfig.height * 0.01,),
                    dropdownColor: Colors.white,
                    value:cubit.rank,
                      style: TextStyles.textStyle18Regular.copyWith(color: ColorManager.darkGrey.withOpacity(.5)),
                    onChanged: (String? newValue) {
                      cubit.setRankDropDownValue(value: newValue);
                    },
                    items: cubit.ranksList
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value, style: TextStyles.textStyle18Regular.copyWith(color: ColorManager.black.withOpacity(.5)),),
                      );
                    }).toList(),
                  ),
                ),
              ),
              SizedBox(
                height: SizeConfig.height * .01,
              ),

              /// PayRoll number
              AuthTextFormField(
                hintText: "Payroll Number",
                controller: cubit.payrollNumberController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "payroll number is required";
                  }
                  return null;
                },
                keyboardType: TextInputType.number,
                textInputAction: TextInputAction.next,
              ),

              SizedBox(
                height: SizeConfig.height * .01,
              ),

              /// air craft models
              const AircraftGridviewWidget(),

              /// Password
              AuthTextFormField(
                isPassword: true,
                withSuffix: true,
                hintText: "Password",
                controller: cubit.registerPasswordController,
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
                  buttonText: "Sign up",
                  onPressed: () {
                    if (cubit.signUpFormKey.currentState!.validate()) {
                      cubit.register(
                          email: cubit.registerEmailController.text,
                          password: cubit.registerPasswordController.text,
                          userName: cubit.userNameController.text,
                          phoneNumber: cubit.phoneNumberController.text,
                          beasNumber: cubit.base!,
                          rank: cubit.rank!,
                          payRollNumber: cubit.payrollNumberController.text,
                          airCrafts: cubit.selectedAirCrafts);
                    }
                  },
                  buttonColor: ColorManager.primaryBlue,
                  large: false),

              SizedBox(
                height: SizeConfig.height * .01,
              ),
              Align(
                alignment:  Alignment.center,
                  child: Text("Or ",
                      style: TextStyles.textStyle18Bold.copyWith(
                        color: ColorManager.black,
                      ))),
              SizedBox(
                height: SizeConfig.height * .01,
              ),
              DefaultButton(
                  width: SizeConfig.width,
                  buttonText: "Login",
                  onPressed: () {
                    customPushNavigator(context, const LoginScreen());
                  },
                  buttonColor: ColorManager.black,
                  large: false),
            ],
          ),
        );
      },
    );
  }
}
