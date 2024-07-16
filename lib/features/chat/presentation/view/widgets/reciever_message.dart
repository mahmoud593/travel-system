import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:travel_system/styles/colors/color_manager.dart';

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
