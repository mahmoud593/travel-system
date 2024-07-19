import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/core/local/shared_preferences.dart';
import 'package:travel_system/features/chat/data/model/message_model.dart';
import 'package:travel_system/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:travel_system/styles/colors/color_manager.dart';
class MessageWidget extends StatelessWidget {
  MessageModel message;

  MessageWidget(this.message, {super.key});

  @override
  Widget build(BuildContext context) {
    return "0840RkDvzjYURonub6lyoO00TpC3" == message.senderId
        ? SenderMessage(messageContent: message.message,)
        : const RecieverMessage();
  }
}
class SenderMessage extends StatelessWidget {
  String messageContent = "";

    SenderMessage({required this.messageContent, super.key});

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatState>(
  listener: (context, state) {},
  builder: (context, state) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          /// message
          ChatBubble(
            clipper: ChatBubbleClipper5(type: BubbleType.sendBubble),
            backGroundColor: ColorManager.primaryBlue,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7,
              ),
              child: Text(
                messageContent,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          ),
          SizedBox(width:  SizeConfig.width * 0.02,),
          /// user pic
          const CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage('assets/images/plane.png'),

          ),
        ],
      ),
    );
  },
);
  }
}

class RecieverMessage extends StatelessWidget {
  const RecieverMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage('assets/images/plane.png'),

          ),
          ChatBubble(
            clipper: ChatBubbleClipper9(type: BubbleType.receiverBubble),
            // alignment: Alignment.topLeft,
            // margin: const EdgeInsets.only(top: 20),
            backGroundColor: ColorManager.lightBlue,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7,
              ),
              child: const Text(
                "Recieved  message",
                style: TextStyle(color: Colors.black),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

