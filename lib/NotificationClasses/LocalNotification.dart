import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class localnotification{
  static FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
  FlutterLocalNotificationsPlugin();



  static showNotification(String a,String b) async {
    var android = new AndroidNotificationDetails(
        'id', 'channel ', 'description',
        priority: Priority.High, importance: Importance.Max);
    var iOS = new IOSNotificationDetails();
    var platform = new NotificationDetails(android, iOS);
    await flutterLocalNotificationsPlugin.show(
        0, a, b, platform,
        payload: 'Welcome to the Local Notification demo ');
  }

}