import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_system/core/constants/constants.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/features/auth/presentaion/cubit/auth_cubit/auth_cubit.dart';
import 'package:travel_system/styles/colors/color_manager.dart';
import 'package:travel_system/styles/text_styles/text_styles.dart';

class AircraftGridviewWidget extends StatefulWidget {
  const AircraftGridviewWidget({super.key});

  @override
  State<AircraftGridviewWidget> createState() => _AircraftGridviewWidgetState();
}

class _AircraftGridviewWidgetState extends State<AircraftGridviewWidget> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit= AuthCubit.get(context);
        return Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Aircrafts",
                  style: TextStyles.textStyle18Medium
                      .copyWith(color: ColorManager.black),
                ),
              ),
            ),
            GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: Constants.airCraftsModel.length,
              itemBuilder: (context, int index) {
                return CheckboxListTile(
                  contentPadding: EdgeInsets.zero,
                  title: Text(Constants.airCraftsModel[index].toString()),
                  activeColor: ColorManager.primaryBlue,
                  checkColor: ColorManager.white,
                  value: cubit.selectedAirCrafts.contains(Constants.airCraftsModel[index]),
                  onChanged: (value) {
                    setState(() {
                      if (value == true) {
                        cubit.selectedAirCrafts.add(Constants.airCraftsModel[index]);
                      } else {
                        cubit.selectedAirCrafts.remove(Constants.airCraftsModel[index]);
                      }
                    });
                  },
                  controlAffinity: ListTileControlAffinity.leading,
                );
              },
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisExtent: SizeConfig.height * .06,
              ),
            ),
          ],
        );
      },
    );
  }
}
