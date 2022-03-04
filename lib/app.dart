import 'package:flutter/material.dart';
import 'package:notifications/screens/messages_screen.dart';
import 'package:notifications/services/services.dart';

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
      NotificationsService.pushNamed(
        MessageScreen.routeName,
        arguments: message,
      );
      NotificationsService.showSnackBar(message);
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
      navigatorKey: NotificationsService.navigatorKey,
      scaffoldMessengerKey: NotificationsService.messengerKey,
    );
  }
}
