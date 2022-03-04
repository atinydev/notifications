import 'package:flutter/material.dart';

class NotificationsService {
  static final navigatorKey = GlobalKey<NavigatorState>();
  static final messengerKey = GlobalKey<ScaffoldMessengerState>();

  static void showSnackBar(String message) {
    final snackBar = SnackBar(
      content: Text(message),
    );
    messengerKey.currentState?.showSnackBar(snackBar);
  }

  static void pushNamed(String routeName, {Object? arguments}) {
    navigatorKey.currentState?.pushNamed(routeName, arguments: arguments);
  }
}
