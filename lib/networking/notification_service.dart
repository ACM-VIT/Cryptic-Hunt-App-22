import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FCM {
  FirebaseMessaging messaging = FirebaseMessaging.instance;
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
      FlutterLocalNotificationsPlugin();

  AndroidNotificationChannel channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.max,
  );

  FCM() {
    init();
  }

  void init() async {
    await FirebaseMessaging.instance.getToken();
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      // Parse the message received
      // PushNotification notification = PushNotification(
      //   title: message.notification?.title,
      //   body: message.notification?.body,
      // );
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      // If `onMessage` is triggered with a notification, construct our own
      // local notification to show to users using the created channel.
      if (notification != null && android != null) {
        flutterLocalNotificationsPlugin.show(
            notification.hashCode,
            notification.title,
            notification.body,
            NotificationDetails(
              android: AndroidNotificationDetails(
                channel.id,
                channel.name,

                icon: "app_icon",
                // other properties...
              ),
            ));
      }

      print("-------------Notification-------------");
      print(message.notification?.title);
      print(message.notification?.body);
    });
  }

  void test() {
    flutterLocalNotificationsPlugin.show(
        123456,
        " gvhbjnk",
        "gbhnjmk",
        NotificationDetails(
          android: AndroidNotificationDetails(
            channel.id,
            channel.name,

            icon: "ic_launcher",
            // other properties...
          ),
        ));
  }
}
