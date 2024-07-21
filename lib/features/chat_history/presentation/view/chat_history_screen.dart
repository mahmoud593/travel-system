import 'package:flutter/material.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/features/chat_history/presentation/widgets/chat_card.dart';
import 'package:travel_system/styles/colors/color_manager.dart';
import 'package:travel_system/styles/text_styles/text_styles.dart';

class ChatHistoryScreen extends StatelessWidget {
  const ChatHistoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'Chat',
            style: TextStyles.textStyle24Regular.copyWith(
                fontSize: SizeConfig.height * 0.03,
                color: ColorManager.primaryBlue),
          ),
          centerTitle: false,
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return const ChatCard();
              },
              separatorBuilder: (context, index) {
                return SizedBox(height: SizeConfig.height * 0.01);
              },
              itemCount: 2),
        ));
  }
}
