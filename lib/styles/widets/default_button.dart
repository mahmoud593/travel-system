import 'package:flutter/material.dart';
import 'package:travel_system/styles/text_styles/text_styles.dart';


class DefaultButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onPressed;
  double? width;
  final Color buttonColor;
  bool large;

   DefaultButton({
    Key? key,
    required this.buttonText,
    required this.onPressed,
    this.width = double.infinity,
    required this.buttonColor,
     required this.large,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      height: MediaQuery.sizeOf(context).height*0.065,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(MediaQuery.sizeOf(context).height*0.04),
        color: buttonColor,
      ),

      child: MaterialButton(
        onPressed: onPressed,
        child: Text(
          buttonText,
          style: large?TextStyles.textStyle18Medium:TextStyles.textStyle18Medium,
        ),
      ),
    );
  }
}

