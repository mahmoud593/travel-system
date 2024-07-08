import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/styles/colors/color_manager.dart';
import 'package:travel_system/styles/text_styles/text_styles.dart';

class AuthTextFormField extends StatefulWidget {
  final String labelText;
  final String hintText;
  TextInputAction textInputAction;
  FormFieldValidator validator;
  TextInputType keyboardType;
  bool withSuffix;
  bool isPassword;
  bool viewPassword;
  IconData? suffixIcon;
  final TextEditingController controller;

  AuthTextFormField(
      {this.withSuffix = false,
      this.isPassword = false,
      this.viewPassword = true,
      this.suffixIcon,
      required this.validator,
      required this.keyboardType,
      required this.textInputAction,
      required this.labelText,
      required this.hintText,
      required this.controller,
      super.key});

  @override
  State<AuthTextFormField> createState() => _AuthTextFormFieldState();
}

class _AuthTextFormFieldState extends State<AuthTextFormField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            widget.labelText,
            style: TextStyles.textStyle18Medium
                .copyWith(color: ColorManager.black),
          ),
        ),
        SizedBox(
          height: SizeConfig.height * .01,
        ),
        TextFormField(
          controller: widget.controller,
          textInputAction: widget.textInputAction,
          keyboardType: widget.keyboardType,
          textDirection: TextDirection.ltr,
          validator: widget.validator,
          obscureText: widget.isPassword?widget.viewPassword:false,

          decoration: InputDecoration(
            enabled: true,
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(25.0),
                borderSide: const BorderSide(color: Colors.yellow)),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(25.0),
              borderSide: const BorderSide(
                color: Color(0xFFF0F2F7),
              ),
            ),
            filled: true,
            contentPadding: const EdgeInsets.all(15.0),
            hintStyle: TextStyles.textStyle18Regular
                .copyWith(color: ColorManager.darkGrey.withOpacity(.5)),
            hintText: widget.hintText,
            fillColor: const Color(0xFFF7F8FA),
            suffixIcon: widget.withSuffix==true ?
            IconButton(
              onPressed: () {
                setState(() {
                  widget.viewPassword = !widget.viewPassword;
                });
              },
              icon: widget.viewPassword == false
                  ? const Icon(
                Icons.visibility_outlined,
                color: Colors.grey,
              )
                  : const Icon(
                Icons.visibility_off_outlined,
                color: Colors.grey,
              ),
            ) :null,
          ),
          style: TextStyles.textStyle18Regular.copyWith(color: ColorManager.black),
        ),
      ],
    );
  }
}
