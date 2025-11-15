import 'dart:developer';
import 'dart:io';

import 'package:banking/shared/helper/local_notification.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class FirebaseService {
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final LocalNotificationService _localNotificationService = LocalNotificationService();

  Future<void> init() async {
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    log('User granted permission: ${settings.authorizationStatus}');

    // Register foreground message handler
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      log('Got a message whilst in the foreground!');
      log('Message data: ${message.data}');
      log('Message data: ${message.notification!.body}');
      log('Message data: ${message.notification!.title}');

      if (message.notification != null) {
        _localNotificationService.show(
          id: message.hashCode,
          title: message.notification!.title ?? 'Notification',
          body: message.notification!.body ?? '',
          payload: ''
        );
        log('Message also contained a notification: ${message.notification}');
      }
    });

    FirebaseMessaging.onMessageOpenedApp.listen((RemoteMessage message) {
      log('Message clicked!');
    });
  }

  Future<String?> getToken() async {
    String? token;
    try {
      if (Platform.isAndroid) {
        log('Getting FCM token for Android');
        token = await _messaging.getToken();
      } else if (Platform.isIOS) {
        log(
          'Getting APNs token for iOS',
        );
        token = await _messaging.getAPNSToken();
      }
      return token;
    } catch (e) {
      return null;
    }
  }
}
