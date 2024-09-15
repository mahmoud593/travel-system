import 'package:firebase_messaging/firebase_messaging.dart';

class NotificationHelper{

  final firebaseMessaging = FirebaseMessaging.instance;

  Future<void> notificationInit() async {
    await firebaseMessaging.requestPermission();
    final token = await firebaseMessaging.getToken();
    print(token);

    FirebaseMessaging.onBackgroundMessage(handleNotification);

  }

  Future<void> handleNotification(RemoteMessage message) async {
    print(message.data.toString());
  }
}