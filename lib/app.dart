import 'package:flutter/material.dart';
import 'package:notifications/services/push_notifications_service.dart';

import 'router/router.dart';
import 'theme/theme.dart';

class NotificationsApp extends StatefulWidget {
  const NotificationsApp({Key? key}) : super(key: key);

  @override
  State<NotificationsApp> createState() => _NotificationsAppState();
}

class _NotificationsAppState extends State<NotificationsApp> {
  @override
  void initState() {
    super.initState();
    PushNotificationService.messageStream.listen((message) {
      print('MyApp: $message');
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "NotificationsApp",
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.homeRoute,
      routes: AppRoutes.getAppRoutes,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
    );
  }
}
