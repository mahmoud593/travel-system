import 'package:flutter/material.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/core/helper/material_navigation.dart';
import 'package:travel_system/features/on_boarding/presentation/view/screen/on_boarding_screen.dart';
import 'package:travel_system/styles/colors/color_manager.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();

}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    timeDelay(context: context);
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
      customPushAndRemoveUntil(context, const OnBoarding());
    });

}
}