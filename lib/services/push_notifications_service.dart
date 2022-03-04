// SHA1: EE:2A:D5:5A:8C:2F:F7:6E:83:89:17:A2:FE:AC:BF:88:29:0B:D3:96

import 'dart:async';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

class PushNotificationService {
  static var messaging = FirebaseMessaging.instance;
  static String? token;
  static final _messageStreamController = StreamController<String>.broadcast();

  static Stream<String> get messageStream => _messageStreamController.stream;

  static Future<void> initializeApp() async {
    // Push Notifications
    await Firebase.initializeApp();
    requestPermission();
    token = await FirebaseMessaging.instance.getToken();
    // print('token $token');

    // Handlers
    FirebaseMessaging.onBackgroundMessage(_onBackgroundHandler);
    FirebaseMessaging.onMessage.listen(_onMessageHandler);
    FirebaseMessaging.onMessageOpenedApp.listen(_onMessageOpenApp);

    // Local Notifications
  }

  static Future<void> _onBackgroundHandler(RemoteMessage message) async {
    // print('onBackground Handler ${message.messageId}');
    // print(message.data);
    _messageStreamController.add(message.data['product'] ?? 'No data');
  }

  static Future<void> _onMessageHandler(RemoteMessage message) async {
    // print('onMessage Handler  ${message.messageId}');
    // print(message.data);
    _messageStreamController.add(message.data['product'] ?? 'No data');
  }

  static Future<void> _onMessageOpenApp(RemoteMessage message) async {
    // print('onMessageOpenApp Handler ${message.messageId}');
    // print(message.data);
    _messageStreamController.add(message.data['product'] ?? 'No data');
  }

  static void closeStreams() {
    _messageStreamController.close();
  }

  // Apple / Web
  static Future<void> requestPermission() async {
    final settings = await messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    print('User push notification status ${settings.authorizationStatus}');
  }
}
