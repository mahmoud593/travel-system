import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:travel_system/core/helper/app_size_config.dart';
import 'package:travel_system/core/local/shared_preferences.dart';
import 'package:travel_system/features/chat/presentation/cubit/chat_cubit.dart';
import 'package:travel_system/styles/colors/color_manager.dart';
import 'package:intl/intl.dart' as intl;
import 'package:travel_system/styles/widets/toast.dart';

class SendMessageContainer extends StatefulWidget {
    String messageContent = "";
      SendMessageContainer({super.key, required this.messageContent});

  @override
  State<SendMessageContainer> createState() => _SendMessageContainerState();
}

class _SendMessageContainerState extends State<SendMessageContainer> {
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatCubit, ChatState>(
      listener: (context, state) {},
      builder: (context, state) {
        var cubit = ChatCubit.get(context);
        return Container(
          height: SizeConfig.height * 0.09,
          decoration: const BoxDecoration(
            color: ColorManager.primaryBlue,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(20),
              topRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: SizedBox(
                    height: SizeConfig.height * 0.06,
                    child: TextFormField(
                      textInputAction:  TextInputAction.send,
                      onFieldSubmitted: (value) {
                        if(cubit.messageController.text.trim().isNotEmpty){
                          cubit.uploadMessageToFireBase(
                              messageContent: value.trim(),
                              senderId: UserDataFromStorage.userId,
                              userName: UserDataFromStorage.userName,
                              userImage: "userImage",
                              time: intl.DateFormat('hh:mm a')
                                  .format(DateTime.now()),
                              dateTime: intl.DateFormat('yyyy-MM-dd')
                                  .format(DateTime.now()))
                              .then((value) {
                            cubit.messageController.clear();
                          });
                        }
                      },
                      controller: cubit.messageController,
                      cursorColor: ColorManager.primaryBlue,
                      maxLines: 5,
                      decoration: const InputDecoration(
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          contentPadding: EdgeInsets.symmetric(horizontal: 20.0,vertical: 8),
                          hintText: "Type a Message",
                          border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.white),
                            borderRadius: BorderRadius.all(Radius.circular(30)),
                          ),
                          filled: true,
                          fillColor: Colors.white),
                    ),
                  ),
                ),
                SizedBox(
                  width: SizeConfig.height * 0.01,
                ),
                InkWell(
                  onTap: () {
                    if(cubit.messageController.text.trim().isNotEmpty){
                      cubit.uploadMessageToFireBase(
                          messageContent: widget.messageContent=cubit.messageController.text.trim(),
                          senderId: UserDataFromStorage.userId,
                          userName: "userName",
                          userImage: "userImage",
                          time: intl.DateFormat('hh:mm a')
                              .format(DateTime.now()),
                          dateTime: intl.DateFormat('yyyy-MM-dd')
                              .format(DateTime.now()))
                          .then((value) {
                        cubit.messageController.clear();
                      });
                    }
                  },
                  child: Icon(
                    Icons.send,
                    size: SizeConfig.height * 0.035,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
