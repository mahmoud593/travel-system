import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:travel_system/styles/colors/color_manager.dart';

class SenderMessage extends StatelessWidget {

  const SenderMessage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          /// message
          ChatBubble(
            clipper: ChatBubbleClipper9(type: BubbleType.sendBubble),
            backGroundColor: ColorManager.primaryBlue,
            child: Container(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width * 0.7,
              ),
              child: const Text(
                "sent message",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
          /// user pic
          const CircleAvatar(
            radius: 15,
            backgroundImage: AssetImage('assets/images/plane.png'),

          ),
        ],
      ),
    );
  }
}
