import 'dart:async';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:travel_system/core/constants/constants.dart';
import 'package:travel_system/core/helper/friebase_api.dart';
import 'package:travel_system/core/local/shared_preferences.dart';
import 'package:travel_system/features/chat/data/chat_repo/chat_repo.dart';
import 'package:travel_system/features/chat/data/model/message_model.dart';

class ChatRepoImplement extends ChatRepo {
  @override
  Future<void> uploadMessageToFireBase(
      {required String message,
      required String senderId,
      required String userName,
      required String userImage,
      required String time,
      required String dateTime}) async {
    DatabaseReference databaseReference = Constants.database
        .child('Users')
        // .child(UserDataFromStorage.userId).child('Messages')
        .child(UserDataFromStorage.userId)
        .child('Messages').push();
    MessageModel messageModel = MessageModel(
        message: message,
        senderId: senderId,
        userName: userName,
        userImage: userImage,
        time: time,
        dateTime: dateTime,
        messageId: databaseReference.key!);
    databaseReference.set(messageModel.toJson());
  }

  @override
  Future<List<MessageModel>> getMessages() async {
    List<MessageModel> messages = [];
    DatabaseReference databaseReference=  Constants.database.child('Users')
        .child(UserDataFromStorage.userId)
        .child('Messages');
   databaseReference.onValue.listen((event)  {
          debugPrint("valueee ${event.snapshot.value}");
           event.snapshot.children.forEach((element) {
             messages.add(MessageModel.fromJson(element.value as Map));
           });
        });
  return messages;
  }

//   Future<List<MessageModel>> getMessages() async {
//     List<MessageModel> messages = [];
//     await Constants.database.child('Users')
//         .child('0840RkDvzjYURonub6lyoO00TpC3')
//         .child('Messages')
//         .once()
//         .then((event) {
//       if (event.snapshot.value != null) {
//         final data = event.snapshot.value as Map;
//         data.forEach((key, value) {
//           messages.add(MessageModel.fromJson(value as Map<dynamic, dynamic>));
//         });
//       }
//     });
//     return messages;
//   }


}
