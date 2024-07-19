import 'package:travel_system/features/chat/data/model/message_model.dart';

abstract class ChatRepo{

  Future<void> uploadMessageToFireBase({
    required String message,
    required String senderId,
    required String userName,
    required String userImage,
    required String time,
    required String dateTime
  });

  Future<List<MessageModel>> getMessages();
}