import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:travel_system/features/chat/presentation/view/widgets/send_message_container.dart';
import 'package:travel_system/features/chat/presentation/view/widgets/sender_message.dart';
import 'package:travel_system/styles/colors/color_manager.dart';
import 'package:travel_system/styles/text_styles/text_styles.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        var cubit = ChatCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          appBar: AppBar(
            titleSpacing: 0.0,
            iconTheme:  const IconThemeData(
              color: ColorManager.primaryBlue,
            ),
            title: Row(
              children: [

                /// User Image
                CircleAvatar(
                  radius: SizeConfig.height * 0.025,
                  backgroundImage: const AssetImage('assets/images/profile.png'),
                ),
                SizedBox(
                  width: SizeConfig.height * 0.01,
                ),
                /// User Name
                Column(
                  children: [
                    Text(
                      'Ahmed Ali',
                      style: TextStyles.textStyle24Regular.copyWith(
                          color: ColorManager.black, fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ],
            ),
          ),
          body: ModalProgressHUD(
            inAsyncCall: state is GetMessageLoading,
            progressIndicator: const CupertinoActivityIndicator(
              color: ColorManager.primaryBlue,
            ) ,
            color: Colors.transparent,
            blur:  0.5,
            opacity:  0.5,
            child: Column(
              children: [
                /// chat body
                Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return SenderMessage(messageContent: cubit.messages[index].message,);
                    },
                    separatorBuilder: (context, index) =>
                        SizedBox(height: SizeConfig.height * 0.01),
                    itemCount: cubit.messages.length,
                  ),
                ),

                /// send message text field with send button
                SendMessageContainer(messageContent:cubit.messageController.text,),
              ],
            ),
          ),
        );
      },
    );
  }
}
