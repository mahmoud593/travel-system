import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';
import 'package:travel_system/features/chat/data/chat_repo_implement/chat_repo_implement.dart';
import 'package:travel_system/features/chat/data/model/message_model.dart';

part 'chat_state.dart';

class ChatCubit extends Cubit<ChatState> {
  ChatCubit() : super(ChatInitial());

  static ChatCubit get(context) => BlocProvider.of(context);
  TextEditingController messageController = TextEditingController();


  Future<void> uploadMessageToFireBase(
      {
        required String messageContent,
        required String senderId,
        required String userName,
        required String userImage,
        required String time,
        required String dateTime
      }) async {
   try{
     emit(SendMessageLoading());
     await ChatRepoImplement().uploadMessageToFireBase(
       message: messageContent,
       senderId: senderId,
       userName: userName,
       userImage: userImage,
       time: time,
       dateTime: dateTime
     ).then((value){
       getMessages();
     });
     debugPrint("====================> Message Uploaded");
     emit(SendMessageSuccess());
   } catch(error){
     print(error.toString());
     emit(SendMessageError());
   }
  }

  MessageModel? messageModel;
  List<MessageModel> messages = [];

  Future<void> getMessages() async {
    try {
      messages = [];
      emit(GetMessageLoading());
      await ChatRepoImplement().getMessages().then((value){
        debugPrint("==================== value  $value");
        messages = value;
      });
      debugPrint("==================== message list $messages");
      emit(GetMessageSuccess());
    } catch (error) {
      print('Error in get messages: ${error.toString()}');
      emit(GetMessageError());
    }
  }

//     Future<void> getMessages() async {
//     try {
//       emit(GetMessageLoading());
//       final fetchedMessages = await ChatRepoImplement().getMessages();
//       messages = fetchedMessages;
//       debugPrint("==================== message list $messages");
//       emit(GetMessageSuccess());
//     } catch (error) {
//       print('Error in get messages: ${error.toString()}');
//       emit(GetMessageError());
//     }
//   }

}
