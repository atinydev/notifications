import 'dart:html';

import 'package:flutter/material.dart';

class MessageScreen extends StatelessWidget {
  const MessageScreen({Key? key}) : super(key: key);

  static const routeName = 'Message';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Message'),
      ),
      body: const Center(
        child: Text(
          'MessageScreen',
          style: TextStyle(
            fontSize: 30,
          ),
        ),
      ),
    );
  }
}
