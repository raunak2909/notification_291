import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class NotificationHelper {
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();


  void initializeNotificationManager() {
    // Android
    AndroidInitializationSettings initializationSettingsAndroid =
        AndroidInitializationSettings('app_icon');

    // iOS
    DarwinInitializationSettings initializationSettingsIOS =
    DarwinInitializationSettings();

    // Android

    InitializationSettings initializationSettings = InitializationSettings(
      android: initializationSettingsAndroid,
      iOS: initializationSettingsIOS,
    );

    flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()!.requestNotificationsPermission();

    flutterLocalNotificationsPlugin.initialize(initializationSettings, onDidReceiveNotificationResponse: (details){
      /// do your work when the notification is tapped

    });
  }

  void notifyMessage({required String title, required String body}) {

    NotificationDetails notificationDetails = NotificationDetails(
      android: AndroidNotificationDetails("Test", "Test Channel", importance: Importance.high),
      iOS: DarwinNotificationDetails(),
    );

    flutterLocalNotificationsPlugin.show(1, title, body, notificationDetails);
  }

  ///periodically
  ///scheduled
}
