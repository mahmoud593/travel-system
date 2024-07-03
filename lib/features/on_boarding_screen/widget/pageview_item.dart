import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:travel_system/core/constants/constants.dart';
import 'package:travel_system/styles/colors/color_manager.dart';



class PageViewItem extends StatelessWidget {
  int index;
  PageViewItem({super.key,required this.index});

  @override
  Widget build(BuildContext context) {

    Size size =MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox( height: size.height*.05),
        Align(
          alignment: Alignment.center,
          child: Lottie.asset(
              Constants.onBoardingScreens[index].image,
              height: size.height*.35
          ),
        ),
        SizedBox( height: size.height*.05),
        Text(
          Constants.onBoardingScreens[index].title,
          style: TextStyle(
              color: ColorManager.black,
              fontSize: size.height*.035,
              fontWeight: FontWeight.w600
          ),
        ),
        const SizedBox(height: 15,),
        Text(
            Constants.onBoardingScreens[index].content,
            style: const TextStyle(
            color: ColorManager.gray,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
