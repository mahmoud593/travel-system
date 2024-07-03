
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/features/on_boarding_screen/widget/pageview_item.dart';
import 'package:travel_system/styles/colors/color_manager.dart';
import 'package:travel_system/styles/text_styles/text_styles.dart';


class OnBoarding extends StatefulWidget {

  const OnBoarding({super.key});

  @override
  State<OnBoarding> createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  var pageController=PageController();
  int currentIndex=1;
  late Timer timer;

  @override
  void initState() {

    timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      Future.delayed(const Duration(seconds: 7),(){
        if(currentIndex==3){
        }
        else{
          currentIndex++;
          pageController.nextPage(duration: const Duration(seconds: 3), curve: Curves.fastOutSlowIn);
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    timer.cancel();
    pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(
            horizontal: MediaQuery.sizeOf(context).height*.035,
            vertical: MediaQuery.sizeOf(context).height*.035,
        ),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                physics: const BouncingScrollPhysics(),
                controller: pageController,
                onPageChanged: (val){

                },
                itemBuilder: (context,index){
                  return PageViewItem(index: index);
                },
                itemCount: 3 ,
              ),
            ),
            SmoothPageIndicator(
              controller: pageController,
              count: 3,
              effect: const JumpingDotEffect(
                  dotColor: ColorManager.gray,
                  activeDotColor: ColorManager.primaryBlue,
                  dotWidth: 12,
                  dotHeight: 12,
              ),

            ),
            SizedBox(height: size.height*.03,),


            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(onPressed: (){}, child: Text("Skip",style: TextStyles.textStyle18Medium.copyWith(
                  color: ColorManager.primaryBlue
                ),)),
                Container(
                  width: size.width*.15,
                  height: size.height*.07,
                  decoration: const BoxDecoration(
                    color: ColorManager.primaryBlue,
                    shape:  BoxShape.circle,
                  ),
                  child: Icon(Icons.arrow_right_alt_rounded,
                    size: SizeConfig.height*.05,
                    color: ColorManager.white,),
                ),

              ],
            ),
          ],
        ),
      ),
    );
  }
}