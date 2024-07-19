import 'package:flutter/material.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/core/helper/material_navigation.dart';
import 'package:travel_system/core/local/shared_preferences.dart';
import 'package:travel_system/features/on_boarding/presentation/view/screen/on_boarding_screen.dart';
import 'package:travel_system/styles/colors/color_manager.dart';

import '../../../home_layout/presentation/view/home_layout_screen/screens/home_layout_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    UserDataFromStorage.getData();
    FlutterNativeSplash.remove();
    timeDelay(context: context);    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: SizeConfig.height,
        width:  SizeConfig.width,
        decoration:  BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [ColorManager.lightBlue, ColorManager.primaryBlue],
            stops:  [0.0, 1.0],
          ),
        ),
        child: Center(
          child: Image.asset('assets/images/logo.png',
            height: SizeConfig.height*.3,
          ),
        ),
      ),
    );
  }

  void timeDelay({required BuildContext context})  {
    Future.delayed(const Duration(seconds: 3),()
    async{
      if(UserDataFromStorage.userIsLogin == true ){
        customPushAndRemoveUntil(context,const HomeLayoutScreen());
      }else{
        customPushAndRemoveUntil(context, const OnBoarding());

      }
    });

}
}