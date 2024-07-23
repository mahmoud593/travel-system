import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/core/helper/material_navigation.dart';
import 'package:travel_system/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:travel_system/features/chat/presentation/view/screens/chat_screen.dart';
import 'package:travel_system/styles/colors/color_manager.dart';
import 'package:travel_system/styles/text_styles/text_styles.dart';

class ChatCard extends StatelessWidget {
  const ChatCard({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        var cubit = ChatCubit.get(context);
        return InkWell(
          onTap: () {
            cubit.getMessages().then((value){
              customPushNavigator(context, const ChatScreen());
            });
          },
          child: Container(
            height: SizeConfig.height * 0.1,
            width: SizeConfig.width,
            decoration: BoxDecoration(
              color: ColorManager.primaryBlue,
              borderRadius: BorderRadius.circular(SizeConfig.height * 0.02),
            ),
            child: Padding(
              padding: EdgeInsets.all(SizeConfig.height * 0.02),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  /// User Image
                  CircleAvatar(
                    radius: SizeConfig.height * 0.03,
                    backgroundImage: AssetImage('assets/images/profile.png'),
                  ),
                  SizedBox(
                    width: SizeConfig.height * 0.02,
                  ),

                  /// User Name
                  Column(
                    children: [
                      Text(
                        'Ahmed Ali',
                        style: TextStyles.textStyle24Regular.copyWith(
                            color: ColorManager.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
