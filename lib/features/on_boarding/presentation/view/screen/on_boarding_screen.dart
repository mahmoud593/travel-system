import 'dart:async';
import 'package:flutter/material.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:travel_system/features/on_boarding/presentation/view/widget/next_with_arrow_button.dart';
import 'package:travel_system/features/on_boarding/presentation/view/widget/page_view_item.dart';
import 'package:travel_system/features/on_boarding/presentation/view/widget/skip_button_widget.dart';
import 'package:travel_system/styles/colors/color_manager.dart';

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
    super.initState();
    timeDelay();
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
            /// page view
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
            /// Page indicator
            SmoothPageIndicator(
              controller: pageController,
              count: 3,
              effect: const JumpingDotEffect(
                  dotColor: ColorManager.gray,
                  activeDotColor: ColorManager.primaryBlue,
                  dotWidth: 20,
                  dotHeight: 5,
              ),

            ),
            SizedBox(height: size.height*.03,),
            /// next and skip
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                /// Skip Button
                const SkipButtonWidget(),
                 /// Next Button
                 NextWithArrowButtonWidget(
                  currentIndex: currentIndex,
                  pageController: pageController,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
  void timeDelay()async{
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
  }
}

