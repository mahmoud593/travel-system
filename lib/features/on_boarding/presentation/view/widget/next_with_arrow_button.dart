import 'package:flutter/material.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/styles/colors/color_manager.dart';

class NextWithArrowButtonWidget extends StatefulWidget {
  int currentIndex;
  PageController pageController;
    NextWithArrowButtonWidget({super.key,required this.currentIndex,required this.pageController});

  @override
  State<NextWithArrowButtonWidget> createState() => _NextWithArrowButtonWidgetState();
}

class _NextWithArrowButtonWidgetState extends State<NextWithArrowButtonWidget> {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: GestureDetector(
        onTap: (){
          setState(() {
            if(widget.currentIndex==3){}
            else{
              widget.currentIndex++;
              widget.pageController.nextPage(duration: const Duration(seconds: 2), curve: Curves.fastOutSlowIn);
            }
          });
        },
        child: Container(
          width: SizeConfig.width*.15,
          height: SizeConfig.height*.07,
          decoration: const BoxDecoration(
            color: ColorManager.primaryBlue,
            shape:  BoxShape.circle,
          ),
          child: Icon(Icons.arrow_right_alt_rounded,
            size: SizeConfig.height*.05,
            color: ColorManager.white,),
        ),
      ),
    );
  }
}
