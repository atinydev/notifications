import 'package:flutter/material.dart';
import 'package:notifications/services/push_notifications_service.dart';

import 'app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await PushNotificationService.initializeApp();
  runApp(const NotificationsApp());
}
