// SHA1: EE:2A:D5:5A:8C:2F:F7:6E:83:89:17:A2:FE:AC:BF:88:29:0B:D3:96

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  static var messaging = FirebaseMessaging.instance;
  static String? token;

  static Future<void> initializeApp() async {
    // Push Notifications
    await Firebase.initializeApp();
    token = await FirebaseMessaging.instance.getToken();
    // Local Notifications
  }
}
