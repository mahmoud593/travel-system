class MessageModel {
  final String messageId;
  final String message;
  final String userImage;
  final String userName;
  final String dateTime;
  final String time;
  final String senderId;

  MessageModel({
    required this.message,
    required this.senderId,
    required this.messageId,
    required this.userImage,
    required this.userName,
    required this.time,
    required this.dateTime,
  });

  MessageModel.fromJson(Map<dynamic, dynamic> json)
      : this(
          messageId: json['messageId'] ?? '',
          message: json['message'] ?? '',
          senderId: json['senderId'] ?? '',
          userImage: json['userImage'] ?? '',
          userName: json['userName'] ?? '',
          time: json['time'] ?? '',
          dateTime: json['dateTime'] ?? '',
        );

  Map<String, dynamic> toJson() => {
        'messageId': messageId,
        'message': message,
        'senderId': senderId,
        'userImage': userImage,
        'userName': userName,
        'time': time,
        'dateTime': dateTime
      };
}
