import 'package:flutter/material.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/features/chat/presentation/view/widgets/reciever_message.dart';
import 'package:travel_system/features/chat/presentation/view/widgets/send_message_container.dart';
import 'package:travel_system/features/chat/presentation/view/widgets/sender_message.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Chat"),
      ),
      body: Column(
        children: [
          /// chat body
          Expanded(
            child: ListView.separated(
              shrinkWrap: true,
              itemBuilder: (context, index) {
                return const Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SenderMessage(),
                    RecieverMessage(),
                  ],
                );
              },
              separatorBuilder: (context, index) =>   SizedBox(height: SizeConfig.height*0.01),
              itemCount: 3,
            ),
          ),
          /// send message text field with send button
          const SendMessageContainer(),
        ],
      ),
    );
  }
}
