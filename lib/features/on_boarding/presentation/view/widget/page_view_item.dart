import 'package:flutter/material.dart';
import 'package:travel_system/core/constants/constants.dart';
import 'package:travel_system/styles/colors/color_manager.dart';
import 'package:travel_system/styles/text_styles/text_styles.dart';



class PageViewItem extends StatelessWidget {
  final int index;
  const PageViewItem({super.key,required this.index});

  @override
  Widget build(BuildContext context) {

    Size size =MediaQuery.of(context).size;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox( height: size.height*.1),
        /// image
        Align(
          alignment: Alignment.center,
          child: Image.asset(
              Constants.onBoardingScreens[index].image,
              height: size.height*.35
          ),
        ),
        SizedBox( height: size.height*.05),
        /// Title
        Text(
          Constants.onBoardingScreens[index].title,
          style: TextStyles.textStyle24Bold.copyWith(
            color: ColorManager.primaryBlue,
          ),
        ),
         SizedBox(height: size.height*.05),
        /// content
        Text(
            Constants.onBoardingScreens[index].content,
            style: TextStyles.textStyle18Medium.copyWith(
              color: ColorManager.darkGrey.withOpacity(.6),
            ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
